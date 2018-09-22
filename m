From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 23 Sep 2018 02:53:33 +0300
Subject: [Buildroot] [PATCH 5/5] webkitgtk: explicitly set USE_GSTREAMER_GL
 build option
In-Reply-To: <20180922235333.85642-1-aperez@igalia.com>
References: <20180922235333.85642-1-aperez@igalia.com>
Message-ID: <20180922235333.85642-6-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the USE_GSTREAMER_GL CMake build option depend on
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL being enabled. This
allows building WebKitGTK+ for targets where GL/GLES is
available but either GStreamer-GL is disabled or cannot be
built.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/webkitgtk/webkitgtk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 028208cb62..dac57ca501 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -98,4 +98,10 @@ WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_GL),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.19.0
