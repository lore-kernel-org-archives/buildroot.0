From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Oct 2011 17:13:03 +0200
Subject: [Buildroot] [git commit] gst-plugins-good: add pulseaudio support
Message-ID: <20111020151346.49BD38E311@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fd04dd41f01ba76b860136799099254e54a3859
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-good/Config.in      |    4 ++++
 .../gst-plugins-good/gst-plugins-good.mk           |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index 1fc66a3..33ecb5c 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -192,6 +192,10 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_OSS4
 	bool "oss4 (Open Sound System 4)"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE
+	select BR2_PACKAGE_PULSEAUDIO
+	bool "pulseaudio"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
 	select BR2_PACKAGE_LIBSOUP
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index c2dcd24..c7afed4 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -345,6 +345,13 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-oss4
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-pulse
+GST_PLUGINS_GOOD_DEPENDENCIES += pulseaudio
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-pulse
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-soup
 GST_PLUGINS_GOOD_DEPENDENCIES += libsoup
