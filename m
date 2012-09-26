From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Sep 2012 09:13:32 +0200
Subject: [Buildroot] [git commit] mplayer: 1.1 version needs largefile
	support
Message-ID: <20120926071505.4B0D399721@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b255b06498e1646a392cc58f7589b043104955c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/7d084a1a8fd484f2c6df82ccd7b9d8aeebe68c2d

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mplayer/Config.in b/package/multimedia/mplayer/Config.in
index 77bf9dc..c64dab7 100644
--- a/package/multimedia/mplayer/Config.in
+++ b/package/multimedia/mplayer/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MPLAYER
 	# "Error: unsupported architecture sh4a" says mplayer
 	# configure script.
 	depends on !BR2_sh4a && !BR2_sh4aeb
+	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
 	  many different file formats.
@@ -23,3 +24,6 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 	  This will install the video encoder.
 
 endif
+
+comment "mplayer requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
