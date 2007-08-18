From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 18 Aug 2007 01:46:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target target/device/Atmel
	target/device etc...
Message-ID: <20070818084644.EA197A5D34@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-18 01:46:41 -0700 (Sat, 18 Aug 2007)
New Revision: 19552

Log:
	Move AVR32 kernel patches to target/device/Atmel/arch-avr32
		Add linux-2.6.22.1-008-atmel-gpio_mouse-setup-for-atstk1000-board.patch
	Move AT91  kernel patches to target/device/Atmel/arch-arm
	Change name from "target/device/Atmel/Linux" to "target/device/Atmel/linux"
	"kernel-headers" will apply all patches in $(LINUX26_KERNEL_PATCH_DIR)
		if this is available.
	Define LINUX26_KERNEL_PATCH_DIR in target/device/Atmel/Makefile.in
		as above "arch-arm/kernel-patches-..." if an AT91 or
		as above "arch-avr32/kernel-patches-..." if an AVR32 target is selected
	Test build done for arm,avr32 and x86


Added:
   trunk/buildroot/target/device/Atmel/arch-arm/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.20.4/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.20.4/linux-2.6.20.4-atmel.patch
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.21.1/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.21.1/2.6.21.1-at91.patch
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.21.1/linux-2.6.21.1-at91-1-update.patch
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.22.1/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.22.1/2.6.22.1-atmel.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.1/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.1/linux-2.6.22.1-003-atmel.3-avr32-updates.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.22.1/linux-2.6.22.1-008-atmel-gpio_mouse-setup-for-atstk1000-board.patch
   trunk/buildroot/target/device/Atmel/linux/
   trunk/buildroot/target/device/Atmel/linux/linux.mk

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-003-atmel.3-avr32-updates.patch

Modified:
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:

Sorry, the patch is too large to include (81042 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19552
