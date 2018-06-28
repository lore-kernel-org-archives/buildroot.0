From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 28 Jun 2018 22:00:53 +0200
Subject: [Buildroot] [git commit] mpv: enable for ARC external toolchain
Message-ID: <20180628195835.8435F83620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2b5b6b59bd4136cda66eb4e3ae6ea1df3ea6ced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the latest prebuilt ARC toolchain this package is building
without any errors.

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpv/Config.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index ce6f367d72..69810038f1 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_MPV
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
-	# ARC toolchain issue
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
@@ -29,4 +27,3 @@ comment "mpv needs a toolchain w/ threads, gcc >= 4.5"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
