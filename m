From: pawnrob at gmail.com <pawnrob@gmail.com>
Date: Fri, 13 Nov 2020 10:10:26 +0000
Subject: [Buildroot] [PATCH 1/1]
 package/freescale-imx/firmware-imx/Config.in: install imx6q binaries for
 IM6UL platform
Message-ID: <20201113101026.1824-1-pawnrob@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: RMellor <Rob.Mellor@ultra-pals.com>

linux-*/arch/arm/boot/dts/imx6ul.dtsi
requires the install of the sdma-imx6q.bin as stated in
line 727: fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6q.bin";

without the BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME being set to "imx6q"
line 102 of firmware-imx.mk does not install the firmware to to target

Signed-off-by: RMellor <Rob.Mellor@ultra-pals.com>
---
 package/freescale-imx/firmware-imx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 587f402426..fcf22c55b3 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	default "imx51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
 	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
-- 
2.17.1
