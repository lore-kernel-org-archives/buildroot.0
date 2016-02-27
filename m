From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Feb 2016 16:23:41 +0100
Subject: [Buildroot] [git commit] package/qhull: add dependency on gcc >= 4.4
Message-ID: <20160227152355.32C4B7FBC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d70e1e9deeeac6bbfd9e1fede2e95265a6a0aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A variadic template template parameters [1] is used in QhullSet.h, this require
a toolchain with (at least) gcc 4.4 [2][3].

Fixes (bfin toolchain with gcc 4.3):
http://autobuild.buildroot.net/results/32f/32f324c7920ac46d393954de13b8a98a77a0c392

[1] http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2008/n2555.pdf
[2] https://gcc.gnu.org/gcc-4.3/cxx0x_status.html
[3] https://gcc.gnu.org/gcc-4.4/cxx0x_status.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qhull/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qhull/Config.in b/package/qhull/Config.in
index 2bc8ff6..0a4b60f 100644
--- a/package/qhull/Config.in
+++ b/package/qhull/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_QHULL
 	bool "qhull"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_4 # needs gcc >= 4.4
 	help
 	  Qhull computes the convex hull, Delaunay triangulation,
 	  Voronoi diagram, halfspace intersection about a point,
@@ -14,5 +15,5 @@ config BR2_PACKAGE_QHULL
 
 	  http://www.qhull.org
 
-comment "qhull needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "qhull needs a toolchain w/ C++, dynamic library, gcc >= 4.4"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
