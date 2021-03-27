From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Mar 2021 14:12:13 +0100
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: add
 support for i.MX 8M Plus
Message-ID: <20210327125840.95A8E80367@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45a0999a1bea0acfa5b7cdc1060d7cea92b60e24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This SoC requires the same (LP)DDR training binaries as i.MX 8M SoC
family.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 8810779799..0bd8000b50 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 config BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME
 	string
@@ -48,6 +49,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP
 
 if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 
