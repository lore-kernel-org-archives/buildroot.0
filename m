From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 18 Jan 2015 11:57:34 +0100
Subject: [Buildroot] [PATCH] imx6slevk: fix uImage load address
Message-ID: <1421578654-11857-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i.MX6 SoloLite SoC has a different external memory base address
than the other i.MX6 family SoCs (0x80000000 for i.MX6 SoloLite
vs 0x10000000 for the others).

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 configs/freescale_imx6sololiteevk_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index f8ecc7b..2bb47af 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -11,7 +11,7 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x80008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
 
-- 
1.7.10.4
