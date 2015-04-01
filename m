From: Fabrice Mousset | GEOCEPT GmbH <fabrice.mousset@geocept.com>
Date: Wed, 1 Apr 2015 14:37:15 +0000
Subject: [Buildroot] Build embedded system for x86 device
In-Reply-To: <AMXPR04MB10385410B37EA5F396EE688EAF30@AMXPR04MB103.eurprd04.prod.outlook.com>
References: <AMXPR04MB10385410B37EA5F396EE688EAF30@AMXPR04MB103.eurprd04.prod.outlook.com>
Message-ID: <AMXPR04MB103B46C4493795E70A219D7EAF30@AMXPR04MB103.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Von: buildroot [mailto:buildroot-bounces at busybox.net] Im Auftrag von Fabrice Mousset | GEOCEPT GmbH
Gesendet: Mittwoch, 1. April 2015 15:33
An: buildroot at busybox.net
Betreff: [Buildroot] Build embedded system for x86 device

Hi all,

I have some questions about Buildroot and x86 support.
I want to create a Linux/Buildroot BSP for our "old" HW (Intel Celeron M) which is actually running Windows XP.
My goal is to have Linux, X11/Wayland, Qt5 and Wine on an 4 GB CompactFlash and booting my embedded PC on it.

I have some experience in Linux BSP build for ARM architecture but not really with x86... Sounds strange I known, but x86 is complicated for me ;-)

So I have ask the Big Oracle (Google) to find some information but they are all quiet old or incomprehensible.

To get a working starting point, I have first installed a stripped Xubuntu with the net installer iso, so I know it is possible to made my target software work on it ;-)

Now the real work begins, and based on my ARM experience (RPi/Wandboard/BeagleBone and some internal HW),  I have tried to create a x86 BSP.

I have "cherry-picked" from "next" the wine package for Buildroot and apply the patch on my buildroot 2015.02.
For the Linux configuration, I have used the linux configuration from Xubuntu. But I don't know if it was a good idea.
I have select bzImage as kernel image format.
I have used GCC 4.9, glibc 2.20 and binutils 2.25 as toolchain
I have selected Grub2 as bootloader.

I have selected the target packages I need to fit my needs (Qt5, X11, Wine, etc).

As rootfs format: ext3 and iso

And at least starts the BSP build... all build fine, I have create a USB key with the ISO file and "Linux Live USB Creator" to check the build.

My device boot on the USB Stick... to be correct, GRUB is starting, but I can't boot my Linux, it stops with a Kernel panic unable to mount root fs...

What do I wrong?
Do I need to create an init RAM fs?

Is there a tutorial I have missed?

Best regards

Fabrice Mousset

One last thing, my system starts with qemu... I just need help to install it on "real HW"

Best regards

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150401/bb1f5d0f/attachment.html>
