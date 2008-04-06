From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  6 Apr 2008 01:19:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/ARM
Message-ID: <20080406081958.CF5183C3B5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-06 01:19:58 -0700 (Sun, 06 Apr 2008)
New Revision: 21648

Log:
target/device/ARM: Use menuconfig and add description of options


Modified:
   trunk/buildroot/target/device/ARM/Config.in


Changeset:
Modified: trunk/buildroot/target/device/ARM/Config.in
===================================================================
--- trunk/buildroot/target/device/ARM/Config.in	2008-04-06 08:08:07 UTC (rev 21647)
+++ trunk/buildroot/target/device/ARM/Config.in	2008-04-06 08:19:58 UTC (rev 21648)
@@ -1,15 +1,20 @@
-config BR2_TARGET_ARM
-	bool
+menuconfig BR2_TARGET_ARM
+	bool "Generic ARM Support"
 	depends on BR2_arm
 	depends on !BR2_TARGET_ARMLTD
 	depends on !BR2_TARGET_ATMEL
 	depends on !BR2_TARGET_SHARP
 	default y
 
+if BR2_TARGET_ARM
+
 config BR2_BOARD_NAME
-	string
+	string "Board Name"
 	default "arm"
 
 config BR2_BOARD_PATH
-	string
+	string "Board Path"
 	default "target/device/ARM"
+
+endif
+
