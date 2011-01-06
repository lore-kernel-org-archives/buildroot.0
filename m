From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Thu,  6 Jan 2011 17:53:20 +0200
Subject: [Buildroot] [PATCH 6/6] Add gst-omapfb package
In-Reply-To: <1294329200-10418-1-git-send-email-felipe.contreras@gmail.com>
References: <1294329200-10418-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1294329200-10418-7-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/gst-omapfb/Config.in     |    7 +++++++
 package/multimedia/gst-omapfb/gst-omapfb.mk |   15 +++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gst-omapfb/Config.in
 create mode 100644 package/multimedia/gst-omapfb/gst-omapfb.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 7590219..8c50c5c 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -7,6 +7,7 @@ source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-ffmpeg/Config.in"
 source "package/multimedia/gst-dsp/Config.in"
+source "package/multimedia/gst-omapfb/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
diff --git a/package/multimedia/gst-omapfb/Config.in b/package/multimedia/gst-omapfb/Config.in
new file mode 100644
index 0000000..e4a62c0
--- /dev/null
+++ b/package/multimedia/gst-omapfb/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GST_OMAPFB
+	bool "gst-omapfb"
+	depends on BR2_PACKAGE_GSTREAMER
+	help
+	  GStreamer plug-in to use OMAP framebuffer.
+
+	  http://github.com/felipec/gst-omapfb
diff --git a/package/multimedia/gst-omapfb/gst-omapfb.mk b/package/multimedia/gst-omapfb/gst-omapfb.mk
new file mode 100644
index 0000000..e370c4e
--- /dev/null
+++ b/package/multimedia/gst-omapfb/gst-omapfb.mk
@@ -0,0 +1,15 @@
+GST_OMAPFB_VERSION=1.0
+GST_OMAPFB_SOURCE=gst-omapfb-$(GST_OMAPFB_VERSION).tar.gz
+GST_OMAPFB_SITE=http://gst-dsp.googlecode.com/files/
+
+define GST_OMAPFB_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
+endef
+
+define GST_OMAPFB_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+endef
+
+GST_OMAPFB_DEPENDENCIES = gstreamer
+
+$(eval $(call GENTARGETS,package/multimedia,gst-omapfb))
-- 
1.7.4.rc1
