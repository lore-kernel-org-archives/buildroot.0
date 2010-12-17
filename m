From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: rename config
	options for consistency
Message-ID: <20101217160158.D042D8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5b2d56068db3ad86a459677b1fb9a421af5af275
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.2.2
