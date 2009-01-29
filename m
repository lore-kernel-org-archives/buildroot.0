From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 22:11:48 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/arch-arm
Message-ID: <20090129221149.4BB417741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 22:11:46 +0000 (Thu, 29 Jan 2009)
New Revision: 25148

Log:
Remove some unneeded AT91 patches

Removed:
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.21.1/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26-rc3/

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2009-01-29 22:00:58 UTC (rev 25147)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2009-01-29 22:11:46 UTC (rev 25148)
@@ -10,7 +10,6 @@
 	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_23
 	default BR2_ARCH_AT91_2_6_22_1		if BR2_LINUX_2_6_22_1
 	default BR2_ARCH_AT91_2_6_21_5		if BR2_LINUX_2_6_21 || BR2_LINUX_2_6_21_5
-	default BR2_ARCH_AT91_2_6_21_1		if BR2_LINUX_2_6_21_1
 	default BR2_ARCH_AT91_2_6_20_4		if BR2_LINUX_2_6_20 || BR2_LINUX_2_6_20_4
 	default BR2_ARCH_AT91_2_6_24
 	help
@@ -31,11 +30,6 @@
 	help
 	  Apply the at91 linux-2.6.26 patches
 
-config	BR2_ARCH_AT91_2_6_26_RC3
-	bool "2.6.26-rc3"
-	help
-	  Apply the at91 linux-2.6.26-rc3 patches
-
 config	BR2_ARCH_AT91_2_6_25
 	bool "2.6.25"
 	help
@@ -56,11 +50,6 @@
 	help
 	  Apply the at91 linux-2.6.21.5 patches
 
-config	BR2_ARCH_AT91_2_6_21_1
-	bool "2.6.21.1"
-	help
-	  Apply the at91 linux-2.6.21.1 patches
-
 config	BR2_ARCH_AT91_2_6_20_4
 	bool "2.6.20.4"
 	help
@@ -75,12 +64,10 @@
 	default "2.6.28" if BR2_ARCH_AT91_2_6_28
 	default "2.6.27.7" if BR2_ARCH_AT91_2_6_27_7
 	default "2.6.26" if BR2_ARCH_AT91_2_6_26
-	default "2.6.26-rc3" if BR2_ARCH_AT91_2_6_26_RC3
 	default "2.6.25" if BR2_ARCH_AT91_2_6_25
 	default "2.6.24" if BR2_ARCH_AT91_2_6_24
 	default "2.6.22.1" if BR2_ARCH_AT91_2_6_22_1
 	default "2.6.21.5" if BR2_ARCH_AT91_2_6_21_5
-	default "2.6.21.1" if BR2_ARCH_AT91_2_6_21_1
 	default "2.6.20.4" if BR2_ARCH_AT91_2_6_20_4
 
 config	BR2_KERNEL_ARCH_PATCH_DIR
