From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 22 Sep 2007 21:11:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/diffutils
Message-ID: <20070923041100.39038A688A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-22 21:10:59 -0700 (Sat, 22 Sep 2007)
New Revision: 19954

Log:
Remove bad 'w' flag from rm in diffutils

Modified:
   trunk/buildroot/package/diffutils/diffutils.mk


Changeset:
Modified: trunk/buildroot/package/diffutils/diffutils.mk
===================================================================
--- trunk/buildroot/package/diffutils/diffutils.mk	2007-09-22 21:38:15 UTC (rev 19953)
+++ trunk/buildroot/package/diffutils/diffutils.mk	2007-09-23 04:10:59 UTC (rev 19954)
@@ -110,7 +110,7 @@
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
-	rm -rfw $(TARGET_DIR)/share/locale
+	rm -rf $(TARGET_DIR)/share/locale
 	rm -rf $(TARGET_DIR)/usr/share/doc
 
 diffutils: uclibc $(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY)
