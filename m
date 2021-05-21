From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 18:52:18 +0200
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: make gst-gl
 depend on _HAS_PLATFORM
Message-ID: <20210521162334.824038909D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e6efb5884c9479703f8023415df8ba707e61664
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The GStreamer-GL usage in WebKitGTK is usable as long as GStreamer
is configured with a valid platform API (GLX+OpenGL, EGL+OpenGL,
EGL+GLES, etc.), which is exactly what the symbol
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM represents.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/webkitgtk/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 2ba8d47660..a05161d052 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -113,7 +113,7 @@ if BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 config BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL
 	bool "use gstreamer-gl"
 	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
 	help
 	  Use the GStreamer GL elements for handling video content.
 	  This is recommended as it improves performance of video
