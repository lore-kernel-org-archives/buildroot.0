From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 29 Apr 2019 21:45:34 +0200
Subject: [Buildroot] [DRAFT v1 7/7] package/gst1-rtsp-server: convert to
 meson build
In-Reply-To: <20190429194534.25743-1-ps.report@gmx.net>
References: <20190429194534.25743-1-ps.report@gmx.net>
Message-ID: <20190429194534.25743-8-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 34869863d9..c4eae64617 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -16,6 +16,11 @@ GST1_RTSP_SERVER_DEPENDENCIES = \
 	gst1-plugins-base \
 	gst1-plugins-good

+GST1_RTSP_SERVER_CONF_OPTS = \
+	-Dexamples=disabled \
+	-Dtests=disabled \
+	-Dintrospection=disabled
+
 ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
 GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
 endif
@@ -24,4 +29,8 @@ ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
 GST1_RTSP_SERVER_DEPENDENCIES += gst1-plugins-bad
 endif

-$(eval $(autotools-package))
+# These plugins are listed in the order from meson_options.txt
+GST1_RTSP_SERVER_CONF_OPTS = \
+	-Drtspclientsink=enabled
+
+$(eval $(meson-package))
--
2.21.0
