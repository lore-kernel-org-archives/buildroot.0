From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:16 -0000
Subject: [Buildroot] [git commit] prboom: remove uninstall command
Message-ID: <20150302222715.A9AA68057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=620ed5c93974618f01fad93d530a72764a9069ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Useless since the uninstall commands were removed in eb7bd9ef

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prboom/prboom.mk |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

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
