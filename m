From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Apr 2016 21:46:23 +0200
Subject: [Buildroot] [git commit] mesa: add vc4 driver support
Message-ID: <20160407194925.291C2802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e331bfa0d54abee687d2c317d680b6b6aa8c74e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in | 10 ++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 11 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8f6ab75..a87f53d 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -79,6 +79,16 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 	  This is a software opengl implementation using the Gallium3D
 	  infrastructure.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
+	bool "Gallium vc4 driver"
+	depends on BR2_arm
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_VC4
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for Broadcom VC4 (rpi2/3) GPUs.
+	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	bool "Gallium virgl driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 292935e..b5677f9 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -65,6 +65,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 # DRI Drivers
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
