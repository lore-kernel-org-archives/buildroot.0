From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Dec 2008 08:26:52 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-arm: kernel-patches-2.6.28
Message-ID: <20081230082652.5E47F76C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-30 08:26:51 +0000 (Tue, 30 Dec 2008)
New Revision: 24613

Log:
Update kernel patch from 2.6.28-rc6 to 2.6.28

Added:
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28/linux-2.6.28-at91.patch.bz2
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28/linux-2.6.28-exp.patch.bz2

Removed:
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28-rc6/

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
   trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2008-12-30 05:05:31 UTC (rev 24612)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2008-12-30 08:26:51 UTC (rev 24613)
@@ -2,7 +2,7 @@
 	prompt "Add AT91 specific patches"
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
-	default BR2_ARCH_AT91_2_6_28_RC6	if BR2_LINUX_2_6_28
+	default BR2_ARCH_AT91_2_6_28		if BR2_LINUX_2_6_28
 	default BR2_ARCH_AT91_2_6_27_7		if BR2_LINUX_2_6_27
 	default BR2_ARCH_AT91_2_6_26		if BR2_LINUX_2_6_26
 	default BR2_ARCH_AT91_2_6_25		if BR2_LINUX_2_6_25
@@ -16,8 +16,8 @@
 	help
 	  Select a patch to add to the Linux kernel
 
-config	BR2_ARCH_AT91_2_6_28_RC6
-	bool "2.6.28-rc6"
+config	BR2_ARCH_AT91_2_6_28
+	bool "2.6.28"
 	help
 	  Apply the at91 linux-2.6.28-rc6 patches
 
@@ -72,7 +72,7 @@
 	string
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
-	default "2.6.28-rc6" if BR2_ARCH_AT91_2_6_28_RC6
+	default "2.6.28" if BR2_ARCH_AT91_2_6_28
 	default "2.6.27.7" if BR2_ARCH_AT91_2_6_27_7
 	default "2.6.26" if BR2_ARCH_AT91_2_6_26
 	default "2.6.26-rc3" if BR2_ARCH_AT91_2_6_26_RC3

Modified: trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in	2008-12-30 05:05:31 UTC (rev 24612)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in	2008-12-30 08:26:51 UTC (rev 24613)
@@ -1,12 +0,0 @@
-ifeq ($(BR2_avr32),y)
-KERNEL_COND_PATCHES:=
-ifeq ($(BR2_LINUX_AVR32_AC97_PATCH),y)
-KERNEL_COND_PATCHES+=avr32.patched.ac97
-endif
-ifeq ($(BR2_LINUX_AVR32_ISI_PATCH),y)
-KERNEL_COND_PATCHES+=avr32.patched.isi
-endif
-ifeq ($(BR2_LINUX_AVR32_PSIF_PATCH),y)
-KERNEL_COND_PATCHES+=avr32.patched.psif
-endif
-endif

Added: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28/linux-2.6.28-at91.patch.bz2
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28/linux-2.6.28-at91.patch.bz2
___________________________________________________________________
Added: svn:mime-type
   + application/octet-stream

Added: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28/linux-2.6.28-exp.patch.bz2
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.28/linux-2.6.28-exp.patch.bz2
___________________________________________________________________
Added: svn:mime-type
   + application/octet-stream
