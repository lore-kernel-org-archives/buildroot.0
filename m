From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Apr 2011 23:32:46 +0200
Subject: [Buildroot] [git commit] u-boot: remove extra CFLAGS / LDFLAGS
	handling
Message-ID: <20110424213558.126CE82A3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f3de6d578bc3f522ed066bd829cddafb6e31f22c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

TARGET_CONFIGURE_FLAGS already contain CFLAGS/LDFLAGS, so no point in
setting them explicitly.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/u-boot/u-boot.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index a86819b..2f839c5 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -129,8 +129,6 @@ endif # BR2_TARGET_UBOOT_NETWORK
 # Build U-Boot itself
 $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 	$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(U_BOOT_CONFIGURE_OPTS) \
 		$(MAKE) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
 		$(U_BOOT_MAKE_OPT) -C $(U_BOOT_DIR)
-- 
1.7.3.4
