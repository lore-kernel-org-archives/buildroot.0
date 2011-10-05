From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 22:02:16 +0200
Subject: [Buildroot] [git commit] Add lame support in gstreamer
Message-ID: <20111005202141.531D98E226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63b7450072c72a1b2f4af6c893e70dd9658e9fb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-ugly/Config.in      |    4 ++++
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index 94e2b9d..c0046e4 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -38,6 +38,10 @@ config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_SYNAESTHESIA
 
 comment "plugins with external dependencies (there may be more available)"
 
+config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_LAME
+	bool "lame (*.mp3 audio encoder)"
+	select BR2_PACKAGE_LAME
+
 config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD
 	bool "mad (*.mp3 audio)"
 	select BR2_PACKAGE_LIBID3TAG
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index 5237bc9..e46b515 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -60,6 +60,13 @@ else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-synaesthesia
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_LAME),y)
+GST_PLUGINS_UGLY_CONF_OPT += --enable-lame
+GST_PLUGINS_UGLY_DEPENDENCIES += lame
+else
+GST_PLUGINS_UGLY_CONF_OPT += --disable-lame
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD),y)
 GST_PLUGINS_UGLY_CONF_OPT += --enable-mad
 GST_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
