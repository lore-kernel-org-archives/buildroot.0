From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 19 Feb 2014 10:53:21 +0100
Subject: [Buildroot] [PATCH 2/3] mplayer: remove sh2 support
In-Reply-To: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
References: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1392803602-5566-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove a leftover of the commit commit e543f5a10488b020bb4ccb03e6de0e455c64841a
(arch: remove sh2, sh3 and sh3eb support).

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/mplayer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index f2b3620..cfe824d 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -29,6 +29,6 @@ config BR2_PACKAGE_MPLAYER_MENCODER
 endif
 
 comment "mplayer needs a toolchain w/ largefile"
-	depends on !(BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
+	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64)
 	depends on !BR2_LARGEFILE
-- 
1.8.5.2
