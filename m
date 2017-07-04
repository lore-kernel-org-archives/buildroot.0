From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 13:31:41 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: add Image Quality
	Assessment (IQA) plugin
Message-ID: <20170704113142.62E6180526@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e3fa33f1e6574f34d3064c42b21382393af23ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This plugin replaces the recently removed videomeasure plugin.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                        | 4 ++++
 package/gstreamer1/gst1-plugins-bad/Config.in           | 5 +++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ++++++
 3 files changed, 15 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index f20eb6a..f1a1b8a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -185,7 +185,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOMEASURE
 	bool "videomeasure removed"
+	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA
 	select BR2_LEGACY
+	help
+	  videomeasure plugin has been removed and has been replaced by
+	  iqa, which has automatically been enabled.
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink removed"
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
