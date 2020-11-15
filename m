From: Garret Kelly <garret.kelly@gmail.com>
Date: Sat, 14 Nov 2020 23:40:43 -0500
Subject: [Buildroot] [PATCH 1/1] boot/uboot: fix custom repo error message
Message-ID: <20201115044043.1885405-1-garret.kelly@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using a custom git or mercurial repository for u-boot the error message
indicating a version had not been provided incorrectly stated that the URL was
missing. Update the error message to indicate that it's the version that's
missing.

Signed-off-by: Garret Kelly <garret.kelly@gmail.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 72d5df412d..d2b4e8dc60 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -477,7 +477,7 @@ ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL)),)
 $(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_URL setting)
 endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_URL
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION)),)
-$(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION setting)
+$(error No custom U-Boot repository version specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION setting)
 endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_VERSION
 endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
-- 
2.25.1
