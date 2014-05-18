From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 May 2014 19:16:54 +0200
Subject: [Buildroot] [PATCH] mplayer: not supported on ARC
Message-ID: <1400433414-23716-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/af1/af1ca869dbc7a71aa4cc89373d605ca8f790fcc9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mplayer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 8b5d05e..7c4877d 100644
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
-- 
1.9.3
