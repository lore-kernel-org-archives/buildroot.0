From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:22:10 +0200
Subject: [Buildroot] [PATCH 36/49] at91bootstrap: fix the boot source
	selection
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5880111f2aebd5f35545581f4c231ff4abf8b3b6.1276352309.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The boot source configuration options were depending on U-Boot
configuration options. Let's make it independent and just allow the
user to select whichever boot source is appropriate.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/Config.in |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 8efbd13..7c0f393 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -18,27 +18,21 @@ choice
 
 config BR2_TARGET_AT91BOOT_DATAFLASH
 	bool "AT45 Dataflash"
-	depends on BR2_BOOTSOURCE_DATAFLASH
 
 config BR2_TARGET_AT91BOOT_DATAFLASHCARD
 	bool "AT45 Dataflash Card"
-	depends on BR2_BOOTSOURCE_DATAFLASHCARD
 
 config BR2_TARGET_AT91BOOT_NANDFLASH
 	bool "NAND Flash"
-	depends on BR2_BOOTSOURCE_NANDFLASH
 
 config BR2_TARGET_AT91BOOT_FLASH
 	bool "Internal Flash or external parallel flash"
-	depends on BR2_BOOTSOURCE_FLASH
 
 config BR2_TARGET_AT91BOOT_SDCARD
 	bool "SD-Card"
-	depends on BR2_BOOTSOURCE_SDCARD
 
 config BR2_TARGET_AT91BOOT_EEPROM
 	bool "EEPROM"
-	depends on BR2_BOOTSOURCE_EEPROM
 
 endchoice
 
-- 
1.7.0.4
