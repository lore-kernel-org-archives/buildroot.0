From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 04:55:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/automake
Message-ID: <20070129125500.8C41D485AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 04:55:00 -0800 (Mon, 29 Jan 2007)
New Revision: 17629

Log:
- bump version


Modified:
   trunk/buildroot/package/automake/automake.mk


Changeset:
Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2007-01-29 12:51:39 UTC (rev 17628)
+++ trunk/buildroot/package/automake/automake.mk	2007-01-29 12:55:00 UTC (rev 17629)
@@ -3,7 +3,7 @@
 # automake
 #
 #############################################################
-AUTOMAKE_VER:=1.9.6
+AUTOMAKE_VER:=1.10
 AUTOMAKE_SOURCE:=automake-$(AUTOMAKE_VER).tar.bz2
 AUTOMAKE_SITE:=http://ftp.gnu.org/pub/gnu/automake
 AUTOMAKE_CAT:=$(BZCAT)
@@ -18,7 +18,7 @@
 
 $(AUTOMAKE_DIR)/.unpacked: $(DL_DIR)/$(AUTOMAKE_SOURCE)
 	$(AUTOMAKE_CAT) $(DL_DIR)/$(AUTOMAKE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(AUTOMAKE_DIR)/.unpacked
+	touch $@
 
 $(AUTOMAKE_DIR)/.configured: $(AUTOMAKE_DIR)/.unpacked
 	(cd $(AUTOMAKE_DIR); rm -rf config.cache; \
@@ -41,7 +41,7 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	);
-	touch $(AUTOMAKE_DIR)/.configured
+	touch $@
 
 $(AUTOMAKE_DIR)/$(AUTOMAKE_BINARY): $(AUTOMAKE_DIR)/.configured
 	$(MAKE) -C $(AUTOMAKE_DIR)
