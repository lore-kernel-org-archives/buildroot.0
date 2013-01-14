From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 14:18:54 +0100
Subject: [Buildroot] [git commit] gst-plugins-bad: add faad option
Message-ID: <20130114132041.5DC8D82B33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3ffea31036676a3d409d3cc470fa8dfc380f8fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Bogdan Radulescu <bogdan_radulescu99@yahoo.com>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 2a386f2..8cbe021 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -270,6 +270,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV
 	bool "fbdev"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD
+	bool "faad"
+	select BR2_PACKAGE_FAAD2
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
 	bool "libmms"
 	select BR2_PACKAGE_LIBMMS
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 714c987..183de7b 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -508,6 +508,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dvb
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-faad
+GST_PLUGINS_BAD_DEPENDENCIES += faad2
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-faad
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-fbdev
 else
