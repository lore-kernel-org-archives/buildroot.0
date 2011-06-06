From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 Jun 2011 13:47:32 +0200
Subject: [Buildroot] [git commit] gst-plugins-bad: ensure cross sdl-config
	is used for sdl plugin
Message-ID: <20110606120009.002C785A48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d79d9a501dbdc20de0ca1a92994d4b63b3ec7249
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we end up linking against host libraries.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
index 357acf3..31d998f 100644
--- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
+++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
@@ -348,6 +348,7 @@ GST_PLUGINS_BAD_CONF_OPT += --disable-oss4
 endif
 
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL),y)
+GST_PLUGINS_BAD_CONF_ENV += ac_cv_path_SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config
 GST_PLUGINS_BAD_CONF_OPT += --enable-sdl
 GST_PLUGINS_BAD_DEPENDENCIES += sdl
 else
-- 
1.7.3.4
