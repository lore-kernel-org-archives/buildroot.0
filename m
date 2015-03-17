From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 17 Mar 2015 10:08:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/cmake: not available on static-only
	build
In-Reply-To: <1426583299-21207-1-git-send-email-s.martin49@gmail.com>
References: <1426583299-21207-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1426583299-21207-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/9f7/9f7c8d5078cd1f3cd493f9ae8e95c8ee728f98fd/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/cmake/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index eee2461..3165572 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	depends on !BR2_xtensa
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
@@ -27,5 +28,5 @@ config BR2_PACKAGE_CMAKE_CTEST
 
 	  http://www.cmake.org/
 
-comment "ctest needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "ctest needs a toolchain w/ C++, wchar, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS
-- 
2.1.0
