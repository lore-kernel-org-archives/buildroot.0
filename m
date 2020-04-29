From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Wed, 29 Apr 2020 10:31:19 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/freescale-imx: Add option for
 DDR FW need
In-Reply-To: <1588149083-8229-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1588059233-11467-1-git-send-email-stephane.viau@oss.nxp.com>
 <1588149083-8229-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1588149083-8229-2-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only some i.MX8 need a DDR training firmware (8M, 8MM, 8MN). Some other
i.MX8 (QuadMax, QuadXPlus) rely on system controller for that task.

Suggested-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
v2:
  - introduce BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW to extend the DDR
    firmware selection to the whole i.MX 8M family (suggested by Gary)

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b0c7de8..6b10d2c 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -96,6 +96,13 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
+config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
+	bool
+	default y if \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
-- 
2.7.4
