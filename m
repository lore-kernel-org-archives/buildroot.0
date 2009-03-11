From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 22:15:59 +0000 (UTC)
Subject: [Buildroot] svn commit: [25621] trunk/buildroot/package/automake
Message-ID: <20090311221559.814A87645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 22:15:59 +0000 (Wed, 11 Mar 2009)
New Revision: 25621

Log:
automake: needs autoconf at configure time

Modified:
   trunk/buildroot/package/automake/automake.mk


Changeset:
Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2009-03-11 22:15:53 UTC (rev 25620)
+++ trunk/buildroot/package/automake/automake.mk	2009-03-11 22:15:59 UTC (rev 25621)
@@ -34,7 +34,7 @@
 #
 #############################################################
 
-$(AUTOMAKE_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked
+$(AUTOMAKE_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked $(AUTOCONF)
 	mkdir -p $(AUTOMAKE_DIR)
 	(cd $(AUTOMAKE_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -103,7 +103,7 @@
 #
 #############################################################
 
-$(AUTOMAKE_HOST_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked
+$(AUTOMAKE_HOST_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked $(AUTOCONF)
 	mkdir -p $(AUTOMAKE_HOST_DIR)
 	(cd $(AUTOMAKE_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
