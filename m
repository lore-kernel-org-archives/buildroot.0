From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 22 Jan 2007 10:15:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20070122181516.1F51648585@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-22 10:15:15 -0800 (Mon, 22 Jan 2007)
New Revision: 17469

Log:
properly depend on pkgconfig


Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-01-22 17:50:21 UTC (rev 17468)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-01-22 18:15:15 UTC (rev 17469)
@@ -67,7 +67,7 @@
 #$(TARGET_DIR)/usr/lib/libdaemon.a: $(STAGING_DIR)/lib/libdaemon.a
 #	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libdaemon.a
 
-libdaemon: uclibc $(STAGING_DIR)/lib/libdaemon.a
+libdaemon: uclibc pkgconfig $(STAGING_DIR)/lib/libdaemon.a
 
 libdaemon-clean:
 	-$(MAKE) -C $(LIBDAEMON_DIR) clean
