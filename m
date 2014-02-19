From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 19 Feb 2014 10:53:20 +0100
Subject: [Buildroot] [PATCH 1/3] mplayer: not available on bfin
In-Reply-To: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
References: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1392803602-5566-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/109/109b7c9b575c7362c4982a908a1e3695e7590ebd/

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/libplayer/Config.in | 3 ++-
 package/mplayer/Config.in   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index 113f650..84dad1d 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -13,7 +13,8 @@ if BR2_PACKAGE_LIBPLAYER
 config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	bool "mplayer backend"
 	# mplayer
-	depends on !BR2_sh4a && !BR2_sh4aeb && !BR2_microblaze && !BR2_aarch64
+	depends on !(BR2_bfin || BR2_sh4a || BR2_sh4aeb || BR2_microblaze || \
+		   BR2_aarch64)
 	# mplayer
 	depends on BR2_LARGEFILE
 	# mplayer
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index ae273e4..f2b3620 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
 	# Those architectures are not supported by MPlayer
-	depends on !(BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t \
@@ -29,6 +29,6 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 endif
 
 comment "mplayer needs a toolchain w/ largefile"
-	depends on !(BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64)
 	depends on !BR2_LARGEFILE
-- 
1.8.5.2
