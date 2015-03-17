From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Mar 2015 11:14:39 +0200
Subject: [Buildroot] [PATCH] cmake/ctest: disable for xtensa
Message-ID: <72c37ea53cc585074aac8fc68a6a817048224597.1426583679.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cmake is missing endianness configuration for xtensa.

Fixes:
http://autobuild.buildroot.net/results/bdf/bdfce8f6aa238ed59331f051cdaff1f60e273c3e/
http://autobuild.buildroot.net/results/de9/de9021fdc63600536ffa91e4b8718584e3e5702c/
http://autobuild.buildroot.net/results/0f1/0f1afc62e91ab798fa65685af3dea3caac663f11/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/cmake/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 0b5bba975403..f39f79467dd0 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	select BR2_PACKAGE_XZ
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_xtensa
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
 	  can be used to automate updating (using CVS for example),
@@ -22,4 +23,5 @@ config BR2_PACKAGE_CMAKE_CTEST
 	  http://www.cmake.org/
 
 comment "ctest needs a toolchain w/ C++, wchar"
+	depends on !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-- 
2.1.4
