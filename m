From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:22:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070729072212.9FC23A60D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:22:12 -0700 (Sun, 29 Jul 2007)
New Revision: 19320

Log:
Update AVR32 target configuration

Modified:
   trunk/buildroot/target/device/Atmel/AVR32_Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/AVR32_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AVR32_Config.in	2007-07-29 07:19:44 UTC (rev 19319)
+++ trunk/buildroot/target/device/Atmel/AVR32_Config.in	2007-07-29 07:22:12 UTC (rev 19320)
@@ -2,7 +2,7 @@
 	depends BR2_avr32
 
 config BR2_TARGET_AVR32
-	bool "Board support for the Atmel AP7000 range of microprocessors"
+	bool "Board support for the Atmel AP7 microprocessors"
 	depends BR2_avr32
 	default n
 	help
@@ -33,24 +33,6 @@
 	help
 	  Atmel AT32AP7002 AVR32 based systems
 
-config BR2_TARGET_AT32AP7200
-	bool "Board support for the Atmel AT32AP7200 Microprocessor"
-	depends BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7200 AVR32 based systems
-
-config BR2_TARGET_AT32AP7010
-	bool "Board support for the Atmel AT32AP7010 Microprocessor"
-	depends BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7010 AVR32 based systems
-
-config BR2_TARGET_AT32AP7020
-	bool "Board support for the Atmel AT32AP7020 Microprocessor"
-	depends BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7020 AVR32 based systems
-
 endchoice
 
 comment "Development Board support"
@@ -59,31 +41,22 @@
 choice
 	prompt "Development Board support"
 	depends BR2_TARGET_AVR32
-	default BR2_TARGET_STK1000
+	default BR2_TARGET_AVR32_ATSTK1002
 	help
 	  Select the specific AVR32 development board you wish to use.
 
-config BR2_TARGET_STK1002
-	bool "Atmel STK1000/2 AVR32 Development Board Support"
+config BR2_TARGET_AVR32_ATSTK1002
+	bool "Atmel ATSTK1000/2 AVR32 Development Board Support"
 	depends BR2_TARGET_AT32AP7000
 	select BR2_PACKAGE_LINUX
 	help
-	  The Atmel STK1000 AVR32 Development Board
+	  The Atmel ATSTK1000 AVR32 Development Board
 
-config BR2_TARGET_AVR32_GATEWAY
+config BR2_TARGET_AVR32_ATNGW100
 	bool "Atmel AVR32 Network Gateway Board Support"
 	depends BR2_TARGET_AT32AP7000
 	select BR2_PACKAGE_LINUX
 	help
 	  The Atmel AVR32 Network Gateway Board
 
-config BR2_TARGET_AVR32_COM
-	bool "Atmel AVR32 Computer On Module Support"
-	depends BR2_TARGET_AT32AP7200
-	select BR2_PACKAGE_LINUX
-	help
-	  The Atmel AVR32 Computer On Module (Not Yet Implemented)
-
 endchoice
-
-
