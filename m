From: Andre Renaud <andre@ignavus.net>
Date: Thu, 12 Apr 2018 09:27:41 +1200
Subject: [Buildroot] [PATCH] Added option to enable Freedreno gallium driver
 in mesa3d
Message-ID: <20180411212741.16489-1-andre@ignavus.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Andre Renaud <arenaud@designa-electronics.com>

---
 package/mesa3d/Config.in | 7 +++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1476b39acc..5005c98cee 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -85,6 +85,13 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	help
 	  Mesa driver for Vivante GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
+	bool "Gallium freedreno driver"
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_FREEDRENO
+	help
+	  Mesa driver for Freedreno GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 506f84274f..bf177591c7 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -78,6 +78,7 @@ endif
 
 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv imx
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)  += freedreno
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
-- 
2.15.1
