From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 10:32:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070901173201.163AAA6584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 10:32:01 -0700 (Sat, 01 Sep 2007)
New Revision: 19754

Log:
- cosmetic cleanup


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-01 17:22:00 UTC (rev 19753)
+++ trunk/buildroot/package/Makefile.in	2007-09-01 17:32:01 UTC (rev 19754)
@@ -89,12 +89,12 @@
 TARGET_LDCONFIG=$(TARGET_CROSS)ldconfig
 INSTALL=/usr/bin/install
 ifeq ($(BR2_STRIP_strip),y)
-STRIP=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
 STRIP_STRIP_ALL:=--strip-all
 REMOVE_SECTION_COMMENT:=--remove-section=.comment
 REMOVE_SECTION_NOTE:=--remove-section=.note
+STRIP=$(TARGET_CROSS)strip $(REMOVE_SECTION_COMMENT) $(REMOVE_SECTION_NOTE)
 endif
 ifeq ($(BR2_STRIP_sstrip),y)
 STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
