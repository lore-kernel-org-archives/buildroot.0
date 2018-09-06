From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 23:04:00 +0200
Subject: [Buildroot] [git commit branch/next] sunxi-mali-mainline-driver:
 add support for building on arm64
Message-ID: <20180906210326.1237C82B80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0523856d6ca5f7c63a187891ae2ffec2d7e4e4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Blobs for ARM64 are now available at Bootlin Github and
sunxi-mali-mainline package has been updated to support them.

This commit updates the <pkg>_MAKE_OPTS variable by substituting
CROSS_COMPILE and INSTALL_MOD_PATH with
LINUX_MAKE_FLAGS. LINUX_MAKE_FLAGS already includes CROSS_COMPILE and
INSTALL_MOD_PAT, but also includes the ARCH variable, which is needed
to select the appropriate architecture when building the Mali driver.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index fcaeb81efe..f69765ebb2 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -9,9 +9,8 @@ SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
 SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
-	KDIR=$(LINUX_DIR) \
-	CROSS_COMPILE=$(TARGET_CROSS) \
-	INSTALL_MOD_PATH=$(TARGET_DIR)
+	$(LINUX_MAKE_FLAGS) \
+	KDIR=$(LINUX_DIR)
 
 define SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
 	ln -sf $(SUNXI_MALI_MAINLINE_REV)/series $(@D)/patches
