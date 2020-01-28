From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jan 2020 17:42:53 -0700
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add support for gallium
 iris driver
Message-ID: <20200128004253.125237-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/Config.in | 7 +++++++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 455091eb9d..14adb407b4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -113,6 +113,13 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	help
 	  Mesa driver for Freedreno GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
+	bool "Gallium iris driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+	help
+	  Mesa driver for iris-based Intel GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
 	bool "Gallium KMSRO driver"
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f6f276c92d..2cf534291c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -74,6 +74,7 @@ endif
 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedreno
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
@@ -167,6 +168,8 @@ else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
 MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
 MESA3D_PLATFORMS += drm
+else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
+MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA),y)
 MESA3D_PLATFORMS += drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
-- 
2.20.1
