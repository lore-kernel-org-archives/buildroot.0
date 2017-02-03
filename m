From: thierry.xenomai43 at yahoo.com <thierry.xenomai43@yahoo.com>
Date: Fri, 3 Feb 2017 09:43:16 +0000 (UTC)
Subject: [Buildroot] [BUILDROOT 2016.11.2] Change kernel version (I need
	4.1.18)
References: <1313003300.253161.1486114996684.ref@mail.yahoo.com>
Message-ID: <1313003300.253161.1486114996684@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

? Hello,?I need to compile a 4.1.18 kernel linux for a RaspberryPi 3 target (ARM 64bit) to patch it with an ADEOS I-pipe (I get ipipe patch only for 4.1.18 kernel).?To start I want to test a simple project without the Xenomai package and with linux 4.1.18.?I tried to change the version of the Linux kernel but during the compilation I get the following error message:
which: no flex in (/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/app/altera/quartus/bin:/home/thierry/.local/bin:/home/thierry/bin:/home/app/altera/quartus/bin)which: no bison in (/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/app/altera/quartus/bin:/home/thierry/.local/bin:/home/thierry/bin:/home/app/altera/quartus/bin)which: no cmake in (/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/home/app/grmon-eval-2.0.60/linux/bin:/home/app/sparc-elf-4.4.2/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/app/altera/quartus/bin:/home/thierry/.local/bin:/home/thierry/bin:/home/app/altera/quartus/bin)****** Can't find default configuration "arch/arm/configs/bcm2709_defconfig"!***scripts/kconfig/Makefile:105: recipe for target 'bcm2709_defconfig' failedmake[3]: *** [bcm2709_defconfig] Error 1Makefile:541: recipe for target 'bcm2709_defconfig' failedmake[2]: *** [bcm2709_defconfig] Error 2linux/linux.mk:447: recipe for target '/home/thierry/MesProgrammes/C/buildroot/buildroot-2016.11.2RT/output/build/linux-4.1.18/.config' failedmake[1]: *** [/home/thierry/MesProgrammes/C/buildroot/buildroot-2016.11.2RT/output/build/linux-4.1.18/.config] Error 2Makefile:76: recipe for target '_all' failedmake: *** [_all] Error 2?When I try the 'make linux-menuconfig' command I have the same error message.?After the fail compilation I see that the '.config' file is not generated in the directory "buildroot-2016.11.2 / output / build / linux-4.1.18"?My process method is the next :make raspberrypi3_defconfig make menuconfigin "Target package ? Libraries ?Hard handling" I select package ?wiringpi?in "Kernel ? Linux Kernel" I select ?Custom version?in "Kernel ? Kernel Version" I input ?4.1.18?in "Toolchain ? Kernel Headers" I select ?Linux 4.1.x?in "System configuration ? enable rootlogin with password" I select ?Yes?in "System configuration ? Root passwort" I init my password?I save my configuration. When I use the command 'make' I get the error message mentioned above.?My questions :
Where did my error come from ?
Is it possible to compile an old linux for ARM ?What is the process to change kernel version ??Thanks for helpBest regardThierry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170203/4e8e0bcc/attachment.html>
