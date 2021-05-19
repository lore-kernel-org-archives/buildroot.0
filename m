From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 20 May 2021 00:42:00 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: make gst-gl depend on
 _HAS_PLATFORM
Message-ID: <20210519214200.1294908-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GStreamer-GL usage in WPE WebKit is usable as long as GStreamer
is configured with a valid platform API (GLX+OpenGL, EGL+OpenGL,
EGL+GLES, etc.), which is exactly what the symbol
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM represents.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/wpewebkit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 640f7c7011..71bce8a88e 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -109,7 +109,7 @@ if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
 	bool "use gstreamer-gl"
 	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
 	help
 	  Use the GStreamer GL elements for handling video content.
 	  This is recommended as it improves performance of video
-- 
2.31.1
