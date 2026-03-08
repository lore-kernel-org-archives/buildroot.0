Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301D7EA8538
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 16:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E572A60711;
	Sun,  8 Mar 2026 16:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVWO9fop7gKv; Sun,  8 Mar 2026 16:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D246360EC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772988184;
	bh=gAWizGczWRphb1RIJ0lV3WopvqZQ1c+ytOtvKjp5HPk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nBdSSz/n88V1FCrl4+NnHFufUFsvXE+b1gQH0QXWVBJAFUFRMVfFhb0T88ajqumK+
	 dirBzJ4LzMVkbWXZZWTOPiqm9CsL7+P4co+9pF430snuU3bzD1URRBnREPW/X8jO4K
	 /zyLSXgs0ce9Jk7NQX+wbGy9/ETlPIYQKGLgw4yAFLKLt3miJ0sGx/SkMieRO9URQ0
	 hO99EfRBMBz+AhFVvoib1ZcaVcXqomnafc6Jh6w2d9jQfkC6obcTa9rXq2Jm/aYI+t
	 MQZJoHPO7KcC+NVlL15fwIzaRQi0Se3NLjNSzF6BJDcgIGQkLUzRLRMLqa9gPgTspm
	 xrVGlzn3EwO7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D246360EC2;
	Sun,  8 Mar 2026 16:43:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3786E223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 320DA60711
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wcG2mecLq6R for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 16:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC9660EC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFC9660EC2
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 16:43:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FBC485C71; Sun,  8 Mar 2026 16:43:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Mar 2026 17:39:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca02e86f882a427ff39926bcf6e8f15123eac56b
X-Git-Newrev: 227378b5930b681c79a13476ae60a98753a98a03
X-Patchwork-Hint: ignore
Message-Id: <20260308164301.0FBC485C71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: bump version to 2.43-10-gc3ceb93dc4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8641966581999977416=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8641966581999977416==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/227378b5930b681c79a13476ae60a98753a98a03
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Updated license files and hashes due to upstream commit:
https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe

Rebased patches 0001-0003.

Added patch 0004 to fix build on hosts with glibc < 2.40 due to
upstream commits:
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=f28a11e43f40df2ad92ece62b28ee004a8ad600b
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=42cc619dfbc44e263239c2de870bae11ad65810a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add info in commit log and patch 0004]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash                           |  6 +--
 package/glibc/glibc.mk                             |  4 +-
 ...001-HACK-only-build-and-install-localedef.patch |  8 +--
 ...ndency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 10 ++--
 ...ISOC23_SOURCE-undefined-to-build-localede.patch |  6 ++-
 ...ME_-MONOTONIC-ACTIVE-THREAD_ACTIVE-withou.patch | 62 ++++++++++++++++++++++
 package/localedef/localedef.mk                     |  2 +-
 7 files changed, 83 insertions(+), 15 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0a11cfdb5e..ed6d69acc2 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,7 +1,7 @@
 # Locally calculated (fetched from git)
-sha256  737e3b2bfee2e3e209e514133f4ff7d2bef0d0dc903fd46b4e2244f6c998f7b2  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz
+sha256  5e21722755f466d15770574788394a4abb4fb1e02603a707beeb199706a26a46  glibc-2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160-git4.tar.gz
 
 # Hashes for license files
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
 sha256  b22a69aa3f80a5201818c66cb0df0f25f9fa13cf5861b0093a058dbd12d50dce  LICENSES
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 80d21b86ed..64a2c58377 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,12 +7,12 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+GLIBC_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
-GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
+GLIBC_LICENSE_FILES = COPYINGv2 COPYING.LESSERv2 LICENSES
 GLIBC_CPE_ID_VENDOR = gnu
 
 # Extract the base version (e.g. 2.38) from GLIBC_VERSION in order to
diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
index dd3906eb37..b7c51c4ed3 100644
--- a/package/localedef/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
@@ -11,16 +11,18 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [yann.morin.1998@free.fr: rebase for 2.39]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+[Bernd: rebase for 2.43]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Rules           | 14 ++++++++++----
  locale/Makefile |  3 ---
  2 files changed, 10 insertions(+), 7 deletions(-)
 
 diff --git a/Rules b/Rules
-index 44c041c491..156c82619b 100644
+index b07400a979..4ce2180b49 100644
 --- a/Rules
 +++ b/Rules
-@@ -239,10 +239,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+@@ -247,10 +247,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
  
  ifneq "$(strip $(binaries-shared-notests))" ""
@@ -42,7 +44,7 @@ index 44c041c491..156c82619b 100644
  
  ifneq "$(strip $(binaries-shared-tests))" ""
 diff --git a/locale/Makefile b/locale/Makefile
-index 9d9c1a7691..4d26032c15 100644
+index fc38c02114..c00bc085b4 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -76,7 +76,6 @@ aux = \
diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index cc11c9a08c..30799cfc46 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -30,15 +30,17 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [yann.morin.1998@free.fr: rebase for 2.39]
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+[Bernd: rebase for 2.43]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 180e49d95b..fdb19d1d27 100755
+index 0cd2269859..1c7e42ec10 100755
 --- a/configure
 +++ b/configure
-@@ -5352,7 +5352,7 @@ printf %s "checking version of $LD... " >&6; }
+@@ -5350,7 +5350,7 @@ printf %s "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -47,11 +49,11 @@ index 180e49d95b..fdb19d1d27 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -5801,7 +5801,7 @@ int
+@@ -5799,7 +5799,7 @@ int
  main (void)
  {
  
--#if !defined __GNUC__ || __GNUC__ < 12 || (__GNUC__ == 12 && __GNUC_MINOR__ < 1)
+-#if (!defined __GNUC__ || __GNUC__ < 12 || (__GNUC__ == 12 && __GNUC_MINOR__ < 1)) && (!defined __clang__ || __clang_major__ < 18)
 +#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
  #error insufficient compiler
  #endif
diff --git a/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
index 5c3803d583..cf9c224a44 100644
--- a/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
+++ b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
@@ -14,15 +14,17 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
 [Thomas: adapted to glibc 2.40, which required the logic to be changed
 to _ISOC23_SOURCE]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Bernd: rebase for 2.43]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  include/features.h | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/include/features.h b/include/features.h
-index 8515b06b36..9abd65af93 100644
+index c080ad4260..230fd2539a 100644
 --- a/include/features.h
 +++ b/include/features.h
-@@ -217,9 +217,7 @@
+@@ -223,9 +223,7 @@
  # undef  _ISOC11_SOURCE
  # define _ISOC11_SOURCE	1
  # undef  _ISOC23_SOURCE
diff --git a/package/localedef/0004-HACK-use-TIME_-MONOTONIC-ACTIVE-THREAD_ACTIVE-withou.patch b/package/localedef/0004-HACK-use-TIME_-MONOTONIC-ACTIVE-THREAD_ACTIVE-withou.patch
new file mode 100644
index 0000000000..e3cbe3a6ad
--- /dev/null
+++ b/package/localedef/0004-HACK-use-TIME_-MONOTONIC-ACTIVE-THREAD_ACTIVE-withou.patch
@@ -0,0 +1,62 @@
+From 34e68bbb6631320bf2b64a00467fb5e59065bd43 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 6 Mar 2026 20:59:28 +0100
+Subject: [PATCH] HACK: use TIME_[MONOTONIC|ACTIVE|THREAD_ACTIVE] without
+ _ISOC23_SOURCE to build localedef with glibc < 2.40
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The Buildroot host-localdef package is built when
+BR2_GENERATE_LOCALE has a value defined.
+
+localdef is a tool from the glibc package, and is normally
+meant to be built with the glibc version it is included in.
+
+When Buildroot builds host-localedef, it will use the host glibc.
+When the host glibc version is < 2.40, the compilation fails with
+error:
+
+    ../include/time.h:545:11: error: ‘TIME_MONOTONIC’ undeclared
+     (first use in this function); did you mean ‘CLOCK_MONOTONIC’?
+    ../include/time.h:546:11: error: ‘TIME_ACTIVE’ undeclared
+     (first use in this function); did you mean ‘TIMER_ABSTIME’?
+    ../include/time.h:547:11: error: ‘TIME_THREAD_ACTIVE’ undeclared
+     (first use in this function)
+
+This error happen for example in the Buildroot Docker image
+(which is a Debian 12, glibc 2.36).
+
+This is because glibc < 2.40 does not define _ISOC23_SOURCE, which
+was added in upstream commit [1], and the previous Buildroot localedef
+package patch which also removes the _ISOC23_SOURCE definition.
+
+This patch workaround the situation by removing the condition around
+the missing definitions.
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=42cc619dfbc44e263239c2de870bae11ad65810a
+
+Upstream: Not applicable
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Julien: add extra info in commit log]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ time/time.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/time/time.h b/time/time.h
+index ae7beccb72..0a2e8e741f 100644
+--- a/time/time.h
++++ b/time/time.h
+@@ -67,8 +67,6 @@ typedef __pid_t pid_t;
+ #ifdef __USE_ISOC11
+ /* Time base values for timespec_get.  */
+ # define TIME_UTC 1
+-#endif
+-#if __GLIBC_USE (ISOC23)
+ # define TIME_MONOTONIC          2
+ # define TIME_ACTIVE             3
+ # define TIME_THREAD_ACTIVE      4
+-- 
+2.53.0
+
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 4da110417a..aa746a9d70 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+LOCALEDEF_VERSION = 2.43-10-gc3ceb93dc4f67253037644dc8f194831e27f3160
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git

--===============8641966581999977416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8641966581999977416==--
