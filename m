From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 Aug 2018 10:49:02 +0200
Subject: [Buildroot] [PATCH 2/3] sunxi-mali-mainline-driver: add support for
 building on arm64(aarch64)
In-Reply-To: <20180827084903.111735-1-giulio.benetti@micronovasrl.com>
References: <20180827084903.111735-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180827084903.111735-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Blobs for arm64(aarch64) are available at Bootlin Github and
sunxi-mali-mainline package has been updated to support them.

In MAKE_OPTS substitute CROSS_COMPILE and INSTALL_MOD_PATH with
LINUX_MAKE_FLAGS that already include the previous variables and contain
ARCH variable too.
This allows to have ARCH=arm or ARCH=arm64 depending on selected
architecture.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 5 ++---
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
-- 
2.17.1
