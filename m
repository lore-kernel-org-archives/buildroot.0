From: Ulf Samuelsson <ulfs@dof.se>
Date: Fri, 11 Aug 2006 06:31:10 +0200
Subject: [Buildroot] Packages that error out during build
References: <bf61e79a0608100739p4899b15brb988f9063f044978@mail.gmail.com><20060810175113.GA20615@codepoet.org>
	<bf61e79a0608101208v69dfe8ban49e8fd39ec28b19e@mail.gmail.com>
Message-ID: <00d501c6bd03$70d22690$664565d5@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hotplug:
> 
> wget --passive-ftp -q -P /home/user/buildroot/dl
> http://www.kernel.org/pub/linux/utils/kernel/hotplug//diethotplug-0.4.tar.gz
> zcat /home/user/buildroot/dl/diethotplug-0.4.tar.gz | tar -C
> /home/user/buildroot/build_i686   -xf -
> toolchain/patch-kernel.sh
> /home/user/buildroot/build_i686/diethotplug-0.4 package/hotplug/
> hotplug\*.patch
> 
> Applying hotplug.patch using plaintext:
> patching file pci.c
> patching file Makefile
> make -j1 CROSS=/home/user/buildroot/build_i686/staging_dir/bin/i686-linux-uclibc-
> DEBUG=false KLIBC=false \
>    KERNEL_INCLUDE_DIR=/home/user/buildroot/build_i686/staging_dir/include \
>    TARGET_DIR=/home/user/buildroot/build_i686/root -C
> /home/user/buildroot/build_i686/diethotplug-0.4;
> make[1]: Entering directory `/home/user/buildroot/build_i686/diethotplug-0.4'
> perl convert_usb.pl <
> /home/user/buildroot/build_i686/root/lib/modules/2.4.31/modules.usbmap
>> usb_modules.h
> /bin/sh: /home/user/buildroot/build_i686/root/lib/modules/2.4.31/modules.usbmap:
> No such file or directory
> make[1]: *** [usb_modules.h] Error 1
> make[1]: Leaving directory `/home/user/buildroot/build_i686/diethotplug-0.4'
> make: *** [/home/user/buildroot/build_i686/diethotplug-0.4/hotplug] Error 2

My guess is that "modules.usbmap" is a file that contains information 
about USB device drivers built as modules.
Hotplug will, when a USB device is inserted, load a suitable module.
"modules.usbmap" should probably be generated as a result of builing the Linux kernel
so it needs to depend on the kernel
I have no clue about the format of the file.

> 
> -- Drew
> 
> 


Please do not send mails or "reply" to ulfs at dof.se, 
since it will be routed to my GSM phone.
My email address is ulf at atmel.com

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
