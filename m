From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 11 Mar 2009 15:43:48 +0000 (UTC)
Subject: [Buildroot] svn commit: [25610] trunk/buildroot/package/gmpc
Message-ID: <20090311154348.435787645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-11 15:43:47 +0000 (Wed, 11 Mar 2009)
New Revision: 25610

Log:
gmpc: needs gob2 installed on host, so check for it

Modified:
   trunk/buildroot/package/gmpc/gmpc.mk


Changeset:
Modified: trunk/buildroot/package/gmpc/gmpc.mk
===================================================================
--- trunk/buildroot/package/gmpc/gmpc.mk	2009-03-11 15:43:43 UTC (rev 25609)
+++ trunk/buildroot/package/gmpc/gmpc.mk	2009-03-11 15:43:47 UTC (rev 25610)
@@ -20,3 +20,10 @@
 endif
 
 $(eval $(call AUTOTARGETS,package,gmpc))
+
+# we NEED a host gob2
+ifeq ($(BR2_PACKAGE_GMPC),y)
+ifeq ($(wildcard $(shell which gob2 || echo /usr/bin/gob2)),)
+$(error Host gob2 not found. Please install GTK+ Object Builder package on your host (something like gob2))
+endif
+endif
