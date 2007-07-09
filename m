From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  9 Jul 2007 11:36:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/make
Message-ID: <20070709183603.96E533007E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-09 11:36:01 -0700 (Mon, 09 Jul 2007)
New Revision: 19057

Log:
- cosmetics: rename _VER to _VERSION and touch at


Modified:
   trunk/buildroot/package/make/make.mk


Changeset:
Modified: trunk/buildroot/package/make/make.mk
===================================================================
--- trunk/buildroot/package/make/make.mk	2007-07-09 18:23:20 UTC (rev 19056)
+++ trunk/buildroot/package/make/make.mk	2007-07-09 18:36:01 UTC (rev 19057)
@@ -3,10 +3,10 @@
 # make
 #
 #############################################################
-GNUMAKE_VER:=3.81
-GNUMAKE_SOURCE:=make-$(GNUMAKE_VER).tar.bz2
+GNUMAKE_VERSION:=3.81
+GNUMAKE_SOURCE:=make-$(GNUMAKE_VERSION).tar.bz2
 GNUMAKE_SITE:=http://ftp.gnu.org/pub/gnu/make
-GNUMAKE_DIR:=$(BUILD_DIR)/make-$(GNUMAKE_VER)
+GNUMAKE_DIR:=$(BUILD_DIR)/make-$(GNUMAKE_VERSION)
 GNUMAKE_CAT:=$(BZCAT)
 GNUMAKE_BINARY:=make
 GNUMAKE_TARGET_BINARY:=usr/bin/make
@@ -19,7 +19,7 @@
 $(GNUMAKE_DIR)/.unpacked: $(DL_DIR)/$(GNUMAKE_SOURCE)
 	$(GNUMAKE_CAT) $(DL_DIR)/$(GNUMAKE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(GNUMAKE_DIR)/config
-	touch $(GNUMAKE_DIR)/.unpacked
+	touch $@
 
 $(GNUMAKE_DIR)/.configured: $(GNUMAKE_DIR)/.unpacked
 	(cd $(GNUMAKE_DIR); rm -rf config.cache; \
@@ -46,7 +46,7 @@
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	);
-	touch $(GNUMAKE_DIR)/.configured
+	touch $@
 
 $(GNUMAKE_DIR)/$(GNUMAKE_BINARY): $(GNUMAKE_DIR)/.configured
 	$(MAKE) -C $(GNUMAKE_DIR)
