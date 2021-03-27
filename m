From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Mar 2021 14:11:58 +0100
Subject: [Buildroot] [git commit] package/freescale-imx: add option for i.MX
 8M Plus
Message-ID: <20210327125840.4DFFD888A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbcb58a2b1e12af20def335758aa1c53990d7dbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The i.MX 8M Plus focuses on machine learning and vision and industrial
automation. It also provides advanced multimedia, including a VPU and
the GPU GC7000UL (3D) + GC520L (2D).

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/Config.in | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b0c7de8436..bedd05a471 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -52,6 +52,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	bool "imx8mn"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
+	bool "imx8mp"
+
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
 endchoice
@@ -72,6 +75,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX8MQ" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	default "IMX8MP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
@@ -83,7 +87,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	bool
@@ -94,6 +99,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
