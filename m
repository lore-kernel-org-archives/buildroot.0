From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:52:47 +0100
Subject: [Buildroot] [PATCH 16/55] at91bootstrap: rename config options for
	consistency
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fa22e452eaba842fe6a40fb5e0bf7dc5b9f93995.1291582351.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index b148973..f022dd5 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -18,22 +18,22 @@ config BR2_TARGET_AT91BOOTSTRAP_BOARD
 
 choice
 	prompt "Boot Memory"
-	default BR2_TARGET_AT91BOOT_DATAFLASH
+	default BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
 	help
 	  Select Chip for which AT91 bootstrap should be built
 
-config BR2_TARGET_AT91BOOT_DATAFLASH
+config BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
 	bool "Data Flash"
 
-config BR2_TARGET_AT91BOOT_NANDFLASH
+config BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
 	bool "NAND Flash"
 
 endchoice
 
 config BR2_TARGET_AT91BOOTSTRAP_MEMORY
 	string
-	default	"dataflash"	if	BR2_TARGET_AT91BOOT_DATAFLASH
-	default	"nandflash"	if	BR2_TARGET_AT91BOOT_NANDFLASH
+	default	"dataflash"	if	BR2_TARGET_AT91BOOTSTRAP_DATAFLASH
+	default	"nandflash"	if	BR2_TARGET_AT91BOOTSTRAP_NANDFLASH
 
 endif
 
-- 
1.7.0.4
