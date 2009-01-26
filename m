From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 18:17:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
Message-ID: <20090126181758.A94D4768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 18:17:57 +0000 (Mon, 26 Jan 2009)
New Revision: 25057

Log:
libglib2: halt build early with description if host glib-genmarshal isn't found

Modified:
   trunk/buildroot/package/libglib2/libglib2.mk


Changeset:
Modified: trunk/buildroot/package/libglib2/libglib2.mk
===================================================================
--- trunk/buildroot/package/libglib2/libglib2.mk	2009-01-26 16:25:17 UTC (rev 25056)
+++ trunk/buildroot/package/libglib2/libglib2.mk	2009-01-26 18:17:57 UTC (rev 25057)
@@ -62,3 +62,10 @@
 endif
 
 $(eval $(call AUTOTARGETS,package,libglib2))
+
+# we NEED a host glib-genmarshal
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+ifeq ($(wildcard $(HOST_GLIB)/bin/glib-genmarshal),)
+$(error Host glib-genmarshal not found. Please install glib development package on your host (something like libglib2.0-dev))
+endif
+endif
