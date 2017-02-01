From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 1 Feb 2017 13:41:27 -0200
Subject: [Buildroot] [PATCH] configs/imx6q-sabresd: Bump to 4.9.7 kernel
Message-ID: <1485963687-30283-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel 4.9.7 has an important fix: a2104c7cd3b24c432 ("drm/atomic:
clear out fence when duplicating state"), which fixes a kernel
warning that triggers sometimes when starting/stopping ksmcube
application several times in a row.

So bump to this version.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/imx6q-sabresd_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6q-sabresd_defconfig b/configs/imx6q-sabresd_defconfig
index 1491668..cc37ecf 100644
--- a/configs/imx6q-sabresd_defconfig
+++ b/configs/imx6q-sabresd_defconfig
@@ -30,7 +30,7 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
-- 
2.7.4
