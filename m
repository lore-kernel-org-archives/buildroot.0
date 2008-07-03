From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu,  3 Jul 2008 01:11:08 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-arm:
	kernel-patches-2.6.25 kernel-patches-2. etc...
Message-ID: <20080703081109.0D6113C647@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-03 01:11:04 -0700 (Thu, 03 Jul 2008)
New Revision: 22614

Log:
Add AT91 patches for 2.6.25 and 2.6.25-rc3

Added:
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.25/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.25/linux-2.6.25-at91.patch.gz
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26-rc3/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26-rc3/linux-2.6.26-rc3-at91.patch.gz

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2008-07-02 22:47:49 UTC (rev 22613)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2008-07-03 08:11:04 UTC (rev 22614)
@@ -2,6 +2,8 @@
 	prompt "Add AT91 specific patches"
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
+	default BR2_ARCH_AT91_2_6_26		if BR2_LINUX_2_6_26
+	default BR2_ARCH_AT91_2_6_25		if BR2_LINUX_2_6_25
 	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_24
 	default BR2_ARCH_AT91_2_6_24		if BR2_LINUX_2_6_23
 	default BR2_ARCH_AT91_2_6_22_1		if BR2_LINUX_2_6_22_1
@@ -12,6 +14,16 @@
 	help
 	  Select a patch to add to the Linux kernel
 
+config	BR2_ARCH_AT91_2_6_26_RC3
+	bool "2.6.26-rc3"
+	help
+	  Apply the at91 linux-2.6.26-rc3 patches"
+
+config	BR2_ARCH_AT91_2_6_25
+	bool "2.6.25"
+	help
+	  Apply the at91 linux-2.6.25 patches"
+
 config	BR2_ARCH_AT91_2_6_24
 	bool "2.6.24"
 	help
@@ -43,6 +55,8 @@
 	string
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
+	default "2.6.26-rc3" if BR2_ARCH_AT91_2_6_26_RC3
+	default "2.6.25" if BR2_ARCH_AT91_2_6_25
 	default "2.6.24" if BR2_ARCH_AT91_2_6_24
 	default "2.6.22.1" if BR2_ARCH_AT91_2_6_22_1
 	default "2.6.21.5" if BR2_ARCH_AT91_2_6_21_5

Added: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.25/linux-2.6.25-at91.patch.gz
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.25/linux-2.6.25-at91.patch.gz
___________________________________________________________________
Name: svn:mime-type
   + application/octet-stream

Added: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26-rc3/linux-2.6.26-rc3-at91.patch.gz
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26-rc3/linux-2.6.26-rc3-at91.patch.gz
___________________________________________________________________
Name: svn:mime-type
   + application/octet-stream
