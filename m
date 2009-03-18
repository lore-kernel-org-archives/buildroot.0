From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 21:21:56 +0000 (UTC)
Subject: [Buildroot] svn commit: [25734] trunk/buildroot/package/freetype
Message-ID: <20090318212156.B191D7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 21:21:56 +0000 (Wed, 18 Mar 2009)
New Revision: 25734

Log:
freetype: cleanup target install

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-03-18 21:21:52 UTC (rev 25733)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-03-18 21:21:56 UTC (rev 25734)
@@ -9,14 +9,13 @@
 FREETYPE_LIBTOOL_PATCH = NO
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
+FREETYPE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = uclibc host-pkgconfig $(if $(BR2_PACKAGE_ZLIB),zlib)
 
 $(eval $(call AUTOTARGETS,package,freetype))
 
-$(FREETYPE_TARGET_INSTALL_TARGET):
-	-cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
+$(FREETYPE_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/freetype2\',g" \
