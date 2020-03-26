From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 26 Mar 2020 17:49:42 +0100
Subject: [Buildroot] [PATCH 1/2] package/freescale-imx: fix i.MX8MMini
 configuration
In-Reply-To: <20200326164943.564656-1-gary.bisson@boundarydevices.com>
References: <20200326164943.564656-1-gary.bisson@boundarydevices.com>
Message-ID: <20200326164943.564656-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Just like i.MX8MQ, i.MX8MMini is using Hantro VPU.
- Platform name wasn't set for i.MX8Mini
  -> now differencing IMX8MQ and IMX8MM for VPU package

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index f42bb11a3c..0a5be9c75a 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -66,7 +66,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
-	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default "IMX8MQ" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default "IMX8MM" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
@@ -77,7 +78,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 	bool
-	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	bool
-- 
2.25.1
