From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 23:40:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libmad
Message-ID: <20071031064036.F3C42A65D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 23:40:36 -0700 (Tue, 30 Oct 2007)
New Revision: 20347

Log:
update ltmain.sh in libmad by running libtoolize during build

Modified:
   trunk/buildroot/package/libmad/libmad.mk


Changeset:
Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2007-10-31 06:38:59 UTC (rev 20346)
+++ trunk/buildroot/package/libmad/libmad.mk	2007-10-31 06:40:36 UTC (rev 20347)
@@ -36,8 +36,13 @@
 	)
 	touch $@
 
+# This rule runs 'libtoolize' since the ltmain.sh which comes in the tarball
+# is unsuitable with new libtool versions (causing shared libraries to build
+# without the .so extension).
+
 $(LIBMAD_DIR)/libmad.la: $(LIBMAD_DIR)/.configured
 	rm -f $@
+	(cd $(LIBMAD_DIR); libtoolize --force)
 	$(MAKE) -C $(LIBMAD_DIR)
 
 $(STAGING_DIR)/usr/lib/libmad.so: $(LIBMAD_DIR)/libmad.la
