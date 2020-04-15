From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 15 Apr 2020 18:18:25 +0200
Subject: [Buildroot] [PATCH 1/7] package/freescale-imx: add option for
 i.MX8M Nano
In-Reply-To: <20200415161831.2093348-1-gary.bisson@boundarydevices.com>
References: <20200415161831.2093348-1-gary.bisson@boundarydevices.com>
Message-ID: <20200415161831.2093348-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The i.MX8M Nano is slightly different from the i.MX8M Mini but very
close (pin to pin compatible).
Mainly the Nano version has no VPU and another GPU (GC7000UL).

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 package/freescale-imx/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 0a5be9c75a..b0c7de8436 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -49,6 +49,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	bool "imx8mm"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+	bool "imx8mn"
+
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
 endchoice
@@ -68,6 +71,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 	default "IMX8MQ" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+	default "IMX8MN" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
@@ -89,6 +93,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
-- 
2.25.1
