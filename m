From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 23:09:41 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/arch-arm/u-boot
Message-ID: <20090122230941.BDC2A76724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 23:09:41 +0000 (Thu, 22 Jan 2009)
New Revision: 24975

Log:
Update AT91 u-boot patches to 2009.01

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Config.in	2009-01-22 23:06:28 UTC (rev 24974)
+++ trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Config.in	2009-01-22 23:09:41 UTC (rev 24975)
@@ -1,20 +1,20 @@
 choice
 	prompt "Add AT91 specific patches to u-Boot"
-	default BR2_TARGET_U_BOOT_2009_01_RC3_ARCH_AT91
+	default BR2_TARGET_U_BOOT_2009_01_ARCH_AT91
 	help
 	  Select a patch to add to U-Boot
 
-config	BR2_TARGET_U_BOOT_2009_01_RC3_ARCH_AT91
-	bool "AT91 patches for u-boot-2009.03-rc3"
+config	BR2_TARGET_U_BOOT_2009_01_ARCH_AT91
+	bool "AT91 patches for u-boot-2009.01"
 	depends on BR2_TARGET_ATMEL && BR2_arm
 	help
-	  Apply the at91 linux-2.6.28-rc6 patches
+	  Apply the at91 u-boot-2009.01 patches
 
 endchoice
 
 config	BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR
 	string
 	depends on BR2_TARGET_U_BOOT_ARCH_PATCH
-	default "target/device/Atmel/arch-arm/u-boot/2009.01-rc3" if BR2_TARGET_U_BOOT_2009_01_RC3_ARCH_AT91
+	default "target/device/Atmel/arch-arm/u-boot/2009.01" if BR2_TARGET_U_BOOT_2009_01_ARCH_AT91
 	default ""
 
