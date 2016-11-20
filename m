From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 20 Nov 2016 16:03:00 -0200
Subject: [Buildroot] [PATCH] configs/imx28evk: Bump to kernel 4.8.8
Message-ID: <1479664980-29851-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel 4.8.8 brings commit 235bde1ed3f0ff ("net: fec: Call swap_buffer()
prior to IP header alignment"), which makes Ethernet functional again
on mx28.

Bump to this version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
This patch depends on Vicente's series that bumps linux-headers and kernel
version to 4.8.8

 configs/freescale_imx28evk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/freescale_imx28evk_defconfig b/configs/freescale_imx28evk_defconfig
index 790c338..9c870cf 100644
--- a/configs/freescale_imx28evk_defconfig
+++ b/configs/freescale_imx28evk_defconfig
@@ -11,7 +11,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.8"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-evk"
-- 
2.7.4
