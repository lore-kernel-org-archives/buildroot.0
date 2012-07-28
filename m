From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 28 Jul 2012 18:30:06 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: add
	libglib2-libtool-remove-builddir-from-rpath.patch
Message-ID: <1343493006-5152-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 package/libglib2/libglib2-libtool-remove-builddir-from-rpath.patch

diff --git a/package/libglib2/libglib2-libtool-remove-builddir-from-rpath.patch b/package/libglib2/libglib2-libtool-remove-builddir-from-rpath.patch
new file mode 100644
index 0000000..a3d1af2
--- /dev/null
+++ b/package/libglib2/libglib2-libtool-remove-builddir-from-rpath.patch
@@ -0,0 +1,22 @@
+--- host-libglib2-2.30.2.orig/ltmain.sh	2012-07-28 11:46:14.976439251 +0200
++++ host-libglib2-2.30.2/ltmain.sh	2012-07-28 17:42:45.547223248 +0200
+@@ -398,6 +398,8 @@ case $progpath in
+      ;;
+ esac
+ 
++top_builddir="$progdir"
++
+ # Sed substitution that helps us do robust quoting.  It backslashifies
+ # metacharacters that are still active within double-quoted strings.
+ Xsed="${SED}"' -e 1s/^X//'
+@@ -8027,6 +8029,10 @@ EOF
+ 	  rpath="$finalize_rpath"
+ 	  test "$opt_mode" != relink && rpath="$compile_rpath$rpath"
+ 	  for libdir in $rpath; do
++	    case "$libdir" in
++	    "$top_buiddir"*) continue ;;
++	    *) ;;
++	    esac
+ 	    if test -n "$hardcode_libdir_flag_spec"; then
+ 	      if test -n "$hardcode_libdir_separator"; then
+ 		func_replace_sysroot "$libdir"
-- 
1.7.11.3
