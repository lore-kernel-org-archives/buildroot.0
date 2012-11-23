From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Nov 2012 22:01:38 +0100
Subject: [Buildroot] [git commit] directfb: needs threads support
Message-ID: <20121123210237.B1AA08F50D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ade0a8a856e1009210538170cd72d92a07c06233
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/237aaf7b036a98867de1df47d39d01ec4137efd3

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/Config.in                   |    4 ++++
 package/multimedia/gst-plugins-bad/Config.in |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 47f9fea..a184568 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_ZLIB
 	help
@@ -107,3 +108,6 @@ config BR2_PACKAGE_DIRECTB_TESTS
 	bool "build directfb tests"
 
 endif # BR2_PACKAGE_DIRECTFB
+
+comment "directfb needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 7784ad7..d87aec4 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -262,6 +262,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
 	select BR2_PACKAGE_DIRECTFB
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
 	bool "dvb"
