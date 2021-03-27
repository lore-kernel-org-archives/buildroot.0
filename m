From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Mar 2021 14:12:21 +0100
Subject: [Buildroot] [git commit] package/imx-mkimage: add support for i.MX
 8M Plus
Message-ID: <20210327125840.78F6287955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f170cee049bf86efab0f22f493c2cf2e65b69e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This SoC uses the same tools to generate boot images as the 8M family.

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
