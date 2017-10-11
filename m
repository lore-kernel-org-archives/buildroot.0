From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Wed, 11 Oct 2017 15:16:17 +0300
Subject: [Buildroot] [PATCH] mpd: enable package for external ARC toolchain
Message-ID: <20171011121617.15179-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now using prebuilt arc-2017.09-rc1 toolchain it is possible to
build mpd package. The GCC patch solving the problem with pthread
support check now is the part of ARC toolchain.

Note this patch has a prerequisite that updates ARC prebuilt toolchain,
http://patchwork.ozlabs.org/patch/824311/

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
CC: Alexey Brodkin <abrodkin@synopsys.com>
CC: arc-buildroot at synopsys.com
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
 package/mpd/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 5991b6f4bb..b7b21672fc 100644
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
@@ -320,7 +318,6 @@ comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 
 comment "mpd needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.11.0
