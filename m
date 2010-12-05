From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:41 +0100
Subject: [Buildroot] [PATCH 10/55] Remove all Config.in/Makefile.in files in
	target/device
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <9a3eb8017e9fcebefdd16f6971909d0f18b6f953.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/device/ARMLTD/Config.in                 |   36 ---
 target/device/ARMLTD/Makefile.in               |    5 -
 target/device/Atmel/AT91_Config.in             |  335 ------------------------
 target/device/Atmel/AVR32_Config.in            |   82 ------
 target/device/Atmel/Config.in                  |   62 -----
 target/device/Atmel/Makefile.in                |   20 --
 target/device/Atmel/at91rm9200df/Makefile.in   |    6 -
 target/device/Atmel/at91sam9260dfc/Makefile.in |   22 --
 target/device/Atmel/at91sam9260pf/Makefile.in  |    7 -
 target/device/Atmel/at91sam9261ek/Makefile.in  |   22 --
 target/device/Atmel/at91sam9263ek/Makefile.in  |   18 --
 target/device/Atmel/at91sam9g20dfc/Makefile.in |   17 --
 target/device/Atmel/atngw100-base/Makefile.in  |    4 -
 target/device/Atmel/atngw100/Makefile.in       |    4 -
 target/device/Atmel/atstk1005/Makefile.in      |    3 -
 target/device/Atmel/atstk100x/Makefile.in      |    4 -
 target/device/Config.in                        |   15 -
 target/device/KwikByte/Config.in               |   90 -------
 target/device/KwikByte/Makefile.in             |   10 -
 target/device/KwikByte/kb9202/Makefile.in      |    3 -
 target/device/Makefile.in                      |    2 -
 target/device/valka/Config.in                  |   25 --
 target/device/valka/Makefile.in                |    6 -
 target/device/x86/Config.in                    |   26 --
 target/device/x86/Makefile.in                  |    4 -
 target/device/x86/i686/Makefile.in             |    3 -
 target/device/xtensa/Config.in                 |   21 --
 target/device/xtensa/Makefile.in               |    7 -
 28 files changed, 0 insertions(+), 859 deletions(-)
 delete mode 100644 target/device/ARMLTD/Config.in
 delete mode 100644 target/device/ARMLTD/Makefile.in
 delete mode 100644 target/device/Atmel/AT91_Config.in
 delete mode 100644 target/device/Atmel/AVR32_Config.in
 delete mode 100644 target/device/Atmel/Config.in
 delete mode 100644 target/device/Atmel/Makefile.in
 delete mode 100644 target/device/Atmel/at91rm9200df/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9260dfc/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9260pf/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9261ek/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9263ek/Makefile.in
 delete mode 100644 target/device/Atmel/at91sam9g20dfc/Makefile.in
 delete mode 100644 target/device/Atmel/atngw100-base/Makefile.in
 delete mode 100644 target/device/Atmel/atngw100/Makefile.in
 delete mode 100644 target/device/Atmel/atstk1005/Makefile.in
 delete mode 100644 target/device/Atmel/atstk100x/Makefile.in
 delete mode 100644 target/device/Config.in
 delete mode 100644 target/device/KwikByte/Config.in
 delete mode 100644 target/device/KwikByte/Makefile.in
 delete mode 100644 target/device/KwikByte/kb9202/Makefile.in
 delete mode 100644 target/device/Makefile.in
 delete mode 100644 target/device/valka/Config.in
 delete mode 100644 target/device/valka/Makefile.in
 delete mode 100644 target/device/x86/Config.in
 delete mode 100644 target/device/x86/Makefile.in
 delete mode 100644 target/device/x86/i686/Makefile.in
 delete mode 100644 target/device/xtensa/Config.in
 delete mode 100644 target/device/xtensa/Makefile.in

diff --git a/target/device/ARMLTD/Config.in b/target/device/ARMLTD/Config.in
deleted file mode 100644
index 66f031c..0000000
--- a/target/device/ARMLTD/Config.in
+++ /dev/null
@@ -1,36 +0,0 @@
-menuconfig BR2_TARGET_ARMLTD
-	bool "ARM Ltd. Device Support"
-	depends on BR2_arm
-	select BR2_ARM_EABI
-	select BR2_arm926t
-
-comment "ARM Ltd. based Device Support"
-	depends on BR2_TARGET_ARMLTD
-
-
-if BR2_TARGET_ARMLTD
-
-choice
-	prompt "Controller board"
-	default BR2_TARGET_ARM_INTEGRATOR_926
-	help
-	  ARM Ltd. Controller Board to build for
-
-config BR2_TARGET_ARM_INTEGRATOR_926
-	bool "Integrator arm926"
-
-config BR2_TARGET_ARM_INTEGRATOR_926_HUGE
-	bool "Integrator arm926 (Huge)"
-
-endchoice
-
-config BR2_BOARD_NAME
-	string
-	default "integrator926"		if BR2_TARGET_ARM_INTEGRATOR_926
-	default "integrator926_huge"	if BR2_TARGET_ARM_INTEGRATOR_926_HUGE
-
-config BR2_BOARD_PATH
-	string "Board Path"
-	default "target/device/ARMLTD/$(BR2_BOARD_NAME)"
-
-endif
diff --git a/target/device/ARMLTD/Makefile.in b/target/device/ARMLTD/Makefile.in
deleted file mode 100644
index 3520f3c..0000000
--- a/target/device/ARMLTD/Makefile.in
+++ /dev/null
@@ -1,5 +0,0 @@
-ifeq ($(BR2_TARGET_ARMLTD),y)
-BOARD_NAME=$(call qstrip,$(BR2_BOARD_NAME))
-BOARD_PATH=$(call qstrip,$(BR2_BOARD_PATH))
-endif
-
diff --git a/target/device/Atmel/AT91_Config.in b/target/device/Atmel/AT91_Config.in
deleted file mode 100644
index 77b01bf..0000000
--- a/target/device/Atmel/AT91_Config.in
+++ /dev/null
@@ -1,335 +0,0 @@
-comment "Atmel AT91 Specific Device Support"
-	depends on BR2_arm
-
-config BR2_TARGET_AT91
-	bool "Board support for the Atmel AT91 range of microprocessors"
-	depends on BR2_arm
-	help
-	  Atmel AT91 ARM based systems
-
-comment	"Selection criteria"
-	depends on BR2_TARGET_AT91
-
-config	BR2_TARGET_ATMEL_ALL
-	bool "Allow all ARM targets"
-	depends on BR2_TARGET_AT91
-	default y
-
-config	BR2_TARGET_ATMEL_NET
-	bool "With network controller"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_ALL
-	default y
-
-config	BR2_TARGET_ATMEL_LCD
-	bool "With LCD controller"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_ALL
-
-config	BR2_TARGET_ATMEL_FPDSP
-	bool "With Floating Point DSP"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_ALL
-
-config	BR2_TARGET_ATMEL_MPB
-	bool "With customizable MP-Block"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_ALL
-
-comment "Device Selection"
-	depends on BR2_TARGET_AT91
-
-choice
-	prompt "AT91 device"
-	depends on BR2_TARGET_AT91
-	default BR2_TARGET_AT91SAM9260
-	help
-	  Select the specific AT91 chip you wish to use.
-
-config BR2_TARGET_AT91RM9200
-	bool "Atmel AT91RM9200 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_LCD
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	help
-	  Atmel AT91RM9200 ARM based systems
-
-config BR2_TARGET_AT91SAM9260
-	bool "Atmel AT91SAM9260 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_LCD
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	help
-	  Atmel AT91SAM9260 ARM based systems
-
-config BR2_TARGET_AT91SAM9G20
-	bool "Atmel AT91SAM9G20 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_LCD
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	help
-	  Atmel AT91SAM9G20 ARM based systems
-
-config BR2_TARGET_AT91SAM9261
-	bool "Atmel AT91SAM9261 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_NET
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	help
-	  Atmel AT91SAM9261 ARM based systems
-
-config BR2_TARGET_AT91SAM9261S
-	bool "Atmel AT91SAM9261S Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_NET
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9261 ARM based systems (Not Yet Implemented)
-
-config BR2_TARGET_AT91SAM9RL64
-	bool "Atmel AT91SAM9RL64 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_NET
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9RL64 ARM based systems (Not Yet Implemented)
-
-config BR2_TARGET_AT91SAM9263
-	bool "Atmel AT91SAM9263 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	help
-	  Atmel AT91SAM9263 ARM based systems
-
-config BR2_TARGET_AT91SAM9G40
-	bool "Atmel AT91SAM9G40 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9G40 ARM based systems
-
-config BR2_TARGET_AT91SAM9G45
-	bool "Atmel AT91SAM9G45 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	help
-	  Atmel AT91SAM9G45 ARM based systems
-
-config BR2_TARGET_AT91SAM9M10
-	bool "Atmel AT91SAM9M10 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9M10 ARM based systems
-
-config BR2_TARGET_AT91SAM9M11
-	bool "Atmel AT91SAM9M11 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9M11 ARM based systems
-
-config BR2_TARGET_AT91SAM9XE
-	bool "Atmel AT91SAM9XE Microprocessors"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_LCD
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91SAM9263 ARM based systems (Not Yet Implemented)
-
-config BR2_TARGET_AT572D940HF
-	bool "Atmel AT572D940HF Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_LCD
-	depends on !BR2_TARGET_ATMEL_MPB
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT572D940 ARM based systems
-
-config BR2_TARGET_AT91CAP9
-	bool "Atmel AT91CAP9 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel AT91CAP9 ARM based systems
-
-endchoice
-
-comment "Development Board Selection"
-	depends on BR2_TARGET_AT91
-
-choice
-	prompt "Development Board support"
-	depends on BR2_TARGET_AT91
-	default BR2_TARGET_AT91SAM9260DFC
-	help
-	  Select the specific AT91 development board you wish to use.
-
-config BR2_TARGET_AT91RM9200DF
-	bool "Atmel AT91RM9200 Generic Dataflash(Card) Board Support"
-	depends on BR2_TARGET_AT91RM9200
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	help
-	  The Atmel AT91RM9200EK Development Board using Dataflashcard
-
-config BR2_TARGET_AT91RM9200EK
-	bool "Atmel AT91RM9200EK Development Board Support"
-	depends on BR2_TARGET_AT91RM9200
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_FLASH
-	help
-	  The Atmel AT91RM9200EK Development Board
-
-config BR2_TARGET_AT91RM9200DK
-	bool "Atmel AT91RM9200DK Development Board Support"
-	depends on BR2_TARGET_AT91RM9200
-	select BR2_BOOTSOURCE_DATAFLASH
-	select BR2_BOOTSOURCE_FLASH
-	help
-	  The Atmel AT91RM9200DK Development Board
-
-config BR2_TARGET_AT91SAM9260DFC
-	bool "Atmel AT91SAM9260DFC"
-	depends on BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9XE
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_DATAFLASH
-	help
-	  The Atmel AT91SAM9260 Development Board booting from Dataflashcard
-
-config BR2_TARGET_AT91SAM9260EK
-	bool "Atmel AT91SAM9260EK"
-	depends on BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9XE
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_DATAFLASH
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91SAM9260 Development Board booting from dataflash
-
-config BR2_TARGET_AT91SAM9G20DFC
-	bool "Atmel AT91SAM9G20DFC"
-	depends on BR2_TARGET_AT91SAM9G20
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	help
-	  The Atmel AT91SAM9G20 Development Board booting from Dataflashcard
-
-config BR2_TARGET_AT91SAM9G20EK
-	bool "Atmel AT91SAM9G20EK"
-	depends on BR2_TARGET_AT91SAM9G20
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_DATAFLASH
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91SAM9G20 Development Board booting from dataflash
-
-config BR2_TARGET_AT91SAM9XEEK
-	bool "Atmel AT91SAM9XE-EK"
-	depends on BR2_TARGET_AT91SAM9260 || BR2_TARGET_AT91SAM9XE
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_DATAFLASH
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91SAM9xe Development Board (Not Yet Implemented)
-
-config BR2_TARGET_AT91SAM9261EK
-	bool "Atmel AT91SAM9261EK"
-	depends on BR2_TARGET_AT91SAM9261 || BR2_TARGET_AT91SAM9261S
-	select BR2_BOOTSOURCE_DATAFLASH
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91SAM9261 Development Board
-
-config BR2_TARGET_AT91SAM9RL64EK
-	bool "Atmel AT91SAM9RL64EK"
-	depends on BR2_TARGET_AT91SAM9RL64
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_DATAFLASH
-	select BR2_BOOTSOURCE_NANDFLASH
-	select BR2_BOOTSOURCE_SDCARD
-	help
-	  The Atmel AT91SAM9RL64 Development Board
-
-config BR2_TARGET_AT91SAM9263EK
-	bool "Atmel AT91SAM9263EK"
-	depends on BR2_TARGET_AT91SAM9263
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91SAM9263 Development Board
-
-config BR2_TARGET_AT91SAM9G45EKES
-	bool "Atmel AT91SAM9G45EKES"
-	depends on BR2_TARGET_AT91SAM9G45
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91SAM9G45 Development Board
-
-config BR2_TARGET_AT572D940DCM
-	bool "Atmel AT572D940 Diopsis Computer Module"
-	depends on BR2_TARGET_AT572D940HF
-	select BR2_BOOTSOURCE_FLASH
-	select BR2_BOOTSOURCE_SDCARD
-	help
-	  The Atmel Diopsis CPU Module (Not Yet Implemented)
-
-config BR2_TARGET_AT91CAP9DK
-	bool "Atmel AT91CAP9DK"
-	depends on BR2_TARGET_AT91CAP9
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_DATAFLASH
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91CAP9 Development Kit (Not Yet Implemented)
-
-config BR2_TARGET_AT91CAP9ADK
-	bool "Atmel AT91CAP9ADK"
-	depends on BR2_TARGET_AT91CAP9
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_DATAFLASH
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91CAP9 Starter Kit (Not Yet Implemented)
-
-endchoice
-
-choice
-	prompt "SPI Mode"
-	depends on BR2_TARGET_AT91SAM9261EK
-	default BR2_TARGET_AT91SAM9261EK_SPIMODE0
-	help
-	  Select SPI Mode 0 or 3
-
-config BR2_TARGET_AT91SAM9261EK_SPIMODE0
-	bool "SPI Mode 0"
-	depends on BR2_TARGET_AT91SAM9261EK
-	help
-	  Use SPI Mode 0, Required for AT45DB642D chips
-
-config BR2_TARGET_AT91SAM9261EK_SPIMODE3
-	bool "SPI Mode 3"
-	depends on BR2_TARGET_AT91SAM9261EK
-	help
-	  Use SPI Mode 3
-
-endchoice
-
-
diff --git a/target/device/Atmel/AVR32_Config.in b/target/device/Atmel/AVR32_Config.in
deleted file mode 100644
index 7ae9fd4..0000000
--- a/target/device/Atmel/AVR32_Config.in
+++ /dev/null
@@ -1,82 +0,0 @@
-comment "Atmel AVR32 Specific Device Support"
-	depends on BR2_avr32
-
-config BR2_TARGET_AVR32
-	bool "Board support for the Atmel AP7 microprocessors"
-	depends on BR2_avr32
-	help
-	  Atmel AT32AP7XXX AVR32 based systems
-
-choice
-	prompt "AVR32 device"
-	depends on BR2_TARGET_AVR32
-	default BR2_TARGET_AT32AP7000
-	help
-	  Select the specific AVR32 chip you wish to use.
-
-config BR2_TARGET_AT32AP7000
-	bool "Board support for the Atmel AT32AP7000 Microprocessor"
-	depends on BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7000 AVR32 based systems
-
-config BR2_TARGET_AT32AP7001
-	bool "Board support for the Atmel AT32AP7001 Microprocessor"
-	depends on BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7001 AVR32 based systems
-
-config BR2_TARGET_AT32AP7002
-	bool "Board support for the Atmel AT32AP7002 Microprocessor"
-	depends on BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7002 AVR32 based systems
-
-config BR2_TARGET_AT32AP7200
-	bool "Board support for the Atmel AT32AP7200 Microprocessor"
-	depends on BR2_TARGET_AVR32
-	help
-	  Atmel AT32AP7200 AVR32 based systems
-
-endchoice
-
-comment "Development board support"
-	depends on BR2_TARGET_AVR32
-
-choice
-	prompt "Development board support"
-	depends on BR2_TARGET_AVR32
-	default BR2_TARGET_AVR32_ATSTK1000
-	help
-	  Select the specific AVR32 development board you wish to use.
-
-config BR2_TARGET_AVR32_ATSTK1002
-	bool "Atmel ATSTK1000/2 AVR32 development board support"
-	depends on BR2_TARGET_AT32AP7000
-	select BR2_PACKAGE_LINUX
-	help
-	  The Atmel ATSTK1000 AVR32 Development Board.
-
-config BR2_TARGET_AVR32_ATSTK1005
-	bool "Atmel ATSTK1000/5 AVR32 development board support"
-	depends on BR2_TARGET_AT32AP7200
-	select BR2_PACKAGE_LINUX
-	help
-	  The Atmel ATSTK1000 AVR32 Development Board,
-	  with the AT32AP7200 based top board
-
-config BR2_TARGET_AVR32_ATNGW100
-	bool "Atmel AVR32 network gateway board support"
-	depends on BR2_TARGET_AT32AP7000
-	select BR2_PACKAGE_LINUX
-	help
-	  The Atmel AVR32 Network Gateway Board.
-
-config BR2_TARGET_AVR32_ATNGW100_BASE
-	bool "Atmel AVR32 basic network gateway board support"
-	depends on BR2_TARGET_AT32AP7000
-	select BR2_PACKAGE_LINUX
-	help
-	  Very simple configuration for the Atmel AVR32 Network Gateway Board.
-
-endchoice
diff --git a/target/device/Atmel/Config.in b/target/device/Atmel/Config.in
deleted file mode 100644
index 1433af4..0000000
--- a/target/device/Atmel/Config.in
+++ /dev/null
@@ -1,62 +0,0 @@
-menuconfig BR2_TARGET_ATMEL
-	bool "Atmel Device Support"
-	depends on BR2_arm || BR2_avr32
-
-if BR2_TARGET_ATMEL
-
-source "target/device/Atmel/AT91_Config.in"
-source "target/device/Atmel/AVR32_Config.in"
-
-config BR2_BOARD_NAME
-	string
-	default	"at91rm9200df"		if	BR2_TARGET_AT91RM9200DF
-	default	"at91rm9200se"		if	BR2_TARGET_AT91RM9200SE
-	default	"at91rm9200ek"		if	BR2_TARGET_AT91RM9200EK
-	default	"at91rm9200dk"		if	BR2_TARGET_AT91RM9200DK
-	default	"at91sam9260ek"		if	BR2_TARGET_AT91SAM9260EK
-	default	"at91sam9260dfc"	if	BR2_TARGET_AT91SAM9260DFC
-	default	"at91sam9261ek"		if	BR2_TARGET_AT91SAM9261EK
-	default	"at91sam9262ek"		if	BR2_TARGET_AT91SAM9262EK
-	default	"at91sam9263ek"		if	BR2_TARGET_AT91SAM9263EK
-	default	"at91sam9xeek"		if	BR2_TARGET_AT91SAM9XEEK
-	default	"at91sam9g20ek"		if	BR2_TARGET_AT91SAM9G20EK
-	default	"at91sam9g20dfc"	if	BR2_TARGET_AT91SAM9G20DFC
-	default "at91sam9g45ekes"	if	BR2_TARGET_AT91SAM9G45EKES
-	default	"at91sam9m10ek"		if	BR2_TARGET_AT91SAM9M10EK
-	default	"at91sam9m10dfc"	if	BR2_TARGET_AT91SAM9M10DFC
-	default	"atstk100x"		if	BR2_TARGET_AVR32_ATSTK1002
-	default	"atstk1005"		if	BR2_TARGET_AVR32_ATSTK1005
-	default	"atngw100"		if	BR2_TARGET_AVR32_ATNGW100
-	default "atngw100-base"		if	BR2_TARGET_AVR32_ATNGW100_BASE
-	default "atngw100-expanded"	if	BR2_TARGET_AVR32_ATNGW100_EXPANDED
-
-config BR2_TARGET_AT91_ADVANCED_INFO
-	bool "Remove work in progress"
-	depends on BR2_TARGET_AT91
-	default y
-	help
-	  Atmel AT91 ARM based systems
-
-comment "Package support"
-	depends on BR2_TARGET_AT91 || BR2_TARGET_AVR32
-
-
-menu "Secondary locations"
-
-config BR2_AT91_LINUXPATCH_SITE
-	string "AT91 Linux Patch mirror site"
-	depends on BR2_TARGET_AT91
-	default "http://maxim.org.za/AT91RM9200/2.6"
-	help
-	    Main download location for AT91 Linux stuff
-
-config BR2_BOARD_PATH
-	string "Atmel board repository"
-	depends on BR2_TARGET_AT91 || BR2_TARGET_AVR32
-	default "target/device/Atmel/$(BR2_BOARD_NAME)"
-	help
-	  Top directory of Atmel board configurations
-
-endmenu
-
-endif
diff --git a/target/device/Atmel/Makefile.in b/target/device/Atmel/Makefile.in
deleted file mode 100644
index 5dacfde..0000000
--- a/target/device/Atmel/Makefile.in
+++ /dev/null
@@ -1,20 +0,0 @@
-# *******************************************************************
-
-ifeq ($(BR2_TARGET_ATMEL),y)
-ATMEL_PATH:=target/device/Atmel
-
-BOARD_NAME:=$(call qstrip,$(BR2_BOARD_NAME))
-BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
-
-ATMEL_TARGET:=$(ATMEL_PATH)/root
-TARGET_SKELETON:=$(ATMEL_TARGET)/target_skeleton
-TARGET_SKELETON_LINKS:=$(ATMEL_TARGET)/skel.tar.gz
-
-ifeq ($(BR2_avr32),y)
-KERNEL_HEADERS_PATCH_DIR=target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2
-endif
-
-# Update things in board specific makefiles
-include target/device/Atmel/*/Makefile.in
-
-endif
diff --git a/target/device/Atmel/at91rm9200df/Makefile.in b/target/device/Atmel/at91rm9200df/Makefile.in
deleted file mode 100644
index 1ef7dc2..0000000
--- a/target/device/Atmel/at91rm9200df/Makefile.in
+++ /dev/null
@@ -1,6 +0,0 @@
-ifeq ($(strip $(BOARD_NAME)),at91rm9200df)
-LINUX_BOARD_NAME:=at91rm9200ek
-UBOOT_BOARD_NAME:=at91rm9200df
-endif
-
-
diff --git a/target/device/Atmel/at91sam9260dfc/Makefile.in b/target/device/Atmel/at91sam9260dfc/Makefile.in
deleted file mode 100644
index b3a4d24..0000000
--- a/target/device/Atmel/at91sam9260dfc/Makefile.in
+++ /dev/null
@@ -1,22 +0,0 @@
-ifeq ($(strip $(BOARD_NAME)),at91sam9260dfc)
-LINUX26_BOARD_NAME=at91sam9260ek
-ifeq ($(U_BOOT_VERSION),1.2.0-atmel)
-UBOOT_BOARD_NAME:=at91sam9260dfc
-else
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD),)
-UBOOT_BOARD_NAME:=at91sam9260ek_dataflash_cs0
-endif
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH),)
-UBOOT_BOARD_NAME:=at91sam9260ek_dataflash_cs1
-endif
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH),)
-UBOOT_BOARD_NAME:=at91sam9260ek_nandflash
-endif
-
-endif
-
-endif
-
diff --git a/target/device/Atmel/at91sam9260pf/Makefile.in b/target/device/Atmel/at91sam9260pf/Makefile.in
deleted file mode 100644
index b43b670..0000000
--- a/target/device/Atmel/at91sam9260pf/Makefile.in
+++ /dev/null
@@ -1,7 +0,0 @@
-ifeq ($(BOARD_NAME),at91sam9260pf)
-LINUX26_BOARD_NAME=at91sam9260ek
-UBOOT_BOARD_NAME:=at91sam9260ek
-# Not functional for U-Boot
-# This needs to have a header file at91sam9260pf.h
-# which puts the environment in parallell flash
-endif
diff --git a/target/device/Atmel/at91sam9261ek/Makefile.in b/target/device/Atmel/at91sam9261ek/Makefile.in
deleted file mode 100644
index 23b5c6d..0000000
--- a/target/device/Atmel/at91sam9261ek/Makefile.in
+++ /dev/null
@@ -1,22 +0,0 @@
-ifeq ($(strip $(BOARD_NAME)),at91sam9261ek)
-LINUX_BOARD_NAME:=at91sam9261ek
-ifeq ($(U_BOOT_VERSION),1.2.0-atmel)
-UBOOT_BOARD_NAME:=at91sam9261ek
-else
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD),)
-UBOOT_BOARD_NAME:=at91sam9261ek_dataflash_cs0
-# use CS0 since we have to route CS0 to the SDcard
-# to allow boot from a card.
-# Note possible conflict with CS3 which needs to be
-# disabled both in U-Boot and in Linux
-endif
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH),)
-UBOOT_BOARD_NAME:=at91sam9261ek_dataflash_cs0
-endif
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH),)
-UBOOT_BOARD_NAME:=at91sam9261ek_nandflash
-endif
-endif
-endif
diff --git a/target/device/Atmel/at91sam9263ek/Makefile.in b/target/device/Atmel/at91sam9263ek/Makefile.in
deleted file mode 100644
index 2f51a8b..0000000
--- a/target/device/Atmel/at91sam9263ek/Makefile.in
+++ /dev/null
@@ -1,18 +0,0 @@
-ifeq ($(strip $(BOARD_NAME)),at91sam9263ek)
-LINUX_BOARD_NAME:=at91sam9263ek
-ifeq ($(U_BOOT_VERSION),1.2.0-atmel)
-UBOOT_BOARD_NAME:=at91sam9263ek
-else
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD),)
-UBOOT_BOARD_NAME:=at91sam9263ek_dataflash_cs0
-endif
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH),)
-UBOOT_BOARD_NAME:=at91sam9263ek_dataflash_cs1
-endif
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH),)
-UBOOT_BOARD_NAME:=at91sam9263ek_nandflash
-endif
-endif
-endif
diff --git a/target/device/Atmel/at91sam9g20dfc/Makefile.in b/target/device/Atmel/at91sam9g20dfc/Makefile.in
deleted file mode 100644
index 0b023fd..0000000
--- a/target/device/Atmel/at91sam9g20dfc/Makefile.in
+++ /dev/null
@@ -1,17 +0,0 @@
-ifeq ($(strip $(BOARD_NAME)),at91sam9g20dfc)
-LINUX26_BOARD_NAME=at91sam9g20ek
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD),)
-UBOOT_BOARD_NAME:=at91sam9g20ek_dataflash_cs0
-endif
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH),)
-UBOOT_BOARD_NAME:=at91sam9g20ek_dataflash_cs1
-endif
-
-ifneq ($(BR2_TARGET_UBOOT_BOOTSOURCE_NANDFLASH),)
-UBOOT_BOARD_NAME:=at91sam9g20ek_nandflash
-endif
-
-endif
-
diff --git a/target/device/Atmel/atngw100-base/Makefile.in b/target/device/Atmel/atngw100-base/Makefile.in
deleted file mode 100644
index c2f2969..0000000
--- a/target/device/Atmel/atngw100-base/Makefile.in
+++ /dev/null
@@ -1,4 +0,0 @@
-ifeq ($(BR2_TARGET_AVR32_ATNGW100_BASE),y)
-UBOOT_BOARD_NAME:=atngw100
-TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-endif
diff --git a/target/device/Atmel/atngw100/Makefile.in b/target/device/Atmel/atngw100/Makefile.in
deleted file mode 100644
index 7e02d8e..0000000
--- a/target/device/Atmel/atngw100/Makefile.in
+++ /dev/null
@@ -1,4 +0,0 @@
-ifeq ($(BR2_TARGET_AVR32_ATNGW100),y)
-UBOOT_BOARD_NAME:=atngw100
-TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-endif
diff --git a/target/device/Atmel/atstk1005/Makefile.in b/target/device/Atmel/atstk1005/Makefile.in
deleted file mode 100644
index 84b3107..0000000
--- a/target/device/Atmel/atstk1005/Makefile.in
+++ /dev/null
@@ -1,3 +0,0 @@
-ifeq ($(strip $(BR2_TARGET_AVR32_ATSTK1005)),y)
-TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-endif
diff --git a/target/device/Atmel/atstk100x/Makefile.in b/target/device/Atmel/atstk100x/Makefile.in
deleted file mode 100644
index 395c74a..0000000
--- a/target/device/Atmel/atstk100x/Makefile.in
+++ /dev/null
@@ -1,4 +0,0 @@
-ifeq ($(strip $(BR2_TARGET_AVR32_ATSTK1002)),y)
-UBOOT_BOARD_NAME:=atstk1002
-TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
-endif
diff --git a/target/device/Config.in b/target/device/Config.in
deleted file mode 100644
index 6b7f11a..0000000
--- a/target/device/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-menu "Target options"
-
-comment "Preset Devices"
-
-source "target/device/ARMLTD/Config.in"
-source "target/device/Atmel/Config.in"
-source "target/device/KwikByte/Config.in"
-source "target/device/valka/Config.in"
-source "target/device/x86/Config.in"
-source "target/device/xtensa/Config.in"
-
-# This must be last
-source "target/generic/Config.in"
-
-endmenu
diff --git a/target/device/KwikByte/Config.in b/target/device/KwikByte/Config.in
deleted file mode 100644
index afa257f..0000000
--- a/target/device/KwikByte/Config.in
+++ /dev/null
@@ -1,90 +0,0 @@
-menuconfig BR2_TARGET_KWIKBYTE
-	bool "KwikByte Board Support"
-	depends on BR2_arm
-
-if BR2_TARGET_KWIKBYTE
-
-comment "Board Selection"
-
-choice
-	prompt	"KwikByte target board"
-	default BR2_TARGET_KB9202
-
-config BR2_TARGET_KB9202
-	bool "Board support for the KwikByte 9202 Evaluation Board"
-	depends on BR2_arm920t || BR2_generic_arm
-	help
-	  KwikByte kb9202 Eval Board
-
-endchoice
-
-
-config BR2_BOARD_NAME
-	string
-	default "kb9202"	if	BR2_TARGET_KB9202
-choice
-	prompt "Add AT91 specific patches"
-	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
-	depends on BR2_arm
-	default BR2_ARCH_AT91_2_6_24_KB		if BR2_LINUX_2_6_24
-#	default BR2_ARCH_AT91_2_6_24_KB		if BR2_LINUX_2_6_23
-#	default BR2_ARCH_AT91_2_6_22_1_KB	if BR2_LINUX_2_6_22_1
-#	default BR2_ARCH_AT91_2_6_21_5_KB	if BR2_LINUX_2_6_21 || BR2_LINUX_2_6_21_5
-#	default BR2_ARCH_AT91_2_6_21_1_KB	if BR2_LINUX_2_6_21_1
-#	default BR2_ARCH_AT91_2_6_20_4_KB	if BR2_LINUX_2_6_20 || BR2_LINUX_2_6_20_4
-#	default BR2_ARCH_AT91_2_6_24_KB
-	help
-	  Select a patch to add to the Linux kernel
-
-config	BR2_ARCH_AT91_2_6_24_KB
-	bool "2.6.24"
-	help
-	  Apply the at91 linux-2.6.24 patches"
-
-#config	BR2_ARCH_AT91_2_6_22_1_KB
-#	bool "2.6.22.1"
-#	help
-#	  Apply the at91 linux-2.6.22.1 patches"
-#
-#config	BR2_ARCH_AT91_2_6_21_5_KB
-#	bool "2.6.21.5"
-#	help
-#	  Apply the at91 linux-2.6.21.5 patches"
-#
-#config	BR2_ARCH_AT91_2_6_21_1_KB
-#	bool "2.6.21.1"
-#	help
-#	  Apply the at91 linux-2.6.21.1 patches"
-#
-#config	BR2_ARCH_AT91_2_6_20_4_KB
-#	bool "2.6.20.4"
-#	help
-#	  Apply the at91 linux-2.6.20.4 patches"
-
-endchoice
-
-config	BR2_KERNEL_ARCH_PATCH_VERSION
-	string
-	depends on BR2_KERNEL_ARCH_PATCH_ENABLED
-	depends on BR2_arm
-	default "2.6.24" if BR2_ARCH_AT91_2_6_24_KB
-#	default "2.6.22.1" if BR2_ARCH_AT91_2_6_22_1_KB
-#	default "2.6.21.5" if BR2_ARCH_AT91_2_6_21_5_KB
-#	default "2.6.21.1" if BR2_ARCH_AT91_2_6_21_1_KB
-#	default "2.6.20.4" if BR2_ARCH_AT91_2_6_20_4_KB
-
-config	BR2_KERNEL_ARCH_PATCH_DIR
-	string
-	default "target/device/Atmel/arch-arm/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
-
-config BR2_BOARD_PATH
-	string "Board Path"
-	default "target/device/KwikByte/$(BR2_BOARD_NAME)"
-
-config BR2_AT91_LINUXPATCH_SITE
-	string "AT91 Linux Patch mirror site"
-	default "http://maxim.org.za/AT91RM9200/2.6"
-	help
-	    Main download location for AT91 Linux stuff
-
-endif
diff --git a/target/device/KwikByte/Makefile.in b/target/device/KwikByte/Makefile.in
deleted file mode 100644
index 0c109a9..0000000
--- a/target/device/KwikByte/Makefile.in
+++ /dev/null
@@ -1,10 +0,0 @@
-ifeq ($(BR2_TARGET_KWIKBYTE),y)
-
-BOARD_NAME:=$(call qstrip,$(BR2_BOARD_NAME))
-BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
-
-ifeq ($(BR2_TARGET_KB9202),y)
-include target/device/KwikByte/kb9202/Makefile.in
-endif
-
-endif
diff --git a/target/device/KwikByte/kb9202/Makefile.in b/target/device/KwikByte/kb9202/Makefile.in
deleted file mode 100644
index 0048dcc..0000000
--- a/target/device/KwikByte/kb9202/Makefile.in
+++ /dev/null
@@ -1,3 +0,0 @@
-BOARD_PATH=target/device/KwikByte/kb9202
-
-TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
diff --git a/target/device/Makefile.in b/target/device/Makefile.in
deleted file mode 100644
index 38b792f..0000000
--- a/target/device/Makefile.in
+++ /dev/null
@@ -1,2 +0,0 @@
--include target/device/*/Makefile.in
-
diff --git a/target/device/valka/Config.in b/target/device/valka/Config.in
deleted file mode 100644
index 931ee73..0000000
--- a/target/device/valka/Config.in
+++ /dev/null
@@ -1,25 +0,0 @@
-menuconfig BR2_TARGET_VALKA
-	bool "ValkaSys"
-	depends on BR2_avr32
-
-if BR2_TARGET_VALKA
-
-choice
-	prompt "Controller board"
-	depends on BR2_TARGET_VALKA
-	help
-	  Valka Controller Board to build for
-
-config BR2_TARGET_VALKA_V100SC2
-	bool "V100SC2 (Based on NGW100)"
-	depends on BR2_TARGET_VALKA
-	help
-	  Board based on NGW100
-
-endchoice
-
-config BR2_BOARD_NAME
-	string
-	default "v100sc2"	if	BR2_TARGET_VALKA_V100SC2
-
-endif
diff --git a/target/device/valka/Makefile.in b/target/device/valka/Makefile.in
deleted file mode 100644
index 06ed605..0000000
--- a/target/device/valka/Makefile.in
+++ /dev/null
@@ -1,6 +0,0 @@
-ifeq ($(BR2_TARGET_VALKA),y)
-VALKA_PATH= target/device/valka
-
-TARGET_SKELETON=$(VALKA_PATH)/target_skeleton
-KERNEL_HEADERS_PATCH_DIR=target/device/Atmel/arch-avr32/kernel-headers-2.6.28.2
-endif
diff --git a/target/device/x86/Config.in b/target/device/x86/Config.in
deleted file mode 100644
index 0b88f7a..0000000
--- a/target/device/x86/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-menuconfig BR2_TARGET_X86
-	bool "Generic x86 Device Support"
-	depends on BR2_i386
-
-if BR2_TARGET_X86
-
-choice
-	prompt "Pentium (or later) Controller board"
-	help
-
-config BR2_TARGET_I686
-	bool "i686"
-	depends on BR2_i386
-
-endchoice
-
-config BR2_BOARD_NAME
-	string
-	default "i686"		if BR2_TARGET_I686
-
-config BR2_BOARD_PATH
-	string "Board Path"
-	default "target/device/x86/$(BR2_BOARD_NAME)"
-
-endif
-
diff --git a/target/device/x86/Makefile.in b/target/device/x86/Makefile.in
deleted file mode 100644
index d7d12fa..0000000
--- a/target/device/x86/Makefile.in
+++ /dev/null
@@ -1,4 +0,0 @@
-ifeq ($(BR2_TARGET_X86),y)
-include target/device/x86/*/Makefile.in
-endif
-
diff --git a/target/device/x86/i686/Makefile.in b/target/device/x86/i686/Makefile.in
deleted file mode 100644
index abb8e5b..0000000
--- a/target/device/x86/i686/Makefile.in
+++ /dev/null
@@ -1,3 +0,0 @@
-BOARD_NAME=$(call qstrip,$(BR2_BOARD_NAME))
-BOARD_PATH=$(call qstrip,$(BR2_BOARD_PATH))
-
diff --git a/target/device/xtensa/Config.in b/target/device/xtensa/Config.in
deleted file mode 100644
index 0d4408c..0000000
--- a/target/device/xtensa/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-menuconfig	BR2_TARGET_XTENSA
-	bool "Device and Board Support for Xtensa and Diamond cores"
-	depends on BR2_xtensa
-	default y
-	help
-	  Lists development boards with support for the Xtensa architecture.
-
-if BR2_TARGET_XTENSA
-comment "Tensilica Xtensa/Diamond based Device Support"
-	depends on BR2_xtensa
-
-config BR2_TARGET_XTENSA_XTAV60
-	bool "XTAV60/200 board (Avnet LX60 or LX200 plus Tensilica IP)"
-	depends on BR2_xtensa
-	default y
-	help
-	  The XTAV60 or XTAV200 board, which is an Avnet LX60 or LX200
-	  emulation board programmed with an FPGA bitstream obtained
-	  from Tensilica.
-
-endif
diff --git a/target/device/xtensa/Makefile.in b/target/device/xtensa/Makefile.in
deleted file mode 100644
index a0403e8..0000000
--- a/target/device/xtensa/Makefile.in
+++ /dev/null
@@ -1,7 +0,0 @@
-ifeq ($(BR2_xtensa),y)
-
-ifeq ($(strip $(BR2_TARGET_XTENSA_XTAV60)),y)
-TARGET_SKELETON_PATCH:=target/device/xtensa
-endif
-
-endif
-- 
1.7.0.4
