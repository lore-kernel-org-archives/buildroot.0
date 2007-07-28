From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 16:17:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libid3tag
Message-ID: <20070728231729.07EB5A493E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 16:17:27 -0700 (Sat, 28 Jul 2007)
New Revision: 19310

Log:
Change space to tab

Modified:
   trunk/buildroot/package/libid3tag/libid3tag.mk


Changeset:
Modified: trunk/buildroot/package/libid3tag/libid3tag.mk
===================================================================
--- trunk/buildroot/package/libid3tag/libid3tag.mk	2007-07-28 23:02:26 UTC (rev 19309)
+++ trunk/buildroot/package/libid3tag/libid3tag.mk	2007-07-28 23:17:27 UTC (rev 19310)
@@ -36,7 +36,7 @@
 	touch $@
 
 $(LIBID3TAG_DIR)/src/.libs/$(LIBID3TAG_BIN): $(LIBID3TAG_DIR)/.configured
-       $(MAKE) -C $(LIBID3TAG_DIR)
+	$(MAKE) -C $(LIBID3TAG_DIR)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBID3TAG_DIR) install
 
 $(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN): $(LIBID3TAG_DIR)/src/.libs/$(LIBID3TAG_BIN)
@@ -44,8 +44,8 @@
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libid3tag.la
 
 $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN): $(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN)
-       cp -dpf  $(STAGING_DIR)/usr/lib/libid3tag.so*  $(TARGET_DIR)/usr/lib/
-       -$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libid3tag.so*
+	cp -dpf  $(STAGING_DIR)/usr/lib/libid3tag.so*  $(TARGET_DIR)/usr/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libid3tag.so*
 
 libid3tag: uclibc libmad $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
 
