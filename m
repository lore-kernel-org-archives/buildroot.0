From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Mar 2009 22:39:15 +0000 (UTC)
Subject: [Buildroot] svn commit: [25742] trunk/buildroot/package/pango
Message-ID: <20090318223915.DD02E7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-18 22:39:15 +0000 (Wed, 18 Mar 2009)
New Revision: 25742

Log:
pango: use same with/without-x setting for host build as for target

Ensures identical pango.modules contents

Modified:
   trunk/buildroot/package/pango/pango.mk


Changeset:
Modified: trunk/buildroot/package/pango/pango.mk
===================================================================
--- trunk/buildroot/package/pango/pango.mk	2009-03-18 22:39:09 UTC (rev 25741)
+++ trunk/buildroot/package/pango/pango.mk	2009-03-18 22:39:15 UTC (rev 25742)
@@ -82,7 +82,7 @@
 		--prefix=$(HOST_DIR)/usr \
 		--sysconfdir=$(HOST_DIR)/etc \
 		--disable-static \
-		--with-x \
+		$(if $(BR2_PACKAGE_XSERVER_none),--without-x,--with-x) \
 		--disable-debug \
 	)
 	touch $@
