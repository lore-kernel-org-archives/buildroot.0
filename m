From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu,  4 Jan 2007 12:24:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20070104202428.D0FC748585@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-04 12:24:28 -0800 (Thu, 04 Jan 2007)
New Revision: 17158

Log:
- fix typo


Modified:
   trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch	2007-01-04 18:02:32 UTC (rev 17157)
+++ trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch	2007-01-04 20:24:28 UTC (rev 17158)
@@ -28,7 +28,7 @@
          # Don't enable LFS with uClinux
          ;;
        *)
-+	if test x"$enable_lfs" = x"yes"; then
++	if test x"$enable_largefile" = x"yes"; then
          AC_DEFINE(_GLIBCXX_USE_LFS)
 +	fi
      esac
@@ -438,7 +438,7 @@
          # Don't enable LFS with uClinux
          ;;
        *)
-+	if test x"$enable_lfs" = x"yes"; then
++	if test x"$enable_largefile" = x"yes"; then
          cat >>confdefs.h <<\_ACEOF
  #define _GLIBCXX_USE_LFS 1
  _ACEOF
