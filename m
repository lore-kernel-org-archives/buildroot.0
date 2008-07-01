From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  1 Jul 2008 14:36:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb:  6.8
Message-ID: <20080701213612.1D2223C67C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-01 14:36:11 -0700 (Tue, 01 Jul 2008)
New Revision: 22599

Log:
Add gdb-6.8 support, courtesy Fathi Boudra

Added:
   trunk/buildroot/toolchain/gdb/6.8/
   trunk/buildroot/toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch


Changeset:
Added: trunk/buildroot/toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch
===================================================================
--- trunk/buildroot/toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gdb/6.8/600-fix-compile-flag-mismatch.patch	2008-07-01 21:36:11 UTC (rev 22599)
@@ -0,0 +1,31 @@
+--- a/gdb/gdbserver/configure
++++ b/gdb/gdbserver/configure
+@@ -1239,7 +1239,7 @@
+       ac_cache_corrupted=: ;;
+     ,);;
+     *)
+-      if test "x$ac_old_val" != "x$ac_new_val"; then
++      if test "`echo x$ac_old_val`" != "`echo x$ac_new_val`"; then
+ 	{ echo "$as_me:$LINENO: error: \`$ac_var' has changed since the previous run:" >&5
+ echo "$as_me: error: \`$ac_var' has changed since the previous run:" >&2;}
+ 	{ echo "$as_me:$LINENO:   former value:  $ac_old_val" >&5
+--- a/gdb/configure
++++ b/gdb/configure
+@@ -272,7 +272,7 @@
+ PACKAGE_BUGREPORT=
+ 
+ ac_unique_file="main.c"
+-ac_subdirs_all="$ac_subdirs_all doc testsuite"
++ac_subdirs_all="$ac_subdirs_all doc"
+ # Factoring default headers for most tests.
+ ac_includes_default="\
+ #include <stdio.h>
+@@ -3077,7 +3077,7 @@
+ 
+ 
+ 
+-subdirs="$subdirs doc testsuite"
++subdirs="$subdirs doc"
+ 
+ 
+ # Provide defaults for some variables set by the per-host and per-target
