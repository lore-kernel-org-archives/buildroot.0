From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 21:25:43 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/gst-plugins-bad:
 allow static build of zbar plugin
Message-ID: <20190319202709.BBA3F81E4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46c5ef2f17e0e0f7402b3d32f858aa9154e4ce15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

zbar can be built statically since commit
fc4a6abfa6bbffeabefb9967dbf378c410fb6318 so remove the dynamic library
dependency from BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ec9b3aec53f55fd1aca99c42f737afafdf912a7f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer/gst-plugins-bad/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer/gst-plugins-bad/Config.in b/package/gstreamer/gst-plugins-bad/Config.in
index f45981f6c8..fe8457f6d2 100644
--- a/package/gstreamer/gst-plugins-bad/Config.in
+++ b/package/gstreamer/gst-plugins-bad/Config.in
@@ -324,14 +324,13 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_ZBAR
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
