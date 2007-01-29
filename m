From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 09:02:32 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20070129170232.7B4E54859B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 09:02:31 -0800 (Mon, 29 Jan 2007)
New Revision: 17637

Log:
- bump version and make it behave of LFS is off


Added:
   trunk/buildroot/package/strace/strace-autoreconf.patch
   trunk/buildroot/package/strace/strace-fix-disabled-largefile-syscalls.patch
   trunk/buildroot/package/strace/strace-statfs64-check.patch
   trunk/buildroot/package/strace/strace-superh-update.ac.patch

Removed:
   trunk/buildroot/package/strace/strace-superh-update.patch

Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Added: trunk/buildroot/package/strace/strace-autoreconf.patch
===================================================================
--- trunk/buildroot/package/strace/strace-autoreconf.patch	                        (rev 0)
+++ trunk/buildroot/package/strace/strace-autoreconf.patch	2007-01-29 17:02:31 UTC (rev 17637)
@@ -0,0 +1,760 @@
+--- strace-4.5.15.orig/configure	2007-01-29 17:23:38.000000000 +0100
++++ strace-4.5.15/configure	2007-01-29 17:46:54.000000000 +0100
+@@ -956,7 +956,7 @@ esac
+     else
+       echo "$as_me: WARNING: no configuration information is in $ac_dir" >&2
+     fi
+-    cd $ac_popdir
++    cd "$ac_popdir"
+   done
+ fi
+ 
+@@ -2660,8 +2660,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -2719,8 +2718,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -2836,8 +2834,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -2891,8 +2888,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -2937,8 +2933,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -2982,8 +2977,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -3721,8 +3715,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -3786,8 +3779,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -3959,8 +3951,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4032,8 +4023,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4087,8 +4077,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4159,8 +4148,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4214,8 +4202,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4345,8 +4332,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4410,8 +4396,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4454,8 +4439,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4519,8 +4503,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4563,8 +4546,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4628,8 +4610,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4672,8 +4653,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4737,8 +4717,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4781,8 +4760,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4846,8 +4824,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4890,8 +4867,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4955,8 +4931,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -4999,8 +4974,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5064,8 +5038,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5108,8 +5081,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5173,8 +5145,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5217,8 +5188,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5286,8 +5256,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5320,6 +5289,73 @@ _ACEOF
+ 
+ fi
+ 
++echo "$as_me:$LINENO: checking for statfs64 in sys/(statfs|vfs).h" >&5
++echo $ECHO_N "checking for statfs64 in sys/(statfs|vfs).h... $ECHO_C" >&6
++if test "${ac_cv_type_statfs64+set}" = set; then
++  echo $ECHO_N "(cached) $ECHO_C" >&6
++else
++  cat >conftest.$ac_ext <<_ACEOF
++/* confdefs.h.  */
++_ACEOF
++cat confdefs.h >>conftest.$ac_ext
++cat >>conftest.$ac_ext <<_ACEOF
++/* end confdefs.h.  */
++#ifdef LINUX
++#include <linux/types.h>
++#include <sys/statfs.h>
++#else
++#include <sys/vfs.h>
++#endif
++int
++main ()
++{
++struct statfs64 st;
++  ;
++  return 0;
++}
++_ACEOF
++rm -f conftest.$ac_objext
++if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
++  (eval $ac_compile) 2>conftest.er1
++  ac_status=$?
++  grep -v '^ *+' conftest.er1 >conftest.err
++  rm -f conftest.er1
++  cat conftest.err >&5
++  echo "$as_me:$LINENO: \$? = $ac_status" >&5
++  (exit $ac_status); } &&
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
++  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  echo "$as_me:$LINENO: \$? = $ac_status" >&5
++  (exit $ac_status); }; } &&
++	 { ac_try='test -s conftest.$ac_objext'
++  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
++  (eval $ac_try) 2>&5
++  ac_status=$?
++  echo "$as_me:$LINENO: \$? = $ac_status" >&5
++  (exit $ac_status); }; }; then
++  ac_cv_type_statfs64=yes
++else
++  echo "$as_me: failed program was:" >&5
++sed 's/^/| /' conftest.$ac_ext >&5
++
++ac_cv_type_statfs64=no
++fi
++rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
++fi
++
++echo "$as_me:$LINENO: result: $ac_cv_type_statfs64" >&5
++echo "${ECHO_T}$ac_cv_type_statfs64" >&6
++if test "$ac_cv_type_statfs64" = yes
++then
++
++cat >>confdefs.h <<\_ACEOF
++#define HAVE_STATFS64 1
++_ACEOF
++
++fi
++
+ 
+ echo "$as_me:$LINENO: checking return type of signal handlers" >&5
+ echo $ECHO_N "checking return type of signal handlers... $ECHO_C" >&6
+@@ -5360,8 +5396,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5460,8 +5495,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5610,8 +5644,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5668,8 +5701,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5816,8 +5848,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -5968,8 +5999,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6033,8 +6063,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6100,8 +6129,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6147,8 +6175,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6214,8 +6241,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6466,8 +6492,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6532,8 +6557,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6600,8 +6624,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6717,8 +6740,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_l
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6812,8 +6834,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -6959,8 +6980,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7020,8 +7040,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7082,8 +7101,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7356,8 +7374,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7401,8 +7418,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7471,8 +7487,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7539,8 +7554,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7585,8 +7599,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7652,8 +7665,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7698,8 +7710,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7767,8 +7778,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7834,8 +7844,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7899,8 +7908,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -7966,8 +7974,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -8032,8 +8039,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -8077,8 +8083,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -8145,8 +8150,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -8218,8 +8222,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -8289,8 +8292,7 @@ if { (eval echo "$as_me:$LINENO: \"$ac_c
+   cat conftest.err >&5
+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); } &&
+-	 { ac_try='test -z "$ac_c_werror_flag"
+-			 || test ! -s conftest.err'
++	 { ac_try='test -z "$ac_c_werror_flag"			 || test ! -s conftest.err'
+   { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
+   (eval $ac_try) 2>&5
+   ac_status=$?
+@@ -9293,11 +9295,6 @@ esac
+   *) ac_INSTALL=$ac_top_builddir$INSTALL ;;
+   esac
+ 
+-  if test x"$ac_file" != x-; then
+-    { echo "$as_me:$LINENO: creating $ac_file" >&5
+-echo "$as_me: creating $ac_file" >&6;}
+-    rm -f "$ac_file"
+-  fi
+   # Let's still pretend it is `configure' which instantiates (i.e., don't
+   # use $as_me), people would be surprised to read:
+   #    /* config.h.  Generated by config.status.  */
+@@ -9336,6 +9333,12 @@ echo "$as_me: error: cannot find input f
+ 	 fi;;
+       esac
+     done` || { (exit 1); exit 1; }
++
++  if test x"$ac_file" != x-; then
++    { echo "$as_me:$LINENO: creating $ac_file" >&5
++echo "$as_me: creating $ac_file" >&6;}
++    rm -f "$ac_file"
++  fi
+ _ACEOF
+ cat >>$CONFIG_STATUS <<_ACEOF
+   sed "$ac_vpsub

Added: trunk/buildroot/package/strace/strace-fix-disabled-largefile-syscalls.patch
===================================================================
--- trunk/buildroot/package/strace/strace-fix-disabled-largefile-syscalls.patch	                        (rev 0)
+++ trunk/buildroot/package/strace/strace-fix-disabled-largefile-syscalls.patch	2007-01-29 17:02:31 UTC (rev 17637)
@@ -0,0 +1,21 @@
+--- strace-4.5.15.orig/syscall.c	2007-01-29 17:23:38.000000000 +0100
++++ strace-4.5.15/syscall.c	2007-01-29 18:02:17.000000000 +0100
+@@ -125,6 +125,18 @@
+ #define TP TRACE_PROCESS
+ #define TS TRACE_SIGNAL
+ 
++#ifndef HAVE_STATFS64
++/*
++ * Ugly hacks for systems that do not have LFS
++ */
++
++#define sys_truncate64  sys_truncate
++#define sys_ftruncate64 sys_ftruncate
++#define sys_getdents64  sys_getdents
++#define sys_statfs64    sys_statfs
++#define sys_fstatfs64   sys_fstatfs
++#endif
++
+ static const struct sysent sysent0[] = {
+ #include "syscallent.h"
+ };

Added: trunk/buildroot/package/strace/strace-statfs64-check.patch
===================================================================
--- trunk/buildroot/package/strace/strace-statfs64-check.patch	                        (rev 0)
+++ trunk/buildroot/package/strace/strace-statfs64-check.patch	2007-01-29 17:02:31 UTC (rev 17637)
@@ -0,0 +1,53 @@
+diff -dup strace-4.5.15.orig/acinclude.m4 strace-4.5.15/acinclude.m4
+--- strace-4.5.15.orig/acinclude.m4	2004-04-14 04:21:01.000000000 +0200
++++ strace-4.5.15/acinclude.m4	2007-01-29 17:31:37.000000000 +0100
+@@ -210,6 +210,26 @@ then
+ fi
+ ])
+ 
++dnl ### A macro to determine whether statfs64 is defined.
++AC_DEFUN([AC_STATFS64],
++[AC_MSG_CHECKING(for statfs64 in sys/(statfs|vfs).h)
++AC_CACHE_VAL(ac_cv_type_statfs64,
++[AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#ifdef LINUX
++#include <linux/types.h>
++#include <sys/statfs.h>
++#else
++#include <sys/vfs.h>
++#endif]], [[struct statfs64 st;]])],[ac_cv_type_statfs64=yes],[ac_cv_type_statfs64=no])])
++AC_MSG_RESULT($ac_cv_type_statfs64)
++if test "$ac_cv_type_statfs64" = yes
++then
++	AC_DEFINE([HAVE_STATFS64], 1,
++[Define if statfs64 is available in sys/statfs.h or sys/vfs.h.])
++fi
++])
++
++
++
+ dnl ### A macro to determine if off_t is a long long
+ AC_DEFUN([AC_OFF_T_IS_LONG_LONG],
+ [AC_MSG_CHECKING(for long long off_t)
+diff -dup strace-4.5.15.orig/configure.ac strace-4.5.15/configure.ac
+--- strace-4.5.15.orig/configure.ac	2007-01-11 12:37:55.000000000 +0100
++++ strace-4.5.15/configure.ac	2007-01-29 17:32:02.000000000 +0100
+@@ -169,6 +169,7 @@ AC_CHECK_MEMBERS([struct stat.st_blksize
+ 		  struct stat.st_level,
+ 		  struct stat.st_rdev])
+ AC_STAT64
++AC_STATFS64
+ 
+ AC_TYPE_SIGNAL
+ AC_TYPE_UID_T
+diff -dup strace-4.5.15.orig/file.c strace-4.5.15/file.c
+--- strace-4.5.15.orig/file.c	2007-01-15 21:25:52.000000000 +0100
++++ strace-4.5.15/file.c	2007-01-29 17:33:15.000000000 +0100
+@@ -1635,7 +1635,7 @@ struct tcb *tcp;
+ 	return 0;
+ }
+ 
+-#ifdef LINUX
++#ifdef HAVE_STATFS64
+ static void
+ printstatfs64(tcp, addr)
+ struct tcb *tcp;

Added: trunk/buildroot/package/strace/strace-superh-update.ac.patch
===================================================================
--- trunk/buildroot/package/strace/strace-superh-update.ac.patch	                        (rev 0)
+++ trunk/buildroot/package/strace/strace-superh-update.ac.patch	2007-01-29 17:02:31 UTC (rev 17637)
@@ -0,0 +1,22 @@
+--- strace-4.5.15.orig/configure.ac	2007-01-11 12:37:55.000000000 +0100
++++ strace-4.5.15/configure.ac	2007-01-29 17:38:26.000000000 +0100
+@@ -91,14 +91,14 @@ hppa*|parisc*)
+ 	arch=hppa
+ 	AC_DEFINE([HPPA], 1, [Define for the HPPA architecture.])
+ 	;;
+-sh)
+-	arch=sh
+-	AC_DEFINE([SH], 1, [Define for the SH architecture.])
+-	;;
+ sh64)
+ 	arch=sh64
+ 	AC_DEFINE([SH64], 1, [Define for the SH64 architecture.])
+ 	;;
++sh*)
++	arch=sh
++	AC_DEFINE([SH], 1, [Define for the SH architecture.])
++	;;
+ x86?64*)
+ 	arch=x86_64
+ 	AC_DEFINE([X86_64], 1, [Define for the AMD x86-64 architecture.])
+

Deleted: trunk/buildroot/package/strace/strace-superh-update.patch
===================================================================
--- trunk/buildroot/package/strace/strace-superh-update.patch	2007-01-29 16:44:43 UTC (rev 17636)
+++ trunk/buildroot/package/strace/strace-superh-update.patch	2007-01-29 17:02:31 UTC (rev 17637)
@@ -1,28 +0,0 @@
---- strace/configure
-+++ strace/configure
-@@ -1993,19 +1993,19 @@
- _ACEOF
- 
- 	;;
--sh)
--	arch=sh
-+sh64)
-+	arch=sh64
- 
- cat >>confdefs.h <<\_ACEOF
--#define SH 1
-+#define SH64 1
- _ACEOF
- 
- 	;;
--sh64)
--	arch=sh64
-+sh*)
-+	arch=sh
- 
- cat >>confdefs.h <<\_ACEOF
--#define SH64 1
-+#define SH 1
- _ACEOF
- 
- 	;;

Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2007-01-29 16:44:43 UTC (rev 17636)
+++ trunk/buildroot/package/strace/strace.mk	2007-01-29 17:02:31 UTC (rev 17637)
@@ -3,12 +3,16 @@
 # strace
 #
 #############################################################
-STRACE_VER:=4.5.14
+STRACE_VER:=4.5.15
 STRACE_SOURCE:=strace-$(STRACE_VER).tar.bz2
 STRACE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/strace
 STRACE_CAT:=$(BZCAT)
 STRACE_DIR:=$(BUILD_DIR)/strace-$(STRACE_VER)
 
+BR2_STRACE_CFLAGS:=
+ifeq ($(BR2_LARGEFILE),)
+BR2_STRACE_CFLAGS+=-U_LARGEFILE64_SOURCE -U__USE_LARGEFILE64 -U__USE_FILE_OFFSET64
+endif
 
 $(DL_DIR)/$(STRACE_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(STRACE_SITE)/$(STRACE_SOURCE)
@@ -18,12 +22,14 @@
 $(STRACE_DIR)/.unpacked: $(DL_DIR)/$(STRACE_SOURCE)
 	$(STRACE_CAT) $(DL_DIR)/$(STRACE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(STRACE_DIR) package/strace strace\*.patch
+	$(CONFIG_UPDATE) $(STRACE_DIR)
 	touch $(STRACE_DIR)/.unpacked
 
 $(STRACE_DIR)/.configured: $(STRACE_DIR)/.unpacked
 	(cd $(STRACE_DIR); rm -rf config.cache; \
+		$(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS) $(BR2_STRACE_CFLAGS)" \
 		aaa_ac_cv_header_linux_if_packet_h=yes \
 		./configure \
 		--target=$(REAL_GNU_TARGET_NAME) \
