# Copyright 2009 by Tim Becker (tim.becker@kuriostaet.de)
# MIT License, for details, see the LICENSE file accompaning
# this distribution

module ISO8583
  class Header
    attr_accessor :header_length,
                  :header_flag_and_format, 
                  :text_format, 
                  :total_message_length,
                  :dest_station_id,
                  :source_station_id,
                  :round_trip_control_info,
                  :base_flags,
                  :msg_status_flags,
                  :batch_number,
                  :reserved,
                  :user_info

    def initialize(msg_length)
      @header_length = "22"
      @header_flag_and_format = "01"
      @text_format = "02"
      @total_message_length = [ msg_length ].pack "n"
      @dest_station_id ="000000"
      @source_station_id = "000000"
      @round_trip_control_info = "00"
      @base_flags = "0000"
      @msg_status_flags = "000000"
      @batch_number = "00"
      @reserved = "000000"
      @user_info = "00"
    end

    def to_b
      byte_string = ''
      byte_string << @header_length
      byte_string << @header_flag_and_format
      byte_string << @text_format
      byte_string << @total_message_length
      byte_string << @dest_station_id
      byte_string << @source_station_id
      byte_string << @round_trip_control_info
      byte_string << @base_flags
      byte_string << @msg_status_flags
      byte_string << @batch_number
      byte_string << @reserved
      byte_string << @user_info
    end


  end

end

# my_hdr = ISO8583::Header.new(1024)
# puts my_hdr.to_b
