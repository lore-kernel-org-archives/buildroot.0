Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D210BCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83853418F0;
	Sun, 24 Sep 2023 10:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83853418F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id va8Fj0Gz_rpF; Sun, 24 Sep 2023 10:36:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38A73418D9;
	Sun, 24 Sep 2023 10:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A73418D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80A9F1BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8A504171E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8A504171E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kaMGTcnJDhAs for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3698C4171C
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3698C4171C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D3B087580; Sun, 24 Sep 2023 10:33:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 12:24:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb8999f59b45c66e06209c9b1ea8de51dd3d5e04
X-Git-Newrev: 227d414ded61058b9cf41815b5683a84ece3aec2
X-Patchwork-Hint: ignore
Message-Id: <20230924103354.1D3B087580@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=227d414ded61058b9cf41815b5683a84ece3aec2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release:
https://github.com/alsa-project/alsa-lib/commit/c72bbed82513074fb5f0d474c7e88e2b4b945905

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.9_v1.2.10#alsa-lib

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...x-symver-build-error-on-non-ELF-platforms.patch | 84 ----------------------
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 3 files changed, 2 insertions(+), 86 deletions(-)

diff --git a/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch b/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
deleted file mode 100644
index 499bbb2ae4..0000000000
--- a/package/alsa-lib/0002-Fix-symver-build-error-on-non-ELF-platforms.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 317aafb133ed797c4cd62599565a77ecc595daea Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Thu, 29 Jun 2023 07:57:21 +0200
-Subject: [PATCH] Fix symver build error on non-ELF platforms
-
-The following error is observed on Microblaze [1] build:
-
-    error: symver is only supported on ELF platforms
-
-due to using __attribute__((symver)) on non-ELF platform.
-
-[1] http://autobuild.buildroot.net/results/1e9/1e965d83d75615f35308440c5db044314a349357/build-end.log
-
-ac_check_attribute_symver.m4 was downloaded from
-https://github.com/smuellerDD/libkcapi/blob/master/m4/ac_check_attribute_symver.m4
-
-Upstream: https://github.com/alsa-project/alsa-lib/pull/334
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- configure.ac                    |  1 +
- include/alsa-symbols.h          |  2 +-
- m4/ac_check_attribute_symver.m4 | 24 ++++++++++++++++++++++++
- 3 files changed, 26 insertions(+), 1 deletion(-)
- create mode 100644 m4/ac_check_attribute_symver.m4
-
-diff --git a/configure.ac b/configure.ac
-index 0588eec3..71ec0b15 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -46,6 +46,7 @@ dnl Checks for typedefs, structures, and compiler characteristics.
- AC_C_CONST
- AC_C_INLINE
- AC_HEADER_TIME
-+AC_CHECK_ATTRIBUTE_SYMVER
- 
- dnl Checks for library functions.
- AC_PROG_GCC_TRADITIONAL
-diff --git a/include/alsa-symbols.h b/include/alsa-symbols.h
-index f8c49103..521e5956 100644
---- a/include/alsa-symbols.h
-+++ b/include/alsa-symbols.h
-@@ -29,7 +29,7 @@
- #define INTERNAL_CONCAT2_2(Pre, Post) Pre##Post
- #define INTERNAL(Name) INTERNAL_CONCAT2_2(__, Name)
- 
--#if __GNUC__ > 10
-+#if HAVE_ATTRIBUTE_SYMVER && __GNUC__ > 10
- #define symbol_version(real, name, version) \
- 	extern __typeof (real) real __attribute__((symver (#name "@" #version)))
- #define default_symbol_version(real, name, version) \
-diff --git a/m4/ac_check_attribute_symver.m4 b/m4/ac_check_attribute_symver.m4
-new file mode 100644
-index 00000000..b484c5eb
---- /dev/null
-+++ b/m4/ac_check_attribute_symver.m4
-@@ -0,0 +1,24 @@
-+dnl Check compiler support for symver function attribute
-+AC_DEFUN([AC_CHECK_ATTRIBUTE_SYMVER], [
-+	saved_CFLAGS=$CFLAGS
-+	CFLAGS="-O0 -Werror"
-+	AC_COMPILE_IFELSE(
-+		[AC_LANG_PROGRAM(
-+			[[
-+				void _test_attribute_symver(void);
-+				__attribute__((__symver__("sym@VER_1.2.3"))) void _test_attribute_symver(void) {}
-+			]],
-+			[[ 
-+				_test_attribute_symver()
-+			]]
-+		)],
-+		[
-+			AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 1, [Define to 1 if __attribute__((symver)) is supported])
-+		],
-+		[
-+			AC_DEFINE([HAVE_ATTRIBUTE_SYMVER], 0, [Define to 0 if __attribute__((symver)) is not supported])
-+		]
-+	)
-+	CFLAGS=$saved_CFLAGS
-+])
-+
--- 
-2.39.2
-
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index f6735cd540..a6d9c7dbdc 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2  alsa-lib-1.2.9.tar.bz2
+sha256  c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e  alsa-lib-1.2.10.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 70f4c969d5..5dfcd1e861 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.9
+ALSA_LIB_VERSION = 1.2.10
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
