From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 02:52:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lzo
Message-ID: <20070923095204.4D3BAA6819@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 02:52:03 -0700 (Sun, 23 Sep 2007)
New Revision: 19955

Log:
Fix library path in lzo

Modified:
   trunk/buildroot/package/lzo/lzo.mk


Changeset:
Modified: trunk/buildroot/package/lzo/lzo.mk
===================================================================
--- trunk/buildroot/package/lzo/lzo.mk	2007-09-23 04:10:59 UTC (rev 19954)
+++ trunk/buildroot/package/lzo/lzo.mk	2007-09-23 09:52:03 UTC (rev 19955)
@@ -48,6 +48,7 @@
 
 $(STAGING_DIR)/usr/lib/liblzo.a: $(LZO_DIR)/src/liblzo.la
 	$(MAKE) CC="$(TARGET_CC)" DESTDIR=$(STAGING_DIR) -C $(LZO_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/liblzo.la
 	touch -c $@
 
 lzo: uclibc $(STAGING_DIR)/usr/lib/liblzo.a
