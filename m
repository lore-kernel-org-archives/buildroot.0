From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 21:29:20 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20090129212920.7A43476D75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 21:29:19 +0000 (Thu, 29 Jan 2009)
New Revision: 25142

Log:
Cleanup AT91 board support

Modified:
   trunk/buildroot/target/device/Atmel/AT91_Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/AT91_Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/AT91_Config.in	2009-01-29 21:28:57 UTC (rev 25141)
+++ trunk/buildroot/target/device/Atmel/AT91_Config.in	2009-01-29 21:29:19 UTC (rev 25142)
@@ -164,15 +164,6 @@
 	help
 	  Atmel AT91CAP9 ARM based systems
 
-config BR2_TARGET_AT91SAM9262
-	bool "Atmel ATR0663 Microprocessor"
-	depends on BR2_TARGET_AT91
-	depends on !BR2_TARGET_ATMEL_FPDSP
-	depends on !BR2_TARGET_ATMEL_MPB
-	depends on ! BR2_TARGET_AT91_ADVANCED_INFO
-	help
-	  Atmel ATR0663 ARM based systems (Not Yet Implemented)
-
 endchoice
 
 comment "Development Board Selection"
@@ -192,13 +183,6 @@
 	help
 	  The Atmel AT91RM9200EK Development Board using Dataflashcard
 
-config BR2_TARGET_AT91RM9200SE
-	bool "Atmel AT91RM9200 Generic Dataflash(Card) Board Support (SE)"
-	depends on BR2_TARGET_AT91RM9200
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	help
-	  The Atmel AT91RM9200EK Development Board using Dataflashcard (SE)
-
 config BR2_TARGET_AT91RM9200EK
 	bool "Atmel AT91RM9200EK Development Board Support"
 	depends on BR2_TARGET_AT91RM9200
@@ -275,21 +259,13 @@
 	help
 	  The Atmel AT91SAM9RL64 Development Board
 
-config BR2_TARGET_AT91SAM9262EK
-	bool "Atmel AT91SAM9262EK"
-	depends on BR2_TARGET_AT91SAM9262
-	select BR2_BOOTSOURCE_DATAFLASHCARD
-	select BR2_BOOTSOURCE_NANDFLASH
-	help
-	  The Atmel AT91SAM9262 Development Board (Not Yet Implemented)
-
 config BR2_TARGET_AT91SAM9263EK
 	bool "Atmel AT91SAM9263EK"
 	depends on BR2_TARGET_AT91SAM9263
 	select BR2_BOOTSOURCE_DATAFLASHCARD
 	select BR2_BOOTSOURCE_NANDFLASH
 	help
-	  The Atmel AT91SAM9263 Development Board (Not Yet Implemented)
+	  The Atmel AT91SAM9263 Development Board
 
 config BR2_TARGET_AT572D940DCM
 	bool "Atmel AT572D940 Diopsis Computer Module"
@@ -308,8 +284,8 @@
 	help
 	  The Atmel AT91CAP9 Development Kit (Not Yet Implemented)
 
-config BR2_TARGET_AT91CAP9STK
-	bool "Atmel AT91CAP9STK"
+config BR2_TARGET_AT91CAP9ADK
+	bool "Atmel AT91CAP9ADK"
 	depends on BR2_TARGET_AT91CAP9
 	select BR2_BOOTSOURCE_DATAFLASHCARD
 	select BR2_BOOTSOURCE_DATAFLASH
