From: Ossy <ossy1980@gmx.net>
Date: Tue, 27 Jul 2010 00:52:13 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: fix custom patch dir
	handling
Message-ID: <20100726225417.D6A3B82DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=98d5a8bcd0e51cc4060d73bc238cf25ae8457869
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ossy <ossy1980@gmx.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/u-boot/u-boot.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 60a4676..9eeea1d 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -77,8 +77,8 @@ $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) boot/u-boot \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
-ifneq ($(qstrip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),)
-	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_CUSTOM_PATCH_DIR) u-boot-$(U_BOOT_VERSION)-\*.patch
+ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR)),"")
+	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) u-boot-$(U_BOOT_VERSION)-\*.patch
 endif
 	touch $@
 
-- 
1.7.1
