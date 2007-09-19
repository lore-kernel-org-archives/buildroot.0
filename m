From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 07:15:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ed
Message-ID: <20070919141548.4CC3630069@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 07:15:46 -0700 (Wed, 19 Sep 2007)
New Revision: 19893

Log:
- bump version


Modified:
   trunk/buildroot/package/ed/ed.mk


Changeset:
Modified: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2007-09-19 14:11:28 UTC (rev 19892)
+++ trunk/buildroot/package/ed/ed.mk	2007-09-19 14:15:46 UTC (rev 19893)
@@ -3,7 +3,7 @@
 # ed
 #
 #############################################################
-ED_VERSION:=0.6
+ED_VERSION:=0.8
 ED_SOURCE:=ed-$(ED_VERSION).tar.bz2
 ED_SITE:=http://ftp.gnu.org/gnu/ed/
 ED_CAT:=$(BZCAT)
@@ -36,7 +36,7 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(ED_DIR)
 
 $(TARGET_DIR)/$(ED_TARGET_BINARY): $(ED_DIR)/$(ED_BINARY)
-	cp -dpf $(ED_DIR)/$(ED_BINARY) $(TARGET_DIR)/$(ED_TARGET_BINARY)
+	$(INSTALL) -D $(ED_DIR)/$(ED_BINARY) $(TARGET_DIR)/$(ED_TARGET_BINARY)
 
 ed: uclibc $(TARGET_DIR)/$(ED_TARGET_BINARY)
 
