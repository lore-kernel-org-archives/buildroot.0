From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:29 +0200
Subject: [Buildroot] [git commit] package/kernel-module-imx-gpu-viv: bear
 the kernel options munging
Message-ID: <20200501133531.4FBB490D03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=391c448acbb9a66ddb43804dbcea677da0651a8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                                                        | 2 --
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk            | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6e2006836e..ad2efd948a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -359,8 +359,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB))
-	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
-		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV))
 	$(if $(LINUX_KERNEL_CUSTOM_LOGO_PATH),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index e087ccaa12..a037858cfc 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -16,5 +16,9 @@ KERNEL_MODULE_IMX_GPU_VIV_MODULE_MAKE_OPTS = \
 
 KERNEL_MODULE_IMX_GPU_VIV_MODULE_SUBDIRS = kernel-module-imx-gpu-viv-src
 
+define KERNEL_MODULE_IMX_GPU_VIV_MODULE_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
