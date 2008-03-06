From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:55:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bind
Message-ID: <20080306175503.C636B1201A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:55:03 -0800 (Thu, 06 Mar 2008)
New Revision: 21181

Log:
makefile cleanup for bind

Modified:
   trunk/buildroot/package/bind/bind.mk


Changeset:
Modified: trunk/buildroot/package/bind/bind.mk
===================================================================
--- trunk/buildroot/package/bind/bind.mk	2008-03-06 17:54:47 UTC (rev 21180)
+++ trunk/buildroot/package/bind/bind.mk	2008-03-06 17:55:03 UTC (rev 21181)
@@ -25,7 +25,7 @@
 $(BIND_DIR2)/.unpacked: $(DL_DIR)/$(BIND_SOURCE)
 	$(BIND_CAT) $(DL_DIR)/$(BIND_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(BIND_DIR2) package/bind/ bind\*.patch
-	touch $(BIND_DIR2)/.unpacked
+	touch $@
 
 $(BIND_DIR2)/Makefile: $(BIND_DIR2)/.unpacked
 	(cd $(BIND_DIR2); rm -rf config.cache; \
@@ -51,7 +51,7 @@
 
 $(BIND_DIR2)/$(BIND_BINARY): $(BIND_DIR2)/Makefile
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -j1 -C $(BIND_DIR2)
-	touch -c $(BIND_DIR2)/$(BIND_BINARY)
+	touch -c $@
 
 #############################################################
 #
