From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Jan 2014 10:26:16 -0300
Subject: [Buildroot] [PATCH 2/2] uboot: bump to version 2014.01
In-Reply-To: <1390310776-8840-1-git-send-email-gustavo@zacarias.com.ar>
References: <1390310776-8840-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1390310776-8840-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/uboot/Config.in | 4 ++--
 boot/uboot/uboot.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d693bcf..035e550 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2013.10"
+	bool "2014.01"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -63,7 +63,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2013.10"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2014.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ba7087e..2174584 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -8,7 +8,7 @@ UBOOT_VERSION    = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPLv2+
-UBOOT_LICENSE_FILES = COPYING
+UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
 
 UBOOT_INSTALL_IMAGES = YES
 
-- 
1.8.3.2
