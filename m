From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 11:43:26 +0200
Subject: [Buildroot] [git commit] mplayer: introduce a
	BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS option
Message-ID: <20150405094334.5B8048193A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2a8a14b97b15f52161dd52e8e101452cb852a47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to allow other packages to easily select mplayer without
duplicating its complicated architecture dependencies, this commit
introduces a BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS blind option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 5140b9b..79ff3b1 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -1,10 +1,15 @@
-config BR2_PACKAGE_MPLAYER
-	bool "mplayer"
+config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
+	bool
+	default y
 	# Those architectures are not supported by MPlayer
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
+
+config BR2_PACKAGE_MPLAYER
+	bool "mplayer"
+	depends on BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	help
 	  MPlayer is a movie player which runs on many systems and supports
 	  many different file formats.
