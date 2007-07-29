From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:19:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070729071944.52071A6076@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:19:44 -0700 (Sun, 29 Jul 2007)
New Revision: 19319

Log:
Cleanup of Atmel configuration

Modified:
   trunk/buildroot/target/device/Atmel/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	2007-07-29 07:17:01 UTC (rev 19318)
+++ trunk/buildroot/target/device/Atmel/Config.in	2007-07-29 07:19:44 UTC (rev 19319)
@@ -1,7 +1,7 @@
 menuconfig BR2_TARGET_ATMEL
 	bool "Atmel Device Support"
 	depends on BR2_arm || BR2_avr32
-	default n	
+	default n
 
 if BR2_TARGET_ATMEL
 
@@ -20,9 +20,8 @@
 	default	"at91sam9262ek"		if	BR2_TARGET_AT91SAM9262EK
 	default	"at91sam9263ek"		if	BR2_TARGET_AT91SAM9263EK
 	default	"at91sam9xeek"		if	BR2_TARGET_AT91SAM9XEEK
-	default	"atstk1002"		if	BR2_TARGET_STK1002
-	default	"avr32_com"		if	BR2_TARGET_AVR32_COM
-	default	"avr32_ngw"		if	BR2_TARGET_AVR32_GATEWAY
+	default	"atstk1002"		if	BR2_TARGET_AVR32_ATSTK1002
+	default	"atngw100"		if	BR2_TARGET_AVR32_ATNGW100
 
 config BR2_TARGET_AT91_ADVANCED_INFO
 	bool "Remove work in progress"
@@ -36,10 +35,10 @@
 
 
 menu "Secondary locations"
-	    
+
 config BR2_AT91_LINUXPATCH_SITE
 	string "AT91 Linux Patch mirror site"
-	depends on BR2_TARGET_AT91 || BR2_TARGET_AVR32
+	depends on BR2_TARGET_AT91
 	default "http://maxim.org.za/AT91RM9200/2.6"
 	help
 	    Main download location for AT91 Linux stuff
