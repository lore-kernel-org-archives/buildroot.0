From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Fri, 12 Feb 2010 23:47:37 +0100
Subject: [Buildroot] [PATCH] gstreamer-good: add speex dependancy
Message-ID: <1266014857-16015-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Otherwise, even if speex is selected, as gstreamer is compiled first,
speex plugin is not activated/built.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/multimedia/gst-plugins-good/Config.in      |    4 ++++
 .../gst-plugins-good/gst-plugins-good.mk           |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
index fdb6646..a326dc9 100644
--- a/package/multimedia/gst-plugins-good/Config.in
+++ b/package/multimedia/gst-plugins-good/Config.in
@@ -172,4 +172,8 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SOUPHTTPSRC
 	bool "souphttpsrc (http client)"
 	select BR2_PACKAGE_LIBSOUP
 
+config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX
+	bool "speex"
+	select BR2_PACKAGE_SPEEX
+
 endif
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 7b6f02b..19a53e6 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -318,4 +318,11 @@ else
 GST_PLUGINS_GOOD_CONF_OPT += --disable-soup
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPEEX),y)
+GST_PLUGINS_GOOD_CONF_OPT += --enable-speex
+GST_PLUGINS_GOOD_DEPENDENCIES += speex
+else
+GST_PLUGINS_GOOD_CONF_OPT += --disable-speex
+endif
+
 $(eval $(call AUTOTARGETS,package/multimedia,gst-plugins-good))
-- 
1.6.0.4
