From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 31 Aug 2014 01:49:19 +0200
Subject: [Buildroot] [PATCH 1/4] package/mesa3d: add option for the i915 DRI
	driver
In-Reply-To: <cover.1409442539.git.yann.morin.1998@free.fr>
References: <cover.1409442539.git.yann.morin.1998@free.fr>
Message-ID: <6a23bd3651764badb8445e63bf56364b76d7661f.1409442539.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 8 ++++++++
 package/mesa3d/mesa3d.mk | 1 +
 2 files changed, 9 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 57d3c1f..74ebbed 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -75,6 +75,14 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	  This is a software opengl implementation using the DRI
 	  infrastructure.
 
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
+	bool "DRI i915 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_LIBDRM_INTEL
+	help
+	  Support for i915-based Intel GPUs.
+
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	bool "DRI i965 driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6b99757..4712104 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -60,6 +60,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
 # DRI Drivers
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
 
-- 
1.9.1
