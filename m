From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun, 24 Feb 2008 16:17:36 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/binutils/2.17.50.0.12
Message-ID: <20080225001736.E4AD412C6D3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2008-02-24 16:17:36 -0800 (Sun, 24 Feb 2008)
New Revision: 21109

Log:
Fix 'makeinfo' failure.


Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-makeinfo-version.patch


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-makeinfo-version.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-makeinfo-version.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-makeinfo-version.patch	2008-02-25 00:17:36 UTC (rev 21109)
@@ -0,0 +1,16 @@
+diff -ur binutils-2.17.50.0.12/configure binutils-2.17.50.0.12-patched/configure
+--- binutils-2.17.50.0.12/configure	2007-01-23 15:37:00.000000000 -0600
++++ binutils-2.17.50.0.12-patched/configure	2008-01-26 15:15:40.018188886 -0600
+@@ -3835,10 +3835,10 @@
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
