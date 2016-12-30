From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 30 Dec 2016 17:22:49 +0100
Subject: [Buildroot] [PATCH 1/2] package/efl: use "depends on" instead of
	"select" BR2_PACKAGE_EFL_WAYLAND
Message-ID: <20161230162250.2735-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The efl Wayland support shouldn't selecte Wayland package itself.
It must be an user decision, so use "depends on" instead.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index c51fc56..f6ec579 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -157,13 +157,14 @@ config BR2_PACKAGE_EFL_X_XLIB
 
 config BR2_PACKAGE_EFL_WAYLAND
 	bool "Wayland support"
+	depends on BR2_PACKAGE_WAYLAND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # Evas DRM Engine -> libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
 	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
 	select BR2_PACKAGE_EFL_DRM
-	select BR2_PACKAGE_WAYLAND
 
 comment "Wayland support needs OpenGL ES w/ EGL, threads"
+	depends on BR2_PACKAGE_WAYLAND
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
 		|| !BR2_PACKAGE_EFL_OPENGLES
 
-- 
2.9.3
