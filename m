From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Apr 2008 02:32:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/editors: ed uemacs
Message-ID: <20080403093253.14C6B3C4B3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-03 02:32:52 -0700 (Thu, 03 Apr 2008)
New Revision: 21624

Log:
package/editors: fix patch-kernel.sh arguments


Modified:
   trunk/buildroot/package/editors/ed/ed.mk
   trunk/buildroot/package/editors/uemacs/uemacs.mk


Changeset:
Modified: trunk/buildroot/package/editors/ed/ed.mk
===================================================================
--- trunk/buildroot/package/editors/ed/ed.mk	2008-04-03 09:28:56 UTC (rev 21623)
+++ trunk/buildroot/package/editors/ed/ed.mk	2008-04-03 09:32:52 UTC (rev 21624)
@@ -16,7 +16,7 @@
 
 $(ED_DIR)/.unpacked: $(DL_DIR)/$(ED_SOURCE)
 	$(ED_CAT) $(DL_DIR)/$(ED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ED_DIR) package/ed/ ed-\*.patch
+	toolchain/patch-kernel.sh $(ED_DIR) package/editors/ed/ ed-\*.patch
 	touch $@
 
 $(ED_DIR)/.configured: $(ED_DIR)/.unpacked

Modified: trunk/buildroot/package/editors/uemacs/uemacs.mk
===================================================================
--- trunk/buildroot/package/editors/uemacs/uemacs.mk	2008-04-03 09:28:56 UTC (rev 21623)
+++ trunk/buildroot/package/editors/uemacs/uemacs.mk	2008-04-03 09:32:52 UTC (rev 21624)
@@ -18,7 +18,7 @@
 
 $(UEMACS_DIR)/.unpacked: $(DL_DIR)/$(UEMACS_SOURCE)
 	$(UEMACS_CAT) $(DL_DIR)/$(UEMACS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(UEMACS_DIR) package/uemacs/ uemacs\*.patch
+	toolchain/patch-kernel.sh $(UEMACS_DIR) package/editors/uemacs/ uemacs\*.patch
 	touch $(UEMACS_DIR)/.unpacked
 
 $(UEMACS_DIR)/$(UEMACS_BINARY): $(UEMACS_DIR)/.unpacked
