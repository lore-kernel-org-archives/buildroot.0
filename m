From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 27 Jun 2008 04:15:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rxvt
Message-ID: <20080627111550.343E13C289@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-27 04:15:49 -0700 (Fri, 27 Jun 2008)
New Revision: 22532

Log:
rxvt: fix target install (make sure directory exists)


Modified:
   trunk/buildroot/package/rxvt/rxvt.mk


Changeset:
Modified: trunk/buildroot/package/rxvt/rxvt.mk
===================================================================
--- trunk/buildroot/package/rxvt/rxvt.mk	2008-06-27 09:08:44 UTC (rev 22531)
+++ trunk/buildroot/package/rxvt/rxvt.mk	2008-06-27 11:15:49 UTC (rev 22532)
@@ -62,8 +62,8 @@
 	$(STRIPCMD) $(STRIP_DISCARD_ALL) $(RXVT_BINARY)
 
 $(TARGET_DIR)$(X11_PREFIX)/bin/rxvt: $(RXVT_BINARY)
-	cp -f $(RXVT_BINARY) $(TARGET_DIR)$(X11_PREFIX)/bin
-	(cd $(TARGET_DIR)$(X11_PREFIX)/bin; ln -fs rxvt xterm)
+	$(INSTALL) -m 0755 -D $^ $@
+	(cd $(@D); ln -fs rxvt xterm)
 
 rxvt: $(XSERVER) $(TARGET_DIR)$(X11_PREFIX)/bin/rxvt
 
