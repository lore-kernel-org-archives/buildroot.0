From: Giovanni Balestrieri <balestrieri.gepp@gmail.com>
Date: Mon, 2 Feb 2015 23:05:58 +0100
Subject: [Buildroot] How to compile a kernel with Adeos and Xenomai patches
	using Buildroot
Message-ID: <CALRX=SGqgQ0A8SLecpTVj1budv3nuuhoSWdZXftQsK+AxNrKFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot mailing list,

I would like to build a Real Time system for the Raspberry Pi board with
the Xenomai and Adeos patches. In this link
https://code.google.com/p/picnc/wiki/RPiXenomaiKernel
patches are applied in the following order:

   1. ipipe-core-3.8.13-raspberry-pre-2.patch
   2. ipipe-core-3.8.13-arm-3.patch
   3. ipipe-core-3.8.13-raspberry-post-2.patch

I've followed the instructions provided in /board/raspberrypi/readme.txt
and I configured Buildroot using the raspberrypi_defconfig. Then I changed
the linux kernel version (BR2_DEFAULT_KERNEL_VERSION) to match the one
compatible with xenomai (3.8.13) and set these options.

BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH: patch_to_adeos_patch

BR2_LINUX_KERNEL_PATCH: path_PRE_patch path_POST_patch

   - With *Buildroot 2013-11, *the compilation ends with 2 errors:

   [...]
   mv autoupdate.tmp autoupdate
   autom4te: need GNU m4 1.4 or later:
   /home/userk/Development/Linux/RaspberryPi/buildroot-2013.11/output/host/usr/bin/m4
   make[3]: *** [autoconf.in] Error 1
   make[3]: Leaving directory
   `/home/userk/Development/Linux/RaspberryPi/buildroot-2013.11/output/build/host-autoconf-2.69/bin'
   make[2]: *** [all-recursive] Error 1
   make[2]: Leaving directory
   `/home/userk/Development/Linux/RaspberryPi/buildroot-2013.11/output/build/host-autoconf-2.69'
   make[1]: *** [all] Error 2
   make[1]: Leaving directory
   `/home/userk/Development/Linux/RaspberryPi/buildroot-2013.11/output/build/host-autoconf-2.69'
   make: ***
   [/home/userk/Development/Linux/RaspberryPi/buildroot-2013.11/output/build/host-autoconf-2.69/.stamp_built]
   Error 2


   - With *Buildroot 2014-11*, the compilation works but the system does
   not
   boot. The boot process stops at

   Starting network...
   usb 1-1 new high-speed USB device number 2 using dwc_otg
   Indeed it is in host mode hprt0 = 00001101


How can I correctly configure Buildroot with Xenomai?

Thank you,
Giovanni Balestrieri.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150202/33c62e12/attachment.html>
