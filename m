From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 06:16:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20080424131639.7C2693C839@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 06:16:39 -0700 (Thu, 24 Apr 2008)
New Revision: 21833

Log:
small fix for libdaemon

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2008-04-24 13:15:30 UTC (rev 21832)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2008-04-24 13:16:39 UTC (rev 21833)
@@ -31,7 +31,7 @@
 	touch $@
 
 $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
-	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && autoreconf)
+	(cd $(LIBDAEMON_DIR) && rm -rf config.cache && libtoolize --copy --force && autoreconf)
 	(cd $(LIBDAEMON_DIR) && \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
