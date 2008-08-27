From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:18:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91bootstrap
Message-ID: <20080827201837.7C05F3C7E2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:18:37 -0700 (Wed, 27 Aug 2008)
New Revision: 23248

Log:
target/device/Atmel: fix long help text lines

And remove trailing spaces while we're at it.

Modified:
   trunk/buildroot/target/device/Atmel/AVR32_Config.in
   trunk/buildroot/target/device/Atmel/Config.in.mirrors
   trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/AVR32_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AVR32_Config.in	2008-08-27 20:18:33 UTC (rev 23247)
+++ trunk/buildroot/target/device/Atmel/AVR32_Config.in	2008-08-27 20:18:37 UTC (rev 23248)
@@ -70,6 +70,7 @@
 	depends on BR2_TARGET_AT32AP7000
 	select BR2_PACKAGE_LINUX
 	help
-	  The Atmel AVR32 Network Gateway Board expanded to include audio, video, and PS/2.
+	  The Atmel AVR32 Network Gateway Board expanded to include
+	  audio, video, and PS/2.
 
 endchoice

Modified: trunk/buildroot/target/device/Atmel/Config.in.mirrors
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in.mirrors	2008-08-27 20:18:33 UTC (rev 23247)
+++ trunk/buildroot/target/device/Atmel/Config.in.mirrors	2008-08-27 20:18:37 UTC (rev 23248)
@@ -4,18 +4,22 @@
 	string "Atmel AVR32/AT91 download site"
 	default "ftp://www.at91.com/pub/buildroot/"
 	help
-	  Unofficial site for AVR32/AT91 Buildroot patches, or your local mirror.
+	  Unofficial site for AVR32/AT91 Buildroot patches, or your
+	  local mirror.
+
 	  Atmel does not currently support buildroot, but this site makes
 	  available neccessary patches and prepatched packages useful
 	  to extend a buildroot for AVR32 or AT91 ARM based boards.
 	  Issues with contents of this server needs to be highlighted
-	  on the buildroot mailing list and
-	  should not be addressed directly to Atmel
+	  on the buildroot mailing list and should not be addressed
+	  directly to Atmel.
+
 	  Atmel provides support for their AVR32 chips on
 	  http://avr32linux.org/ or http://www.avrfreaks.net/
 	  Atmel provides support for AT91 chips on www.at91.com.
 	  Commercial AT91 Linux support is through www.timesys.com
-	  Community  AT91 Linux support is through http://maxim.org.za/AT91_26.html
+	  Community  AT91 Linux support is through
+	  http://maxim.org.za/AT91_26.html
 
 config BR2_AT91_PATCH_MIRROR
 	string "Atmel AT91 Linux Patch download site"

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2008-08-27 20:18:33 UTC (rev 23247)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/Config.in	2008-08-27 20:18:37 UTC (rev 23248)
@@ -9,8 +9,10 @@
 	depends on BR2_TARGET_AT91BOOTSTRAP
 	help
 	  Select Chip for which AT91 bootstrap should be built
-	  Currently supports AT91SAM9260EK, AT91SAM9261EK, AT91SAM9XEEK, AT981SAM9263EK
+	  Currently supports AT91SAM9260EK, AT91SAM9261EK,
+	  AT91SAM9XEEK, AT981SAM9263EK
 
+
 config BR2_TARGET_AT91BOOT_DATAFLASH
         depends on BR2_TARGET_AT91SAM9260EK || BR2_TARGET_AT91SAM9261EK || \
 		BR2_TARGET_AT91SAM9263EK || BR2_TARGET_AT91SAM9XEEK
@@ -48,14 +50,16 @@
 	  Select the size of your application
 	  AT91 Bootstrap will copy this amount from flash to SDRAM
 
-choice	
+choice
 	prompt "Start address of application"
 	default BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
 	depends on BR2_TARGET_AT91BOOTSTRAP
 	help
 	  Select Chip for which AT91 bootstrap should be built
-	  Currently supports AT91SAM9260EK, AT91SAM9261EK, AT91SAM9XEEK, AT91SAM9263EK
+	  Currently supports AT91SAM9260EK, AT91SAM9261EK,
+	  AT91SAM9XEEK, AT91SAM9263EK
 
+
 config	BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
 	bool "Copy to the default U-Boot start location in the SDRAM"
 	help
@@ -75,7 +79,7 @@
 config	BR2_AT91BOOTSTRAP_JUMP_ADDR
 	string
 	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
-	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM	
+	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM
 	default "0x20000000" if BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM
 	depends on BR2_TARGET_AT91BOOTSTRAP
 
