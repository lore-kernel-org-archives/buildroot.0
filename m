From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 19 Feb 2014 10:53:22 +0100
Subject: [Buildroot] [PATCH 3/3] mplayer: add missing reverse dependencies
	for bfin and sh2a
In-Reply-To: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
References: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1392803602-5566-4-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Propagate to comment and libplayer unsupported platforms bfin and sh2a.

Fixes:
http://autobuild.buildroot.net/results/5d8/5d80ade791319b6a66ac1c342f7b1d25c023f0af/

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libplayer/Config.in | 4 ++--
 package/mplayer/Config.in   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 84dad1d..c8271a1 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -13,8 +13,8 @@ if BR2_PACKAGE_LIBPLAYER
 config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
 	# mplayer
-	depends on !(BR2_bfin || BR2_sh4a || BR2_sh4aeb || BR2_microblaze || \
-		   BR2_aarch64)
+	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb || \
+		   BR2_microblaze || BR2_aarch64 || BR2_nios)
 	# mplayer
 	depends on BR2_LARGEFILE
 	# mplayer
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index cfe824d..bacd744 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -30,5 +30,5 @@ endif
 
 comment "mplayer needs a toolchain w/ largefile"
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-			|| BR2_microblaze || BR2_aarch64)
+			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	depends on !BR2_LARGEFILE
-- 
1.8.5.2
