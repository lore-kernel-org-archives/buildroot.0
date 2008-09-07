From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Sep 2008 07:31:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/libid3tag
Message-ID: <20080907143143.1CEE03C664@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-07 07:31:42 -0700 (Sun, 07 Sep 2008)
New Revision: 23355

Log:
libid3tag: don't depend on libmad

libid3tag doesn't use libmad.

Modified:
   trunk/buildroot/package/audio/libid3tag/Config.in
   trunk/buildroot/package/audio/libid3tag/libid3tag.mk


Changeset:
Modified: trunk/buildroot/package/audio/libid3tag/Config.in
===================================================================
--- trunk/buildroot/package/audio/libid3tag/Config.in	2008-09-07 14:31:39 UTC (rev 23354)
+++ trunk/buildroot/package/audio/libid3tag/Config.in	2008-09-07 14:31:42 UTC (rev 23355)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBID3TAG
 	bool "libid3tag"
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_PACKAGE_LIBMAD
 	help
 	  ID3 tag reading library from the MAD project.
 

Modified: trunk/buildroot/package/audio/libid3tag/libid3tag.mk
===================================================================
--- trunk/buildroot/package/audio/libid3tag/libid3tag.mk	2008-09-07 14:31:39 UTC (rev 23354)
+++ trunk/buildroot/package/audio/libid3tag/libid3tag.mk	2008-09-07 14:31:42 UTC (rev 23355)
@@ -46,7 +46,7 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libid3tag.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libid3tag.so*
 
-libid3tag: uclibc zlib libmad $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
+libid3tag: uclibc zlib $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)
 
 libid3tag-source: $(DL_DIR)/$(LIBID3TAG_SOURCE)
 
