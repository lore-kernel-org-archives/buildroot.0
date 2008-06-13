From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 06:31:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20080613133142.063B33C807@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-13 06:31:41 -0700 (Fri, 13 Jun 2008)
New Revision: 22322

Log:
expat: make sure usr/lib/ exists


Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2008-06-13 13:20:38 UTC (rev 22321)
+++ trunk/buildroot/package/expat/expat.mk	2008-06-13 13:31:41 UTC (rev 22322)
@@ -52,6 +52,7 @@
 	touch -c $@
 
 $(TARGET_DIR)/$(EXPAT_TARGET_BINARY): $(STAGING_DIR)/$(EXPAT_TARGET_BINARY)
+	mkdir -p $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/libexpat.so* $(TARGET_DIR)/usr/lib/
 	#cp -dpf $(STAGING_DIR)/usr/bin/xmlwf $(TARGET_DIR)/usr/bin/xmlwf
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libexpat.so*
