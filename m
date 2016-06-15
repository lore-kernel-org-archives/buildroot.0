From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 22:22:48 +0200
Subject: [Buildroot] [git commit] mplayer: not available on m68k
Message-ID: <20160615202253.1AE597FB96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2674db8a217c7d7cf1dc01291ec42cdf52e21110
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/e48/e48db9dc487547f4d6f6102b4bd2512e0281018a/
http://autobuild.buildroot.org/results/cfc/cfc6ad13c7b4fb080ee89ba4acb420ebb38373ea/

From the log:
The architecture of your CPU (m68k) is not supported by this configure script
It seems nobody has ported MPlayer to your OS or CPU type yet.

Error: unsupported architecture m68k

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 686b3b0..97b1f38 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	default y
 	# Those architectures are not supported by MPlayer
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-		|| BR2_microblaze || BR2_nios2)
+		|| BR2_m68k || BR2_microblaze || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
 
