From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 06:18:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxslt
Message-ID: <20080424131803.6B7603C840@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 06:18:03 -0700 (Thu, 24 Apr 2008)
New Revision: 21834

Log:
make sure xslt uses the right xml2 headers

Modified:
   trunk/buildroot/package/libxslt/libxslt.mk


Changeset:
Modified: trunk/buildroot/package/libxslt/libxslt.mk
===================================================================
--- trunk/buildroot/package/libxslt/libxslt.mk	2008-04-24 13:16:39 UTC (rev 21833)
+++ trunk/buildroot/package/libxslt/libxslt.mk	2008-04-24 13:18:03 UTC (rev 21834)
@@ -54,6 +54,7 @@
 		--without-python \
 		--without-threads \
 		--with-libxml-libs-prefix=$(STAGING_DIR)/usr/lib \
+		CFLAGS="-I$(STAGING_DIR)/usr/include/libxml2" \
 	);
 	touch $@
 
