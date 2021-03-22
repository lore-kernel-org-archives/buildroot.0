From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Mon, 22 Mar 2021 10:12:50 +0100
Subject: [Buildroot] [PATCH v2 3/5] package/imx-mkimage: add support for
 i.MX8M Plus
In-Reply-To: <20210322091252.11392-1-stephane.viau@oss.nxp.com>
References: <20210322091252.11392-1-stephane.viau@oss.nxp.com>
Message-ID: <20210322091252.11392-4-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This SoC uses the same tools to generate boot images as the 8M family.

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
2.29.2
