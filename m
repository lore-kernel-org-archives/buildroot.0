From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:21:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/irda-utils
Message-ID: <20090111202104.8D99C76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:21:04 +0000 (Sun, 11 Jan 2009)
New Revision: 24760

Log:
Remove irda.mk from build, since it is totally broken

Added:
   trunk/buildroot/package/irda-utils/irda.mk.broken

Removed:
   trunk/buildroot/package/irda-utils/irda.mk


Changeset:
Deleted: trunk/buildroot/package/irda-utils/irda.mk
===================================================================
--- trunk/buildroot/package/irda-utils/irda.mk	2009-01-11 20:19:24 UTC (rev 24759)
+++ trunk/buildroot/package/irda-utils/irda.mk	2009-01-11 20:21:04 UTC (rev 24760)
@@ -1,57 +0,0 @@
-#############################################################
-#
-# irda-utils
-#
-#############################################################
-IRDA_UTILS_VERSION:=0.9.18
-IRDA_UTILS_SOURCE:=irda-utils-$(IRDA_UTILS_VERSION).tar.gz
-IRDA_UTILS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/irda/$(IRDA_UTILS_SOURCE)
-IRDA_UTILS_DIR:=$(BUILD_DIR)/irda-utils-$(IRDA_UTILS_VERSION)
-
-ifeq ($(IRDA_IRATTACH),y)
-IRDA_DIRS += irattach
-endif
-ifeq ($(IRDA_IRDAPING),y)
-IRDA_DIRS += irdaping
-endif
-ifeq ($(IRDA_IRNETD),y)
-IRDA_DIRS += irnetd
-endif
-ifeq ($(IRDA_PSION),y)
-IRDA_DIRS += psion
-endif
-ifeq ($(IRDA_TEKRAM),y)
-IRDA_DIRS += tekram
-endif
-ifeq ($(IRDA_FINDCHIP),y)
-IRDA_DIRS += findchip
-endif
-ifeq ($(IRDA_IRDADUMP),y)
-IRDA_DIRS += irdadump
-endif
-ifeq ($(IRDA_SMCINIT),y)
-IRDA_DIRS += smcinit
-endif
-
-IRDA_UTILS_MAKE_OPT:=-e "DIRS=$(IRDA_DIRS)"
-IRDA_UTILS_MAKE_ENV:=CC=$(TARGET_CC) LD=$(TARGET_LD) AR=$(TARGET_AR) RANLIB=$(TARGET_RANLIB) ROOT=$(TARGET_DIR) PREFIX=$(TARGET_DIR)
-
-# Since there is no configure-script
-
-$(IRDA_UTILS_DIR)/.configured: $(IRDA_UTILS_DIR)/.patched
-	touch $@
-
-irda-utils: uclibc $(DL_DIR)/$(IRDA_UTILS_SOURCE) $(IRDA_UTILS_DIR)/.installed
-
-irda-utils-clean: $(IRDA_UTILS_DIR)/.clean
-
-irda-utils-dirclean: $(IRDA_UTILS_DIR)/.dirclean
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_IRDA_UTILS),y)
-TARGETS+=irda-utils
-endif

Added: trunk/buildroot/package/irda-utils/irda.mk.broken
===================================================================
--- trunk/buildroot/package/irda-utils/irda.mk.broken	                        (rev 0)
+++ trunk/buildroot/package/irda-utils/irda.mk.broken	2009-01-11 20:21:04 UTC (rev 24760)
@@ -0,0 +1,57 @@
+#############################################################
+#
+# irda-utils
+#
+#############################################################
+IRDA_UTILS_VERSION:=0.9.18
+IRDA_UTILS_SOURCE:=irda-utils-$(IRDA_UTILS_VERSION).tar.gz
+IRDA_UTILS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/irda/$(IRDA_UTILS_SOURCE)
+IRDA_UTILS_DIR:=$(BUILD_DIR)/irda-utils-$(IRDA_UTILS_VERSION)
+
+ifeq ($(IRDA_IRATTACH),y)
+IRDA_DIRS += irattach
+endif
+ifeq ($(IRDA_IRDAPING),y)
+IRDA_DIRS += irdaping
+endif
+ifeq ($(IRDA_IRNETD),y)
+IRDA_DIRS += irnetd
+endif
+ifeq ($(IRDA_PSION),y)
+IRDA_DIRS += psion
+endif
+ifeq ($(IRDA_TEKRAM),y)
+IRDA_DIRS += tekram
+endif
+ifeq ($(IRDA_FINDCHIP),y)
+IRDA_DIRS += findchip
+endif
+ifeq ($(IRDA_IRDADUMP),y)
+IRDA_DIRS += irdadump
+endif
+ifeq ($(IRDA_SMCINIT),y)
+IRDA_DIRS += smcinit
+endif
+
+IRDA_UTILS_MAKE_OPT:=-e "DIRS=$(IRDA_DIRS)"
+IRDA_UTILS_MAKE_ENV:=CC=$(TARGET_CC) LD=$(TARGET_LD) AR=$(TARGET_AR) RANLIB=$(TARGET_RANLIB) ROOT=$(TARGET_DIR) PREFIX=$(TARGET_DIR)
+
+# Since there is no configure-script
+
+$(IRDA_UTILS_DIR)/.configured: $(IRDA_UTILS_DIR)/.patched
+	touch $@
+
+irda-utils: uclibc $(DL_DIR)/$(IRDA_UTILS_SOURCE) $(IRDA_UTILS_DIR)/.installed
+
+irda-utils-clean: $(IRDA_UTILS_DIR)/.clean
+
+irda-utils-dirclean: $(IRDA_UTILS_DIR)/.dirclean
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_IRDA_UTILS),y)
+TARGETS+=irda-utils
+endif
