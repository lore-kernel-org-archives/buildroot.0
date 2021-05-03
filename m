From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 May 2021 13:13:49 +0200
Subject: [Buildroot] [PATCH 8/9] package/postgis: remove libgeos binutils
 bug 21464 inheritance
In-Reply-To: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210503111350.2933319-9-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/postgis/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/postgis/Config.in b/package/postgis/Config.in
index 49887b61c0..553c89d9dd 100644
--- a/package/postgis/Config.in
+++ b/package/postgis/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_POSTGIS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
 	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
 	depends on BR2_USE_WCHAR # libgeos, proj
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
 	select BR2_PACKAGE_LIBGEOS
 	select BR2_PACKAGE_PROJ
@@ -20,9 +19,8 @@ config BR2_PACKAGE_POSTGIS
 
 	  https://postgis.net/
 
-comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
+comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 27597"
 	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
 		!BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-- 
2.25.1
