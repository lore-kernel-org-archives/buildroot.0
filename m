From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Jan 2017 12:21:17 +0100
Subject: [Buildroot] [git commit] mpd: needs toolchain with C++14 support
Message-ID: <20170106112237.2D0618057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b03ba26de3d7e1003009033e3ca5d1351b08b837
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3fe/3fe440c0b9d05acb44553a8f02f688570e06bca9/
http://autobuild.buildroot.net/results/9b9/9b9659ba30afde49912276fe7f9c282953a352ab/
http://autobuild.buildroot.net/results/208/208bb987f52b8ba65e3c6fc9b6e917dbd44c0fbd/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 82bbd8d..e0bb604 100644
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
