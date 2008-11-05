From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed,  5 Nov 2008 05:33:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/games/prboom
Message-ID: <20081105133343.4570C3C8F6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-11-05 05:33:43 -0800 (Wed, 05 Nov 2008)
New Revision: 23939

Log:
prboom: add a touch $@ to end of install target rule to install PrBoom only once

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/games/prboom/prboom.mk


Changeset:
Modified: trunk/buildroot/package/games/prboom/prboom.mk
===================================================================
--- trunk/buildroot/package/games/prboom/prboom.mk	2008-11-05 13:20:58 UTC (rev 23938)
+++ trunk/buildroot/package/games/prboom/prboom.mk	2008-11-05 13:33:43 UTC (rev 23939)
@@ -42,6 +42,7 @@
 	$(INSTALL) -D $(PRBOOM_DIR)/data/prboom.wad $(TARGET_DIR)/usr/share/games/doom/prboom.wad
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/games/prboom
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/games/prboom-game-server
+	touch $@
 
 $(PRBOOM_TARGET_CLEAN):
 	rm -rf $(TARGET_DIR)/usr/share/games/doom/prboom.wad
