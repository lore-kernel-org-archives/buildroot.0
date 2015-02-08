From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun,  8 Feb 2015 21:36:40 +0100
Subject: [Buildroot] [PATCH] prboom: remove uninstall command
Message-ID: <1423427800-11915-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Useless since the uninstall commands were removed in eb7bd9ef

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/prboom/prboom.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/prboom/prboom.mk b/package/prboom/prboom.mk
index 5612cc6..3d131cd 100644
--- a/package/prboom/prboom.mk
+++ b/package/prboom/prboom.mk
@@ -45,10 +45,4 @@ define PRBOOM_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/data/prboom.wad $(TARGET_DIR)/usr/share/games/doom/prboom.wad
 endef
 
-define PRBOOM_UINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/usr/share/games/doom/prboom.wad \
-		$(TARGET_DIR)/usr/games/prboom-game-server \
-		$(TARGET_DIR)/usr/games/prboom
-endef
-
 $(eval $(autotools-package))
-- 
2.1.0
