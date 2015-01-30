From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 30 Jan 2015 11:09:47 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: bump to version 2015.01
Message-ID: <1422612587-13153-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Though U-Boot introduced a Kconfig and Kbuild build system with version
2014.10 the old build commands with <board>_config are still supported.

Tested with BR2_TARGET_UBOOT_BOARDNAME="m28evk"

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index f3e1778..03e6acc 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2014.10"
+	bool "2015.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -63,7 +63,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2014.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2015.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
-- 
2.2.2
