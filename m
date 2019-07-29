From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Jul 2019 14:33:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: needs gcc >= 6
Message-ID: <20190729123315.6910-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mpd needs gcc >= 6 since version 0.21 and
https://github.com/MusicPlayerDaemon/MPD/commit/a72d1200fba613d542aa806cbd6c536c0e5061db

Fixes:
 - http://autobuild.buildroot.org/results/dc4/dc49aaae29c61a8edd82e5fbd93db962e1126465

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 9d19248c82..84698b1702 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -5,7 +5,7 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -355,11 +355,11 @@ config BR2_PACKAGE_MPD_UPNP
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
+comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 6"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 comment "mpd needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.20.1
