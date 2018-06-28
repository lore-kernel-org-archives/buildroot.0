From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu, 28 Jun 2018 13:56:58 +0300
Subject: [Buildroot] [PATCH 1/3] mpd: enable for ARC external toolchain
In-Reply-To: <20180628105700.29015-1-didin@synopsys.com>
References: <20180628105700.29015-1-didin@synopsys.com>
Message-ID: <20180628105700.29015-2-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the latest prebuilt ARC toolchain this package is building
without any errors.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
---
 package/mpd/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 857f212477..1d50c7bf44 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -7,8 +7,6 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
-	# ARC toolchain issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -338,7 +336,6 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 
 comment "mpd needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.17.1
