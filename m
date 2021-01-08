From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2021 08:44:07 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/freescale-imx/firmware-imx/Config.in: install imx6q binaries for
 IM6UL platform
Message-ID: <20210108073947.9A1CF807F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94016794bad3ce051d1c8ef5baf180a8c8c1bea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

linux-*/arch/arm/boot/dts/imx6ul.dtsi
requires the install of the sdma-imx6q.bin as stated in
line 727: fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6q.bin";

without the BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME being set to "imx6q"
line 102 of firmware-imx.mk does not install the firmware to to target

Signed-off-by: Rob Mellor <Rob.Mellor@ultra-pals.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8e00c32b14c2e382cd8abb3ef2958e628cdaf4ad)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-imx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index d49241bff8..8810779799 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
+	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "imx7d" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
