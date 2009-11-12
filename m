From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 12 Nov 2009 23:33:14 +0100
Subject: [Buildroot] [PATCH 2/6] Fix gst-plugins-bad dependency on libcdaudio
In-Reply-To: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
References: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258065198-22972-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 8601cf4..6aebefd 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -33,6 +33,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER
 	bool "bayer"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO
+	bool "cdaudio"
+	select BR2_PACKAGE_LIBCDAUDIO
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE
 	bool "cdxaparse"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index c6c5fd0..282445e 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -63,6 +63,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-cdxaparse
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-cdaudio
+GST_PLUGINS_BAD_DEPENDENCIES += libcdaudio
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-cdaudio
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DCCP),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dccp
 else
-- 
1.6.5.2
