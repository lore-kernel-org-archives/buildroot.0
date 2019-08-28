From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 28 Aug 2019 18:21:46 +0200
Subject: [Buildroot] [PATCH/next v10 12/12] package/mesa3d: add support for
 gallium panfrost driver
In-Reply-To: <20190828162146.19585-1-bernd.kuhls@t-online.de>
References: <20190828162146.19585-1-bernd.kuhls@t-online.de>
Message-ID: <20190828162146.19585-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see https://panfrost.freedesktop.org

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 7 +++++++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1cf241e552..035b018a5a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -119,6 +119,13 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	help
 	  Supports all Nvidia GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
+	bool "Gallium panfrost driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+	help
+	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 	bool "Gallium Radeon R600 driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 794de462ef..ad5362ec70 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -88,6 +88,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
@@ -175,6 +176,8 @@ else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
 MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA),y)
 MESA3D_PLATFORMS = drm
+else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
+MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
 MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
-- 
2.20.1
