From: Zolnierczuk, Piotr <pzolnier@indiana.edu>
Date: Thu, 1 Mar 2007 09:42:01 -0500
Subject: [Buildroot] static libgcc_s
In-Reply-To: <004901c75bcc$356388c0$8c1d10ac@atmel.com>
References: <004901c75bcc$356388c0$8c1d10ac@atmel.com>
Message-ID: <4B278B357EBD634ABB3A5F9D2B63B9C40176A903@iu-mssg-mbx101.ads.iu.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ulf,
Yes: you are right I can compile U-Boot with NOSOFTFLOAT=yes with the "default" toolchain (i.e. the one with shared gcc enabled), but I cannot compile AT91 bootstrap for that I have (following Eric's tip) a static-only toolchain that compiles bootstrap.

So for now: two toolchains. 

Thank you all for help

Piotr


Piotr Adam Zolnierczuk
Indiana University               phone:  (812) 855-3613
Cyclotron Facility               fax:    (812) 855-6645
2401 Milo B Sampson Ln    e-mail:  pzolnier at indiana.edu
Bloomington,              http://www.iucf.indiana.edu/u/pzolnier
IN 47408
USA   
________________________________________________
                        written on recycled electrons   
-----Original Message-----
From: Ulf Samuelsson [mailto:ulf at atmel.com] 
Sent: Thursday, March 01, 2007 1:14 AM
To: Zolnierczuk, Piotr; buildroot at uclibc.org
Subject: Re: [Buildroot] static libgcc_s

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
