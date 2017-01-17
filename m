From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jan 2017 14:23:26 +1100
Subject: [Buildroot] [git commit] package/efl: use "depends on" instead of
	"select" BR2_PACKAGE_EFL_WAYLAND
Message-ID: <20170117034151.7526D81E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f05f94e267a29799cffbd015455b42b944b459f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The efl Wayland support shouldn't select Wayland package itself. It must
be an user decision, so use "depends on" instead.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
