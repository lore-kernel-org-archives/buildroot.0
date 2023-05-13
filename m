Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB7C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB9A4295B;
	Sat, 13 May 2023 20:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EB9A4295B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhN4BXZWKvGl; Sat, 13 May 2023 20:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B66D42989;
	Sat, 13 May 2023 20:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B66D42989
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15BD21BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2009840EC
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2009840EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcgulA4tAlDd for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:45:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C5F6840EB
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:45:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C5F6840EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBDA886621; Sat, 13 May 2023 20:45:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 22:44:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b97f479a9fec0f430e06aad8cd45d698d9b294c1
X-Git-Newrev: b36e4b10f36866537aebe54f7538324c0efc5c17
X-Patchwork-Hint: ignore
Message-Id: <20230513204504.EBDA886621@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: bump to version 8.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b36e4b10f36866537aebe54f7538324c0efc5c17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://octave.org/NEWS-8.html

Notable changes in this commit:
- the package patch was rebased and updated for this new version
- a comment in .hash file about signature verification is added
- the pcre dependency is replaced by pcre2, following the upstream
  package recommendation and preference. See:
  https://octave.org/NEWS-8.html#general-improvements
  This change also adds the host-pkgconf as a dependency.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Fix-BLAS-library-integer-size-detection.patch     | 14 +++++++-------
 package/octave/Config.in                                   |  3 +--
 package/octave/octave.hash                                 |  6 ++++--
 package/octave/octave.mk                                   |  5 +++--
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch b/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch
index 3fb609de07..6603295e03 100644
--- a/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch
+++ b/package/octave/0001-Fix-BLAS-library-integer-size-detection.patch
@@ -1,4 +1,4 @@
-From e4dcfefac4215ee66c3dda5b067dd6d06066b0a2 Mon Sep 17 00:00:00 2001
+From 75b973373ed2e9a7a30f62dfe330299306ecff75 Mon Sep 17 00:00:00 2001
 From: Julien Olivain <ju.o@free.fr>
 Date: Sat, 5 Mar 2022 12:36:09 +0100
 Subject: [PATCH] Fix BLAS library integer size detection
@@ -19,22 +19,22 @@ Signed-off-by: Julien Olivain <ju.o@free.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index de7a00a330..383ce27b06 100644
+index 4092e5915d..f4ea2c1987 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -781,6 +781,12 @@ if test $ax_blas_ok = no || test $ax_lapack_ok = no; then
+@@ -757,6 +757,12 @@ if test $ax_blas_ok = no || test $ax_lapack_ok = no; then
    AC_MSG_ERROR([BLAS and LAPACK libraries are required])
  fi
  
 +if ac_fn_f77_try_run "$LINENO"; then :
-+  ax_blas_integer_size=8
++  ax_cv_blas_integer_size=8
 +else
-+  ax_blas_integer_size=4
++  ax_cv_blas_integer_size=4
 +fi
 +
- case $ax_blas_integer_size in
+ case $ax_cv_blas_integer_size in
    4)
      HAVE_64_BIT_BLAS=no
 -- 
-2.36.0
+2.39.2
 
diff --git a/package/octave/Config.in b/package/octave/Config.in
index 171bdfa156..73e27f65e8 100644
--- a/package/octave/Config.in
+++ b/package/octave/Config.in
@@ -13,8 +13,7 @@ config BR2_PACKAGE_OCTAVE
 	# used by the "utils/test-pkg" script.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BOOTLIN || !BR2_x86_64
 	select BR2_PACKAGE_OPENBLAS
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_PCRE_UTF
+	select BR2_PACKAGE_PCRE2
 	help
 	  GNU Octave is a high-level language, primarily intended for
 	  numerical computations. It provides a convenient command
diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 9696f2a00a..f301feb6fd 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  fdb32602252289e068431329add2eed146e6f26301cbb5fc4412f9d972db9475  octave-7.3.0.tar.lz
+# Locally computed after checking signature
+# https://ftp.gnu.org/gnu/octave/octave-8.1.0.tar.lz.sig
+# using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
+sha256  79f35c249e5ed71c6cafcf26ef72ffcf4845637093efde309b499a6690154b4f  octave-8.1.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 647f988a3f..63265e7d25 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 7.3.0
+OCTAVE_VERSION = 8.1.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
@@ -15,8 +15,9 @@ OCTAVE_CONF_OPTS = --disable-java
 
 OCTAVE_DEPENDENCIES = \
 	host-gperf \
+	host-pkgconf \
 	openblas \
-	pcre
+	pcre2
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
 OCTAVE_CONF_OPTS += --enable-readline
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
