From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Feb 2017 22:38:52 +0100
Subject: [Buildroot] [git commit] Revert "cmake: adjust dependencies added
	for libuv"
Message-ID: <20170226214212.AACD07FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3f0ba82c5cb7ecdd6766c454001bf3daca6f30c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cmake 3.7 causes serious regressions in some cmake-based packages,
related to how RPATH is handled.

This reverts commit b754237520a4795eadc0edec768b267dd598ab0e.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cmake/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 2706db5..716d80e 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_CMAKE_CTEST
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libuv
 	depends on BR2_USE_MMU # libuv
 	help
 	  CTest is a testing tool distributed as a part of CMake. It
@@ -37,9 +37,9 @@ config BR2_PACKAGE_CMAKE_CTEST
 
 	  http://www.cmake.org/
 
-comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, NPTL"
+comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, threads"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS
