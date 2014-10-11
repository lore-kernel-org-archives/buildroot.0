From: lf <micro1183@gmail.com>
Date: Sat, 11 Oct 2014 17:23:19 +0200
Subject: [Buildroot] [PATCH 2/2] mesa3d add option for Radeon
	r300/r600/radeonsi gallium drivers
In-Reply-To: <1413040999-3426-1-git-send-email-micro1183@gmail.com>
References: <1413040999-3426-1-git-send-email-micro1183@gmail.com>
Message-ID: <1413040999-3426-2-git-send-email-micro1183@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: lf <micro1183@gmail.com>
---
 package/mesa3d/Config.in | 27 +++++++++++++++++++++++++++
 package/mesa3d/mesa3d.mk |  3 +++
 2 files changed, 30 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1bd92ea..f149a68 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -47,6 +47,33 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	help
 	  Supports all Nvidia GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
+	bool "Gallium Radeon R300 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for ATI/AMD Radeon R300/R400/R500 GPUs.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	bool "Gallium Radeon R600 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
+
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	bool "Gallium Radeon SI driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8fbd72c..76cfe7a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -56,6 +56,9 @@ endif
 
 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
 # DRI Drivers
-- 
1.9.1
