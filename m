From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 08:23:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/quagga
Message-ID: <20070728152335.03C13A47AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 08:23:35 -0700 (Sat, 28 Jul 2007)
New Revision: 19288

Log:
Use correct build options for Quagga

Modified:
   trunk/buildroot/package/quagga/quagga.mk


Changeset:
Modified: trunk/buildroot/package/quagga/quagga.mk
===================================================================
--- trunk/buildroot/package/quagga/quagga.mk	2007-07-28 15:21:54 UTC (rev 19287)
+++ trunk/buildroot/package/quagga/quagga.mk	2007-07-28 15:23:35 UTC (rev 19288)
@@ -152,7 +152,7 @@
 	touch $@
 
 $(QUAGGA_BINARY): $(QUAGGA_DIR)/.configured
-	$(MAKE) -C $(QUAGGA_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QUAGGA_DIR)
 
 $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY): $(QUAGGA_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) install
