From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 May 2014 23:32:04 +0200
Subject: [Buildroot] [git commit] mplayer: not supported on ARC
Message-ID: <20140518213731.73E139CC4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a4fa3fccaecb5d5c524453fcb8e6ad2edcbfef7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/af1/af1ca869dbc7a71aa4cc89373d605ca8f790fcc9/

[Peter: also adjust largefile comment dependency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 8b5d05e..f0dc9a5 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
-	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_arc || BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
@@ -29,6 +29,6 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 endif
 
 comment "mplayer needs a toolchain w/ largefile"
-	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_arc || BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	depends on !BR2_LARGEFILE
