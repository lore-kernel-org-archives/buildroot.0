From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 19 Oct 2020 21:27:57 +0200
Subject: [Buildroot] [PATCH v1] package/gst1-devtools: add optional
 gst1-rtsp-server dependency
Message-ID: <20201019192757.6624-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add optional gst1-rtsp-server dependency as checked for in
gst1-devtools-1.18.0/validate/tools/meson.build.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/gstreamer1/gst1-devtools/gst1-devtools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gst1-devtools/gst1-devtools.mk b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
index c88d4c0378..65c9bd4914 100644
--- a/package/gstreamer1/gst1-devtools/gst1-devtools.mk
+++ b/package/gstreamer1/gst1-devtools/gst1-devtools.mk
@@ -23,6 +23,10 @@ else
 GST1_DEVTOOLS_DEPENDENCIES += host-python python
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_RTSP_SERVER),y)
+GST1_DEVTOOLS_DEPENDENCIES += gst1-rtsp-server
+endif
+
 GST1_DEVTOOLS_CONF_OPTS = \
 	-Dvalidate=enabled \
 	-Ddebug_viewer=disabled \
-- 
2.28.0
