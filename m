From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 13 Aug 2007 01:12:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20070813081221.6A016A4647@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-13 01:12:20 -0700 (Mon, 13 Aug 2007)
New Revision: 19483

Log:
Fix libdir path for libfakeroot.la

Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-08-13 06:14:15 UTC (rev 19482)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-08-13 08:12:20 UTC (rev 19483)
@@ -51,6 +51,8 @@
 	$(SED) 's,^PREFIX=.*,PREFIX=$(STAGING_DIR)/usr,g' $(STAGING_DIR)/usr/bin/fakeroot
 	$(SED) 's,^BINDIR=.*,BINDIR=$(STAGING_DIR)/usr/bin,g' $(STAGING_DIR)/usr/bin/fakeroot
 	$(SED) 's,^PATHS=.*,PATHS=$(FAKEROOT_DIR1)/.libs:/lib:/usr/lib,g' $(STAGING_DIR)/usr/bin/fakeroot
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
+		$(STAGING_DIR)/usr/lib/libfakeroot.la
 	touch -c $@
 
 host-fakeroot: uclibc $(STAGING_DIR)/usr/bin/fakeroot
