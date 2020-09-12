From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:24:29 +0200
Subject: [Buildroot] [git commit] package/weston: add imx-gpu-viv as
 possible egl provider
Message-ID: <20200912121656.354A786E55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23f14802c3c6f818d62b3c0ba029b3a722195ec3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As the imx-gpu-viv package provides both EGL and gbm libraries.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
