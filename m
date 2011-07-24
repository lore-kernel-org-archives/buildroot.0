From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jul 2011 23:11:17 +0200
Subject: [Buildroot] [git commit] gst-plugins-ugly: fix dependencies for mad
	MP3 decoder plug-in
Message-ID: <20110724211848.43A078AE9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8d3b7283faceedf71797b4e53ac8dba0cda9b7e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mad plug-in depends on libid3tag. This dependency used to be
implicit by selecting the id3tag plug-in. Now that this plug-in
is not any longer part of gst-plugins-ugly we need an explicit
dependency on libid3tag.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-ugly/Config.in      |    2 +-
 .../gst-plugins-ugly/gst-plugins-ugly.mk           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gst-plugins-ugly/Config.in b/package/multimedia/gst-plugins-ugly/Config.in
index e20426f..94e2b9d 100644
--- a/package/multimedia/gst-plugins-ugly/Config.in
+++ b/package/multimedia/gst-plugins-ugly/Config.in
@@ -40,7 +40,7 @@ comment "plugins with external dependencies (there may be more available)"
 
 config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD
 	bool "mad (*.mp3 audio)"
-	select BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_ID3TAG
+	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
 
 config BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MPEG2DEC
diff --git a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
index da214a1..ab557a3 100644
--- a/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
+++ b/package/multimedia/gst-plugins-ugly/gst-plugins-ugly.mk
@@ -62,7 +62,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_UGLY_PLUGIN_MAD),y)
 GST_PLUGINS_UGLY_CONF_OPT += --enable-mad
-GST_PLUGINS_UGLY_DEPENDENCIES += libmad
+GST_PLUGINS_UGLY_DEPENDENCIES += libid3tag libmad
 else
 GST_PLUGINS_UGLY_CONF_OPT += --disable-mad
 endif
-- 
1.7.3.4
