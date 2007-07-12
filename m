From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 11:47:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device: Arm Atmel
	Sharp
Message-ID: <20070712184755.AE1C8A6827@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 11:47:48 -0700 (Thu, 12 Jul 2007)
New Revision: 19078

Log:
Make Config.in targets for ARM chips look consistent

Modified:
   trunk/buildroot/target/device/Arm/Config.in
   trunk/buildroot/target/device/Atmel/Config.in
   trunk/buildroot/target/device/Sharp/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Arm/Config.in
===================================================================
--- trunk/buildroot/target/device/Arm/Config.in	2007-07-12 17:04:05 UTC (rev 19077)
+++ trunk/buildroot/target/device/Arm/Config.in	2007-07-12 18:47:48 UTC (rev 19078)
@@ -1,3 +1,9 @@
+menuconfig	BR2_TARGET_ARM
+	bool "ARM Ltd. Device Support"
+	depends BR2_arm
+	default n
+
+if BR2_TARGET_ARM
 comment "Arm based Device Support"
 	depends BR2_arm
 
@@ -14,3 +20,4 @@
 	  An ARM integrator 926 board for use with qemu.
 	  This one has an MMU.
 
+endif

Modified: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	2007-07-12 17:04:05 UTC (rev 19077)
+++ trunk/buildroot/target/device/Atmel/Config.in	2007-07-12 18:47:48 UTC (rev 19078)
@@ -1,5 +1,5 @@
 menuconfig BR2_TARGET_ATMEL
-	bool "Atmel Target"
+	bool "Atmel Device Support"
 	depends on BR2_arm || BR2_avr32
 	default n
 

Modified: trunk/buildroot/target/device/Sharp/Config.in
===================================================================
--- trunk/buildroot/target/device/Sharp/Config.in	2007-07-12 17:04:05 UTC (rev 19077)
+++ trunk/buildroot/target/device/Sharp/Config.in	2007-07-12 18:47:48 UTC (rev 19078)
@@ -1,9 +1,16 @@
+menuconfig BR2_TARGET_SHARP
+	bool "Sharp Device Support"
+	depends on BR2_arm
+	default n
+
+if BR2_TARGET_SHARP
 comment "Sharp Specific Device Support"
 	depends BR2_arm
-
+ 
 config BR2_TARGET_SHARP_LNODE80
 	bool "Board support for the LNode80 development board"
 	depends BR2_arm
 	default n
 	help
-	  Support for the LNode80 LH79520 based device
\ No newline at end of file
+	  Support for the LNode80 LH79520 based device
+endif
