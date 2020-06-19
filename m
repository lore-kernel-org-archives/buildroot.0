From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 19 Jun 2020 14:54:59 +0200
Subject: [Buildroot] [PATCH 1/2] package/weston: add imx-gpu-viv as possible
 egl provider
In-Reply-To: <20200619125500.524503-1-gary.bisson@boundarydevices.com>
References: <20200619125500.524503-1-gary.bisson@boundarydevices.com>
Message-ID: <20200619125500.524503-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the imx-gpu-viv package provides both EGL and gbm libraries.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/weston/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index bf783b70d4..d07eba4c9d 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -39,11 +39,11 @@ config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
 
 config BR2_PACKAGE_WESTON_DEFAULT_DRM
 	bool "drm"
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	select BR2_PACKAGE_WESTON_DRM
 
 comment "drm backend needs mesa3d w/ EGL driver"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
 config BR2_PACKAGE_WESTON_DEFAULT_X11
 	bool "X11"
@@ -63,11 +63,11 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 
 config BR2_PACKAGE_WESTON_DRM
 	bool "DRM compositor"
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
 # Uses libgbm from mesa3d
 comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor"
-- 
2.26.2
