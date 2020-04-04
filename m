From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:34 +0200
Subject: [Buildroot] [PATCH 22/22] package/kernel-module-imx-gpu-viv: bear
 the kernel options munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <681cc941334365689dadc41143521d842cd98189.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 linux/linux.mk                                                | 2 --
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk    | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3762e718c6..60dc343efa 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -357,8 +357,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB))
-	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
-		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV))
 	$(if $(LINUX_KERNEL_CUSTOM_LOGO_PATH),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index c76a5ee386..1895b9f446 100644
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
-- 
2.20.1
