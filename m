From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 22:07:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libevent
Message-ID: <20070114060749.BB085485C5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 22:07:49 -0800 (Sat, 13 Jan 2007)
New Revision: 17293

Log:
Remove man pages after installing into target filesystem.


Modified:
   trunk/buildroot/package/libevent/libevent.mk


Changeset:
Modified: trunk/buildroot/package/libevent/libevent.mk
===================================================================
--- trunk/buildroot/package/libevent/libevent.mk	2007-01-14 05:38:00 UTC (rev 17292)
+++ trunk/buildroot/package/libevent/libevent.mk	2007-01-14 06:07:49 UTC (rev 17293)
@@ -43,15 +43,18 @@
 $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY): $(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY)
 	make -C $(LIBEVENT_DIR) DESTDIR=$(TARGET_DIR) install
 	rm -f $(TARGET_DIR)/usr/lib/libevent*.la $(TARGET_DIR)/usr/include/ev*
+	rm -f $(TARGET_DIR)/usr/man/man3/ev*.3
+	rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/man/man3
 
 libevent: uclibc $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY)
 
 libevent-clean:
-	rm -f $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY)*
 	-$(MAKE) -C $(LIBEVENT_DIR) clean
 
 libevent-dirclean:
 	rm -rf $(LIBEVENT_DIR)
+
 #############################################################
 #
 # Toplevel Makefile options
