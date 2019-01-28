From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 09:58:59 +0100
Subject: [Buildroot] [git commit] zbar: needs kernel headers >= 3.17
Message-ID: <20190128090221.48CBE7FB8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd08ca7aa98209222a077d1db97323bbc3b563b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

v4l2_query_ext_ctrl has been added in kernel 3.17:
https://github.com/torvalds/linux/commit/5082c2417841e64df975789011e182ce99a9dacd

Fixes:
 - http://autobuild.buildroot.org/results/d7b244cf9488eafb59ba8575f17884f4f8512db1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-bad/Config.in | 6 +++---
 package/zbar/Config.in                      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 7bbd56a602..f45981f6c8 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -326,12 +326,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
 	depends on BR2_USE_MMU # zbar-> libv4l
 	depends on !BR2_STATIC_LIBS # zbar-> libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # zbar-> libv4l
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # zbar-> libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # zbar
 	select BR2_PACKAGE_ZBAR
 
-comment "zbar plugin needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.0"
+comment "zbar plugin needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.17"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 endif
diff --git a/package/zbar/Config.in b/package/zbar/Config.in
index 0f4d115745..e850c1f02b 100644
--- a/package/zbar/Config.in
+++ b/package/zbar/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_ZBAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
 	depends on BR2_USE_MMU # libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # libv4l
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # v4l2_query_ext_ctrl
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBV4L
 	help
@@ -11,7 +11,7 @@ config BR2_PACKAGE_ZBAR
 
 	  https://git.linuxtv.org/zbar.git/about/
 
-comment "zbar needs a toolchain w/ threads, C++ and headers >= 3.0"
+comment "zbar needs a toolchain w/ threads, C++ and headers >= 3.17"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
