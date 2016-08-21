From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 22 Aug 2016 00:18:49 +0200
Subject: [Buildroot] [PATCH] vlc: depends on NPTL
Message-ID: <20160821221849.GA8404@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

VLC requires NPTL.

Required functions and symbols (_POSIX_CLOCK_SELECTION) are only
available for NPTL.

Fixes:
  http://autobuild.buildroot.net/results/3122287ddea1e316a64ccf0d0dc9415bfefebb49/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/vlc/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 166e7d2..6870f0f 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_VLC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_VLC_OPENCV_BACKEND if BR2_PACKAGE_OPENCV
@@ -32,7 +32,7 @@ config BR2_PACKAGE_VLC_OPENCV3_BACKEND
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 
-comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, headers >= 3.7"
+comment "vlc needs a toolchain w/ C++, dynamic library, wchar, NPTL, headers >= 3.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-- 
2.1.4
