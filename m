From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 27 Jul 2007 00:38:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/at
Message-ID: <20070727073848.B1A97A4560@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-27 00:38:48 -0700 (Fri, 27 Jul 2007)
New Revision: 19269

Log:
Use correct binary in 'at' to avoid rebuilds

Modified:
   trunk/buildroot/package/at/at.mk


Changeset:
Modified: trunk/buildroot/package/at/at.mk
===================================================================
--- trunk/buildroot/package/at/at.mk	2007-07-27 07:35:49 UTC (rev 19268)
+++ trunk/buildroot/package/at/at.mk	2007-07-27 07:38:48 UTC (rev 19269)
@@ -9,7 +9,7 @@
 AT_DIR:=$(BUILD_DIR)/at-$(AT_VERSION)
 AT_CAT:=$(ZCAT)
 AT_TARGET_SCRIPT:=etc/init.d/S99at
-AT_BINARY:=.at
+AT_BINARY:=at
 
 $(DL_DIR)/$(AT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(AT_SITE)/$(AT_SOURCE)
@@ -62,6 +62,8 @@
 
 at-dirclean:
 	rm -rf $(AT_DIR)
+
+.PHONY:	at
 #############################################################
 #
 # Toplevel Makefile options
