From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 26 Aug 2011 15:03:52 +0200
Subject: [Buildroot] [git commit] ncurses: remove explicit STRIPCMD
Message-ID: <20110826130551.5B5678D1C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d43a90032c4016a7583c3c8a88948e6bf3d24271
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stripping is done globally in target-finalize these days.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncurses/ncurses.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 0d42528..ac4c12b 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -117,7 +117,6 @@ define NCURSES_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/a/ansi $(TARGET_DIR)/usr/share/terminfo/a
 	mkdir -p $(TARGET_DIR)/usr/share/terminfo/l
 	cp -dpf $(STAGING_DIR)/usr/share/terminfo/l/linux $(TARGET_DIR)/usr/share/terminfo/l
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libncurses.so*
 	$(NCURSES_INSTALL_TARGET_DEVFILES)
 endef # NCURSES_INSTALL_TARGET_CMDS
 
-- 
1.7.3.4
