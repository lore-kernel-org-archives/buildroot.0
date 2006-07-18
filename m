From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 02:13:14 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk12
Message-ID: <20060718091313.7189F48BF5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 02:13:13 -0700 (Tue, 18 Jul 2006)
New Revision: 15715

Log:
fixup patch


Modified:
   trunk/buildroot/package/libgtk12/gtk+1.2-reconf.patch


Changeset:
Modified: trunk/buildroot/package/libgtk12/gtk+1.2-reconf.patch
===================================================================
--- trunk/buildroot/package/libgtk12/gtk+1.2-reconf.patch	2006-07-18 08:53:30 UTC (rev 15714)
+++ trunk/buildroot/package/libgtk12/gtk+1.2-reconf.patch	2006-07-18 09:13:13 UTC (rev 15715)
@@ -641,49 +641,3 @@
  AC_DEFUN(AM_GTK_WITH_NLS,
    [AC_MSG_CHECKING([whether NLS is requested])
      dnl Default is enabled NLS
---- gtk+-1.2.10/gtk-config.in~gtk+1.2-reconf-fix
-+++ gtk+-1.2.10/gtk-config.in
-@@ -1,10 +1,5 @@
- #!/bin/sh
- 
--glib_libs="@glib_libs@"
--glib_cflags="@glib_cflags@"
--glib_thread_libs="@glib_thread_libs@"
--glib_thread_cflags="@glib_thread_cflags@"
--
- prefix=@prefix@
- exec_prefix=@exec_prefix@
- exec_prefix_set=no
-@@ -86,27 +81,16 @@
- fi
- 
- if test "$lib_gthread" = "yes"; then
--      glib_cflags="$glib_thread_cflags"
--      glib_libs="$glib_thread_libs"
-+  modules="gtk+ gthread"
-+else
-+  modules="gtk+"
- fi
- 
- if test "$echo_cflags" = "yes"; then
--      echo -I@includedir@/gtk-1.2 $glib_cflags @x_cflags@ 
-+  echo `pkg-config --cflags $modules`
- fi
- 
- if test "$echo_libs" = "yes"; then
--      my_glib_libs=
--      libdirs=-L@libdir@
--      for i in $glib_libs ; do
--        if test $i != -L@libdir@ ; then
--          if test -z "$my_glib_libs" ; then
--            my_glib_libs="$i"
--          else
--            my_glib_libs="$my_glib_libs $i"
--          fi
--        fi
--      done
--
--      echo $libdirs @x_ldflags@ -lgtk -lgdk $my_glib_libs @INTLLIBS@ @x_libs@ @GDK_WLIBS@ -lm
-+  echo `pkg-config --libs $modules`
- fi      
- 
