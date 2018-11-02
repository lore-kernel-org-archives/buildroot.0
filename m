From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Nov 2018 14:35:21 +0100
Subject: [Buildroot] [PATCH 1/1] libv4l: needs kernel headers >= 3.18
Message-ID: <20181102133521.2297-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 1.16.1 added a dependency to bpf headers:
https://git.linuxtv.org/v4l-utils.git/commit/?id=d6025b0e8c7f57b0f9390f987acc5eed57360d80

BPF headers are available since kernel 3.18:
https://github.com/torvalds/linux/commit/c15952dc18d8a293d976ac6c06d44d9d98023b45

Fixes:
 - http://autobuild.buildroot.org/results/d22c0939eed4bc949f7eaeae7595d01ec45cc2cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libv4l/Config.in   | 2 +-
 package/v4l2grab/Config.in | 2 +-
 package/zbar/Config.in     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 57ddde1dfb..84844349a4 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBV4L
 	bool "libv4l"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # bpf headers
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
diff --git a/package/v4l2grab/Config.in b/package/v4l2grab/Config.in
index ec3a7a8c54..e25b1618e8 100644
--- a/package/v4l2grab/Config.in
+++ b/package/v4l2grab/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_V4L2GRAB
 	depends on BR2_USE_MMU # libv4l
 	depends on !BR2_STATIC_LIBS # libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # libv4l
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # libv4l
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBV4L
 	help
diff --git a/package/zbar/Config.in b/package/zbar/Config.in
index 05c9b769ce..1d8f1be7cf 100644
--- a/package/zbar/Config.in
+++ b/package/zbar/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_ZBAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libv4l
 	depends on BR2_USE_MMU # libv4l
 	depends on BR2_INSTALL_LIBSTDCPP # libv4l
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libv4l
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # libv4l
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBV4L
 	help
-- 
2.17.1
