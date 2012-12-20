From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Dec 2012 09:21:39 +0100
Subject: [Buildroot] [git commit] mplayer: prevent selection on Microblaze
	and AArch64
Message-ID: <20121220082223.6E0779A3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14bf3df3a649715246e13a9bf5f0902f09df84a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MPlayer wants to have some "support" for each architecture, and for
now, it doesn't know about Microblaze and AArch64, so prevent the
selection of MPlayer on those architectures.

For Microblaze, fixes:

  http://autobuild.buildroot.org/results/4e6e0d15694345ded649c92251cc2173dc45fe7c/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

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
