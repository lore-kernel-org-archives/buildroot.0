From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  5 Jan 2017 23:09:31 +0200
Subject: [Buildroot] [PATCH] mpd: needs toolchain with C++14 support
Message-ID: <891220d41f6022b8b875ac0d84bcccd9a8fe5b96.1483650571.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/3fe/3fe440c0b9d05acb44553a8f02f688570e06bca9/
http://autobuild.buildroot.net/results/9b9/9b9659ba30afde49912276fe7f9c282953a352ab/
http://autobuild.buildroot.net/results/208/208bb987f52b8ba65e3c6fc9b6e917dbd44c0fbd/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/mpd/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 82bbd8d21fea..e0bb60447c10 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -4,7 +4,7 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_USE_WCHAR # libglib2, flac
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBGLIB2
@@ -315,8 +315,8 @@ config BR2_PACKAGE_MPD_UPNP
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.6"
+comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-- 
2.11.0
