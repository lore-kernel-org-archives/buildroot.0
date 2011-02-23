From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Feb 2011 16:46:07 +0100
Subject: [Buildroot] [git commit master 1/1] u-boot: drop old 2009.xx
	versions
Message-ID: <20110223154954.4A3238F623@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a157909eefe1215d9173aa2b76b4bfd7ba1612f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We use 'make tools' to build a mkimage for the host if needed by the
kernel (uImage) without having u-boot configured, but that only works
since the 2010.03 release:

http://git.denx.de/?p=u-boot.git;a=commit;h=c7c0d542a1990

So drop the old 2009.xx versions rather than having the build break
for people.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/u-boot/Config.in |    8 --------
 boot/u-boot/u-boot.mk |    2 +-
 2 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 78c03ff..3ba1ef3 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -28,12 +28,6 @@ config BR2_TARGET_UBOOT_2010_06
 config BR2_TARGET_UBOOT_2010_03
 	bool "2010.03"
 
-config BR2_TARGET_UBOOT_2009_11
-	bool "2009.11"
-
-config BR2_TARGET_UBOOT_2009_08
-	bool "2009.08"
-
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -52,8 +46,6 @@ config BR2_TARGET_UBOOT_VERSION
 	default "2010.09"	if BR2_TARGET_UBOOT_2010_09
 	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
-	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
-	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 
 config BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index bd26f52..a86819b 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -43,7 +43,7 @@ U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(MKIMAGE)
 U_BOOT_ARCH=$(KERNEL_ARCH)
 
 # u-boot in the past used arch=ppc for powerpc
-ifneq ($(findstring x200,x$(U_BOOT_VERSION))$(findstring x2010.03,x$(U_BOOT_VERSION)),)
+ifneq ($(findstring x2010.03,x$(U_BOOT_VERSION)),)
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 endif
 
-- 
1.7.3.4
