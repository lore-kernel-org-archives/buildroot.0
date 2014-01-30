From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Jan 2014 10:51:20 -0300
Subject: [Buildroot] udev and serial port
In-Reply-To: <52EA5785.5050507@gmail.com>
References: <52E4FA8C.7060109@gmail.com>	<52E6945C.40202@mind.be>	<52E8120F.7080805@gmail.com>	<20140128230904.1f01a5dc@skate>	<52E8AA41.1020709@mind.be>
 <20140129093013.5ca63190@skate> <52E8DB08.8060107@mind.be>
 <52EA5785.5050507@gmail.com>
Message-ID: <52EA58D8.8070103@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/30/2014 10:45 AM, Marco Trapanese wrote:

> Hello,
> in my buildroot environment I have udev enabled. I need to connect some
> UART-to-USB converter based upon FTDI chip (I added the libftdi in the
> config).
> 
> When I plug-in the converter to my target dmesg see the new hardware but
> I can't see any /dev/ttyUSB device.
> 
> Do I need to add something other in the configuration?
> Where should I search information about this "how-to"?
> 
> Thanks
> Marco

Hi.
libftdi is for direct access to FTDI chips from applications.
This is used for GPIO, bitbanging, SPI and other purposes.
What you want is to enable the CONFIG_USB_SERIAL_FTDI_SIO knob in your
linux kernel config.
Regards.
