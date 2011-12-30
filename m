From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Dec 2011 12:02:17 -0300
Subject: [Buildroot] [PATCH] u-boot: add version 2011.12
Message-ID: <1325257337-11806-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/uboot/Config.in |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f154bd1..281a909 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2011_09
+	default BR2_TARGET_UBOOT_2011_12
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2011_12
+	bool "2011.12"
+
 config BR2_TARGET_UBOOT_2011_09
 	bool "2011.09"
 
@@ -51,6 +54,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
-- 
1.7.3.4
