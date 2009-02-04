From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Feb 2009 23:51:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/libvorbis
Message-ID: <20090204235112.7376E76273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-04 23:51:11 +0000 (Wed, 04 Feb 2009)
New Revision: 25243

Log:
tremor: strip target lib

Modified:
   trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk	2009-02-04 23:51:06 UTC (rev 25242)
+++ trunk/buildroot/package/multimedia/libvorbis/libvorbis.mk	2009-02-04 23:51:11 UTC (rev 25243)
@@ -108,7 +108,8 @@
 	touch $@
 
 $(TARGET_DIR)/usr/lib/tremor.so: $(TREMOR_DIR)/.libs
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(TREMOR_DIR) install
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(TREMOR_DIR) \
+		$(if $(BR2_STRIP_none),install,install-strip)
 	touch $@
 
 $(TARGET_DIR)/usr/lib/tremor.a: $(TARGET_DIR)/usr/lib/tremor.so
