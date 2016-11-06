From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:21:05 +0100
Subject: [Buildroot] [git commit branch/next] gst1-plugins-bad: add new
	timecode plugin
Message-ID: <20161107205049.ECFCD80AC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2485193b5d41e0456c22574b9add2f6b2261a2f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a new explicit option for the dependency-less timecode plugin.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 3 +++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 1e251af..40bb283 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -419,6 +419,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SUBENC
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO
 	bool "stereo"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE
+	bool "timecode"
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA
 	bool "tta"
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ba9f8ff..012b948 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -517,6 +517,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-stereo
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TIMECODE),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-timecode
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-timecode
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTA),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-tta
 else
