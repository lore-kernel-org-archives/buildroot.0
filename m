From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sat, 26 Jan 2008 12:52:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	2.17.50.0.16 2.17.50.0.17
Message-ID: <20080126205245.F064F12C56C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2008-01-26 12:52:45 -0800 (Sat, 26 Jan 2008)
New Revision: 20906

Log:
New patches for the makeinfo bug to older binutils.


Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.16/100-makeinfo-version.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.17/100-makeinfo-version.patch


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.17.50.0.16/100-makeinfo-version.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.16/100-makeinfo-version.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.16/100-makeinfo-version.patch	2008-01-26 20:52:45 UTC (rev 20906)
@@ -0,0 +1,32 @@
+diff -ur binutils-2.17.50.0.16/configure binutils-2.17.50.0.16-patched/configure
+--- binutils-2.17.50.0.16/configure	2007-03-23 10:41:48.000000000 -0500
++++ binutils-2.17.50.0.16-patched/configure	2008-01-26 14:26:39.418390940 -0600
+@@ -6111,10 +6111,10 @@
+   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
+   *)
+ 
+-    # For an installed makeinfo, we require it to be from texinfo 4.4 or
++    # For an installed makeinfo, we require it to be from texinfo 4.6 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"
+diff -ur binutils-2.17.50.0.16/configure.ac binutils-2.17.50.0.16-patched/configure.ac
+--- binutils-2.17.50.0.16/configure.ac	2007-03-23 10:41:48.000000000 -0500
++++ binutils-2.17.50.0.16-patched/configure.ac	2008-01-26 14:26:39.422390987 -0600
+@@ -2397,10 +2397,10 @@
+   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
+   *)
+ changequote(,)
+-    # For an installed makeinfo, we require it to be from texinfo 4.4 or
++    # For an installed makeinfo, we require it to be from texinfo 4.6 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"

Added: trunk/buildroot/toolchain/binutils/2.17.50.0.17/100-makeinfo-version.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.17/100-makeinfo-version.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.17/100-makeinfo-version.patch	2008-01-26 20:52:45 UTC (rev 20906)
@@ -0,0 +1,32 @@
+diff -ur binutils-2.17.50.0.17/configure binutils-2.17.50.0.17-patched/configure
+--- binutils-2.17.50.0.17/configure	2007-06-18 12:29:28.000000000 -0500
++++ binutils-2.17.50.0.17-patched/configure	2008-01-26 14:31:23.477741690 -0600
+@@ -6111,10 +6111,10 @@
+   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
+   *)
+ 
+-    # For an installed makeinfo, we require it to be from texinfo 4.4 or
++    # For an installed makeinfo, we require it to be from texinfo 4.6 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"
+diff -ur binutils-2.17.50.0.17/configure.ac binutils-2.17.50.0.17-patched/configure.ac
+--- binutils-2.17.50.0.17/configure.ac	2007-06-18 12:29:28.000000000 -0500
++++ binutils-2.17.50.0.17-patched/configure.ac	2008-01-26 14:31:23.481741737 -0600
+@@ -2397,10 +2397,10 @@
+   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
+   *)
+ changequote(,)
+-    # For an installed makeinfo, we require it to be from texinfo 4.4 or
++    # For an installed makeinfo, we require it to be from texinfo 4.6 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"
