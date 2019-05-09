From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  9 May 2019 18:46:22 -0400
Subject: [Buildroot] [PATCH 4/5] package/gstreamer1/gst1-plugins-bad: add
 audiolatency plugin
In-Reply-To: <20190509224624.80437-1-aduskett@gmail.com>
References: <20190509224624.80437-1-aduskett@gmail.com>
Message-ID: <20190509224624.80437-5-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This plugin was introduced in 1.16.0. It is dependencyless and provides
a way to measure audio latency

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 5 +++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index c53ff66272..35d6bddd05 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -46,6 +46,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD
 	help
 	  Audio filters plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOLATENCY
+	bool "audiolatency"
+	help
+	  Audio latency plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX
 	bool "audiomixmatrix"
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index d6414f9daa..ad1adbc385 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -132,6 +132,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiofxbad
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOLATENCY),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiolatency
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-audiolatency
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXMATRIX),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-audiomixmatrix
 else
-- 
2.21.0
