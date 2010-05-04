From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 4 May 2010 23:11:20 +0200
Subject: [Buildroot] [git commit master] mplayer: disable parallel builds
	(make -jX)
Message-ID: <20100504211440.530E48D361@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=32ed97007509228e0b4aa1050dd1d017118d0d7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build system races with itself when building the internal vidix stuff
(x86 only), so use MAKE1.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/mplayer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 50afcfb..6e03cff 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -71,7 +71,7 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 	touch $@
 
 $(MPLAYER_DIR)/$(MPLAYER_BINARY): $(MPLAYER_DIR)/.configured
-	$(MAKE) -C $(MPLAYER_DIR)
+	$(MAKE1) -C $(MPLAYER_DIR)
 	touch -c $@
 
 $(TARGET_DIR)/$(MPLAYER_TARGET_BINARY): $(MPLAYER_DIR)/$(MPLAYER_BINARY)
-- 
1.6.3.3
