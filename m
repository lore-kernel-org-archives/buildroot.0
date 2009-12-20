From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Dec 2009 19:47:57 +0100
Subject: [Buildroot] [git commit master] Fix gst-plugins-bad dependency on
	libdvdnav
Message-ID: <20091220184829.E4E3E777E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4914383ebd7145428a8fda346f2c9831c939c353
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 180facf..3d2480a 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -56,6 +56,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
 	bool "dtmf"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV
+	bool "dvdnav"
+        select BR2_PACKAGE_LIBDVDNAV
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
 	bool "dvdspu"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 9b65198..b651247 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -101,6 +101,13 @@ else
 GST_PLUGINS_BAD_CONF_OPT += --disable-dtmf
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV),y)
+GST_PLUGINS_BAD_CONF_OPT += --enable-dvdnav
+GST_PLUGINS_BAD_DEPENDENCIES += libdvdnav
+else
+GST_PLUGINS_BAD_CONF_OPT += --disable-dvdnav
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU),y)
 GST_PLUGINS_BAD_CONF_OPT += --enable-dvdspu
 else
-- 
1.6.3.3
