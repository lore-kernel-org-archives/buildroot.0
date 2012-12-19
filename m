From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Dec 2012 00:27:07 +0100
Subject: [Buildroot] [PATCH] mplayer: prevent selection on Microblaze and
	AArch64
Message-ID: <1355959627-13525-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MPlayer wants to have some "support" for each architecture, and for
now, it doesn't know about Microblaze and AArch64, so prevent the
selection of MPlayer on those architectures.

For Microblaze, fixes:

  http://autobuild.buildroot.org/results/4e6e0d15694345ded649c92251cc2173dc45fe7c/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
For AArch64, there was also a build failure raised by the autobuilders
some days ago, but I can't find it anymore.
---
 package/multimedia/mplayer/Config.in |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/mplayer/Config.in b/package/multimedia/mplayer/Config.in
index c64dab7..e285644 100644
--- a/package/multimedia/mplayer/Config.in
+++ b/package/multimedia/mplayer/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
-	# "Error: unsupported architecture sh4a" says mplayer
-	# configure script.
-	depends on !BR2_sh4a && !BR2_sh4aeb
+	# Those architectures are not supported by MPlayer
+	depends on !BR2_sh4a && !BR2_sh4aeb && !BR2_microblaze && !BR2_aarch64
 	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
-- 
1.7.9.5
