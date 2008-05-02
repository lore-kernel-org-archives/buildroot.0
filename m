From: pen ontable <penontable@gmail.com>
Date: Fri, 2 May 2008 11:15:06 +0200
Subject: [Buildroot] ATMEL SAM9 board
Message-ID: <290b1c870805020215s4d472318kdc72eddfc601f848@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a prototype board based on AT91RM9200+AT45DB64.
I have evaluated the buildroot framework starting from the at91rm9200df
configurations set that is tailored on the AT91RM9200-EK. Changes were made
since my board has a different ethernet PHY and a different GPIO map, to
leds, MMC/SD, etc..

The most important difference with respect the at91rm9200df configurations
set is that I need the linux kernel mounts the root fs read-write on the
dataflash.
I have changed the u-boot bootcmd and bootargs accordingly (defenv) and the
linux kernel .config in order to use only the legacy AT91RM9200 SPI driver
(the only SPI driver that detects the dataflash).

U-boot and linux work fine but I still have problems with the file system
image. It seems that the kernel doesn't find initrc (busybox), there are not
scripts outputs to console.

I suppose the problems can be solved (hints will be appreciated) but I have
to decide between keeping the AT91RM9200 board as production board or to
design a new board based on another ATMEL SAM9.

My question is: in your opinion/experience how good buildroot supports ATMEL
SAM9 + Dataflash or ATMEL SAM9 + NOR Flash platforms?

Thank you,

Mike.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080502/2ce9bed6/attachment.htm 
