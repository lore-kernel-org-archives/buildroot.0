From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:54:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/aumix
Message-ID: <20080306175427.853E11201B9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:54:27 -0800 (Thu, 06 Mar 2008)
New Revision: 21179

Log:
makefile cleanup for aumix

Modified:
   trunk/buildroot/package/aumix/aumix.mk


Changeset:
Modified: trunk/buildroot/package/aumix/aumix.mk
===================================================================
--- trunk/buildroot/package/aumix/aumix.mk	2008-03-06 17:54:01 UTC (rev 21178)
+++ trunk/buildroot/package/aumix/aumix.mk	2008-03-06 17:54:27 UTC (rev 21179)
@@ -15,7 +15,7 @@
 
 $(AUMIX_DIR)/.unpacked: $(DL_DIR)/$(AUMIX_SOURCE)
 	$(AUMIX_CAT) $(DL_DIR)/$(AUMIX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(AUMIX_DIR)/.unpacked
+	touch $@
 
 $(AUMIX_DIR)/.configured: $(AUMIX_DIR)/.unpacked
 	(cd $(AUMIX_DIR); rm -rf config.cache; \
@@ -36,14 +36,14 @@
 		--without-sysmouse \
 		$(DISABLE_NLS) \
 	)
-	touch $(AUMIX_DIR)/.configured
+	touch $@
 
 $(AUMIX_DIR)/src/aumix: $(AUMIX_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(AUMIX_DIR)
 
 $(AUMIX_DIR)/.installed: $(AUMIX_DIR)/src/aumix
 	$(MAKE) -C $(AUMIX_DIR) DESTDIR=$(TARGET_DIR) install
-	touch $(AUMIX_DIR)/.installed
+	touch $@
 
 aumix: uclibc ncurses $(AUMIX_DIR)/.installed
 
