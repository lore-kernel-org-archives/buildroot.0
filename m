From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 13:02:49 +0100
Subject: [Buildroot] [git commit] package/cmake: not available on
	static-only build
Message-ID: <20150317120306.E345280140@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2ad6e36a981fc784fd0e8f6cdf5b9047f79c8e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/9f7/9f7c8d5078cd1f3cd493f9ae8e95c8ee728f98fd/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index e06d4b7..dbc7d01 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -22,6 +22,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
@@ -31,6 +32,6 @@ config BR2_PACKAGE_CMAKE_CTEST
 
 	  http://www.cmake.org/
 
-comment "ctest needs a toolchain w/ C++, wchar"
+comment "ctest needs a toolchain w/ C++, wchar, dynamic library"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS
