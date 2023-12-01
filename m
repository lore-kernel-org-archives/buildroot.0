Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DCCC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDC8B40492;
	Fri,  1 Dec 2023 20:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDC8B40492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjECZ-b3qvio; Fri,  1 Dec 2023 20:03:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADA3443761;
	Fri,  1 Dec 2023 20:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADA3443761
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 324B61BF2C0
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B4AB607AA
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B4AB607AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BsTm65INFTdg for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:03:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A21960783
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A21960783
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E99DD8770B; Fri,  1 Dec 2023 20:03:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Dec 2023 21:02:44 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: a17063e8ca72f69d119bcdd9c87067caf6a9dfdf
X-Git-Newrev: fb3f6d1d1eb3fe089ab751a3bf9fe27355f6e652
X-Patchwork-Hint: ignore
Message-Id: <20231201200348.E99DD8770B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/gsl: fix musl
 build on m68k
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb3f6d1d1eb3fe089ab751a3bf9fe27355f6e652
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Update patch to fix the following musl build failure with m68k which is
only raised (for an unknown reason) since bump to version 2.7.1 in commit
3e48f8358e519f9c24262a6549d8f6c78ee01add:

In file included from fp.c:6:
fp-gnum68k.c:21:10: fatal error: fpu_control.h: No such file or directory
   21 | #include <fpu_control.h>
      |          ^~~~~~~~~~~~~~~

Add also upstream link to first patch iteration which was sent in
November 2022 but didn't get it any reply (like most of the other emails
sent to bug-gsl@gnu.org ...)

Fixes:
 - http://autobuild.buildroot.org/results/e59636f6ac148807c1c67f09eef0e0a9f5d52303

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 02e80e06c54af2863b622f1ecaa076656f1c16cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                      | 1 -
 package/gsl/0001-configure.ac-fix-build-on-powerpc.patch | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a779518b63..3c12cbc0e3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -547,7 +547,6 @@ package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch Up
 package/grpc/0002-wrap_memcpy.cc-add-GPR_DISABLE_WRAPPED_MEMCPY.patch Upstream
 package/grpc/0003-host-grpc-only-cpp-plugin.patch Upstream
 package/grpc/0004-disable-unconditionally-downloading-api-repos.patch Upstream
-package/gsl/0001-configure.ac-fix-build-on-powerpc.patch Upstream
 package/gstreamer1/gstd/0001-Don-t-require-gstd-check-user-xenv.sh-for-systemd-se.patch Upstream
 package/guile/0001-calculate-csqrt_manually.patch Upstream
 package/guile/0002-Makefile.am-fix-build-without-makeinfo.patch Upstream
diff --git a/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch b/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
index 13f6da4588..96ab780467 100644
--- a/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
+++ b/package/gsl/0001-configure.ac-fix-build-on-powerpc.patch
@@ -1,9 +1,9 @@
 From 84e62d57b90b41a0c96bb9fb6ec61ecaac76a1ab Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 5 Nov 2022 21:31:36 +0100
-Subject: [PATCH] configure.ac: fix build on powerpc
+Subject: [PATCH] configure.ac: fix build on powerpc and m68k
 
-Fix the following powerpc build failures on:
+Fix the following powerpc and m68k build failures on:
  - musl raised because fpu_control.h is not available:
 
 In file included from fp.c:8:
@@ -25,6 +25,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/48403946bb4cda9013e51db59c1b2ffdcf4e2854
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://lists.gnu.org/archive/html/bug-gsl/2022-11/msg00000.html
 ---
  configure.ac | 8 ++++++++
  1 file changed, 8 insertions(+)
@@ -37,7 +38,7 @@ index bfd9ca30..1ee6dca0 100644
     fi
  fi
  
-+if test "$ac_cv_c_ieee_interface" = "gnuppc" ; then
++if test "$ac_cv_c_ieee_interface" = "gnuppc" -o "$ac_cv_c_ieee_interface" = "gnum68k" ; then
 +    AC_CACHE_CHECK([for _FPU_RC_NEAREST], ac_cv_c__fpu_rc_nearest,
 +    [ac_cv_c__fpu_rc_nearest=no
 +    AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <fpu_control.h>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
