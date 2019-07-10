From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 10 Jul 2019 11:36:34 -0400
Subject: [Buildroot] [PATCH v2 6/6] package/gstreamer1/gst1-rtsp-server:
 convert package type to meson
In-Reply-To: <20190710153634.25235-1-aduskett@gmail.com>
References: <20190710153634.25235-1-aduskett@gmail.com>
Message-ID: <20190710153634.25235-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

GStreamer 1.16.0 is the last version to support autotools, and will be removed
in the next version.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 34869863d9..bd2d7c741e 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -16,6 +16,11 @@ GST1_RTSP_SERVER_DEPENDENCIES = \
 	gst1-plugins-base \
 	gst1-plugins-good
 
+GST1_RTSP_SERVER_CONF_OPTS += \
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Dintrospection=disabled
+
 ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
 GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
 endif
@@ -24,4 +29,4 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_RTSP_SERVER_DEPENDENCIES += gst1-plugins-bad
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.21.0
