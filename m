From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 16:57:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20070811235720.1AC3BA65D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 16:57:19 -0700 (Sat, 11 Aug 2007)
New Revision: 19451

Log:
Avoid error msg when TARGET_DIR/bin is created for the umpteenth time

Modified:
   trunk/buildroot/package/bash/bash.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2007-08-11 23:35:07 UTC (rev 19450)
+++ trunk/buildroot/package/bash/bash.mk	2007-08-11 23:57:19 UTC (rev 19451)
@@ -62,9 +62,9 @@
 	$(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(BASH_DIR)
 
 $(TARGET_DIR)/$(BASH_TARGET_BINARY): $(BASH_DIR)/$(BASH_BINARY)
+	mkdir -p $(TARGET_DIR)/bin
 	$(MAKE1) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BASH_DIR) install
 	rm -f $(TARGET_DIR)/bin/bash*
-	-mkdir $(TARGET_DIR)/bin
 	mv $(TARGET_DIR)/usr/bin/bash* $(TARGET_DIR)/bin/
 	(cd $(TARGET_DIR)/bin; /bin/ln -fs bash sh)
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
