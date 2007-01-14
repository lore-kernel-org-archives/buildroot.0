From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 13 Jan 2007 19:09:48 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070114030948.45D224859B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-01-13 19:09:47 -0800 (Sat, 13 Jan 2007)
New Revision: 17279

Log:
Make gettext have its own definition.


Added:
   trunk/buildroot/package/gettext/gettext-error_print_progname.patch


Changeset:
Added: trunk/buildroot/package/gettext/gettext-error_print_progname.patch
===================================================================
--- trunk/buildroot/package/gettext/gettext-error_print_progname.patch	                        (rev 0)
+++ trunk/buildroot/package/gettext/gettext-error_print_progname.patch	2007-01-14 03:09:47 UTC (rev 17279)
@@ -0,0 +1,12 @@
+diff -ur gettext-0.14.6/gettext-tools/lib/error.h gettext-0.14.6-patched/gettext-tools/lib/error.h
+--- gettext-0.14.6/gettext-tools/lib/error.h	2005-05-20 16:03:42.000000000 -0500
++++ gettext-0.14.6-patched/gettext-tools/lib/error.h	2007-01-13 20:57:24.422168053 -0600
+@@ -50,7 +50,7 @@
+ /* If NULL, error will flush stdout, then print on stderr the program
+    name, a colon and a space.  Otherwise, error will call this
+    function without parameters instead.  */
+-extern DLL_VARIABLE void (*error_print_progname) (void);
++void (*error_print_progname) (void);
+ 
+ /* This variable is incremented each time `error' is called.  */
+ extern DLL_VARIABLE unsigned int error_message_count;
