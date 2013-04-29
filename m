From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 15:16:00 +0200
Subject: [Buildroot] [git commit] directfb: 1.6.x needs C++ support in
	toolchain
Message-ID: <20130429131603.6F9D29B8D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de33240fe61ac9e779d7eb5cf8e4eba12483f3ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/b36f5492401a8bba8ed04614decfbf4152464740/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in                   |    5 +++--
 package/multimedia/gst-plugins-bad/Config.in |    1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 23f4947..b9ff5f9 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
@@ -120,5 +121,5 @@ config BR2_PACKAGE_DIRECTFB_TESTS
 
 endif # BR2_PACKAGE_DIRECTFB
 
-comment "directfb needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "directfb needs a toolchain with C++ and thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 370259b..2271036 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -263,6 +263,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
 	select BR2_PACKAGE_DIRECTFB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
