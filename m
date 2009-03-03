From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 21:23:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils/2.17
Message-ID: <20090303212335.A60467644B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 21:23:34 +0000 (Tue, 03 Mar 2009)
New Revision: 25512

Log:
binutils: 2.17: fix makeinfo 4.xx check

Fixes #111.

Added:
   trunk/buildroot/toolchain/binutils/2.17/500-fix-makeinfo-check.patch


Changeset:
Added: trunk/buildroot/toolchain/binutils/2.17/500-fix-makeinfo-check.patch
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17/500-fix-makeinfo-check.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17/500-fix-makeinfo-check.patch	2009-03-03 21:23:34 UTC (rev 25512)
@@ -0,0 +1,17 @@
+---
+ configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: binutils-2.17/configure
+===================================================================
+--- binutils-2.17.orig/configure
++++ binutils-2.17/configure
+@@ -3637,7 +3637,7 @@
+     # For an installed makeinfo, we require it to be from texinfo 4.4 or
+     # higher, else we use the "missing" dummy.
+     if ${MAKEINFO} --version \
+-       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null 2>&1; then
++       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|4\.[1-9][0-9]|[5-9])' >/dev/null 2>&1; then
+       :
+     else
+       MAKEINFO="$MISSING makeinfo"
