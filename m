From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 08:22:28 +0200
Subject: [Buildroot] [git commit] package/freescale-imx: fix i.MX8MMini
 configuration
Message-ID: <20200330060937.1124F8A37D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43890423ddb97a10d1fb96ada869a08cc4c98272
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Just like i.MX8MQ, i.MX8MMini is using Hantro VPU.
- Platform name wasn't set for i.MX8Mini
  -> now differencing IMX8MQ and IMX8MM for VPU package

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
