From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:28:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lzma
Message-ID: <20070812232848.97B48A6842@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:28:48 -0700 (Sun, 12 Aug 2007)
New Revision: 19473

Log:
fix liblzmadec.la paths

Modified:
   trunk/buildroot/package/lzma/lzma.mk


Changeset:
Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2007-08-12 23:27:38 UTC (rev 19472)
+++ trunk/buildroot/package/lzma/lzma.mk	2007-08-12 23:28:48 UTC (rev 19473)
@@ -44,6 +44,8 @@
 
 $(STAGING_DIR)/bin/lzma: $(LZMA_HOST_DIR)/src/lzma/lzma
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZMA_HOST_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
+		$(STAGING_DIR)/lib/liblzmadec.la
 
 lzma-host: $(STAGING_DIR)/bin/lzma
 lzma-host-clean:
