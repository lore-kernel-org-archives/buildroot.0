From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 12:05:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libungif
Message-ID: <20070723190543.C93EA3007B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 12:05:43 -0700 (Mon, 23 Jul 2007)
New Revision: 19239

Log:
Cleanup of libungif package

Modified:
   trunk/buildroot/package/libungif/libungif.mk


Changeset:
Modified: trunk/buildroot/package/libungif/libungif.mk
===================================================================
--- trunk/buildroot/package/libungif/libungif.mk	2007-07-23 19:04:27 UTC (rev 19238)
+++ trunk/buildroot/package/libungif/libungif.mk	2007-07-23 19:05:43 UTC (rev 19239)
@@ -3,12 +3,12 @@
 # libungif
 #
 #############################################################
-LIBUNGIF_VER:=4.1.4
-LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VER).tar.bz2
+LIBUNGIF_VERSION:=4.1.4
+LIBUNGIF_SOURCE:=libungif-$(LIBUNGIF_VERSION).tar.bz2
 LIBUNGIF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libungif/$(LIBUNGIF_SOURCE)
-LIBUNGIF_DIR:=$(BUILD_DIR)/libungif-$(LIBUNGIF_VER)
+LIBUNGIF_DIR:=$(BUILD_DIR)/libungif-$(LIBUNGIF_VERSION)
 LIBUNGIF_CAT:=$(BZCAT)
-LIBUNGIF_BINARY:=libungif.so.$(LIBUNGIF_VER)
+LIBUNGIF_BINARY:=libungif.so.$(LIBUNGIF_VERSION)
 LIBUNGIF_TARGET_BINARY:=usr/lib/libungif.so
 
 $(DL_DIR)/$(LIBUNGIF_SOURCE):
@@ -16,12 +16,13 @@
 
 $(LIBUNGIF_DIR)/.unpacked: $(DL_DIR)/$(LIBUNGIF_SOURCE)
 	$(LIBUNGIF_CAT) $(DL_DIR)/$(LIBUNGIF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBUNGIF_DIR) package/libungif/ libungif-$(LIBUNGIF_VER)\*.patch\*
+	toolchain/patch-kernel.sh $(LIBUNGIF_DIR) package/libungif/ libungif-$(LIBUNGIF_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(LIBUNGIF_DIR)
 	touch $@
 
 $(LIBUNGIF_DIR)/.configured: $(LIBUNGIF_DIR)/.unpacked
 	(cd $(LIBUNGIF_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
