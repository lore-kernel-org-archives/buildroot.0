From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:29 +0200
Subject: [Buildroot] [git commit] package/sunxi-mali-mainline-driver: bear
 the kernel options munging
Message-ID: <20200501133531.1D63590D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b4a2bd8e402a3b0936cdc6094d93fb2a068a603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                                                   | 3 ---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index ca5dd692d7..8867be44f7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -357,9 +357,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
-	$(if $(BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_CMA)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_DMA_CMA))
 	$(if $(BR2_PACKAGE_IPTABLES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 0edcdee4d6..40ea450b31 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -32,4 +32,9 @@ define SUNXI_MALI_MAINLINE_DRIVER_INSTALL_TARGET_CMDS
 		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -i
 endef
 
+define SUNXI_MALI_MAINLINE_DRIVER_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CMA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DMA_CMA)
+endef
+
 $(eval $(generic-package))
