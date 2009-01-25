From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:47:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/liboil
Message-ID: <20090125234749.B772976D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:47:47 +0000 (Sun, 25 Jan 2009)
New Revision: 25033

Log:
Add explanation why examples are disabled for liboil

Modified:
   trunk/buildroot/package/liboil/liboil.mk


Changeset:
Modified: trunk/buildroot/package/liboil/liboil.mk
===================================================================
--- trunk/buildroot/package/liboil/liboil.mk	2009-01-25 23:44:53 UTC (rev 25032)
+++ trunk/buildroot/package/liboil/liboil.mk	2009-01-25 23:47:47 UTC (rev 25033)
@@ -45,6 +45,10 @@
 	rm -f $(TARGET_DIR)/usr/bin/oil-bugreport
 	touch $@
 
+
+# Disable some examples that will break the build.
+# There are sveral more that can be removed
+# by someone with time over.
 $(LIBOIL_HOOK_POST_CONFIGURE):
 	$(SED) 's/uberopt//g' $(LIBOIL_DIR)/examples/Makefile
 	$(SED) 's/work//g' $(LIBOIL_DIR)/examples/Makefile
