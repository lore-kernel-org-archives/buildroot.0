From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 13 Aug 2015 01:20:03 +0300
Subject: [Buildroot] [PATCH 4/4] Revert "opencv: mark as not available on
	Xtensa"
In-Reply-To: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
References: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1439418003-23805-5-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that xtensa toolchain is able to compile huge functions this
workaround is no longer needed.

This reverts commit d21932508e69d4ab849cba9958f953ae9342cb8c.
---
 package/opencv/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index a52092d..0b5d1ac 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -5,8 +5,6 @@ menuconfig BR2_PACKAGE_OPENCV
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # include dlfcn.h
-	# Causes some toolchain failures on Xtensa
-	depends on !BR2_xtensa
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
@@ -336,7 +334,6 @@ config BR2_PACKAGE_OPENCV_INSTALL_DATA
 endif # BR2_PACKAGE_OPENCV
 
 comment "opencv needs a toolchain w/ C++, NPTL, wchar, dynamic library"
-	depends on !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-- 
1.8.1.4
