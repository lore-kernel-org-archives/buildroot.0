From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 28 Sep 2007 09:26:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils: 2.18
	2.18.50.0.1
Message-ID: <20070928162641.56978A6ABD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-28 09:26:40 -0700 (Fri, 28 Sep 2007)
New Revision: 20086

Log:
- fix texinfo version check. The next release will most likely supercede these


Added:
   trunk/buildroot/toolchain/binutils/2.18.50.0.1/100-makeinfo-version.patch
   trunk/buildroot/toolchain/binutils/2.18/100-makeinfo-version.patch


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.18/100-makeinfo-version.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.18/100-makeinfo-version.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.18/100-makeinfo-version.patch	2007-09-28 16:26:40 UTC (rev 20086)
@@ -0,0 +1,32 @@
+diff -u binutils-2.18-orig/configure binutils-2.18/configure
+--- binutils-2.18-orig/configure	2007-08-06 16:29:40.000000000 -0400
++++ binutils-2.18/configure	2007-09-27 22:41:51.000000000 -0400
+@@ -6125,10 +6125,10 @@
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
+diff -u binutils-2.18-orig/configure.ac binutils-2.18/configure.ac
+--- binutils-2.18-orig/configure.ac	2007-08-28 16:24:26.000000000 -0400
++++ binutils-2.18/configure.ac	2007-09-27 22:41:00.000000000 -0400
+@@ -2400,10 +2400,10 @@
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

Added: trunk/buildroot/toolchain/binutils/2.18.50.0.1/100-makeinfo-version.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.18.50.0.1/100-makeinfo-version.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.18.50.0.1/100-makeinfo-version.patch	2007-09-28 16:26:40 UTC (rev 20086)
@@ -0,0 +1,32 @@
+diff -u binutils-2.18-orig/configure binutils-2.18/configure
+--- binutils-2.18-orig/configure	2007-08-06 16:29:40.000000000 -0400
++++ binutils-2.18/configure	2007-09-27 22:41:51.000000000 -0400
+@@ -6125,10 +6125,10 @@
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
+diff -u binutils-2.18-orig/configure.ac binutils-2.18/configure.ac
+--- binutils-2.18-orig/configure.ac	2007-08-28 16:24:26.000000000 -0400
++++ binutils-2.18/configure.ac	2007-09-27 22:41:00.000000000 -0400
+@@ -2400,10 +2400,10 @@
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
