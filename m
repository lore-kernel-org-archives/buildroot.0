From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 28 Sep 2007 15:20:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20070928222033.CCC92300B0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-28 15:20:27 -0700 (Fri, 28 Sep 2007)
New Revision: 20107

Log:
- rename to match Config.in.foo naming convention


Added:
   trunk/buildroot/target/device/Atmel/Config.in.at91
   trunk/buildroot/target/device/Atmel/Config.in.avr32

Removed:
   trunk/buildroot/target/device/Atmel/AT91_Config.in
   trunk/buildroot/target/device/Atmel/AVR32_Config.in

Modified:
   trunk/buildroot/target/device/Atmel/Config.in


Changeset:
Deleted: trunk/buildroot/target/device/Atmel/AT91_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AT91_Config.in	2007-09-28 22:16:47 UTC (rev 20106)
+++ trunk/buildroot/target/device/Atmel/AT91_Config.in	2007-09-28 22:20:27 UTC (rev 20107)
@@ -1,167 +0,0 @@
-comment "Atmel AT91 Specific Device Support"
-	depends BR2_arm
-
-config BR2_TARGET_AT91
-	bool "Board support for the Atmel AT91 range of microprocessors"
-	depends BR2_arm
-	default n
-	help
-	  Atmel AT91 ARM based systems
-
-choice
-	prompt "AT91 device"
-	depends BR2_TARGET_AT91
-	default BR2_TARGET_AT91RM9200
-	help
-	  Select the specific AT91 chip you wish to use.
-
-config BR2_TARGET_AT91RM9200
-	bool "Atmel AT91RM9200 Microprocessor"
-	depends BR2_TARGET_AT91
-	help
-	  Atmel AT91RM9200 ARM based systems
-
-config BR2_TARGET_AT91SAM9260
-	bool "AT91SAM9260 Microprocessor"
-	depends BR2_TARGET_AT91
-	help
-	  Atmel AT91SAM9260 ARM based systems
-
-config BR2_TARGET_AT91SAM9260A
-	bool "AT91SAM9260A Microprocessor"
-	depends BR2_TARGET_AT91 &&  ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9260A ARM based systems (Not Yet Implemented)
-
-config BR2_TARGET_AT91SAM9261
-	bool "AT91SAM9261 Microprocessor"
-	depends BR2_TARGET_AT91
-	help
-	  Atmel AT91SAM9261 ARM based systems
-
-config BR2_TARGET_AT91SAM9261S
-	bool "AT91SAM9261S Microprocessor"
-	depends BR2_TARGET_AT91
-	depends ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9261 ARM based systems (Not Yet Implemented)
-
-config BR2_TARGET_AT91SAM9262
-	bool "ATR0663 Microprocessor"
-	depends BR2_TARGET_AT91
-	depends ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel ATR0663 ARM based systems (Not Yet Implemented)
-
-config BR2_TARGET_AT91SAM9263
-	bool "Atmel AT91SAM9263 Microprocessor"
-	depends BR2_TARGET_AT91
-	help
-	  Atmel AT91SAM9263 ARM based systems
-
-config BR2_TARGET_AT91SAM9XE
-	bool "Atmel AT91SAM9XE Microprocessors"
-	depends BR2_TARGET_AT91
-	depends ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9263 ARM based systems (Not Yet Implemented)
-
-endchoice
-
-
-choice
-	prompt "Development Board support"
-	depends BR2_TARGET_AT91
-	default BR2_TARGET_AT91RM9200DF
-	help
-	  Select the specific AT91 development board you wish to use.
-
-config BR2_TARGET_AT91RM9200DF
-	bool "Atmel AT91RM9200 Generic Dataflash(Card) Board Support"
-	depends BR2_TARGET_AT91RM9200
-	help
-	  The Atmel AT91RM9200EK Development Board using Dataflashcard
-
-config BR2_TARGET_AT91RM9200SE
-	bool "Atmel AT91RM9200 Generic Dataflash(Card) Board Support (SE)"
-	depends BR2_TARGET_AT91RM9200
-	help
-	  The Atmel AT91RM9200EK Development Board using Dataflashcard (SE)
-
-config BR2_TARGET_AT91RM9200EK
-	bool "Atmel AT91RM9200EK Development Board Support"
-	depends BR2_TARGET_AT91RM9200
-	help
-	  The Atmel AT91RM9200EK Development Board
-
-config BR2_TARGET_AT91RM9200DK
-	bool "Atmel AT91RM9200DK Development Board Support"
-	depends BR2_TARGET_AT91RM9200
-	help
-	  The Atmel AT91RM9200DK Development Board
-
-config BR2_TARGET_AT91SAM9260DFC
-	bool "Atmel AT91SAM9260DFC"
-	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
-	help
-	  The Atmel AT91SAM9260 Development Board Booting from Dataflash
-
-config BR2_TARGET_AT91SAM9260EK
-	bool "Atmel AT91SAM9260EK"
-	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
-	help
-	  The Atmel AT91SAM9260 Development Board
-
-config BR2_TARGET_AT91SAM9260PF
-	bool "Atmel AT91SAM9260 running from parallel flash"
-	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
-	help
-	  Generic support for the Atmel AT91SAM9260 running from parallel flash
-
-config BR2_TARGET_AT91SAM9261EK
-	bool "Atmel AT91SAM9261EK"
-	depends BR2_TARGET_AT91SAM9261 || BR2_TARGET_AT91SAM9261S
-	help
-	  The Atmel AT91SAM9261 Development Board
-
-config BR2_TARGET_AT91SAM9262EK
-	bool "Atmel AT91SAM9262EK"
-	depends BR2_TARGET_AT91SAM9262
-	help
-	  The Atmel AT91SAM9262 Development Board (Not Yet Implemented)
-
-config BR2_TARGET_AT91SAM9263EK
-	bool "Atmel AT91SAM9263EK"
-	depends BR2_TARGET_AT91SAM9263
-	help
-	  The Atmel AT91SAM9263 Development Board (Not Yet Implemented)
-
-config BR2_TARGET_AT91SAM9XEEK
-	bool "Atmel AT91SAM9XE-EK"
-	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
-	help
-	  The Atmel AT91SAM9xe Development Board (Not Yet Implemented)
-
-endchoice
-
-choice
-	prompt "SPI Mode"
-	depends BR2_TARGET_AT91SAM9261EK
-	default BR2_TARGET_AT91SAM9261EK_SPIMODE0
-	help
-	  Select SPI Mode 0 or 3
-
-config BR2_TARGET_AT91SAM9261EK_SPIMODE0
-	bool "SPI Mode 0"
-	depends BR2_TARGET_AT91SAM9261EK
-	help
-	  Use SPI Mode 0, Required for AT45DB642D chips
-
-config BR2_TARGET_AT91SAM9261EK_SPIMODE3
-	bool "SPI Mode 3"
-	depends BR2_TARGET_AT91SAM9261EK
-	help
-	  Use SPI Mode 3
-
-endchoice
-

Deleted: trunk/buildroot/target/device/Atmel/AVR32_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AVR32_Config.in	2007-09-28 22:16:47 UTC (rev 20106)
+++ trunk/buildroot/target/device/Atmel/AVR32_Config.in	2007-09-28 22:20:27 UTC (rev 20107)
@@ -1,62 +0,0 @@
-comment "Atmel AVR32 Specific Device Support"
-	depends BR2_avr32
-
-config BR2_TARGET_AVR32
-	bool "Board support for the Atmel AP7 microprocessors"
-	depends BR2_avr32
-	default n
-	help
-	  Atmel AT32AP7XXX AVR32 based systems
-
-choice
-	prompt "AVR32 device"
-	depends BR2_TARGET_AVR32
-	default BR2_TARGET_AT32AP7000
-	help
-	  Select the specific AVR32 chip you wish to use.
-
-config BR2_TARGET_AT32AP7000
-	bool "Board support for the Atmel AT32AP7000 Microprocessor"
-	depends BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7000 AVR32 based systems
-
-config BR2_TARGET_AT32AP7001
-	bool "Board support for the Atmel AT32AP7001 Microprocessor"
-	depends BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7001 AVR32 based systems
-
-config BR2_TARGET_AT32AP7002
-	bool "Board support for the Atmel AT32AP7002 Microprocessor"
-	depends BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7002 AVR32 based systems
-
-endchoice
-
-comment "Development Board support"
-	depends BR2_TARGET_AVR32
-
-choice
-	prompt "Development Board support"
-	depends BR2_TARGET_AVR32
-	default BR2_TARGET_AVR32_ATSTK1002
-	help
-	  Select the specific AVR32 development board you wish to use.
-
-config BR2_TARGET_AVR32_ATSTK1002
-	bool "Atmel ATSTK1000/2 AVR32 Development Board Support"
-	depends BR2_TARGET_AT32AP7000
-	select BR2_PACKAGE_LINUX
-	help
-	  The Atmel ATSTK1000 AVR32 Development Board
-
-config BR2_TARGET_AVR32_ATNGW100
-	bool "Atmel AVR32 Network Gateway Board Support"
-	depends BR2_TARGET_AT32AP7000
-	select BR2_PACKAGE_LINUX
-	help
-	  The Atmel AVR32 Network Gateway Board
-
-endchoice

Modified: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	2007-09-28 22:16:47 UTC (rev 20106)
+++ trunk/buildroot/target/device/Atmel/Config.in	2007-09-28 22:20:27 UTC (rev 20107)
@@ -5,8 +5,8 @@
 
 if BR2_TARGET_ATMEL
 
-source "target/device/Atmel/AT91_Config.in"
-source "target/device/Atmel/AVR32_Config.in"
+source "target/device/Atmel/Config.in.at91"
+source "target/device/Atmel/Config.in.avr32"
 
 config BR2_BOARD_NAME
 	string

Copied: trunk/buildroot/target/device/Atmel/Config.in.at91 (from rev 20100, trunk/buildroot/target/device/Atmel/AT91_Config.in)
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in.at91	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/Config.in.at91	2007-09-28 22:20:27 UTC (rev 20107)
@@ -0,0 +1,167 @@
+comment "Atmel AT91 Specific Device Support"
+	depends BR2_arm
+
+config BR2_TARGET_AT91
+	bool "Board support for the Atmel AT91 range of microprocessors"
+	depends BR2_arm
+	default n
+	help
+	  Atmel AT91 ARM based systems
+
+choice
+	prompt "AT91 device"
+	depends BR2_TARGET_AT91
+	default BR2_TARGET_AT91RM9200
+	help
+	  Select the specific AT91 chip you wish to use.
+
+config BR2_TARGET_AT91RM9200
+	bool "Atmel AT91RM9200 Microprocessor"
+	depends BR2_TARGET_AT91
+	help
+	  Atmel AT91RM9200 ARM based systems
+
+config BR2_TARGET_AT91SAM9260
+	bool "AT91SAM9260 Microprocessor"
+	depends BR2_TARGET_AT91
+	help
+	  Atmel AT91SAM9260 ARM based systems
+
+config BR2_TARGET_AT91SAM9260A
+	bool "AT91SAM9260A Microprocessor"
+	depends BR2_TARGET_AT91 &&  ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel AT91SAM9260A ARM based systems (Not Yet Implemented)
+
+config BR2_TARGET_AT91SAM9261
+	bool "AT91SAM9261 Microprocessor"
+	depends BR2_TARGET_AT91
+	help
+	  Atmel AT91SAM9261 ARM based systems
+
+config BR2_TARGET_AT91SAM9261S
+	bool "AT91SAM9261S Microprocessor"
+	depends BR2_TARGET_AT91
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel AT91SAM9261 ARM based systems (Not Yet Implemented)
+
+config BR2_TARGET_AT91SAM9262
+	bool "ATR0663 Microprocessor"
+	depends BR2_TARGET_AT91
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel ATR0663 ARM based systems (Not Yet Implemented)
+
+config BR2_TARGET_AT91SAM9263
+	bool "Atmel AT91SAM9263 Microprocessor"
+	depends BR2_TARGET_AT91
+	help
+	  Atmel AT91SAM9263 ARM based systems
+
+config BR2_TARGET_AT91SAM9XE
+	bool "Atmel AT91SAM9XE Microprocessors"
+	depends BR2_TARGET_AT91
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel AT91SAM9263 ARM based systems (Not Yet Implemented)
+
+endchoice
+
+
+choice
+	prompt "Development Board support"
+	depends BR2_TARGET_AT91
+	default BR2_TARGET_AT91RM9200DF
+	help
+	  Select the specific AT91 development board you wish to use.
+
+config BR2_TARGET_AT91RM9200DF
+	bool "Atmel AT91RM9200 Generic Dataflash(Card) Board Support"
+	depends BR2_TARGET_AT91RM9200
+	help
+	  The Atmel AT91RM9200EK Development Board using Dataflashcard
+
+config BR2_TARGET_AT91RM9200SE
+	bool "Atmel AT91RM9200 Generic Dataflash(Card) Board Support (SE)"
+	depends BR2_TARGET_AT91RM9200
+	help
+	  The Atmel AT91RM9200EK Development Board using Dataflashcard (SE)
+
+config BR2_TARGET_AT91RM9200EK
+	bool "Atmel AT91RM9200EK Development Board Support"
+	depends BR2_TARGET_AT91RM9200
+	help
+	  The Atmel AT91RM9200EK Development Board
+
+config BR2_TARGET_AT91RM9200DK
+	bool "Atmel AT91RM9200DK Development Board Support"
+	depends BR2_TARGET_AT91RM9200
+	help
+	  The Atmel AT91RM9200DK Development Board
+
+config BR2_TARGET_AT91SAM9260DFC
+	bool "Atmel AT91SAM9260DFC"
+	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
+	help
+	  The Atmel AT91SAM9260 Development Board Booting from Dataflash
+
+config BR2_TARGET_AT91SAM9260EK
+	bool "Atmel AT91SAM9260EK"
+	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
+	help
+	  The Atmel AT91SAM9260 Development Board
+
+config BR2_TARGET_AT91SAM9260PF
+	bool "Atmel AT91SAM9260 running from parallel flash"
+	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
+	help
+	  Generic support for the Atmel AT91SAM9260 running from parallel flash
+
+config BR2_TARGET_AT91SAM9261EK
+	bool "Atmel AT91SAM9261EK"
+	depends BR2_TARGET_AT91SAM9261 || BR2_TARGET_AT91SAM9261S
+	help
+	  The Atmel AT91SAM9261 Development Board
+
+config BR2_TARGET_AT91SAM9262EK
+	bool "Atmel AT91SAM9262EK"
+	depends BR2_TARGET_AT91SAM9262
+	help
+	  The Atmel AT91SAM9262 Development Board (Not Yet Implemented)
+
+config BR2_TARGET_AT91SAM9263EK
+	bool "Atmel AT91SAM9263EK"
+	depends BR2_TARGET_AT91SAM9263
+	help
+	  The Atmel AT91SAM9263 Development Board (Not Yet Implemented)
+
+config BR2_TARGET_AT91SAM9XEEK
+	bool "Atmel AT91SAM9XE-EK"
+	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
+	help
+	  The Atmel AT91SAM9xe Development Board (Not Yet Implemented)
+
+endchoice
+
+choice
+	prompt "SPI Mode"
+	depends BR2_TARGET_AT91SAM9261EK
+	default BR2_TARGET_AT91SAM9261EK_SPIMODE0
+	help
+	  Select SPI Mode 0 or 3
+
+config BR2_TARGET_AT91SAM9261EK_SPIMODE0
+	bool "SPI Mode 0"
+	depends BR2_TARGET_AT91SAM9261EK
+	help
+	  Use SPI Mode 0, Required for AT45DB642D chips
+
+config BR2_TARGET_AT91SAM9261EK_SPIMODE3
+	bool "SPI Mode 3"
+	depends BR2_TARGET_AT91SAM9261EK
+	help
+	  Use SPI Mode 3
+
+endchoice
+

Copied: trunk/buildroot/target/device/Atmel/Config.in.avr32 (from rev 20100, trunk/buildroot/target/device/Atmel/AVR32_Config.in)
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in.avr32	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/Config.in.avr32	2007-09-28 22:20:27 UTC (rev 20107)
@@ -0,0 +1,62 @@
+comment "Atmel AVR32 Specific Device Support"
+	depends BR2_avr32
+
+config BR2_TARGET_AVR32
+	bool "Board support for the Atmel AP7 microprocessors"
+	depends BR2_avr32
+	default n
+	help
+	  Atmel AT32AP7XXX AVR32 based systems
+
+choice
+	prompt "AVR32 device"
+	depends BR2_TARGET_AVR32
+	default BR2_TARGET_AT32AP7000
+	help
+	  Select the specific AVR32 chip you wish to use.
+
+config BR2_TARGET_AT32AP7000
+	bool "Board support for the Atmel AT32AP7000 Microprocessor"
+	depends BR2_TARGET_AVR32
+	help
+	  Atmel AT32AP7000 AVR32 based systems
+
+config BR2_TARGET_AT32AP7001
+	bool "Board support for the Atmel AT32AP7001 Microprocessor"
+	depends BR2_TARGET_AVR32
+	help
+	  Atmel AT32AP7001 AVR32 based systems
+
+config BR2_TARGET_AT32AP7002
+	bool "Board support for the Atmel AT32AP7002 Microprocessor"
+	depends BR2_TARGET_AVR32
+	help
+	  Atmel AT32AP7002 AVR32 based systems
+
+endchoice
+
+comment "Development Board support"
+	depends BR2_TARGET_AVR32
+
+choice
+	prompt "Development Board support"
+	depends BR2_TARGET_AVR32
+	default BR2_TARGET_AVR32_ATSTK1002
+	help
+	  Select the specific AVR32 development board you wish to use.
+
+config BR2_TARGET_AVR32_ATSTK1002
+	bool "Atmel ATSTK1000/2 AVR32 Development Board Support"
+	depends BR2_TARGET_AT32AP7000
+	select BR2_PACKAGE_LINUX
+	help
+	  The Atmel ATSTK1000 AVR32 Development Board
+
+config BR2_TARGET_AVR32_ATNGW100
+	bool "Atmel AVR32 Network Gateway Board Support"
+	depends BR2_TARGET_AT32AP7000
+	select BR2_PACKAGE_LINUX
+	help
+	  The Atmel AVR32 Network Gateway Board
+
+endchoice
