From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 20 Feb 2018 13:22:08 +0100
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: set parallel build
 according to buildroot
Message-ID: <1519129328-98231-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sunxi-mali-mainline-driver builds using parallel compilation by default,
using -j $(nproc), but this could be not wanted.

Pass -j $(PARALLEL_JOBS) to build using jobs configured in buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 9123c42..cde76e2 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -23,12 +23,12 @@ SUNXI_MALI_MAINLINE_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_DRIVER_USE_AP
 
 define SUNXI_MALI_MAINLINE_DRIVER_BUILD_CMDS
 	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -b
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -b
 endef
 
 define SUNXI_MALI_MAINLINE_DRIVER_INSTALL_TARGET_CMDS
 	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -i
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -i
 endef
 
 $(eval $(generic-package))
-- 
2.7.4
