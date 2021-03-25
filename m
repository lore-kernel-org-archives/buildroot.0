From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Thu, 25 Mar 2021 07:21:39 +0100
Subject: [Buildroot] [PATCH v3 3/5] package/imx-mkimage: add support for
 i.MX 8M Plus
In-Reply-To: <20210325062141.10226-1-stephane.viau@oss.nxp.com>
References: <20210325062141.10226-1-stephane.viau@oss.nxp.com>
Message-ID: <20210325062141.10226-4-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This SoC uses the same tools to generate boot images as the 8M family.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Changes v1 -> v2:
- Split one patch into multiple patches (Gary)

Changes v2 -> v3:
- Fix typo in commit log (Gary)

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/imx-mkimage/imx-mkimage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 626e3d873f..17ba3596f7 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -11,7 +11,7 @@ IMX_MKIMAGE_LICENSE = GPL-2.0+
 IMX_MKIMAGE_LICENSE_FILES = COPYING
 HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP),y)
 # i.MX8M needs a different binary
 define HOST_IMX_MKIMAGE_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
-- 
2.31.0
