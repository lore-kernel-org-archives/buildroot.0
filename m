From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:44:12 +0100
Subject: [Buildroot] [git commit] package/imx-mkimage: add -std=c99 to CFLAGS
Message-ID: <20190307204137.13C2D88F28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ad4cb3a5e712a8caa8b102aca2c200b80601dc1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/4c31d97a9aaf9ef887e68d64efe468c81f8cf7bc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-mkimage/imx-mkimage.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index 9f8e7d2d01..d8d8b10b32 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -14,7 +14,9 @@ HOST_IMX_MKIMAGE_DEPENDENCIES = host-zlib
 ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M),y)
 # i.MX8M needs a different binary
 define HOST_IMX_MKIMAGE_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/iMX8M -f soc.mak mkimage_imx8
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS) -std=c99" \
+		-C $(@D)/iMX8M -f soc.mak mkimage_imx8
 endef
 define HOST_IMX_MKIMAGE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/iMX8M/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
@@ -23,7 +25,9 @@ endef
 else
 # i.MX8 and i.MX8X
 define HOST_IMX_MKIMAGE_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) MKIMG=mkimage_imx8 mkimage_imx8
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS) -std=c99" \
+		-C $(@D) MKIMG=mkimage_imx8 mkimage_imx8
 endef
 define HOST_IMX_MKIMAGE_INSTALL_CMDS
 	$(INSTALL) -D -m 755 $(@D)/mkimage_imx8 $(HOST_DIR)/bin/mkimage_imx8
