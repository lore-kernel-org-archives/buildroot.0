From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:29 +0200
Subject: [Buildroot] [PATCH 17/22] package/sunxi-mali-mainline-driver: bear
 the kernel options munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <c208470f8f88410c3227f292d5a1645a20c536d8.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 linux/linux.mk                                               | 3 ---
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk | 5 +++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6ce984b22b..e4dfefde48 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -355,9 +355,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
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
-- 
2.20.1
