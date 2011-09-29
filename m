From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Sep 2011 16:55:08 +0200
Subject: [Buildroot] [git commit] gst-plugins-good: bump version
Message-ID: <20110929190333.D01178DAC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=531d31d286de113d9653bf5b592932bc8295725c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-good/Config.in      |    9 ++++++---
 .../gst-plugins-good/gst-plugins-good.mk           |   20 +++++++++++++-------
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index e560ea8..1fc66a3 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -45,6 +45,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_APETAG
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOFX
 	bool "audiofx"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS
+	bool "audioparsers"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUPARSE
 	bool "auparse"
 
@@ -94,6 +97,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_INTERLEAVE
 	bool "interleave"
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ISOMP4
+	bool "isomp4"
+
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW
 	bool "law"
 
@@ -112,9 +118,6 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIFILE
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_MULTIPART
 	bool "multipart"
 
-config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX
-	bool "qtdemux"
-
 config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN
 	bool "replaygain"
 
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index eeff266..202e60e 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -3,7 +3,7 @@
 # gst-plugins-good
 #
 #############################################################
-GST_PLUGINS_GOOD_VERSION = 0.10.28
+GST_PLUGINS_GOOD_VERSION = 0.10.30
 GST_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST_PLUGINS_GOOD_VERSION).tar.bz2
 GST_PLUGINS_GOOD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-good
 
@@ -72,6 +72,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-audiofx
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-audioparsers
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-audioparsers
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_AUPARSE),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-auparse
 else
@@ -168,6 +174,12 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-interleave
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_ISOMP4),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-isomp4
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-isomp4
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_LAW),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-law
 else
@@ -204,12 +216,6 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-multipart
 endif
 
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_QTDEMUX),y)
-GST_PLUGINS_GOOD_CONF_OPT += --enable-qtdemux
-else
-GST_PLUGINS_GOOD_CONF_OPT += --disable-qtdemux
-endif
-
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_REPLAYGAIN),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-replaygain
 else
