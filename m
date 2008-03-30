From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 30 Mar 2008 15:23:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20080330222339.997CD3C558@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-30 15:23:39 -0700 (Sun, 30 Mar 2008)
New Revision: 21590

Log:
Add Configs for new boards

Modified:
   trunk/buildroot/target/device/Atmel/AT91_Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/AT91_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AT91_Config.in	2008-03-30 21:49:16 UTC (rev 21589)
+++ trunk/buildroot/target/device/Atmel/AT91_Config.in	2008-03-30 22:23:39 UTC (rev 21590)
@@ -8,71 +8,177 @@
 	help
 	  Atmel AT91 ARM based systems
 
+comment	"Selection criteria"
+
+config	BR2_TARGET_ATMEL_ALL
+	bool "Allow all ARM targets"
+	default y
+
+config	BR2_TARGET_ATMEL_NET
+	bool "With network controller"
+	depends on !BR2_TARGET_ATMEL_ALL
+	default y
+
+config	BR2_TARGET_ATMEL_LCD
+	bool "With LCD controller"
+	depends on !BR2_TARGET_ATMEL_ALL
+	default n
+
+config	BR2_TARGET_ATMEL_FPDSP
+	bool "With Floating Point DSP"
+	depends on !BR2_TARGET_ATMEL_ALL
+	default n
+
+config	BR2_TARGET_ATMEL_MPB
+	bool "With customizable MP-Block"
+	depends on !BR2_TARGET_ATMEL_ALL
+	default n
+
+comment "Device Selection"
+
 choice
 	prompt "AT91 device"
 	depends BR2_TARGET_AT91
-	default BR2_TARGET_AT91RM9200
+	default BR2_TARGET_AT91SAM9260
 	help
 	  Select the specific AT91 chip you wish to use.
 
 config BR2_TARGET_AT91RM9200
 	bool "Atmel AT91RM9200 Microprocessor"
 	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_LCD
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
 	help
 	  Atmel AT91RM9200 ARM based systems
 
 config BR2_TARGET_AT91SAM9260
-	bool "AT91SAM9260 Microprocessor"
+	bool "Atmel AT91SAM9260 Microprocessor"
 	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_LCD
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
 	help
 	  Atmel AT91SAM9260 ARM based systems
 
-config BR2_TARGET_AT91SAM9260A
-	bool "AT91SAM9260A Microprocessor"
-	depends BR2_TARGET_AT91 &&  ! BR2_TARGET_AT91_ADVANCED_INFO
+config BR2_TARGET_AT91SAM9G20
+	bool "Atmel AT91SAM9G20 Microprocessor"
+	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_LCD
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
 	help
-	  Atmel AT91SAM9260A ARM based systems (Not Yet Implemented)
+	  Atmel AT91SAM9G20 ARM based systems (Not Yet Implemented)
 
 config BR2_TARGET_AT91SAM9261
-	bool "AT91SAM9261 Microprocessor"
+	bool "Atmel AT91SAM9261 Microprocessor"
 	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_NET
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
 	help
 	  Atmel AT91SAM9261 ARM based systems
 
 config BR2_TARGET_AT91SAM9261S
-	bool "AT91SAM9261S Microprocessor"
+	bool "Atmel AT91SAM9261S Microprocessor"
 	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_NET
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
 	depends ! BR2_TARGET_AT91_ADVANCED_INFO
 	help
 	  Atmel AT91SAM9261 ARM based systems (Not Yet Implemented)
 
-config BR2_TARGET_AT91SAM9262
-	bool "ATR0663 Microprocessor"
+config BR2_TARGET_AT91SAM9RL64
+	bool "Atmel AT91SAM9RL64 Microprocessor"
 	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_NET
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
 	depends ! BR2_TARGET_AT91_ADVANCED_INFO
 	help
-	  Atmel ATR0663 ARM based systems (Not Yet Implemented)
+	  Atmel AT91SAM9RL64 ARM based systems (Not Yet Implemented)
 
 config BR2_TARGET_AT91SAM9263
 	bool "Atmel AT91SAM9263 Microprocessor"
 	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
 	help
 	  Atmel AT91SAM9263 ARM based systems
 
+config BR2_TARGET_AT91SAM9G41
+	bool "Atmel AT91SAM9G41 Microprocessor"
+	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel AT91SAM9G41 ARM based systems
+
+config BR2_TARGET_AT91SAM9M10
+	bool "Atmel AT91SAM9M10 Microprocessor"
+	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel AT91SAM9M10 ARM based systems
+
+config BR2_TARGET_AT91SAM9M11
+	bool "Atmel AT91SAM9M11 Microprocessor"
+	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel AT91SAM9M11 ARM based systems
+
 config BR2_TARGET_AT91SAM9XE
 	bool "Atmel AT91SAM9XE Microprocessors"
 	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_LCD
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
 	depends ! BR2_TARGET_AT91_ADVANCED_INFO
 	help
 	  Atmel AT91SAM9263 ARM based systems (Not Yet Implemented)
 
+config BR2_TARGET_AT572D940HF
+	bool "Atmel AT572D940HF Microprocessor"
+	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_LCD
+	depends !BR2_TARGET_ATMEL_MPB
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel AT572D940 ARM based systems
+
+config BR2_TARGET_AT91CAP9
+	bool "Atmel AT91CAP9 Microprocessor"
+	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel AT91CAP9 ARM based systems
+
+config BR2_TARGET_AT91SAM9262
+	bool "Atmel ATR0663 Microprocessor"
+	depends BR2_TARGET_AT91
+	depends !BR2_TARGET_ATMEL_FPDSP
+	depends !BR2_TARGET_ATMEL_MPB
+	depends ! BR2_TARGET_AT91_ADVANCED_INFO
+	help
+	  Atmel ATR0663 ARM based systems (Not Yet Implemented)
+
 endchoice
 
+comment "Development Board Selection"
 
 choice
 	prompt "Development Board support"
 	depends BR2_TARGET_AT91
-	default BR2_TARGET_AT91RM9200DF
+	default BR2_TARGET_AT91SAM9260DFC
 	help
 	  Select the specific AT91 development board you wish to use.
 
@@ -102,22 +208,34 @@
 
 config BR2_TARGET_AT91SAM9260DFC
 	bool "Atmel AT91SAM9260DFC"
-	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
+	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9G20 || BR2_TARGET_AT91SAM9XE
 	help
-	  The Atmel AT91SAM9260 Development Board Booting from Dataflash
+	  The Atmel AT91SAM9260 Development Board booting from Dataflashcard
 
 config BR2_TARGET_AT91SAM9260EK
 	bool "Atmel AT91SAM9260EK"
-	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
+	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9G20 || BR2_TARGET_AT91SAM9XE
 	help
-	  The Atmel AT91SAM9260 Development Board
+	  The Atmel AT91SAM9260 Development Board booting from dataflash
 
+config BR2_TARGET_AT91SAM9XEEK
+	bool "Atmel AT91SAM9XE-EK"
+	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9G20 || BR2_TARGET_AT91SAM9XE
+	help
+	  The Atmel AT91SAM9xe Development Board (Not Yet Implemented)
+
 config BR2_TARGET_AT91SAM9261EK
 	bool "Atmel AT91SAM9261EK"
 	depends BR2_TARGET_AT91SAM9261 || BR2_TARGET_AT91SAM9261S
 	help
 	  The Atmel AT91SAM9261 Development Board
 
+config BR2_TARGET_AT91SAM9RL64EK
+	bool "Atmel AT91SAM9RL64EK"
+	depends BR2_TARGET_AT91SAM9RL64
+	help
+	  The Atmel AT91SAM9RL64 Development Board
+
 config BR2_TARGET_AT91SAM9262EK
 	bool "Atmel AT91SAM9262EK"
 	depends BR2_TARGET_AT91SAM9262
@@ -130,12 +248,24 @@
 	help
 	  The Atmel AT91SAM9263 Development Board (Not Yet Implemented)
 
-config BR2_TARGET_AT91SAM9XEEK
-	bool "Atmel AT91SAM9XE-EK"
-	depends BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9260A || BR2_TARGET_AT91SAM9XE
+config BR2_TARGET_AT572D940DCM
+	bool "Atmel AT572D940 Diopsis Computer Module"
+	depends BR2_TARGET_AT572D940HF
 	help
-	  The Atmel AT91SAM9xe Development Board (Not Yet Implemented)
+	  The Atmel Diopsis CPU Module (Not Yet Implemented)
 
+config BR2_TARGET_AT91CAP9DK
+	bool "Atmel AT91CAP9DK"
+	depends BR2_TARGET_AT91CAP9
+	help
+	  The Atmel AT91CAP9 Development Kit (Not Yet Implemented)
+
+config BR2_TARGET_AT91CAP9STK
+	bool "Atmel AT91CAP9STK"
+	depends BR2_TARGET_AT91CAP9
+	help
+	  The Atmel AT91CAP9 Starter Kit (Not Yet Implemented)
+
 endchoice
 
 choice
