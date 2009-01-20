From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 Jan 2009 22:25:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bzip2
Message-ID: <20090120222556.45283770AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-20 22:25:55 +0000 (Tue, 20 Jan 2009)
New Revision: 24929

Log:
Make libbz2.so point at libbz2.so.1.0.4 in /usr/lib (correct) instead of in /lib

Modified:
   trunk/buildroot/package/bzip2/bzip2.mk


Changeset:
Modified: trunk/buildroot/package/bzip2/bzip2.mk
===================================================================
--- trunk/buildroot/package/bzip2/bzip2.mk	2009-01-20 21:34:46 UTC (rev 24928)
+++ trunk/buildroot/package/bzip2/bzip2.mk	2009-01-20 22:25:55 UTC (rev 24929)
@@ -40,7 +40,7 @@
 	cp $(BZIP2_DIR)/libbz2.so.$(BZIP2_VERSION) $(STAGING_DIR)/usr/lib/
 	cp $(BZIP2_DIR)/libbz2.a $(STAGING_DIR)/usr/lib/
 	(cd $(STAGING_DIR)/usr/lib/; \
-		ln -snf ../../lib/libbz2.so.$(BZIP2_VERSION) libbz2.so; \
+		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
 	)
 	(cd $(STAGING_DIR)/usr/lib; \
 		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
