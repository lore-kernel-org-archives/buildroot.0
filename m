From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu,  7 Apr 2011 21:27:54 +0200
Subject: [Buildroot] [PATCH] u-boot: add 2011.03 release
Message-ID: <1302204474-21172-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 boot/u-boot/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 3ba1ef3..00a4a5f 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2010_12
+	default BR2_TARGET_UBOOT_2011_03
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2011_03
+	bool "2011.03"
+
 config BR2_TARGET_UBOOT_2010_12
 	bool "2010.12"
 
@@ -42,6 +45,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
 	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
 	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
 	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
-- 
1.7.1
