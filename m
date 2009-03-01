From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  1 Mar 2009 22:35:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
Message-ID: <20090301223549.7DB24769D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-01 22:35:48 +0000 (Sun, 01 Mar 2009)
New Revision: 25475

Log:
ncurses: fixup ncurses5-config script

Fixes #133.

Modified:
   trunk/buildroot/package/ncurses/ncurses.mk


Changeset:
Modified: trunk/buildroot/package/ncurses/ncurses.mk
===================================================================
--- trunk/buildroot/package/ncurses/ncurses.mk	2009-03-01 20:20:20 UTC (rev 25474)
+++ trunk/buildroot/package/ncurses/ncurses.mk	2009-03-01 22:35:48 UTC (rev 25475)
@@ -100,6 +100,8 @@
 	    ticdir=$(STAGING_DIR)/usr/share/terminfo \
 	    -C $(NCURSES_DIR) install
 	chmod a-x $(NCURSES_DIR)/lib/libncurses.so*
+	$(SED) 's^prefix="^prefix="$(STAGING_DIR)^' \
+		$(STAGING_DIR)/bin/ncurses5-config
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/usr/lib/libncurses.so.$(NCURSES_VERSION)
