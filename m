From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 15:47:47 -0500 (EST)
Subject: [Buildroot] [PATCH] allow module-init-tools on uClinux
Message-ID: <alpine.LFD.2.00.0812031545010.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matching *-*-linux* is too restrictive.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: package/module-init-tools/module-init-tools-match-uclinux.patch
===================================================================
--- package/module-init-tools/module-init-tools-match-uclinux.patch	(revision 0)
+++ package/module-init-tools/module-init-tools-match-uclinux.patch	(revision 0)
@@ -0,0 +1,23 @@
+# relax target match to also include uclinux
+--- module-init-tools-3.2.2/configure.orig	2008-11-27 12:26:35.000000000 -0500
++++ module-init-tools-3.2.2/configure	2008-11-27 12:26:47.000000000 -0500
+@@ -2818,7 +2818,7 @@
+ 
+ 
+ case $target in
+-*-*-linux*) ;;
++*-*linux*) ;;
+ *) { { echo "$as_me:$LINENO: error: Linux only, dude!" >&5
+ echo "$as_me: error: Linux only, dude!" >&2;}
+    { (exit 1); exit 1; }; };;
+--- module-init-tools-3.2.2/configure.in.orig	2008-11-27 12:26:14.000000000 -0500
++++ module-init-tools-3.2.2/configure.in	2008-11-27 12:26:56.000000000 -0500
+@@ -21,7 +21,7 @@
+ AC_SUBST(LDADD)
+ 
+ case $target in
+-*-*-linux*) ;;
++*-*linux*) ;;
+ *) AC_MSG_ERROR([Linux only, dude!]);;
+ esac
+ 
