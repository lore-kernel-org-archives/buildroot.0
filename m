From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  5 Nov 2008 07:47:10 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/games/prboom
Message-ID: <20081105154710.249223C8DC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-05 07:47:09 -0800 (Wed, 05 Nov 2008)
New Revision: 23940

Log:
prboom: misc cleanups

As noted by Bernhard on irc.

Modified:
   trunk/buildroot/package/games/prboom/prboom.mk


Changeset:
Modified: trunk/buildroot/package/games/prboom/prboom.mk
===================================================================
--- trunk/buildroot/package/games/prboom/prboom.mk	2008-11-05 13:33:43 UTC (rev 23939)
+++ trunk/buildroot/package/games/prboom/prboom.mk	2008-11-05 15:47:09 UTC (rev 23940)
@@ -40,12 +40,12 @@
 	$(INSTALL) -D $(PRBOOM_DIR)/src/prboom $(TARGET_DIR)/usr/games/prboom
 	$(INSTALL) -D $(PRBOOM_DIR)/src/prboom-game-server $(TARGET_DIR)/usr/games/prboom-game-server
 	$(INSTALL) -D $(PRBOOM_DIR)/data/prboom.wad $(TARGET_DIR)/usr/share/games/doom/prboom.wad
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/games/prboom
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/games/prboom-game-server
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/games/prboom
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/games/prboom-game-server
 	touch $@
 
 $(PRBOOM_TARGET_CLEAN):
-	rm -rf $(TARGET_DIR)/usr/share/games/doom/prboom.wad
-	rm -rf $(TARGET_DIR)/usr/games/prboom-game-server
-	rm -rf $(TARGET_DIR)/usr/games/prboom
+	rm -rf $(TARGET_DIR)/usr/share/games/doom/prboom.wad \
+		$(TARGET_DIR)/usr/games/prboom-game-server \
+		$(TARGET_DIR)/usr/games/prboom
 	-$(MAKE) -C $(PRBOOM_DIR) clean
