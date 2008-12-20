From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 22:17:52 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20081220221752.72EE276CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 22:17:52 +0000 (Sat, 20 Dec 2008)
New Revision: 24468

Log:
Hide AT91 features if not an AT91 ARM

Modified:
   trunk/buildroot/target/device/Atmel/AT91_Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/AT91_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AT91_Config.in	2008-12-20 21:45:59 UTC (rev 24467)
+++ trunk/buildroot/target/device/Atmel/AT91_Config.in	2008-12-20 22:17:52 UTC (rev 24468)
@@ -8,30 +8,36 @@
 	  Atmel AT91 ARM based systems
 
 comment	"Selection criteria"
+	depends on BR2_TARGET_AT91
 
 config	BR2_TARGET_ATMEL_ALL
 	bool "Allow all ARM targets"
-	depends on BR2_arm
+	depends on BR2_TARGET_AT91
 	default y
 
 config	BR2_TARGET_ATMEL_NET
 	bool "With network controller"
+	depends on BR2_TARGET_AT91
 	depends on !BR2_TARGET_ATMEL_ALL
 	default y
 
 config	BR2_TARGET_ATMEL_LCD
 	bool "With LCD controller"
+	depends on BR2_TARGET_AT91
 	depends on !BR2_TARGET_ATMEL_ALL
 
 config	BR2_TARGET_ATMEL_FPDSP
 	bool "With Floating Point DSP"
+	depends on BR2_TARGET_AT91
 	depends on !BR2_TARGET_ATMEL_ALL
 
 config	BR2_TARGET_ATMEL_MPB
 	bool "With customizable MP-Block"
+	depends on BR2_TARGET_AT91
 	depends on !BR2_TARGET_ATMEL_ALL
 
 comment "Device Selection"
+	depends on BR2_TARGET_AT91
 
 choice
 	prompt "AT91 device"
@@ -170,6 +176,7 @@
 endchoice
 
 comment "Development Board Selection"
+	depends on BR2_TARGET_AT91
 
 choice
 	prompt "Development Board support"
