From: hamish at uclibc.org <hamish@uclibc.org>
Date: Sun,  7 Dec 2008 20:43:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20081208044333.A35D33C6DF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-12-07 20:43:33 -0800 (Sun, 07 Dec 2008)
New Revision: 24305

Log:
Override the target-install target properly rather than installing as a post-build hook


Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-12-08 04:41:19 UTC (rev 24304)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-12-08 04:43:33 UTC (rev 24305)
@@ -8,13 +8,13 @@
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_LIBTOOL_PATCH = NO
 FREETYPE_INSTALL_STAGING = YES
-FREETYPE_INSTALL_TARGET = NO
+FREETYPE_INSTALL_TARGET = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
 FREETYPE_DEPENDENCIES = uclibc pkgconfig zlib
 
 $(eval $(call AUTOTARGETS,package,freetype))
 
-$(FREETYPE_HOOK_POST_BUILD):
+$(FREETYPE_TARGET_INSTALL_TARGET):
 	-cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
