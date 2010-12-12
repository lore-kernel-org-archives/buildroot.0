From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 12 Dec 2010 13:27:18 -0500
Subject: [Buildroot] [PATCH v2] u-boot: version bump to 2010.09
In-Reply-To: <1289916977-29852-1-git-send-email-vapier@gentoo.org>
References: <1289916977-29852-1-git-send-email-vapier@gentoo.org>
Message-ID: <1292178438-9441-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- also set update mkimage fallback to 2010.09

 boot/u-boot/Config.in |    6 +++++-
 boot/u-boot/u-boot.mk |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index ce79a8a..86c656d 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2010_06
+	default BR2_TARGET_UBOOT_2010_09
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2010_09
+	bool "2010.09"
+
 config BR2_TARGET_UBOOT_2010_06
 	bool "2010.06"
 
@@ -42,6 +45,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
 	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 9719207..99615c8 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -11,7 +11,7 @@ U_BOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 # pick some random stable U-Boot version that will be used just to
 # build mkimage.
 ifeq ($(U_BOOT_VERSION),)
-U_BOOT_VERSION=2010.03
+U_BOOT_VERSION=2010.09
 endif
 
 ifeq ($(U_BOOT_VERSION),custom)
-- 
1.7.3.3
