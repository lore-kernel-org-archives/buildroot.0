From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:38 +0200
Subject: [Buildroot] [PATCH 26/35] at91bootstrap: simplify configuration
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <373cd213327131b518473f516ec7b6ba6a022103.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There no need to depends on BR2_TARGET_AT91BOOTSTRAP when the
configuration options are already inside a if
BR2_TARGET_AT91BOOTSTRAP.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/Config.in |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 8514ccc..8efbd13 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -13,7 +13,6 @@ config BR2_TARGET_AT91BOOTSTRAP_BOARD
 choice
 	prompt "Boot Memory"
 	default BR2_TARGET_AT91BOOT_DATAFLASHCARD
-	depends on BR2_TARGET_AT91BOOTSTRAP
 	help
 	  Select Chip for which AT91 bootstrap should be built
 
@@ -45,7 +44,6 @@ endchoice
 
 config BR2_TARGET_AT91BOOTSTRAP_MEMORY
 	string
-	depends on BR2_TARGET_AT91BOOTSTRAP
 	default	"dataflash"	if	BR2_TARGET_AT91BOOT_DATAFLASH
 	default	"dataflashcard"	if	BR2_TARGET_AT91BOOT_DATAFLASHCARD
 	default	"nandflash"	if	BR2_TARGET_AT91BOOT_NANDFLASH
@@ -55,7 +53,6 @@ config BR2_TARGET_AT91BOOTSTRAP_MEMORY
 
 config	BR2_AT91BOOTSTRAP_IMG_SIZE
 	string	"Image Size to copy to SDRAM"
-	depends on BR2_TARGET_AT91BOOTSTRAP
 	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASH
 	default	"0x32000"	if	BR2_TARGET_AT91BOOT_DATAFLASHCARD
 	default	"0x30000"	if	BR2_TARGET_AT91BOOT_NANDFLASH
@@ -69,7 +66,6 @@ config	BR2_AT91BOOTSTRAP_IMG_SIZE
 choice
 	prompt "Start address of application"
 	default BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
-	depends on BR2_TARGET_AT91BOOTSTRAP
 	help
 	  Select Chip for which AT91 bootstrap should be built
 	  Currently supports AT91SAM9260EK, AT91SAM9261EK,
@@ -97,10 +93,6 @@ config	BR2_AT91BOOTSTRAP_JUMP_ADDR
 	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_DEFAULT
 	default	"0x23F00000" if BR2_AT91BOOTSTRAP_JUMP_TO_HIGH_SDRAM
 	default "0x20000000" if BR2_AT91BOOTSTRAP_JUMP_TO_START_OF_SDRAM
-	depends on BR2_TARGET_AT91BOOTSTRAP
-
-comment "It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)"
-	depends on BR2_TARGET_AT91BOOTSTRAP
 
 endif
 
-- 
1.6.3.3
