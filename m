From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 15:18:44 +0200
Subject: [Buildroot] [git commit] package/wpewebkit: fix gstreamer-gl
 dependency
Message-ID: <20190807131550.348258E458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0b32cf11ed86170335efc83c418bfe08dd9eac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gstreamer1 opengl plugin was moved from gst1-plugins-bad to
gst1-plugins-base so we need to update wpewebkit to depend on the
correct package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
[Thomas: don't add gst1-plugins-base to the DEPENDENCIES variable when
BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL is enabled, because it's
already added when BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA=y, and
BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL depends on
BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wpewebkit/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
index 2808a3c8b3..5f3e237c53 100644
--- a/package/wpewebkit/Config.in
+++ b/package/wpewebkit/Config.in
@@ -93,8 +93,7 @@ if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
 config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
 	bool "use gstreamer-gl"
 	default y
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
-	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
 	help
 	  Use the GStreamer GL elements for handling video content.
 	  This is recommended as it improves performance of video
