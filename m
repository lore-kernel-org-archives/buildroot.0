From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  9 Feb 2020 08:30:53 -0700
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add support for dri r200
 driver
Message-ID: <20200209153053.128369-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Renamed r100 driver to be consistent with r200 driver.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/Config.in | 11 +++++++++--
 package/mesa3d/mesa3d.mk |  3 ++-
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 9965b0e972..882ae8d1d3 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -343,13 +343,20 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU
 	help
 	  Support for Nvidia-based GPUs.
 
-config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
-	bool "DRI radeon driver"
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_R100
+	bool "DRI radeon r100 driver"
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
+config BR2_PACKAGE_MESA3D_DRI_DRIVER_R200
+	bool "DRI radeon r200 driver"
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	help
+	  Legacy Radeon driver for R200 series GPUs.
+
 comment "Vulkan drivers"
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7fb07ae05c..fb178e0622 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -93,7 +93,8 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_R100)   += r100
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_R200)   += r200
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
-- 
2.20.1
