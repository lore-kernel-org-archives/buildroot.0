From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Aug 2019 00:56:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-rtsp-server: disable examples
 and tests
Message-ID: <20190815225652.3699-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/7a268af00535d0f93e94955a3beea2745cf93422

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index 34869863d9..0a821e6fed 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -15,6 +15,9 @@ GST1_RTSP_SERVER_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
 	gst1-plugins-good
+GST1_RTSP_SERVER_CONF_OPTS = \
+	--disable-examples \
+	--disable-tests
 
 ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
 GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
-- 
2.20.1
