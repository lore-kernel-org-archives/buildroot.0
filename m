From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 11:05:57 +0100
Subject: [Buildroot] [git commit] package/gst1-devtools: add optional
 gst1-rtsp-server dependency
Message-ID: <20201025095356.52DD183935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f96dc1e64acc2635c01d60c57af9c8cee5a1586f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optional gst1-rtsp-server dependency as checked for in
gst1-devtools-1.18.0/validate/tools/meson.build.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
