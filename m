From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  5 Mar 2019 23:28:07 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst-plugins-bad: allow static build
 of zbar plugin
Message-ID: <20190305222807.18393-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zbar can be built statically since commit
fc4a6abfa6bbffeabefb9967dbf378c410fb6318 so remove the dynamic library
dependency from BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer/gst-plugins-bad/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index 971668b710..411e4b6174 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -320,14 +320,13 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
 	bool "zbar"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zbar-> libv4l
 	depends on BR2_USE_MMU # zbar-> libv4l
-	depends on !BR2_STATIC_LIBS # zbar-> libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # zbar-> libv4l
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # zbar
 	select BR2_PACKAGE_ZBAR
 
-comment "zbar plugin needs a toolchain w/ threads, dynamic library, C++ and headers >= 3.17"
+comment "zbar plugin needs a toolchain w/ threads, C++ and headers >= 3.17"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 endif
-- 
2.14.1
