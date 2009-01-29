From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 22:33:24 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-arm:
	kernel-patches-2.6.20 kernel-patches-2. etc...
Message-ID: <20090129223325.455EC7741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 22:33:23 +0000 (Thu, 29 Jan 2009)
New Revision: 25149

Log:
Cleanup of AT91 patches

Added:
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.20/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.21/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.22/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.27/

Removed:
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.20.4/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.21.5/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.22.1/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.27.7/

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2009-01-29 22:11:46 UTC (rev 25148)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2009-01-29 22:33:23 UTC (rev 25149)
@@ -3,27 +3,27 @@
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
 	default BR2_ARCH_AT91_2_6_28		if BR2_LINUX_2_6_28
-	default BR2_ARCH_AT91_2_6_27_7		if BR2_LINUX_2_6_27
+	default BR2_ARCH_AT91_2_6_27		if BR2_LINUX_2_6_27
 	default BR2_ARCH_AT91_2_6_26		if BR2_LINUX_2_6_26
 	default BR2_ARCH_AT91_2_6_25		if BR2_LINUX_2_6_25
 	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_24
-	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_23
-	default BR2_ARCH_AT91_2_6_22_1		if BR2_LINUX_2_6_22_1
-	default BR2_ARCH_AT91_2_6_21_5		if BR2_LINUX_2_6_21 || BR2_LINUX_2_6_21_5
-	default BR2_ARCH_AT91_2_6_20_4		if BR2_LINUX_2_6_20 || BR2_LINUX_2_6_20_4
-	default BR2_ARCH_AT91_2_6_24
+	default BR2_ARCH_AT91_2_6_23		if BR2_LINUX_2_6_23
+	default BR2_ARCH_AT91_2_6_22		if BR2_LINUX_2_6_22
+	default BR2_ARCH_AT91_2_6_21		if BR2_LINUX_2_6_21
+	default BR2_ARCH_AT91_2_6_20		if BR2_LINUX_2_6_20
+	default BR2_ARCH_AT91_2_6_28
 	help
 	  Select a patch to add to the Linux kernel
 
 config	BR2_ARCH_AT91_2_6_28
 	bool "2.6.28"
 	help
-	  Apply the at91 linux-2.6.28-rc6 patches
+	  Apply the at91 linux-2.6.28 patches
 
-config	BR2_ARCH_AT91_2_6_27_7
-	bool "2.6.27.7"
+config	BR2_ARCH_AT91_2_6_27
+	bool "2.6.27"
 	help
-	  Apply the at91 linux-2.6.27.7 patches
+	  Apply the at91 linux-2.6.27 patches
 
 config	BR2_ARCH_AT91_2_6_26
 	bool "2.6.26"
@@ -40,21 +40,26 @@
 	help
 	  Apply the at91 linux-2.6.24 patches
 
-config	BR2_ARCH_AT91_2_6_22_1
-	bool "2.6.22.1"
+config	BR2_ARCH_AT91_2_6_23
+	bool "2.6.23"
 	help
-	  Apply the at91 linux-2.6.22.1 patches
+	  Apply the at91 linux-2.6.23 patches
 
-config	BR2_ARCH_AT91_2_6_21_5
-	bool "2.6.21.5"
+config	BR2_ARCH_AT91_2_6_22
+	bool "2.6.22"
 	help
-	  Apply the at91 linux-2.6.21.5 patches
+	  Apply the at91 linux-2.6.22 patches
 
-config	BR2_ARCH_AT91_2_6_20_4
-	bool "2.6.20.4"
+config	BR2_ARCH_AT91_2_6_21
+	bool "2.6.21"
 	help
-	  Apply the at91 linux-2.6.20.4 patches
+	  Apply the at91 linux-2.6.21 patches
 
+config	BR2_ARCH_AT91_2_6_20
+	bool "2.6.20"
+	help
+	  Apply the at91 linux-2.6.20 patches
+
 endchoice
 
 config	BR2_KERNEL_ARCH_PATCH_VERSION
@@ -62,14 +67,16 @@
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
 	default "2.6.28" if BR2_ARCH_AT91_2_6_28
-	default "2.6.27.7" if BR2_ARCH_AT91_2_6_27_7
+	default "2.6.27" if BR2_ARCH_AT91_2_6_27
 	default "2.6.26" if BR2_ARCH_AT91_2_6_26
 	default "2.6.25" if BR2_ARCH_AT91_2_6_25
 	default "2.6.24" if BR2_ARCH_AT91_2_6_24
-	default "2.6.22.1" if BR2_ARCH_AT91_2_6_22_1
-	default "2.6.21.5" if BR2_ARCH_AT91_2_6_21_5
-	default "2.6.20.4" if BR2_ARCH_AT91_2_6_20_4
+	default "2.6.24" if BR2_ARCH_AT91_2_6_23
+	default "2.6.22" if BR2_ARCH_AT91_2_6_22
+	default "2.6.21" if BR2_ARCH_AT91_2_6_21
+	default "2.6.20" if BR2_ARCH_AT91_2_6_20
 
 config	BR2_KERNEL_ARCH_PATCH_DIR
 	string
 	default "target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
+


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.20
___________________________________________________________________
Added: svn:mergeinfo
   + 


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.21
___________________________________________________________________
Added: svn:mergeinfo
   + 


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.22
___________________________________________________________________
Added: svn:mergeinfo
   + 


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.27
___________________________________________________________________
Added: svn:mergeinfo
   + 
