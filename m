From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 15 Jun 2008 12:17:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20080615191726.869EE3C920@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-15 12:17:23 -0700 (Sun, 15 Jun 2008)
New Revision: 22355

Log:
valgrind: needs kernel headers (and doesn't respect CFLAGS)


Modified:
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 19:17:14 UTC (rev 22354)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2008-06-15 19:17:23 UTC (rev 22355)
@@ -25,6 +25,7 @@
 	(cd $(VALGRIND_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		CC="$(TARGET_CC) $(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
