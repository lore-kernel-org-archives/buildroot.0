From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 23:43:28 +0100
Subject: [Buildroot] [git commit] mplayer: not supported on or1k
Message-ID: <20170227203649.C64387FC1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=076095a860ba24a4bc8302e5bfa5c753c00d228a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MPlayer doesn't support OpenRISC:

The architecture of your CPU (or1k) is not supported by this configure script
It seems nobody has ported MPlayer to your OS or CPU type yet.

so disable it on this architecture.

Fixes:

  http://autobuild.buildroot.net/results/47207dfd10ff6e5ec4ccdcf8454aaf5f408ad1e3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 8474b0e..a10ad26 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	default y
 	# Those architectures are not supported by MPlayer
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-		|| BR2_m68k || BR2_microblaze || BR2_nios2)
+		|| BR2_m68k || BR2_microblaze || BR2_nios2 || BR2_or1k)
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
 	# configure script barfs on the -Wl,-elf2flt we add in the toolchain
