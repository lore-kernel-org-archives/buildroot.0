From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  1 Dec 2011 12:04:57 -0300
Subject: [Buildroot] [PATCH 1/2] u-boot: add version 2011.09
Message-ID: <1322751898-16010-1-git-send-email-gustavo@zacarias.com.ar>
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
index 506f354..dd49a2c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2011_06
+	default BR2_TARGET_UBOOT_2011_09
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2011_09
+	bool "2011.09"
+
 config BR2_TARGET_UBOOT_2011_06
 	bool "2011.06"
 
@@ -48,6 +51,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
 	default "2011.06"	if BR2_TARGET_UBOOT_2011_06
 	default "2011.03"	if BR2_TARGET_UBOOT_2011_03
 	default "2010.12"	if BR2_TARGET_UBOOT_2010_12
-- 
1.7.3.4
