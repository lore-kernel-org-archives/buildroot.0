From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Sep 2019 18:38:49 +0200
Subject: [Buildroot] [PATCH v13 13/13] package/mesa3d: add support for
 gallium freedreno driver
In-Reply-To: <20190920163849.8124-1-bernd.kuhls@t-online.de>
References: <20190920163849.8124-1-bernd.kuhls@t-online.de>
Message-ID: <20190920163849.8124-14-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 7 +++++++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 05d7475368..c140b73ade 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -93,6 +93,13 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	help
 	  Mesa driver for Vivante GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	bool "Gallium freedreno driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+	help
+	  Mesa driver for Freedreno GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
 	bool "Gallium KMSRO driver"
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 90eaf6a9ba..5c7cabc97a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -85,6 +85,7 @@ endif
 
 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedreno
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
@@ -174,6 +175,8 @@ else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
 MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
 MESA3D_PLATFORMS = drm
+else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
+MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA),y)
 MESA3D_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
-- 
2.20.1
