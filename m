From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  5 Mar 2008 05:35:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20080305133525.0B2FF120129@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2008-03-05 05:35:23 -0800 (Wed, 05 Mar 2008)
New Revision: 21165

Log:
Fix patch. Apparently people don't know how to test their changes before
cheking them in.


Modified:
   trunk/buildroot/package/libpng/libpng-remove-setjmp-error.patch


Changeset:
Modified: trunk/buildroot/package/libpng/libpng-remove-setjmp-error.patch
===================================================================
--- trunk/buildroot/package/libpng/libpng-remove-setjmp-error.patch	2008-03-05 10:35:56 UTC (rev 21164)
+++ trunk/buildroot/package/libpng/libpng-remove-setjmp-error.patch	2008-03-05 13:35:23 UTC (rev 21165)
@@ -1,7 +1,7 @@
-diff -ur libpng-1.2.16/pngconf.h libpng-1.2.16-patched/pngconf.h
---- libpng-1.2.16/pngconf.h	2007-01-31 07:22:33.000000000 -0600
-+++ libpng-1.2.16-patched/pngconf.h	2008-02-27 17:40:23.707516659 -0600
-@@ -310,13 +310,6 @@
+diff -ur libpng-1.2.25/pngconf.h libpng-1.2.25-patched/pngconf.h
+--- libpng-1.2.25/pngconf.h	2008-02-18 16:31:05.000000000 -0600
++++ libpng-1.2.25-patched/pngconf.h	2008-03-05 07:30:22.900478085 -0600
+@@ -319,13 +319,6 @@
  #      define PNG_SAVE_BSD_SOURCE
  #      undef _BSD_SOURCE
  #    endif
@@ -9,7 +9,7 @@
 -     /* If you encounter a compiler error here, see the explanation
 -      * near the end of INSTALL.
 -      */
--         __png.h__ already includes setjmp.h;
+-         __pngconf.h__ already includes setjmp.h;
 -         __dont__ include it again.;
 -#    endif
  #  endif /* __linux__ */
