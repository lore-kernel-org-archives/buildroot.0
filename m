From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Dec 2009 00:32:35 +0100
Subject: [Buildroot] [git commit master] Fix gst-plugins-bad dependency on
	libcdaudio
Message-ID: <20091210233611.BDA30777CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c198660d419f3fd5508b92ab87ab1b1f748f4502
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 66335a8..6c5e448 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -36,6 +36,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LEGACYRESAMPLE
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_BAYER
 	bool "bayer"
 
+config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO
+	bool "cdaudio"
+	select BR2_PACKAGE_LIBCDAUDIO
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDXAPARSE
 	bool "cdxaparse"
 
diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index bd5b633..ee7003c 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -69,6 +69,13 @@ else
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
1.6.3.3
