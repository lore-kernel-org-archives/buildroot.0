From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:43:33 +0100
Subject: [Buildroot] [git commit] package/gqrx: suppress dependency to not
 BR2_PACKAGE_PYTHON3
Message-ID: <20200203223240.091778910F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6082de3cf6d4fa3423161784e5db67b83b51189f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Gnuradio 3.8 support python3 dependency to only python2 is no more
mandatory

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
