From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Apr 2014 09:50:19 +0200
Subject: [Buildroot] [git commit] taglib: needs wchar
Message-ID: <20140408075118.4B5129C63E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03d516f5172e3f695c6a665a4ce86b34fd7b111c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/02a/02a6874aa21041ac9fef6fef51410c2ad92881c4/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in |    5 +++--
 package/taglib/Config.in                       |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 20983d6..818412c 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -324,12 +324,13 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SPEEX
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB
 	bool "taglib"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_TAGLIB
 	help
 	  Taglib tagging plugin library
 
-comment "taglib needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "taglib needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	bool "vpx (webm)"
diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index 8f832a6..209837f 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -2,6 +2,7 @@
 config BR2_PACKAGE_TAGLIB
 	bool "taglib"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	help
 	  TagLib is a library for reading and editing the meta-data of
 	  several popular audio formats. Currently it supports both ID3v1
@@ -20,5 +21,5 @@ config BR2_PACKAGE_TAGLIB_ASF
 
 endif
 
-comment "taglib needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "taglib needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
