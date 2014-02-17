From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2014 11:04:18 +0100
Subject: [Buildroot] [git commit] gst1-plugins-bad: add vo-aacenc option
Message-ID: <20140228133413.BA0D09BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d413fd4c22e041b8afe94c34bf0f5d39206ea0e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      |    4 ++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    8 +++++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 407bf31..95d1f13 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -318,6 +318,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink"
 	select BR2_PACKAGE_OPENSSL
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
+	bool "voaacenc"
+	select BR2_PACKAGE_VO_AACENC
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
 	bool "bz2"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 046f6bc..1ad76fe 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -41,7 +41,6 @@ GST1_PLUGINS_BAD_CONF_OPT += \
 	--disable-uvch264 \
 	--disable-assrender \
 	--disable-voamrwbenc \
-	--disable-voaacenc \
 	--disable-chromaprint \
 	--disable-dash \
 	--disable-dc1394 \
@@ -511,6 +510,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-apexsink
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-voaacenc
+GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-voaacenc
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-bz2
 GST1_PLUGINS_BAD_DEPENDENCIES += bzip2
