Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1875C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:27:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE7A60EBD
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DE7A60EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C9440499;
	Tue, 26 Oct 2021 12:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcsEXZVND32B; Tue, 26 Oct 2021 12:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D910404A6;
	Tue, 26 Oct 2021 12:27:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D52721BF38D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4CD780D83
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8_a0FouXCpiP for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:27:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A21480D6A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:27:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E787788DD3; Tue, 26 Oct 2021 12:24:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 14:25:53 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: fff3c2c77dc1efe6b3416e0466f8ee649adf1727
X-Git-Newrev: fccedaf0d9e22c102ee9f5d0b2d7a4e41429ebf6
X-Patchwork-Hint: ignore
Message-Id: <20211026122409.E787788DD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/asterisk: fix
 build with autoconf >= 2.70
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fccedaf0d9e22c102ee9f5d0b2d7a4e41429ebf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

configure: error: *** ANSI C header files not found.

Fixes:
 - http://autobuild.buildroot.org/results/e7dc47da7863a5dc492154f620c4fcebafccf6ea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ae68285509b8519970697b78a48eb8a7287ca264)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uses-a-compile-failure-with-autoconf-2-70.patch | 171 +++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch b/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
new file mode 100644
index 0000000000..cced0bbae7
--- /dev/null
+++ b/package/asterisk/0006-AC_HEADER_STDC-causes-a-compile-failure-with-autoconf-2-70.patch
@@ -0,0 +1,171 @@
+From 060ce10163e46a740c15036fc56214468abc710b Mon Sep 17 00:00:00 2001
+From: Jaco Kroon <jaco@uls.co.za>
+Date: Fri, 8 Jan 2021 18:02:47 +0200
+Subject: [PATCH] AC_HEADER_STDC causes a compile failure with autoconf 2.70
+
+From https://www.mail-archive.com/bug-autoconf@gnu.org/msg04408.html
+
+> ... the long-obsolete AC_HEADER_STDC, previously used internally by
+> AC_INCLUDES_DEFAULT, used AC_EGREP_HEADER.  The AC_HEADER_STDC macro
+> is now a no-op (and is not used at all within Autoconf anymore), so
+> that change is likely what made the first use of AC_EGREP_HEADER the
+> one inside the if condition, causing the observed results.
+
+The implication is that the test does nothing anyway, and due to it
+being a no-op from 2.70 onwards, results in the required not being set
+to yes, resulting in ./configure to fail.
+
+Change-Id: Ic1ff38d87f791fbf1f2a80512f81bb7110392460
+Signed-off-by: Jaco Kroon <jaco@uls.co.za>
+
+[Retrieved from:
+https://github.com/asterisk/asterisk/commit/060ce10163e46a740c15036fc56214468abc710b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure    | 116 ---------------------------------------------------
+ configure.ac |   5 ---
+ 2 files changed, 121 deletions(-)
+
+diff --git a/configure b/configure
+index 3594ac62f0c..735a8e98c7f 100755
+--- a/configure
++++ b/configure
+@@ -13129,122 +13129,6 @@ if test -z $ac_header_dirent -o "$ac_header_dirent" = "no"; then
+   as_fn_error $? "*** Could not find dirent header that defines 'DIR'." "$LINENO" 5
+ fi
+ 
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for ANSI C header files" >&5
+-$as_echo_n "checking for ANSI C header files... " >&6; }
+-if ${ac_cv_header_stdc+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-#include <stdlib.h>
+-#include <stdarg.h>
+-#include <string.h>
+-#include <float.h>
+-
+-int
+-main ()
+-{
+-
+-  ;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_compile "$LINENO"; then :
+-  ac_cv_header_stdc=yes
+-else
+-  ac_cv_header_stdc=no
+-fi
+-rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+-
+-if test $ac_cv_header_stdc = yes; then
+-  # SunOS 4.x string.h does not declare mem*, contrary to ANSI.
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-#include <string.h>
+-
+-_ACEOF
+-if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "memchr" >/dev/null 2>&1; then :
+-
+-else
+-  ac_cv_header_stdc=no
+-fi
+-rm -f conftest*
+-
+-fi
+-
+-if test $ac_cv_header_stdc = yes; then
+-  # ISC 2.0.2 stdlib.h does not declare free, contrary to ANSI.
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-#include <stdlib.h>
+-
+-_ACEOF
+-if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "free" >/dev/null 2>&1; then :
+-
+-else
+-  ac_cv_header_stdc=no
+-fi
+-rm -f conftest*
+-
+-fi
+-
+-if test $ac_cv_header_stdc = yes; then
+-  # /bin/cc in Irix-4.0.5 gets non-ANSI ctype macros unless using -ansi.
+-  if test "$cross_compiling" = yes; then :
+-  :
+-else
+-  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+-/* end confdefs.h.  */
+-#include <ctype.h>
+-#include <stdlib.h>
+-#if ((' ' & 0x0FF) == 0x020)
+-# define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+-# define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+-#else
+-# define ISLOWER(c) \
+-		   (('a' <= (c) && (c) <= 'i') \
+-		     || ('j' <= (c) && (c) <= 'r') \
+-		     || ('s' <= (c) && (c) <= 'z'))
+-# define TOUPPER(c) (ISLOWER(c) ? ((c) | 0x40) : (c))
+-#endif
+-
+-#define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
+-int
+-main ()
+-{
+-  int i;
+-  for (i = 0; i < 256; i++)
+-    if (XOR (islower (i), ISLOWER (i))
+-	|| toupper (i) != TOUPPER (i))
+-      return 2;
+-  return 0;
+-}
+-_ACEOF
+-if ac_fn_c_try_run "$LINENO"; then :
+-
+-else
+-  ac_cv_header_stdc=no
+-fi
+-rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext \
+-  conftest.$ac_objext conftest.beam conftest.$ac_ext
+-fi
+-
+-fi
+-fi
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_header_stdc" >&5
+-$as_echo "$ac_cv_header_stdc" >&6; }
+-if test $ac_cv_header_stdc = yes; then
+-
+-$as_echo "#define STDC_HEADERS 1" >>confdefs.h
+-
+-fi
+-
+-if test "$ac_cv_header_stdc" != "yes"; then
+-  as_fn_error $? "*** ANSI C header files not found." "$LINENO" 5
+-fi
+-
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sys/wait.h that is POSIX.1 compatible" >&5
+ $as_echo_n "checking for sys/wait.h that is POSIX.1 compatible... " >&6; }
+ if ${ac_cv_header_sys_wait_h+:} false; then :
+diff --git a/configure.ac b/configure.ac
+index 9ae3769d02e..2260fe63268 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -616,11 +616,6 @@ if test -z $ac_header_dirent -o "$ac_header_dirent" = "no"; then
+   AC_MSG_ERROR([*** Could not find dirent header that defines 'DIR'.])
+ fi
+ 
+-AC_HEADER_STDC
+-if test "$ac_cv_header_stdc" != "yes"; then
+-  AC_MSG_ERROR([*** ANSI C header files not found.])
+-fi
+-
+ AC_HEADER_SYS_WAIT
+ if test "$ac_cv_header_sys_wait_h" != "yes"; then
+   AC_MSG_ERROR([*** POSIX.1 compatible sys/wait.h is required.])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
