From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 22:22:09 +0100
Subject: [Buildroot] [git commit] mplayer: not available on nios2
Message-ID: <20131128213428.7038F9BE37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9402eef6e24b51da750f0852e16cd92ffc65f2a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/0ae/0ae3a53a1a6e870ee1bf2a902a400893339777df/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 3a1b428..c8f1480 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
 	depends on !(BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-			|| BR2_microblaze || BR2_aarch64)
+			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t \
 		|| BR2_arm920t || BR2_arm922t || BR2_fa526 || BR2_strongarm)
