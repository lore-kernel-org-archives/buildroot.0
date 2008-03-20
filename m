From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Mar 2008 15:06:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device:  ARMLTD
Message-ID: <20080320220611.2EA333C320@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-20 15:06:10 -0700 (Thu, 20 Mar 2008)
New Revision: 21419

Log:
Move ARM target to ARMLTD target to prepare for generic ARM

Added:
   trunk/buildroot/target/device/ARMLTD/

Removed:
   trunk/buildroot/target/device/Arm/

Modified:
   trunk/buildroot/target/device/ARMLTD/Config.in
   trunk/buildroot/target/device/ARMLTD/Makefile.in
   trunk/buildroot/target/device/ARMLTD/integrator926_defconfig
   trunk/buildroot/target/device/ARMLTD/integrator926_huge_defconfig
   trunk/buildroot/target/device/Config.in


Changeset:
Copied: trunk/buildroot/target/device/ARMLTD (from rev 21418, trunk/buildroot/target/device/Arm)

Modified: trunk/buildroot/target/device/ARMLTD/Config.in
===================================================================
--- trunk/buildroot/target/device/Arm/Config.in	2008-03-20 21:19:35 UTC (rev 21418)
+++ trunk/buildroot/target/device/ARMLTD/Config.in	2008-03-20 22:06:10 UTC (rev 21419)
@@ -1,14 +1,14 @@
-menuconfig BR2_TARGET_ARM
+menuconfig BR2_TARGET_ARMLTD
 	bool "ARM Ltd. Device Support"
 	depends BR2_arm
 	default n
 
 comment "Arm based Device Support"
-	depends BR2_arm && BR2_TARGET_ARM
+	depends BR2_arm && BR2_TARGET_ARMLTD
 
 config BR2_TARGET_ARM_INTEGRATOR_926
 	bool "Integrator arm926"
-	depends BR2_arm && BR2_TARGET_ARM
+	depends BR2_arm && BR2_TARGET_ARMLTD
 	default n
 	select BR2_PACKAGE_LINUX
 	select BR2_ARM_EABI

Modified: trunk/buildroot/target/device/ARMLTD/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Arm/Makefile.in	2008-03-20 21:19:35 UTC (rev 21418)
+++ trunk/buildroot/target/device/ARMLTD/Makefile.in	2008-03-20 22:06:10 UTC (rev 21419)
@@ -1,4 +1,4 @@
-ifeq ($(BR2_TARGET_ARM_INTEGRATOR_926),y)
+ifeq ($(BR2_TARGET_ARMLTD_INTEGRATOR_926),y)
 LINUX26_KCONFIG:=target/device/Arm/linux26.integrator926.config
 TARGETS+=linux26
 

Modified: trunk/buildroot/target/device/ARMLTD/integrator926_defconfig
===================================================================
--- trunk/buildroot/target/device/Arm/integrator926_defconfig	2008-03-20 21:19:35 UTC (rev 21418)
+++ trunk/buildroot/target/device/ARMLTD/integrator926_defconfig	2008-03-20 22:06:10 UTC (rev 21419)
@@ -84,12 +84,12 @@
 # Preset Devices
 #
 BR2_PACKAGE_LINUX=y
-BR2_TARGET_ARM=y
+BR2_TARGET_ARMLTD=y
 
 #
 # Arm based Device Support
 #
-BR2_TARGET_ARM_INTEGRATOR_926=y
+BR2_TARGET_ARMLTD_INTEGRATOR_926=y
 # BR2_TARGET_ATMEL is not set
 # BR2_TARGET_SHARP is not set
 

Modified: trunk/buildroot/target/device/ARMLTD/integrator926_huge_defconfig
===================================================================
--- trunk/buildroot/target/device/Arm/integrator926_huge_defconfig	2008-03-20 21:19:35 UTC (rev 21418)
+++ trunk/buildroot/target/device/ARMLTD/integrator926_huge_defconfig	2008-03-20 22:06:10 UTC (rev 21419)
@@ -60,12 +60,12 @@
 # Preset Devices
 #
 BR2_PACKAGE_LINUX=y
-BR2_TARGET_ARM=y
+BR2_TARGET_ARMLTD=y
 
 #
 # Arm based Device Support
 #
-BR2_TARGET_ARM_INTEGRATOR_926=y
+BR2_TARGET_ARMLTD_INTEGRATOR_926=y
 # BR2_TARGET_ATMEL is not set
 # BR2_TARGET_SHARP is not set
 

Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2008-03-20 21:19:35 UTC (rev 21418)
+++ trunk/buildroot/target/device/Config.in	2008-03-20 22:06:10 UTC (rev 21419)
@@ -5,7 +5,7 @@
 comment "Preset Devices"
 
 source "target/device/AMD/Config.in"
-source "target/device/Arm/Config.in"
+source "target/device/ARMLTD/Config.in"
 source "target/device/Atmel/Config.in"
 source "target/device/Hitachi/Config.in"
 source "target/device/jp/Config.in"
