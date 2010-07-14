From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Jul 2010 21:08:26 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: fix version detection
	and get rid of unneeded double CFLAGS/LDFLAGS
Message-ID: <20100714190919.CD55B82973@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1acd72a1ab7b1f9cac453d29ec55a6676a16f15b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/u-boot/u-boot.mk |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 37ed215..c21166f 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -35,7 +35,7 @@ U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(MKIMAGE)
 U_BOOT_ARCH=$(KERNEL_ARCH)
 
 # u-boot in the past used arch=ppc for powerpc
-ifneq ($(findstring x200,$(UBOOT_VERSION))$(findstring x2010.03,$(UBOOT_VERSION)),)
+ifneq ($(findstring x200,x$(U_BOOT_VERSION))$(findstring x2010.03,x$(U_BOOT_VERSION)),)
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 endif
 
@@ -81,8 +81,6 @@ ifeq ($(U_BOOT_BOARD_NAME),)
 	$(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
 	$(TARGET_CONFIGURE_OPTS)		\
-		CFLAGS="$(TARGET_CFLAGS)"	\
-		LDFLAGS="$(TARGET_LDFLAGS)"	\
 		$(U_BOOT_CONFIGURE_OPTS) \
 		$(MAKE) -C $(U_BOOT_DIR)	\
 		$(U_BOOT_BOARD_NAME)_config
-- 
1.7.1
