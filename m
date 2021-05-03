From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 May 2021 13:13:48 +0200
Subject: [Buildroot] [PATCH 7/9] package/libgeos: remove binutils bug 21464
 dependency
In-Reply-To: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210503111350.2933319-8-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libgeos/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
index ebe40bd1ff..b659c98460 100644
--- a/package/libgeos/Config.in
+++ b/package/libgeos/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBGEOS
 	bool "libgeos"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	help
 	  GEOS (Geometry Engine - Open Source) is a C++ port of the
@@ -13,7 +12,6 @@ config BR2_PACKAGE_LIBGEOS
 
 	  https://trac.osgeo.org/geos
 
-comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
+comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 27597"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		   !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.25.1
