From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 May 2017 18:21:14 +0100
Subject: [Buildroot] [PATCH next 06/11] gst1-plugins-bad: add Image Quality
	Assessment (IQA) plugin
In-Reply-To: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
References: <20170509172119.33642-1-Vincent.Riera@imgtec.com>
Message-ID: <20170509172119.33642-6-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This plugin replaces the recently removed videomeasure plugin.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 5 +++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index d137a6c..35d3f16 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -407,6 +407,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOFRAME_AUDIOLEVEL
 	help
 	  videoframe_audiolevel
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA
+	bool "iqa"
+	help
+	  Image Quality Assessment
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS
 	bool "videoparsers"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 9dbde14..f597065 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -476,6 +476,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-videoframe_audiolevel
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-iqa
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-iqa
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-videoparsers
 else
-- 
2.10.2
