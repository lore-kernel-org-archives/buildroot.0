From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Nov 2020 00:13:55 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/webkitgtk: fix opengl configure
 option
Message-ID: <20201109231356.32230-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- option was renamed from ENABLE_OPENGL to ENABLE_GRAPHICS_CONTEXT_GL
  since 2.30.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.29.2
