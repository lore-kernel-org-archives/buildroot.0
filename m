From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:10:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gnuchess
Message-ID: <20080306181051.BD3AB1201F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:10:50 -0800 (Thu, 06 Mar 2008)
New Revision: 21195

Log:
added gnuchess

Added:
   trunk/buildroot/package/gnuchess/
   trunk/buildroot/package/gnuchess/Config.in
   trunk/buildroot/package/gnuchess/gnuchess-5.07.patch
   trunk/buildroot/package/gnuchess/gnuchess.mk


Changeset:
Added: trunk/buildroot/package/gnuchess/Config.in
===================================================================
--- trunk/buildroot/package/gnuchess/Config.in	                        (rev 0)
+++ trunk/buildroot/package/gnuchess/Config.in	2008-03-06 18:10:50 UTC (rev 21195)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GNUCHESS
+	bool "gnuchess"
+	default n
+	help
+	  GNU Chess lets most modern computers play a full game of chess.
+
+	  http://ftp.gnu.org/pub/gnu/chess

Added: trunk/buildroot/package/gnuchess/gnuchess-5.07.patch
===================================================================
--- trunk/buildroot/package/gnuchess/gnuchess-5.07.patch	                        (rev 0)
+++ trunk/buildroot/package/gnuchess/gnuchess-5.07.patch	2008-03-06 18:10:50 UTC (rev 21195)
@@ -0,0 +1,11 @@
+--- a/src/input.c	2003-07-01 13:06:43.000000000 -0400
++++ a/src/input.c	2008-02-13 12:24:43.000000000 -0500
+@@ -92,7 +92,7 @@ void getline_standard(char *p)
+   fgets(inputstr, MAXSTR, stdin);
+ }
+ 
+-static pthread_t input_thread;
++pthread_t input_thread;
+ 
+ /* Mutex and condition variable for thread communication */
+ 

Added: trunk/buildroot/package/gnuchess/gnuchess.mk
===================================================================
--- trunk/buildroot/package/gnuchess/gnuchess.mk	                        (rev 0)
+++ trunk/buildroot/package/gnuchess/gnuchess.mk	2008-03-06 18:10:50 UTC (rev 21195)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# gnuchess
+#
+#############################################################
+GNUCHESS_VERSION = 5.07
+GNUCHESS_SOURCE = gnuchess-$(GNUCHESS_VERSION).tar.gz
+GNUCHESS_SITE = http://ftp.gnu.org/pub/gnu/chess
+GNUCHESS_AUTORECONF = NO
+GNUCHESS_INSTALL_STAGING = NO
+GNUCHESS_INSTALL_TARGET = YES
+
+GNUCHESS_CONF_ENV = ac_cv_func_realloc_0_nonnull=yes ac_cv_func_malloc_0_nonnull=yes
+
+GNUCHESS_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,gnuchess))
+
