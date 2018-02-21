From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Feb 2018 22:47:33 +0100
Subject: [Buildroot] [git commit] sunxi-mali-mainline-driver: set parallel
 build according to buildroot
Message-ID: <20180305200717.1727381EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4de24dc4a9a8f9e2aec09764d608f37635e220a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sunxi-mali-mainline-driver builds using parallel compilation by default,
using -j $(nproc), but this could be not wanted.

Pass -j $(PARALLEL_JOBS) to build using jobs configured in buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 9123c42947..cde76e2655 100644
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
