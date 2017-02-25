From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Feb 2017 19:51:31 +0100
Subject: [Buildroot] [PATCH 2/4] Revert "cmake: adjust dependencies added
	for libuv"
In-Reply-To: <cover.1488048682.git.yann.morin.1998@free.fr>
References: <cover.1488048682.git.yann.morin.1998@free.fr>
Message-ID: <3984391a000ba9c6aae8d4672a099497d77c6b4f.1488048682.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cmake 3.7 causes serious regressions in some cmake-based packages,
related to how RPATH is handled.

This reverts commit b754237520a4795eadc0edec768b267dd598ab0e.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Cc: Baruch Siach <baruch@tkos.co.il>
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
-- 
2.7.4
