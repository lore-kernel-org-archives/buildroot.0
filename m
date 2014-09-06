From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Sep 2014 23:23:03 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add option for the i915
	DRI driver
Message-ID: <20140906212914.CC9A89D561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=032893b7a60d8ff830d9f42618b66b3fb48bf1c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d/Config.in |    8 ++++++++
 package/mesa3d/mesa3d.mk |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

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
index 9a63fa2..f986d0e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -60,6 +60,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
 # DRI Drivers
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
 
