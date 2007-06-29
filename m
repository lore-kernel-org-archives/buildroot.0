From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 29 Jun 2007 01:18:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
Message-ID: <20070629081814.4D6A8A5E1C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-29 01:18:13 -0700 (Fri, 29 Jun 2007)
New Revision: 18969

Log:
- change download site to sourceforge


Modified:
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2007-06-28 22:38:48 UTC (rev 18968)
+++ trunk/buildroot/package/zlib/zlib.mk	2007-06-29 08:18:13 UTC (rev 18969)
@@ -6,7 +6,7 @@
 ZLIB_VER:=1.2.3
 ZLIB_SOURCE:=zlib-$(ZLIB_VER).tar.bz2
 ZLIB_CAT:=$(BZCAT)
-ZLIB_SITE:=http://www.zlib.net/
+ZLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 ZLIB_DIR:=$(BUILD_DIR)/zlib-$(ZLIB_VER)
 ZLIB_CFLAGS:=$(TARGET_CFLAGS) -fPIC
 ifeq ($(BR2_LARGEFILE),y)
@@ -33,7 +33,7 @@
 		--exec-prefix=$(STAGING_DIR)/usr/bin \
 		--libdir=$(STAGING_DIR)/usr/lib \
 		--includedir=$(STAGING_DIR)/usr/include \
-	);
+	)
 	touch $@
 
 $(ZLIB_DIR)/libz.so.$(ZLIB_VER): $(ZLIB_DIR)/.configured
