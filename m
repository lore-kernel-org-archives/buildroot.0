From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 21:57:00 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add support for gallium
 tegra driver
Message-ID: <20190928195146.94E93815C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39248bba259d1b35d224285d4379844b2a551fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"tegra driver requires nouveau driver":
https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.2#n251

Suggested-by: Ross Green <grunpferd@netscape.net>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 9 +++++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 92caa05679..d9a705f991 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -194,6 +194,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 comment "Gallium swrast: Only one swrast provider can be built"
 	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
+	bool "Gallium tegra driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
+	select BR2_PACKAGE_LIBDRM_NOUVEAU
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Adds support for Nvidia Tegra GPUs, requires nouveau.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_arm || BR2_aarch64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 82781c9e10..b47c6b9b2e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -93,6 +93,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
 # DRI Drivers
