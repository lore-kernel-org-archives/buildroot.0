From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Mar 2009 08:34:24 +0000 (UTC)
Subject: [Buildroot] svn commit: [25754] trunk/buildroot/package/liboil
Message-ID: <20090319083424.327CE7763E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-19 08:34:23 +0000 (Thu, 19 Mar 2009)
New Revision: 25754

Log:
liboil: don't build examples

Add patch missing from r25053.

Added:
   trunk/buildroot/package/liboil/liboil-0.3.15-no-examples.patch


Changeset:
Added: trunk/buildroot/package/liboil/liboil-0.3.15-no-examples.patch
===================================================================
--- trunk/buildroot/package/liboil/liboil-0.3.15-no-examples.patch	                        (rev 0)
+++ trunk/buildroot/package/liboil/liboil-0.3.15-no-examples.patch	2009-03-19 08:34:23 UTC (rev 25754)
@@ -0,0 +1,34 @@
+[patch] liboil: don't build examples
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ Makefile.am |    2 +-
+ Makefile.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: liboil-0.3.15/Makefile.am
+===================================================================
+--- liboil-0.3.15.orig/Makefile.am
++++ liboil-0.3.15/Makefile.am
+@@ -1,7 +1,7 @@
+ 
+ AUTOMAKE_OPTIONS = foreign
+ 
+-SUBDIRS = liboil testsuite examples doc
++SUBDIRS = liboil testsuite doc
+ 
+ EXTRA_DIST = COPYING autogen.sh gtk-doc.make HACKING BUG-REPORTING
+ 
+Index: liboil-0.3.15/Makefile.in
+===================================================================
+--- liboil-0.3.15.orig/Makefile.in
++++ liboil-0.3.15/Makefile.in
+@@ -259,7 +259,7 @@
+ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+ AUTOMAKE_OPTIONS = foreign
+-SUBDIRS = liboil testsuite examples doc
++SUBDIRS = liboil testsuite doc
+ EXTRA_DIST = COPYING autogen.sh gtk-doc.make HACKING BUG-REPORTING
+ DISTCHECK_CONFIGURE_FLAGS = --enable-gtk-doc
+ pkgconfig_DATA = liboil-$(LIBOIL_MAJORMINOR).pc
