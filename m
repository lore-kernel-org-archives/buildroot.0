From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 10:10:49 +0000 (UTC)
Subject: [Buildroot] svn commit: [25603] trunk/buildroot/package/libiconv
Message-ID: <20090311101049.508BB7645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 10:10:48 +0000 (Wed, 11 Mar 2009)
New Revision: 25603

Log:
libiconv: strip libcharset as well

Modified:
   trunk/buildroot/package/libiconv/libiconv.mk


Changeset:
Modified: trunk/buildroot/package/libiconv/libiconv.mk
===================================================================
--- trunk/buildroot/package/libiconv/libiconv.mk	2009-03-10 22:47:21 UTC (rev 25602)
+++ trunk/buildroot/package/libiconv/libiconv.mk	2009-03-11 10:10:48 UTC (rev 25603)
@@ -22,5 +22,6 @@
 	rm -f $(TARGET_DIR)/usr/lib/preloadable_libiconv.so
 ifneq ($(BR2_ENABLE_DEBUG),y)
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libiconv.so.*
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libcharset.so.*
 endif
 	touch $@
