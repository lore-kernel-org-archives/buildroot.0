Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD520CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 18:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 975E184603;
	Thu, 21 Aug 2025 18:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0YajnNRViUgh; Thu, 21 Aug 2025 18:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4279084627
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4279084627;
	Thu, 21 Aug 2025 18:57:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 710B31C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C9FE40DB7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 968REsJU7Prf for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D99407C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D99407C0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9DD487A05; Thu, 21 Aug 2025 18:56:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:38:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 19abfb5e1bf536a45decf49cfd8099aebe30e97f
X-Git-Newrev: 9e8a3796e6fd224b3ef2e785f1539173d7f1f1ec
X-Patchwork-Hint: ignore
Message-Id: <20250821185659.B9DD487A05@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/elfutils:
 security bump to v0.193
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3141055324178034267=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3141055324178034267==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=9e8a3796e6fd224b3ef2e785f1539173d7f1f1ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For more details on the version bump, see:
  - https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=47bf2c6a3b1f49c7adc1d0389de375290461a44c

Fixes the following security issues:

- CVE-2025-1352

    A vulnerability has been found in GNU elfutils 0.192 and classified as
    critical. This vulnerability affects the function __libdw_thread_tail
    in the library libdw_alloc.c of the component eu-readelf. The
    manipulation of the argument w leads to memory corruption. The attack
    can be initiated remotely. The complexity of an attack is rather high.
    The exploitation appears to be difficult. The exploit has been
    disclosed to the public and may be used. The name of the patch is
    2636426a091bd6c6f7f02e49ab20d4cdc6bfc753. It is recommended to apply a
    patch to fix this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-1352
  - https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=2636426a091bd6c6f7f02e49ab20d4cdc6bfc753

- CVE-2025-1365

    A vulnerability, which was classified as critical, was found in GNU
    elfutils 0.192. This affects the function process_symtab of the file
    readelf.c of the component eu-readelf. The manipulation of the
    argument D/a leads to buffer overflow. Local access is required to
    approach this attack. The exploit has been disclosed to the public and
    may be used. The identifier of the patch is
    5e5c0394d82c53e97750fe7b18023e6f84157b81. It is recommended to apply a
    patch to fix this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-1365
  - https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=5e5c0394d82c53e97750fe7b18023e6f84157b81

- CVE-2025-1371

    A vulnerability has been found in GNU elfutils 0.192 and classified as
    problematic. This vulnerability affects the function
    handle_dynamic_symtab of the file readelf.c of the component eu-read.
    The manipulation leads to null pointer dereference. Attacking locally
    is a requirement. The exploit has been disclosed to the public and may
    be used. The patch is identified as
    b38e562a4c907e08171c76b8b2def8464d5a104a. It is recommended to apply a
    patch to fix this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-1371
  - https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=b38e562a4c907e08171c76b8b2def8464d5a104a

- CVE-2025-1372

    A vulnerability was found in GNU elfutils 0.192. It has been declared
    as critical. Affected by this vulnerability is the function
    dump_data_section/print_string_section of the file readelf.c of the
    component eu-readelf. The manipulation of the argument z/x leads to
    buffer overflow. An attack has to be approached locally. The exploit
    has been disclosed to the public and may be used. The identifier of
    the patch is 73db9d2021cab9e23fd734b0a76a612d52a6f1db. It is
    recommended to apply a patch to fix this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-1372
  - https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=73db9d2021cab9e23fd734b0a76a612d52a6f1db

- CVE-2025-1376

    A vulnerability classified as problematic was found in GNU elfutils
    0.192. This vulnerability affects the function elf_strptr in the
    library /libelf/elf_strptr.c of the component eu-strip. The
    manipulation leads to denial of service. It is possible to launch the
    attack on the local host. The complexity of an attack is rather high.
    The exploitation appears to be difficult. The exploit has been
    disclosed to the public and may be used. The name of the patch is
    b16f441cca0a4841050e3215a9f120a6d8aea918. It is recommended to apply a
    patch to fix this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-1376
  - https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=b16f441cca0a4841050e3215a9f120a6d8aea918

- CVE-2025-1377

    A vulnerability, which was classified as problematic, has been found
    in GNU elfutils 0.192. This issue affects the function
    gelf_getsymshndx of the file strip.c of the component eu-strip. The
    manipulation leads to denial of service. The attack needs to be
    approached locally. The exploit has been disclosed to the public and
    may be used. The identifier of the patch is
    fbf1df9ca286de3323ae541973b08449f8d03aba. It is recommended to apply a
    patch to fix this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-1377
  - https://sourceware.org/git/?p=elfutils.git;a=commitdiff;h=fbf1df9ca286de3323ae541973b08449f8d03aba

Patch 0003 is now part of this release.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit c7508a23242aae7a80f22acc4473da25f7f9e96d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...d-a-enable-disable-progs-configure-option.patch | 16 ++--
 .../0003-define-user_pac_mask-if-needed.patch      | 97 ----------------------
 package/elfutils/elfutils.hash                     |  4 +-
 package/elfutils/elfutils.mk                       |  2 +-
 4 files changed, 12 insertions(+), 107 deletions(-)

diff --git a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
index 7f6dff94f0..b2b5a5d299 100644
--- a/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
+++ b/package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch
@@ -24,6 +24,8 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Rebased on 0.192]
 Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+[Rebased on 0.193]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
 ---
  Makefile.am  | 6 +++++-
  configure.ac | 8 +++++++-
@@ -33,7 +35,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 92130b57..00f5176b 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,8 +26,12 @@ AM_MAKEFLAGS = --no-print-directory
+@@ -28,8 +28,12 @@ AM_MAKEFLAGS = --no-print-directory
  
  pkginclude_HEADERS = version.h
  
@@ -41,17 +43,17 @@ index 92130b57..00f5176b 100644
 +PROGS_SUBDIR = src
 +endif
 +
- SUBDIRS = config lib libelf libcpu backends libebl libdwelf libdwfl libdw \
--	  libasm debuginfod src po doc tests
-+	  libasm debuginfod $(PROGS_SUBDIR) po doc tests
- 
+ SUBDIRS = config lib libelf libcpu backends libebl libdwelf libdwfl \
+-	  libdwfl_stacktrace libdw libasm debuginfod src po doc tests
++	  libdwfl_stacktrace libdw libasm debuginfod $(PROGS_SUBDIR) po doc tests
+
  EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING SECURITY \
  	     COPYING COPYING-GPLV2 COPYING-LGPLV3 CONDUCT
 diff --git a/configure.ac b/configure.ac
 index f191488f..87d91f8f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -426,6 +426,12 @@ AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
+@@ -427,6 +427,12 @@ AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
  	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
  AM_CONDITIONAL(TESTS_RPATH, test "$tests_use_rpath" = yes)
  
@@ -64,7 +66,7 @@ index f191488f..87d91f8f 100644
  dnl zlib is mandatory.
  save_LIBS="$LIBS"
  LIBS=
-@@ -670,7 +676,7 @@ saved_LIBS="$LIBS"
+@@ -671,7 +677,7 @@ saved_LIBS="$LIBS"
  AC_SEARCH_LIBS([_obstack_free], [obstack])
  LIBS="$saved_LIBS"
  case "$ac_cv_search__obstack_free" in
diff --git a/package/elfutils/0003-define-user_pac_mask-if-needed.patch b/package/elfutils/0003-define-user_pac_mask-if-needed.patch
deleted file mode 100644
index 2753a23094..0000000000
--- a/package/elfutils/0003-define-user_pac_mask-if-needed.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 52a747a316042e70a22acb489df9e51bfc6bf2d5 Mon Sep 17 00:00:00 2001
-From: Markus Mayer <mmayer@broadcom.com>
-Date: Fri, 21 Feb 2025 11:19:34 -0800
-Subject: [PATCH] aarch64: define struct user_pac_mask if needed
-
-On Aarch64, Linux is using Pointer Authentication Code (PAC) for pointer
-authentication.[1] The struct "user_pac_mask" has been part of the Linux
-kernel since version 5.0 as part of this feature. However, older kernels
-do not define it.
-
-Therefore, we want to check if the definition is present in the kernel
-headers and provide one if it isn't. This ensures two things:
-
-* elfutils will continue to compile against kernel headers from 4.x
-* binaries built against older kernel headers will still be fully
-  functional if used on a newer system
-
-For reference, the build error that is being avoided looks like this:
-
-[...]
-  CC       aarch64_initreg.o
-aarch64_initreg.c: In function 'aarch64_set_initial_registers_tid':
-aarch64_initreg.c:61:24: error: storage size of 'pac_mask' isn't known
-   struct user_pac_mask pac_mask;
-                        ^~~~~~~~
-aarch64_initreg.c:61:24: warning: unused variable 'pac_mask' [-Wunused-variable]
-make[4]: *** [Makefile:831: aarch64_initreg.o] Error 1
-make[3]: *** [Makefile:547: all-recursive] Error 1
-make[2]: *** [Makefile:463: all] Error 2
-
-[1] https://docs.kernel.org/arch/arm64/pointer-authentication.html
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=32684
-
-Fixes: 64e3b451ad2c ("aarch64: extend dwfl_thread_state_registers to handle PAC")
-Signed-off-by: Markus Mayer <mmayer@broadcom.com>
-Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
-Upstream: https://sourceware.org/git/?p=elfutils.git;a=commit;h=52a747a316042e70a22acb489df9e51bfc6bf2d5
----
- backends/aarch64_initreg.c | 21 +++++++++++++++++++++
- configure.ac               |  8 ++++++++
- 2 files changed, 29 insertions(+)
-
-diff --git a/backends/aarch64_initreg.c b/backends/aarch64_initreg.c
-index 5ec45ea60..a6badbb45 100644
---- a/backends/aarch64_initreg.c
-+++ b/backends/aarch64_initreg.c
-@@ -47,6 +47,27 @@
- #define BACKEND aarch64_
- #include "libebl_CPU.h"
- 
-+/*
-+ * pointer authentication masks (NT_ARM_PAC_MASK)
-+ *
-+ * Defined by Linux kernel headers since Linux 5.0. Define it here if kernel
-+ * headers are older than that, to ensure this file builds regardless.
-+ */
-+#if defined(__aarch64__) && defined(__linux__)
-+
-+#ifndef NT_ARM_PAC_MASK
-+#define NT_ARM_PAC_MASK 0x406
-+#endif
-+
-+#ifndef HAVE_USER_PACK_MASK
-+struct user_pac_mask {
-+  __u64 data_mask;
-+  __u64 insn_mask;
-+};
-+#endif
-+
-+#endif /* __aarch64__ && __linux__ */
-+
- bool
- aarch64_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
- 			  ebl_tid_registers_t *setfunc __attribute__ ((unused)),
-diff --git a/configure.ac b/configure.ac
-index e57d39275..3298f7fc7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -777,6 +777,14 @@ if test "$sys_user_has_user_regs" = "yes"; then
-             [Define to 1 if <sys/user.h> defines struct user_regs_struct])
- fi
- 
-+AC_CHECK_TYPE([struct user_pac_mask],
-+              [has_user_pac_mask=yes], [has_user_pac_mask=no],
-+              [[#include <asm/ptrace.h>]])
-+if test "$has_user_pac_mask" = "yes"; then
-+  AC_DEFINE(HAVE_USER_PACK_MASK, 1,
-+            [Defined if struct user_pac_mask exists.])
-+fi
-+
- # On a 64-bit host where can can use $CC -m32, we'll run two sets of tests.
- utrace_BIARCH
- CC_BIARCH="$CC $utrace_biarch"
--- 
-2.43.5
-
diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
index 19f628de46..8a132f3a1c 100644
--- a/package/elfutils/elfutils.hash
+++ b/package/elfutils/elfutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceware.org/elfutils/ftp/0.189/sha512.sum
-sha512  543188f5f2cfe5bc7955a878416c5f252edff9926754e5de0c6c57b132f21d9285c9b29e41281e93baad11d4ae7efbbf93580c114579c182103565fe99bd3909  elfutils-0.192.tar.bz2
+# From https://sourceware.org/elfutils/ftp/0.193/sha512.sum
+sha512  557e328e3de0d2a69d09c15a9333f705f3233584e2c6a7d3ce855d06a12dc129e69168d6be64082803630397bd64e1660a8b5324d4f162d17922e10ddb367d76  elfutils-0.193.tar.bz2
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 39d6607cdf..712e69570b 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELFUTILS_VERSION = 0.192
+ELFUTILS_VERSION = 0.193
 ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
 ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
 ELFUTILS_INSTALL_STAGING = YES

--===============3141055324178034267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3141055324178034267==--
