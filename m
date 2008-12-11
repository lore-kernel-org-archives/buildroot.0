From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu, 11 Dec 2008 06:40:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
Message-ID: <20081211144057.044263C67C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-11 06:40:56 -0800 (Thu, 11 Dec 2008)
New Revision: 24378

Log:
zlib: install using cp instead of install for zlib libraries

This patch will install zlib keeping the symlinks. The usage of
$(INSTALL) here did not take into account symbolic links.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2008-12-11 13:43:07 UTC (rev 24377)
+++ trunk/buildroot/package/zlib/zlib.mk	2008-12-11 14:40:56 UTC (rev 24378)
@@ -53,7 +53,7 @@
 	touch -c $@
 
 $(STAGING_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.a
-	$(INSTALL) $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
+	cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libz.so: $(STAGING_DIR)/usr/lib/libz.so
