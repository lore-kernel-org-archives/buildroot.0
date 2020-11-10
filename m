From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 21:25:05 +0100
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: fix opengl
 configure option
Message-ID: <20201117203827.5FB4A7FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a27f4bd420ab0f81e1eaab18b5ef18bea4425d55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- option was renamed from ENABLE_OPENGL to ENABLE_GRAPHICS_CONTEXT_GL
  since 2.30.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 1f8582daf5..5209eeed2d 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -66,7 +66,7 @@ ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_ACCELERATED_2D_CANVAS=ON \
 	-DENABLE_GLES2=OFF \
-	-DENABLE_OPENGL=ON \
+	-DENABLE_GRAPHICS_CONTEXT_GL=ON \
 	-DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
@@ -84,13 +84,13 @@ WEBKITGTK_DEPENDENCIES += libegl
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_GLES2=ON \
-	-DENABLE_OPENGL=ON
+	-DENABLE_GRAPHICS_CONTEXT_GL=ON
 WEBKITGTK_DEPENDENCIES += libgles
 else
 # Disable general OpenGL (shading) if there's no GLESv2
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_GLES2=OFF \
-	-DENABLE_OPENGL=OFF
+	-DENABLE_GRAPHICS_CONTEXT_GL=OFF
 endif
 # We must explicitly state the wayland target
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
