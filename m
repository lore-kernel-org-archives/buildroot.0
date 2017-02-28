From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 20:59:45 +0100
Subject: [Buildroot] [git commit] mpv: disable with ARC external toolchain
Message-ID: <20170228200410.AEF0B7FAC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a8b1eac87ede3cee48669efe95cb27df8f673a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package fails when building with ARC external toolchain

Marking this with special comment "# ARC toolchain issue" as the package
is to be enabled as soon as the issue with the ARC toolchain is
resolved.

Fixes:
  http://autobuild.buildroot.net/results/fb6/fb677a917545adee321bdcd2c2519c81326448c4//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 2719981..6e115ae 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_MPV
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	# ARC toolchain issue
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
@@ -21,3 +23,4 @@ comment "mpv needs a toolchain w/ threads, gcc >= 4.5"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
+	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
