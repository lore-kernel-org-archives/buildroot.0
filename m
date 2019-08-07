From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed,  7 Aug 2019 15:58:04 -0600
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad: fix
 opengl dependency
Message-ID: <20190807215804.100437-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
WPEThreadedView.h:24:10: fatal error: gst/gl/gl.h: No such file or directory
 #include <gst/gl/gl.h>
          ^~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index f00f3edb7c..79acd83a63 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -595,11 +595,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
 	bool "wpe"
 	default y
 	depends on BR2_PACKAGE_WPEWEBKIT
-	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
 
 comment "wpe needs the gst1-plugins-base opengl library and wpewebkit"
 	depends on !BR2_PACKAGE_WPEWEBKIT \
-		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_HAS_LIB_OPENGL
+		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
 	bool "x265"
-- 
2.20.1
