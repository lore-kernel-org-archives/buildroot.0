From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 05:06:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20070812120600.F2ACDA65DB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 05:05:55 -0700 (Sun, 12 Aug 2007)
New Revision: 19459

Log:
Make paths to expat available to fontconfig

Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2007-08-12 11:59:51 UTC (rev 19458)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2007-08-12 12:05:55 UTC (rev 19459)
@@ -53,6 +53,9 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
+		--with-expat="$(STAGING_DIR)/usr/lib" \
+		--with-expat-lib=$(STAGING_DIR)/usr/lib \
+		--with-expat-includes=$(STAGING_DIR)/usr/include \
 		--disable-docs \
 	)
 	touch $@
