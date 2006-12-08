From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  8 Dec 2006 04:50:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20061208125037.C26B0485DA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-08 04:50:37 -0800 (Fri, 08 Dec 2006)
New Revision: 16814

Log:
- bash can't be built with -j.


Modified:
   trunk/buildroot/package/bash/bash.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2006-12-08 12:45:45 UTC (rev 16813)
+++ trunk/buildroot/package/bash/bash.mk	2006-12-08 12:50:37 UTC (rev 16814)
@@ -54,10 +54,10 @@
 	touch $(BASH_DIR)/.configured
 
 $(BASH_DIR)/$(BASH_BINARY): $(BASH_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
+	$(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
 
 $(TARGET_DIR)/$(BASH_TARGET_BINARY): $(BASH_DIR)/$(BASH_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) install
+	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) install
 	rm -f $(TARGET_DIR)/bin/bash*
 	mv $(TARGET_DIR)/usr/bin/bash* $(TARGET_DIR)/bin/
 	(cd $(TARGET_DIR)/bin; /bin/ln -fs bash sh)
@@ -73,8 +73,8 @@
 endif
 
 bash-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) uninstall
-	-$(MAKE) -C $(BASH_DIR) clean
+	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) uninstall
+	-$(MAKE1) -C $(BASH_DIR) clean
 
 bash-dirclean:
 	rm -rf $(BASH_DIR)
