Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88539C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 445E6605A4;
	Sat, 13 Jan 2024 21:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 445E6605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kfAxzaO89iZ1; Sat, 13 Jan 2024 21:18:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4355860F63;
	Sat, 13 Jan 2024 21:18:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4355860F63
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC701BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58CAF60B83
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58CAF60B83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uEnTmyo2yNHo for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDDB260EEE
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDDB260EEE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCB8E85ED9; Sat, 13 Jan 2024 21:15:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:45:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b034d1127aae5601bccc4b47356a34f86dfa3eb7
X-Git-Newrev: e6af32c08c8d47a71d6f8fa48439f3d87dcef2f6
X-Patchwork-Hint: ignore
Message-Id: <20240113211501.CCB8E85ED9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libkcapi: bump to version 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e6af32c08c8d47a71d6f8fa48439f3d87dcef2f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/smuellerDD/libkcapi/releases/tag/v1.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  3 -
 ...01-lib-kcapi-kernel-if.c-fix-uclibc-build.patch | 55 --------------
 package/libkcapi/0002-Add-disable-werror.patch     | 46 ------------
 ...x-symver-build-error-on-non-ELF-platforms.patch | 84 ----------------------
 package/libkcapi/libkcapi.hash                     |  2 +-
 package/libkcapi/libkcapi.mk                       |  2 +-
 6 files changed, 2 insertions(+), 190 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f66f4f9a64..7417e12e93 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -648,9 +648,6 @@ package/libiio/S99iiod Shellcheck Variables
 package/libiqrf/0001-cmake-handle-static-library-and-find-required-thread.patch Upstream
 package/libiqrf/0002-use-only-c-language.patch Upstream
 package/libjson/0001-fix-broken-makefile.patch Upstream
-package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch Upstream
-package/libkcapi/0002-Add-disable-werror.patch Upstream
-package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch Upstream
 package/libks/0001-CMakeLists.txt-honour-BUILD_TESTING.patch Upstream
 package/liblinear/0001-build-static-lib.patch Upstream
 package/liblockfile/0001-Makefile.in-fix-cross-compilation.patch Upstream
diff --git a/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch b/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch
deleted file mode 100644
index 818150dafb..0000000000
--- a/package/libkcapi/0001-lib-kcapi-kernel-if.c-fix-uclibc-build.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 4d9bbc866682bdf46c78047dca02230372620295 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 6 Nov 2022 17:05:14 +0100
-Subject: [PATCH] lib/kcapi-kernel-if.c: fix uclibc build
-
-Fix the following uclibc build failure raised since version 1.4.0 and
-https://github.com/smuellerDD/libkcapi/commit/12f19b9a1dd308117f83e8cb33e28e3c040710a0:
-
-lib/kcapi-kernel-if.c: In function '_kcapi_common_send_meta':
-lib/kcapi-kernel-if.c:196:26: error: conversion to 'int' from 'size_t' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
-  196 |         msg.msg_iovlen = kcapi_downcast_int(iovlen);
-      |                          ^~~~~~~~~~~~~~~~~~
-
-Indeed, uclibc has the same behavior than musl when __WORDSIZE != 32
-even if it defines __GLIBC__:
-https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887182948f627be/libc/sysdeps/linux/common/bits/socket.h
-
-Fixes:
- - http://autobuild.buildroot.org/results/eccf4b84670b5ef0fdd68b46338edf5043c7cc0d
-
-Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-[Retrieved from:
-https://github.com/smuellerDD/libkcapi/commit/4d9bbc866682bdf46c78047dca02230372620295]
----
- lib/kcapi-kernel-if.c | 8 ++------
- 1 file changed, 2 insertions(+), 6 deletions(-)
-
-diff --git a/lib/kcapi-kernel-if.c b/lib/kcapi-kernel-if.c
-index d7b10bf..b4d7f74 100644
---- a/lib/kcapi-kernel-if.c
-+++ b/lib/kcapi-kernel-if.c
-@@ -119,7 +119,7 @@ int _kcapi_common_accept(struct kcapi_handle *handle)
- 	return 0;
- }
- 
--#ifdef __GLIBC__
-+#if defined(__GLIBC__) && !(defined(__UCLIBC__) && __WORDSIZE == 32)
- static inline size_t kcapi_downcast_int(size_t in)
- {
- 	return in;
-@@ -564,11 +564,7 @@ ssize_t _kcapi_common_recv_data(struct kcapi_handle *handle,
- 	msg.msg_controllen = 0;
- 	msg.msg_flags = 0;
- 	msg.msg_iov = iov;
--#ifdef __GLIBC__
--	msg.msg_iovlen = iovlen;
--#else
--	msg.msg_iovlen = (int)iovlen;
--#endif
-+	msg.msg_iovlen = kcapi_downcast_int(iovlen);
- 	ret = recvmsg(*_kcapi_get_opfd(handle), &msg, 0);
- 	if (ret < 0)
- 		ret = -errno;
diff --git a/package/libkcapi/0002-Add-disable-werror.patch b/package/libkcapi/0002-Add-disable-werror.patch
deleted file mode 100644
index 4f2f55f145..0000000000
--- a/package/libkcapi/0002-Add-disable-werror.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From c27b154f03ad7e94447c7114d73aee60f0098093 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 7 Nov 2022 13:38:06 +0100
-Subject: [PATCH] Add --disable-werror
-
-Allow the user to disable -Werror through --disable-werror
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-[Retrieved from:
-https://github.com/smuellerDD/libkcapi/commit/c27b154f03ad7e94447c7114d73aee60f0098093]
----
- Makefile.am  | 5 ++++-
- configure.ac | 3 +++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 1c95d3d..cddedac 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,7 +2,10 @@ ACLOCAL_AMFLAGS = -I m4
- AUTOMAKE_OPTIONS = subdir-objects
- lib_LTLIBRARIES = libkcapi.la
- 
--COMMON_CPPFLAGS = -Wextra -Wall -pedantic -fwrapv --param ssp-buffer-size=4 -O2 -Werror -std=gnu99 -Wconversion
-+COMMON_CPPFLAGS = -Wextra -Wall -pedantic -fwrapv --param ssp-buffer-size=4 -O2 -std=gnu99 -Wconversion
-+if ENABLE_WERROR
-+COMMON_CPPFLAGS += -Werror
-+endif
- COMMON_LDFLAGS =  -Wl,-z,relro,-z,now
- 
- libtool: $(LIBTOOL_DEPS)
-diff --git a/configure.ac b/configure.ac
-index cb910e2..e230577 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -76,6 +76,9 @@ AX_ADD_FORTIFY_SOURCE
- 
- AC_CHECK_API_VERSION
- 
-+AC_ARG_ENABLE([werror], [AS_HELP_STRING([--disable-werror], [Disable -Werror])], [with_werror=$enableval], [with_werror=yes])
-+AM_CONDITIONAL([ENABLE_WERROR], [test "x$with_werror" = "xyes"])
-+
- AC_ARG_ENABLE([kcapi-test], [AS_HELP_STRING([--enable-kcapi-test], [Compile kcapi test program])], [with_kcapi_test=$enableval])
- AM_CONDITIONAL([ENABLE_KCAPI_TEST], [test "x$with_kcapi_test" = "xyes"])
- 
diff --git a/package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch b/package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch
deleted file mode 100644
index 206ac7ec4a..0000000000
--- a/package/libkcapi/0003-Fix-symver-build-error-on-non-ELF-platforms.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From f630ed1f807e26de04b3a5dfd7f1b39d1c5cb642 Mon Sep 17 00:00:00 2001
-From: Tan En De <ende.tan@starfivetech.com>
-Date: Sat, 26 Nov 2022 07:47:39 +0800
-Subject: [PATCH] Fix symver build error on non-ELF platforms
-
-The following error is observed on Microblaze [1] build:
-```
-error: symver is only supported on ELF platforms
-```
-due to using __attribute__((symver)) on non-ELF platform.
-So, revert to using .symver in such case.
-
-[1]: http://autobuild.buildroot.net/results/447/4470efb5a078c0e368f6bd4f5ec455eea5eeebb5/build-end.log
-
-Signed-off-by: Tan En De <ende.tan@starfivetech.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
----
-Upstream status: commit f630ed1f807e26de04b3a5dfd7f1b39d1c5cb642
-
- configure.ac                    |  2 ++
- lib/internal.h                  |  2 +-
- m4/ac_check_attribute_symver.m4 | 24 ++++++++++++++++++++++++
- 3 files changed, 27 insertions(+), 1 deletion(-)
- create mode 100644 m4/ac_check_attribute_symver.m4
-
-diff --git a/configure.ac b/configure.ac
-index e230577..ba17404 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -76,6 +76,8 @@ AX_ADD_FORTIFY_SOURCE
- 
- AC_CHECK_API_VERSION
- 
-+AC_CHECK_ATTRIBUTE_SYMVER
-+
- AC_ARG_ENABLE([werror], [AS_HELP_STRING([--disable-werror], [Disable -Werror])], [with_werror=$enableval], [with_werror=yes])
- AM_CONDITIONAL([ENABLE_WERROR], [test "x$with_werror" = "xyes"])
- 
-diff --git a/lib/internal.h b/lib/internal.h
-index 14844a9..7977b04 100644
---- a/lib/internal.h
-+++ b/lib/internal.h
-@@ -352,7 +352,7 @@ static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
-  * Auxiliary macros
-  ************************************************************/
- 
--#if __GNUC__ >= 10
-+#if HAVE_ATTRIBUTE_SYMVER && __GNUC__ >= 10
- # define IMPL_SYMVER(name, version) \
-     __attribute__((__symver__("kcapi_" #name "@@LIBKCAPI_" version)))
- 
-diff --git a/m4/ac_check_attribute_symver.m4 b/m4/ac_check_attribute_symver.m4
-new file mode 100644
-index 0000000..b484c5e
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
-2.34.1
-
diff --git a/package/libkcapi/libkcapi.hash b/package/libkcapi/libkcapi.hash
index d858086408..691ef0977a 100644
--- a/package/libkcapi/libkcapi.hash
+++ b/package/libkcapi/libkcapi.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  644b47593b3f27f08add7a8808ccdbe569a2f331d70fb8b52551e57379b917fa  libkcapi-1.4.0.tar.xz
+sha256  15b550c14165a266fa233b485d029d54508da593dfa6d1731ec5d5a285c716e9  libkcapi-1.5.0.tar.xz
 sha256  9765fad61726afb2b253db2c68153672e4178d6809667ae98141f3e90fe8645b  COPYING
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index c6251c286c..11462d6e2a 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKCAPI_VERSION = 1.4.0
+LIBKCAPI_VERSION = 1.5.0
 LIBKCAPI_SOURCE = libkcapi-$(LIBKCAPI_VERSION).tar.xz
 LIBKCAPI_SITE = http://www.chronox.de/libkcapi
 LIBKCAPI_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
