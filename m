From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:04:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sed
Message-ID: <20080804190406.9EFA23C844@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:04:05 -0700 (Mon, 04 Aug 2008)
New Revision: 23013

Log:
sed: fix CPPFLAGS typo

Patch by Claus Klein.

Modified:
   trunk/buildroot/package/sed/sed.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2008-08-04 14:40:58 UTC (rev 23012)
+++ trunk/buildroot/package/sed/sed.mk	2008-08-04 19:04:05 UTC (rev 23013)
@@ -113,7 +113,7 @@
 	(cd $(SED_DIR2); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		CPPFLAGS="$(SED_CFLAGS)" \
+		CPPFLAGS="$(SED_CPPFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
