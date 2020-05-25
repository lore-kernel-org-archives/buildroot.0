From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Mon, 25 May 2020 18:02:06 +0200
Subject: [Buildroot] [PATCH v3 1/5] package/freescale-imx: Add option for
 DDR FW need
In-Reply-To: <1590422530-4788-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1590422530-4788-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1590422530-4788-2-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only some i.MX8 needs a DDR training firmware (8M, 8MM, 8MN). Some other
i.MX8 (QuadMax, QuadXPlus) rely on system controller for that task.

Suggested-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
v3:
  - let the others 'select' this newly introduced option instead of
    'default y' it. I believe this option is still required since we
    only want to choose a DDR binary for the i.MX 8M platforms. (Gary)
v2:
  - introduce BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW to extend the DDR
    firmware selection to the whole i.MX 8M family (suggested by Gary)

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b0c7de8..0be37ce 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -45,12 +45,15 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	bool "imx8m"
+	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 	bool "imx8mm"
+	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
 	bool "imx8mn"
+	select BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
@@ -96,6 +99,9 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 
+config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
+	bool
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
-- 
2.7.4
