From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2014 11:13:15 +0100
Subject: [Buildroot] [git commit branch/next] gst1-plugins-bad: add
	assrender option
Message-ID: <20140217101407.66F3B9CA6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d3590d4b0141b00e2430db67fafb2546b56ec26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      |    4 ++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |    8 +++++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 95d1f13..25be9ce 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -318,6 +318,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_APEXSINK
 	bool "apexsink"
 	select BR2_PACKAGE_OPENSSL
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
+	bool "assrender"
+	select BR2_PACKAGE_LIBASS
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 	bool "voaacenc"
 	select BR2_PACKAGE_VO_AACENC
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 1ad76fe..dbd0625 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -39,7 +39,6 @@ GST1_PLUGINS_BAD_CONF_OPT += \
 	--disable-mfc \
 	--disable-opensles \
 	--disable-uvch264 \
-	--disable-assrender \
 	--disable-voamrwbenc \
 	--disable-chromaprint \
 	--disable-dash \
@@ -510,6 +509,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-apexsink
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-assrender
+GST1_PLUGINS_BAD_DEPENDENCIES += libass
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-assrender
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-voaacenc
 GST1_PLUGINS_BAD_DEPENDENCIES += vo-aacenc
