From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 12:25:29 +0100
Subject: [Buildroot] [git commit] package/freescale-imx: add option for i.MX8
Message-ID: <20200205111426.2D9FE8BFC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e11fec61beff8c682d5f635382587b2cb3914f8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The i.MX8 family has both the i.MX8QP and i.MX8QM.

See [0] for an overall presentation of all i.MX8 series, and [1] for
i.MX8 itself, which includes i.MX8QM (i.MX8 Quad Max) and i.MX8QP
(i.MX8 Quad Plus), which both have a quad Cortex-A53, the Plus has a
single Cortex-A72 and the Max has a dual Cortex-A72.

[0] https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i.mx-applications-processors/i.mx-8-processors:IMX8-SERIES
[1] https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i.mx-applications-processors/i.mx-8-processors/i.mx-8-family-arm-cortex-a53-cortex-a72-virtualization-vision-3d-graphics-4k-video:i.MX8

Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index d23bcdbd9a..711e8f72c2 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -40,6 +40,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	bool "imx7d/imx7ulp"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	bool "imx8"
+
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	bool "imx8m"
 
@@ -62,6 +65,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX6S" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
@@ -80,6 +84,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
