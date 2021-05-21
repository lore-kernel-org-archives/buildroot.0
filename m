From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 18:52:17 +0200
Subject: [Buildroot] [git commit branch/next] package/wpewebkit: make gst-gl
 depend on _HAS_PLATFORM
Message-ID: <20210521162334.71C748152B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e53ee4f01f7a8ae0695b32cdd80d8dfdb5d3f9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The GStreamer-GL usage in WPE WebKit is usable as long as GStreamer
is configured with a valid platform API (GLX+OpenGL, EGL+OpenGL,
EGL+GLES, etc.), which is exactly what the symbol
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM represents.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpewebkit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index c8c66e8458..04b2bf3beb 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -110,7 +110,7 @@ if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
 	bool "use gstreamer-gl"
 	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
 	help
 	  Use the GStreamer GL elements for handling video content.
 	  This is recommended as it improves performance of video
