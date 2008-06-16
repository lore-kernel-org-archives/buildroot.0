From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:16:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libogg
Message-ID: <20080616111611.6BE11F8012@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:16:10 -0700 (Mon, 16 Jun 2008)
New Revision: 22370

Log:
libogg: fix libogg.a target

Based on patch by Conrad Parker.


Modified:
   trunk/buildroot/package/libogg/libogg.mk


Changeset:
Modified: trunk/buildroot/package/libogg/libogg.mk
===================================================================
--- trunk/buildroot/package/libogg/libogg.mk	2008-06-16 11:15:51 UTC (rev 22369)
+++ trunk/buildroot/package/libogg/libogg.mk	2008-06-16 11:16:10 UTC (rev 22370)
@@ -55,11 +55,9 @@
 ifneq ($(strip $(BR2_HAVE_MANPAGES)),y)
 	rm -rf $(TARGET_DIR)/usr/share/doc/$(LIBOGG_NAME)
 endif
-	touch $@
 
 $(TARGET_DIR)/usr/lib/libogg.a: $(TARGET_DIR)/usr/lib/libogg.so
-	cp -dpf $(LIBOGG_DIR)/lib/libogg.a $(TARGET_DIR)/usr/lib/
-	touch $@
+	cp -dpf $(STAGING_DIR)/usr/lib/libogg.a $@
 
 libogg-header: $(TARGET_DIR)/usr/lib/libogg.a
 	mkdir -p $(TARGET_DIR)/usr/include/ogg
