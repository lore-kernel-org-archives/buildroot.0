From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 22:30:39 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] boot/uboot: fix custom
 repo error message
Message-ID: <20201116211736.23C03865F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0bc3384b8f017b52ad5c26fbd4e6ad5ca6382ca6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

When using a custom git or mercurial repository for u-boot the error message
indicating a version had not been provided incorrectly stated that the URL was
missing. Update the error message to indicate that it's the version that's
missing.

Signed-off-by: Garret Kelly <garret.kelly@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1271867831a9fcf8e7ef52a1691386c63205474c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1831466780..abb408acaf 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -510,7 +510,7 @@ ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_URL)),)
 $(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_URL setting)
 endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_URL
 ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION)),)
-$(error No custom U-Boot repository URL specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION setting)
+$(error No custom U-Boot repository version specified. Check your BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION setting)
 endif # qstrip BR2_TARGET_UBOOT_CUSTOM_CUSTOM_REPO_VERSION
 endif # BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG
 
