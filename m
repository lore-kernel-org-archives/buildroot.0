From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 13:24:20 +0100
Subject: [Buildroot] [git commit] gst-plugins-bad: rsvg support needs C++
	(but no longer GTK+)
Message-ID: <20130101130011.48E679A585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02f2d52f59e69b212bbec40e82a7b6b256196b53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gst-plugins-bad/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index d87aec4..9dd2daa 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -288,9 +288,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_OPUS
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_RSVG
 	bool "rsvg"
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBRSVG
 
+comment "rsvg plugin requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
