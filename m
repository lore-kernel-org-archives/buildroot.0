From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 23 Aug 2008 13:45:43 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-arm: kernel-patches-2.6.26
Message-ID: <20080823204543.23D7DF8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-08-23 13:45:42 -0700 (Sat, 23 Aug 2008)
New Revision: 23188

Log:
Update AT91 patches to latest Linux

Added:
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26/
   trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26/2.6.26-at91.patch.gz

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2008-08-23 20:25:29 UTC (rev 23187)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Config.in.linux.patches	2008-08-23 20:45:42 UTC (rev 23188)
@@ -14,6 +14,11 @@
 	help
 	  Select a patch to add to the Linux kernel
 
+config	BR2_ARCH_AT91_2_6_26
+	bool "2.6.26"
+	help
+	  Apply the at91 linux-2.6.26 patches
+
 config	BR2_ARCH_AT91_2_6_26_RC3
 	bool "2.6.26-rc3"
 	help
@@ -55,6 +60,7 @@
 	string
 	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
 	depends on BR2_TARGET_ATMEL && BR2_arm
+	default "2.6.26" if BR2_ARCH_AT91_2_6_26
 	default "2.6.26-rc3" if BR2_ARCH_AT91_2_6_26_RC3
 	default "2.6.25" if BR2_ARCH_AT91_2_6_25
 	default "2.6.24" if BR2_ARCH_AT91_2_6_24

Added: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26/2.6.26-at91.patch.gz
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/kernel-patches-2.6.26/2.6.26-at91.patch.gz
___________________________________________________________________
Name: svn:mime-type
   + application/octet-stream
