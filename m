From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 16:36:45 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91bootstrap
Message-ID: <20090106163645.D380976BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 16:36:45 +0000 (Tue, 06 Jan 2009)
New Revision: 24708

Log:
Add support for SAM9G20 in at91bootstrap

Modified:
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2009-01-06 16:30:32 UTC (rev 24707)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2009-01-06 16:36:45 UTC (rev 24708)
@@ -1,6 +1,6 @@
 config BR2_TARGET_AT91BOOTSTRAP
 	depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9260DFC || BR2_TARGET_AT91SAM9260PF || \
-	BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9XEEK
+	BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9XEEK || BR2_TARGET_AT91SAM9G20DFC
 	bool "Build AT91 Bootstrap for selected chip"
 
 config BR2_TARGET_AT91BOOTSTRAP_BOARD
@@ -22,16 +22,16 @@
 
 config BR2_TARGET_AT91BOOT_DATAFLASH
         depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9261EK || \
-		BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9XEEK
+		BR2_TARGET_AT91SAM9XEEK  || BR2_TARGET_AT91SAM9G20DFC
 
 	bool "Dataflash"
 
 config BR2_TARGET_AT91BOOT_DATAFLASHCARD
-       depends on BR2_TARGET_AT91SAM9260DFC
+       depends on BR2_TARGET_AT91SAM9260DFC || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9G20DFC
 	bool "Dataflash Card"
 
 config BR2_TARGET_AT91BOOT_NANDFLASH
-        depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK
+        depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9261EK || BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9G20DFC
 	bool "NAND Flash"
 
 config BR2_TARGET_AT91BOOT_FLASH
