Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C93C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 20:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0789C8198A;
	Wed, 31 Jul 2024 20:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkLg8wDhGiHp; Wed, 31 Jul 2024 20:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E4981990
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E4981990;
	Wed, 31 Jul 2024 20:31:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA9631BF3F2
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8ADF40139
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 20:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2E_FYz_-SbD for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 20:31:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FDB940DFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FDB940DFA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FDB940DFA
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 20:31:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E80EDB0053D;
 Wed, 31 Jul 2024 22:31:49 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 22:31:43 +0200
Message-ID: <20240731203143.318400-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1722457911;
 bh=m7A88xMIaM6l4Vm/3dWeqeAvw6Y1/tfaeFFmzPkUceY=;
 h=From:To:Cc:Subject:Date:From;
 b=gYLnXRoydO2H4aY2zEsytrqna9i23T8rIR4/u8ZRdi/Uj7DyucGZVED4uYHe5ZeNV
 HmUglA8SNoaBEk8XQ+HuYAFFXBPPRfVQEBsc+dWhjtuy2PB6btMOgAgb5PeeWKJ8UK
 cGAl9CXkY1vp3G6eSofUJjeE127Y4yL5S4UIZpyVONLqzu6gr9RFk9FHCO0LlO4BYs
 chl72RC0U9DklYu4ScWrFIxcvGYxlkY4fEwuylUDyurnC8wtJw0oVFyD9451+ryw1c
 CZ8QQvZy2JRPBzLj7dckimBMp4dTtQlhWsY2KgFyN0Uex3WtFVDYSpS6SkpZeAnYO5
 oxeMzb/Srz3lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gYLnXRoy
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump version to 6.10
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v6.9.2, see:
https://github.com/kdave/btrfs-progs/blob/v6.10/CHANGES

This commit also drops the two package patches, which are now
included in this release.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...compat-fix-fallthrough-definition-fo.patch | 63 --------------
 ...uClibc-ng-compatibility-for-printf-f.patch | 85 -------------------
 package/btrfs-progs/btrfs-progs.hash          |  2 +-
 package/btrfs-progs/btrfs-progs.mk            |  2 +-
 4 files changed, 2 insertions(+), 150 deletions(-)
 delete mode 100644 package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch
 delete mode 100644 package/btrfs-progs/0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch

diff --git a/package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch b/package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch
deleted file mode 100644
index 588e9d4723..0000000000
--- a/package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 0d2bf742df7f6b6d91fff8abe3c2f8b6ef0e0c01 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Sun, 14 Jul 2024 12:52:33 +0200
-Subject: [PATCH] btrfs-progs: kerncompat: fix fallthrough definition for gcc
- 5.x and 6.x.
-
-Commit [1] 3a1d4aa089 "btrfs-progs: fix fallthrough cases with proper
-attributes" introduced a macro "fallthrough" to better handle compiler
-warnings of fallthrough situations.
-
-This macro is defined using the "__has_attribute" built-in
-function-like macro, which was introduced in GCC 5. See [2]. It then
-test for the "__fallthrough__" attribute, which was introduced in
-GCC 7. See [3].
-
-When compiling with a gcc version which supports "__has_attribute" and
-not the "__fallthrough__" attribute, compilation fails with error
-message:
-
-    common/format-output.c: In function 'print_escaped':
-    common/format-output.c:78:4: error: 'fallthrough' undeclared (first use in this function)
-        fallthrough;
-        ^
-btrfs-progs claim to support gcc at minimal version 4.8 in [4].
-
-This commit fixes this issue by adding the missing definition.
-
-The definition of the unsupported case is duplicated, because testing
-for "__has_attribute" and an attribute at the same time is not
-portable. See the cpp "__has_attribute" documentation [5].
-
-Note: the issue was found with Buildroot Linux [6], while testing with
-the command "utils/test-pkg -a -p btrfs-progs".
-
-[1] https://github.com/kdave/btrfs-progs/commit/3a1d4aa089419b7c94b31ff87122fa74907e1aa6
-[2] https://gcc.gnu.org/gcc-5/changes.html
-[3] https://gcc.gnu.org/gcc-7/changes.html
-[4] https://github.com/kdave/btrfs-progs/tree/v6.9.2#build-compatibility
-[5] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fattribute.html
-[6] https://buildroot.org/
-
-Upstream: Proposed: https://github.com/kdave/btrfs-progs/pull/842
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- include/kerncompat.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/kerncompat.h b/include/kerncompat.h
-index 31cd9d8d..bcd46bde 100644
---- a/include/kerncompat.h
-+++ b/include/kerncompat.h
-@@ -305,6 +305,8 @@ static inline void up_read(struct rw_semaphore *sem)
- #if defined __has_attribute
- # if __has_attribute(__fallthrough__)
- #  define fallthrough			__attribute__((__fallthrough__))
-+# else
-+#  define fallthrough			do {} while (0)  /* fallthrough */
- # endif
- #else
- # define fallthrough			do {} while (0)  /* fallthrough */
--- 
-2.45.2
-
diff --git a/package/btrfs-progs/0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch b/package/btrfs-progs/0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch
deleted file mode 100644
index b1b4fba519..0000000000
--- a/package/btrfs-progs/0002-btrfs-progs-add-uClibc-ng-compatibility-for-printf-f.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 0f34a362c8644f212138fb8de8e0fba54941e757 Mon Sep 17 00:00:00 2001
-From: Julien Olivain <ju.o@free.fr>
-Date: Sun, 14 Jul 2024 16:28:08 +0200
-Subject: [PATCH] btrfs-progs: add uClibc-ng compatibility for printf format
- %pV
-
-Commit [1] 164bc10d "btrfs-progs: add musl compatibility for printf
-format %pV" added a logic to detect the presence of the glibc
-<printf.h> header, and if present, to use the
-register_printf_specifier() and register_printf_modifier() functions.
-
-The original intent (as the commit log suggests), was to support the
-musl libc, which does not provides this <printf.h> header.
-
-When compiling with another libc, such as uClibc-ng, btrfs-progs fail
-to build with error:
-
-    common/messages.c: In function 'print_va_format':
-    common/messages.c:51:19: error: 'const struct printf_info' has no member named 'user'
-       51 |         if (!(info->user & va_modifier))
-          |                   ^~
-    common/messages.c: In function 'btrfs_no_printk':
-    common/messages.c:76:17: warning: implicit declaration of function 'register_printf_specifier'; did you mean 'register_printf_function'? [-Wimplicit-function-declaration]
-       76 |                 register_printf_specifier('V', print_va_format,
-          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
-          |                 register_printf_function
-    common/messages.c:78:31: warning: implicit declaration of function 'register_printf_modifier'; did you mean 'register_printf_function'? [-Wimplicit-function-declaration]
-       78 |                 va_modifier = register_printf_modifier(L"p");
-          |                               ^~~~~~~~~~~~~~~~~~~~~~~~
-          |                               register_printf_function
-
-This is because uClibc-ng provides a <printf.h> header, but not the
-register_printf_specifier() and register_printf_modifier() functions.
-See [2]. It mainly includes register_printf_function(). uClibc-ng
-emulates an older glibc behavior. Glibc added support for printf user
-elements in commit [3] (first included in glibc-2.10, in 2009). Checking
-only the <printf.h> is not sufficient.
-
-This commit fixes this build issue by refining the detection logic of
-the <printf.h> functions required by btrfs-progs.
-
-[1] https://github.com/kdave/btrfs-progs/commit/164bc10dfc08d8754d23ef0d6d7281e139d6cd53
-[2] https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/src/v1.0.49/include/printf.h
-[3] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=9d26efa90c6dcbcd6b3e586c9927b6058ef4d529
-
-Upstream: Proposed: https://github.com/kdave/btrfs-progs/pull/843
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- common/messages.h | 4 +++-
- configure.ac      | 4 ++++
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/common/messages.h b/common/messages.h
-index d6d4044d..aced7c9b 100644
---- a/common/messages.h
-+++ b/common/messages.h
-@@ -25,7 +25,9 @@
- /*
-  * Workaround for custom format %pV that may not be supported on all libcs.
-  */
--#ifdef HAVE_PRINTF_H
-+#if defined(HAVE_PRINTF_H) \
-+	&& defined(HAVE_REGISTER_PRINTF_SPECIFIER) \
-+	&& defined(HAVE_REGISTER_PRINTF_MODIFIER)
- #define DECLARE_PV(name)		struct va_format name
- #define PV_FMT				"%pV"
- #define PV_VAL(va)			&va
-diff --git a/configure.ac b/configure.ac
-index b69973b3..62b88973 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -95,6 +95,10 @@ AC_CHECK_HEADERS([linux/hw_breakpoint.h])
- AC_CHECK_HEADERS([linux/fsverity.h])
- AC_CHECK_HEADERS([printf.h])
- 
-+dnl Check for printf.h functions.
-+AC_CHECK_FUNCS([register_printf_specifier])
-+AC_CHECK_FUNCS([register_printf_modifier])
-+
- if grep -q 'HAVE_LINUX_FSVERITY_H.*1' confdefs.h; then
- 	have_fsverity='yes'
- else
--- 
-2.45.2
-
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 082e8c1cdc..f12c76c2ee 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  43865bb272dc0ab2585de3605434d81ba217578f0897bf700cd36c14ac40652a  btrfs-progs-v6.9.2.tar.xz
+sha256  3382a84e3fcfe1ffdea07a61ab3f4e86665d38fa35f1f34548d5df867423e0df  btrfs-progs-v6.10.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 69424a2d72..273c7e37f2 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 6.9.2
+BTRFS_PROGS_VERSION = 6.10
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
