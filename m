From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 10 Jul 2019 18:26:55 -0400
Subject: [Buildroot] [PATCH v3 4/4] package/gstreamer1/gst1-rtsp-server:
 convert package type to meson
In-Reply-To: <20190710222655.31023-1-aduskett@gmail.com>
References: <20190710222655.31023-1-aduskett@gmail.com>
Message-ID: <20190710222655.31023-4-aduskett@gmail.com>
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

 .../gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk    | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 34869863d9..b3b132d07e 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -16,6 +16,14 @@ GST1_RTSP_SERVER_DEPENDENCIES = \
 	gst1-plugins-base \
 	gst1-plugins-good
 
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
@@ -24,4 +32,4 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_RTSP_SERVER_DEPENDENCIES += gst1-plugins-bad
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.21.0
