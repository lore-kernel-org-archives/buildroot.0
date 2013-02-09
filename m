From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Feb 2013 19:47:35 +0100
Subject: [Buildroot] [git commit] mplayer: not supported on sh2/sh2a
Message-ID: <20130209184752.AD22B9AA5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ee0c793653ebd03acf90eea2913328a0bd8d0ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mplayer configure script says that sh2a is not supported.

Fixes:
http://autobuild.buildroot.org/results/0e530fd99c4b37782208ee0549be500220643999/

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mplayer/Config.in b/package/multimedia/mplayer/Config.in
index e285644..e36fc46 100644
--- a/package/multimedia/mplayer/Config.in
+++ b/package/multimedia/mplayer/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
-	depends on !BR2_sh4a && !BR2_sh4aeb && !BR2_microblaze && !BR2_aarch64
+	depends on !(BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+			|| BR2_microblaze || BR2_aarch64)
 	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
