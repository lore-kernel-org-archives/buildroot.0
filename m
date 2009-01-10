From: Quick X <quickx@hotmail.com>
Date: Fri, 9 Jan 2009 16:44:53 -0800
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9261ek
Message-ID: <BAY124-W220BC89AF62D28FD44E473D2DA0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Buildroot Compiles now with the at91sam9261ek_defconfig, however, I can't get the generated bootstraps to work on my board.
 
--My build commands tested--
$ svn co svn://uclibc.org/trunk/buildroot buildroot
$ cd buildroot
$ make menuconfig (SAVE EXIT)
$ make at91sam9261ek_defconfig
$ make
 
It ask's a couple questions about the new uClibc options (which I take default for all).  No errors produced.
 
I then flash all the new binaries to my image and atempt to boot.  I get the following:
 
---New StartUp Log---
>Start AT91Bootstrap...
dataflash code 0x0000003CAT45DB642D detected
>Start application at [0x23F00000]
*sits here forever*
 
 
If I then flash the old "at91sam9261ek-dataflashboot-2.3.4.bin", then I get the following start message
>Start AT91Bootstrap...
>AT45DB642D detected
>Loading from Dataflash[0x00008400] to SDRAM[0x23F00000]
.......
>Loading complete, [0x00032000] bytes
>Start application at [0x23F00000]
Error Timeout
*sits here forever*
 
 
If I then flash the old "at91sam9261ek-u-boot-1.2.0-atmel-20090105.bin", then everything works fine. AKA the new linux and root file system both work fine, so it is just the new bootstraps that I think have a problem.
 
 
Also the "make saveconfig" with the newest revision is looking in the wrong place for the u-boot config:
[SNIP]
if [ -f /include/configs/at91sam9261ek.h ]; then \
                mkdir -p .//local/at91sam9261ek/u-boot; \
                cp /include/configs/at91sam9261ek.h \
                        .//local/at91sam9261ek/u-boot/at91sam9261ek.h; \
        fi
 
 
If you need more information, or more complete logs, I can try to provide.
_________________________________________________________________
