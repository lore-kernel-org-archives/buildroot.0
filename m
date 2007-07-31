From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 11:40:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/make
Message-ID: <20070731184018.3AC4EA60D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 11:40:17 -0700 (Tue, 31 Jul 2007)
New Revision: 19367

Log:
Ensure host make is used when building 'make'

Modified:
   trunk/buildroot/package/make/make.mk


Changeset:
Modified: trunk/buildroot/package/make/make.mk
===================================================================
--- trunk/buildroot/package/make/make.mk	2007-07-31 18:37:52 UTC (rev 19366)
+++ trunk/buildroot/package/make/make.mk	2007-07-31 18:40:17 UTC (rev 19367)
@@ -49,7 +49,7 @@
 	touch $@
 
 $(GNUMAKE_DIR)/$(GNUMAKE_BINARY): $(GNUMAKE_DIR)/.configured
-	$(MAKE) -C $(GNUMAKE_DIR)
+	$(MAKE) MAKE=$(HOSTMAKE) -C $(GNUMAKE_DIR)
 
 $(TARGET_DIR)/$(GNUMAKE_TARGET_BINARY): $(GNUMAKE_DIR)/$(GNUMAKE_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GNUMAKE_DIR) install
