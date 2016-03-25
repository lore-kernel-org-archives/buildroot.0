From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 09:50:10 -0300
Subject: [Buildroot] [PATCH 06/10] gst1-plugins-bad: add netsim and
	videoframe_audiolevel support
In-Reply-To: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458910214-10963-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1458910214-10963-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           |  8 ++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 68fed23..a9667af 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -350,6 +350,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF
 	help
 	  MXF plugin library
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NETSIM
+	bool "netsim"
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX
 	bool "nuvdemux"
 
@@ -426,6 +429,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFILTERS
 	help
 	  Video filters in gst-plugins-bad
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFRAME_AUDIOLEVEL
+	bool "videoframe_audiolevel"
+	help
+	  videoframe_audiolevel
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE
 	bool "videomeasure"
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 55b4d6f..c63a848 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -431,6 +431,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-mxf
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_NETSIM),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-netsim
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-netsim
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-nuvdemux
 else
@@ -539,6 +545,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-videofilters
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFRAME_AUDIOLEVEL),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-videoframe_audiolevel
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-videoframe_audiolevel
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-videomeasure
 else
-- 
2.7.3
