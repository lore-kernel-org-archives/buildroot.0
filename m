From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 May 2013 12:47:54 +0200
Subject: [Buildroot] [git commit] gstreamer: needs threads support in
	toolchain
Message-ID: <20130503104822.3400499A4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97387cda09e234c6584f7edfd9ae4c504a0304b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Indirectly fixes http://autobuild.buildroot.net/results/453ac64daf384702512ac68f1779f375e337332d/build-end.log

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/gstreamer/Config.in |    5 +++--
 package/opencv/Config.in               |    1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
index 9a67481..4b4d80f 100644
--- a/package/multimedia/gstreamer/Config.in
+++ b/package/multimedia/gstreamer/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer"
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework.
@@ -24,5 +25,5 @@ config BR2_PACKAGE_GSTREAMER_PLUGIN_REGISTRY
 	  Enable support for the GStreamer plugin registry. This may increase
 	  the launch-time for a GStreamer application.
 
-comment "gstreamer requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "gstreamer requires a toolchain with WCHAR and threads support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 3e9ead6..55b86a0 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -140,6 +140,7 @@ comment "ffmpeg support requires a toolchain with LARGEFILE and IPV6 support"
 config BR2_PACKAGE_OPENCV_WITH_GSTREAMER
 	bool "gstreamer support"
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_GSTREAMER
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP
