From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Mar 2009 16:58:49 +0000 (UTC)
Subject: [Buildroot] svn commit: [25811] trunk/buildroot/package/pango
Message-ID: <20090324165850.0A2EE76BFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-24 16:58:49 +0000 (Tue, 24 Mar 2009)
New Revision: 25811

Log:
pango: host build needs automake/autoconf

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-24 10:58:04 UTC (rev 25810)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-24 16:58:49 UTC (rev 25811)
@@ -76,7 +76,7 @@
 	toolchain/patch-kernel.sh $(PANGO_HOST_DIR) package/pango/ \*.patch
 	touch $@
 
-$(STAMP_DIR)/host_pango_configured: $(STAMP_DIR)/host_pango_unpacked $(STAMP_DIR)/host_cairo_installed $(STAMP_DIR)/host_libglib2_installed
+$(STAMP_DIR)/host_pango_configured: $(STAMP_DIR)/host_pango_unpacked $(STAMP_DIR)/host_cairo_installed $(STAMP_DIR)/host_libglib2_installed $(STAMP_DIR)/host_autoconf_installed  $(STAMP_DIR)/host_automake_installed
 	(cd $(PANGO_HOST_DIR); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
