From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 1 Mar 2007 07:13:40 +0100
Subject: [Buildroot] static libgcc_s
References: <45E5A4E6.3010508@indiana.edu><20070228214534.GA23235@codepoet.org>
	<45E622E4.6010600@indiana.edu>
Message-ID: <004901c75bcc$356388c0$8c1d10ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Thanks Eric
> It's a good thought. I will certainly give it a try.
> 
> It still, though,  leaves me with two toolchains:
> one 'static' for dataflash and u-boot  and a second 'dynamic'  for 
> kernel and applications (for space considerations)
> 
> I am still curious if one could have just one toolchain that rules them 
> all ... :)

I removed the -msoftfloat from the 
cpu/arm920t/config.mk and
from
cpu/arm920t/at91rm9200/config.mk

After this I have a single toolchain which allows me to build:

* dataflashboot.bin (for AT91RM9200)
* U-Boot
* Linux
* Root File System

It does not allow me to build at91-bootstrap.

> 
> Piotr
> 


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT89 C51 Applications Group: mailto:micro.hotline at nto.atmel.com
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
FPSLIC Application Group: mailto:fpslic at atmel.com
Best AVR  link: www.avrfreaks.net
