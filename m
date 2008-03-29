From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 16:09:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target: device device/Atmel
	device/Atmel/arch-a etc...
Message-ID: <20080329230951.6BF193C480@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 16:09:46 -0700 (Sat, 29 Mar 2008)
New Revision: 21567

Log:
Remove duplicate AVR32 patches, and add support for ARCH and conditional AVR32 patches

Added:
   trunk/buildroot/target/device/Atmel/Config.in.linux.patches
   trunk/buildroot/target/device/Atmel/Makefile.in.linux
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
   trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in
   trunk/buildroot/target/device/Atmel/arch-arm/arch-arm.mk
   trunk/buildroot/target/device/Atmel/arch-avr32/Config.in.linux.patches
   trunk/buildroot/target/device/Atmel/arch-avr32/arch-avr32.mk
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.23/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.23/linux-2.6.23-100-avr32-atmel.2.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.23/linux-2.6.23-200-fix-include-typo-for-atngw100-board.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-100-avr32-git.1.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-500-v4l-avr32-isi.patch.cond
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-600-avr32-mmc.patch
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-avr32-ac97-reset.patch.cond
   trunk/buildroot/target/device/Atmel/arch-avr32/kernel-patches-2.6.24/linux-2.6.24-avr32-psif-2.patch.cond
   trunk/buildroot/target/device/Config.in.linux.patches
   trunk/buildroot/target/device/Makefile.in.linux

Removed:
   trunk/buildroot/target/device/Atmel/atngw100-base/kernel-patches/linux-2.6.23-100-avr32-atmel.2.patch
   trunk/buildroot/target/device/Atmel/atngw100-base/kernel-patches/linux-2.6.23-200-fix-include-typo-for-atngw100-board.patch
   trunk/buildroot/target/device/Atmel/atngw100-base/kernel-patches/linux-2.6.24-100-avr32-git.1.patch
   trunk/buildroot/target/device/Atmel/atngw100-base/kernel-patches/linux-2.6.24-600-avr32-mmc.patch
   trunk/buildroot/target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.23-100-avr32-atmel.2.patch
   trunk/buildroot/target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.23-200-fix-include-typo-for-atngw100-board.patch
   trunk/buildroot/target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.24-100-avr32-git.1.patch
   trunk/buildroot/target/device/Atmel/atngw100-expanded/kernel-patches/linux-2.6.24-600-avr32-mmc.patch
   trunk/buildroot/target/device/Atmel/atngw100/kernel-patches/linux-2.6.23-100-avr32-atmel.2.patch
   trunk/buildroot/target/device/Atmel/atngw100/kernel-patches/linux-2.6.23-200-fix-include-typo-for-atngw100-board.patch
   trunk/buildroot/target/device/Atmel/atngw100/kernel-patches/linux-2.6.24-100-avr32-git.1.patch
   trunk/buildroot/target/device/Atmel/atngw100/kernel-patches/linux-2.6.24-600-avr32-mmc.patch
   trunk/buildroot/target/device/Atmel/atstk1002/kernel-patches/linux-2.6.23-100-avr32-atmel.2.patch
   trunk/buildroot/target/device/Atmel/atstk1002/kernel-patches/linux-2.6.24-100-avr32-git.1.patch
   trunk/buildroot/target/device/Atmel/atstk1002/kernel-patches/linux-2.6.24-600-avr32-mmc.patch
   trunk/buildroot/target/device/Atmel/misc-patches/linux-2.6.24-500-v4l-avr32-isi.patch
   trunk/buildroot/target/device/Atmel/misc-patches/linux-2.6.24-avr32-ac97-reset.patch
   trunk/buildroot/target/device/Atmel/misc-patches/linux-2.6.24-avr32-psif-2.patch

Modified:
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig
   trunk/buildroot/target/linux/Config.in.advanced
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:

Sorry, the patch is too large to include (194962 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21567
