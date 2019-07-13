From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 13 Jul 2019 17:43:21 -0400
Subject: [Buildroot] [PATCH v4 4/4] package/gstreamer1/gst1-rtsp-server:
 convert package type to meson
In-Reply-To: <20190713214321.119654-1-aduskett@gmail.com>
References: <20190713214321.119654-1-aduskett@gmail.com>
Message-ID: <20190713214321.119654-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - Add missing gobject-cast-checks, glib-asserts, and glib-checks in
    gst1-plugins-bad.mk (Peter)

Changes v3 -> v4:
  - Add GST1_RTSP_SERVER_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS) (Arnout)

 .../gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk  | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 34869863d9..7377f1b2c9 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -16,6 +16,16 @@ GST1_RTSP_SERVER_DEPENDENCIES = \
 	gst1-plugins-base \
 	gst1-plugins-good
 
+GST1_RTSP_SERVER_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
+GST1_RTSP_SERVER_CONF_OPTS += \
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Dintrospection=disabled \
+	-Dgobject-cast-checks=disabled \
+	-Dglib-asserts=disabled \
+	-Dglib-checks=disabled
+
 ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
 GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
 endif
@@ -24,4 +34,4 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_RTSP_SERVER_DEPENDENCIES += gst1-plugins-bad
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.21.0
