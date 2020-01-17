From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 17 Jan 2020 12:02:32 +0100
Subject: [Buildroot] [PATCH v2 6/6] package/gqrx: suppress dependency to not
 BR2_PACKAGE_PYTHON3
In-Reply-To: <20200117110232.31336-1-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
Message-ID: <20200117110232.31336-6-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Since Gnuradio 3.8 support python3 dependency to only python2 is no more
mandatory

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gqrx/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index 990d594c6a..d873c6a4d4 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -1,6 +1,5 @@
 comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_USE_MMU # gnuradio
-	depends on !BR2_PACKAGE_PYTHON3 # gnuradio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || !BR2_STATIC_LIBS
@@ -20,7 +19,6 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
-	depends on !BR2_PACKAGE_PYTHON3
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
-- 
2.24.1
