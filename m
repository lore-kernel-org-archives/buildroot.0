From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 17:27:27 +0100
Subject: [Buildroot] [git commit] Revert "opencv: mark as not available on
	Xtensa"
Message-ID: <20151004162733.4750181D79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac43503bf7a6c9866eb0bde361cf7a2ff0ce4bdd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that xtensa toolchain is able to compile huge functions this
workaround is no longer needed.

This reverts commit d21932508e69d4ab849cba9958f953ae9342cb8c.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv3/Config.in |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 137a351..934d546 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -5,8 +5,6 @@ menuconfig BR2_PACKAGE_OPENCV3
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # include dlfcn.h
-	# Causes some toolchain failures on Xtensa
-	depends on !BR2_xtensa
 	depends on !BR2_PACKAGE_OPENCV
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
@@ -337,7 +335,6 @@ config BR2_PACKAGE_OPENCV3_INSTALL_DATA
 endif # BR2_PACKAGE_OPENCV3
 
 comment "opencv3 needs a toolchain w/ C++, NPTL, wchar, dynamic library"
-	depends on !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
