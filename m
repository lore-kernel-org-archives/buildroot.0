Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA90ECFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0D4B61AD3;
	Thu, 27 Nov 2025 20:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tu-3_drU34ia; Thu, 27 Nov 2025 20:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5445E61C08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5445E61C08;
	Thu, 27 Nov 2025 20:36:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 034B42A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26B7C61707
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrquGzpAwAyi for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7216E61AD2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7216E61AD2
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7101A83CC9; Thu, 27 Nov 2025 20:36:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Nov 2025 13:25:12 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: f5e9c1f379725d815786aba6f244011f28b40935
X-Git-Newrev: bc1f6a524e862040cd4ec9ed0fb155522ad62636
X-Patchwork-Hint: ignore
Message-Id: <20251127203603.7101A83CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libpng: security
 bump version to 1.6.51
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
Content-Type: multipart/mixed; boundary="===============3704336687148575448=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3704336687148575448==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bc1f6a524e862040cd4ec9ed0fb155522ad62636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.51/ANNOUNCE

Fixes CVE-2025-64505, CVE-2025-64506, CVE-2025-64720 & CVE-2025-65018.

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 08ad91052b69090b74220d89b13cfc29fb86ed72)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../libpng/0001-riscv-Support-only-RVV-1.0.patch   | 246 ---------------------
 package/libpng/libpng.hash                         |   6 +-
 package/libpng/libpng.mk                           |   2 +-
 3 files changed, 4 insertions(+), 250 deletions(-)

diff --git a/package/libpng/0001-riscv-Support-only-RVV-1.0.patch b/package/libpng/0001-riscv-Support-only-RVV-1.0.patch
deleted file mode 100644
index 6896e94a20..0000000000
--- a/package/libpng/0001-riscv-Support-only-RVV-1.0.patch
+++ /dev/null
@@ -1,246 +0,0 @@
-From 7916eb7ba08e97ac97c71784e15f78e3ffcd838c Mon Sep 17 00:00:00 2001
-From: Filip Wasil <f.wasil@samsung.com>
-Date: Mon, 7 Jul 2025 11:08:35 +0200
-Subject: [PATCH] riscv: Support only RVV 1.0
-
-Reviewed-by: John Bowler <jbowler@acm.org>
-Signed-off-by: Cosmin Truta <ctruta@gmail.com>
-
-Upstream: https://github.com/pnggroup/libpng/commit/7916eb7ba08e97ac97c71784e15f78e3ffcd838c
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt            |  4 --
- configure.ac              |  4 --
- contrib/riscv-rvv/README  | 85 ---------------------------------------
- contrib/riscv-rvv/linux.c | 36 -----------------
- riscv/riscv_init.c        | 32 ++++-----------
- 5 files changed, 7 insertions(+), 154 deletions(-)
- delete mode 100644 contrib/riscv-rvv/README
- delete mode 100644 contrib/riscv-rvv/linux.c
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f0f3a88846..22b929ba97 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -331,10 +331,6 @@ if(PNG_HARDWARE_OPTIMIZATIONS)
- 
-       check_c_source_compiles("
-         #include <riscv_vector.h>
--        #include <asm/hwcap.h>
--        #ifndef COMPAT_HWCAP_ISA_V /* added in linux-6.5 */
--        #error \"COMPAT_HWCAP_ISA_V is not available\"
--        #endif
-         int main() {
-           const float src[] = { 0.0f, 0.0f, 0.0f, 0.0f };
-           uint64_t ptr[2] = {0x0908060504020100, 0xFFFFFFFF0E0D0C0A};
-diff --git a/configure.ac b/configure.ac
-index 5b5d242c5d..bb40f6d994 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -707,10 +707,6 @@ then
- 
-    AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- #include <riscv_vector.h>
--#include <asm/hwcap.h>
--#ifndef COMPAT_HWCAP_ISA_V /* added in linux-6.5 */
--#error "COMPAT_HWCAP_ISA_V is not available"
--#endif
- int main() {
-    const float src[] = { 0.0f, 0.0f, 0.0f, 0.0f };
-    uint64_t ptr[2] = {0x0908060504020100, 0xFFFFFFFF0E0D0C0A};
-diff --git a/contrib/riscv-rvv/README b/contrib/riscv-rvv/README
-deleted file mode 100644
-index 56b7cd284b..0000000000
---- a/contrib/riscv-rvv/README
-+++ /dev/null
-@@ -1,85 +0,0 @@
--OPERATING SYSTEM SPECIFIC RISC-V RVV DETECTION
------------------------------------------------
--
--Detection of the ability to execute RISC-V Vector on a RISC-V processor
--requires operating system support.  (The information is not available in user
--mode.)
--
--HOW TO USE THIS
-----------------
--
--This directory contains C code fragments that can be included in
--riscv/riscv_init.c by setting the macro PNG_RISCV_RVV_FILE to the file name
--in "" or <> at build time.  This setting is not recorded in pnglibconf.h and
--can be changed simply by rebuilding riscv/riscv_init.o with the required macro
--definition.
--
--For any of this code to be used the RISC-V Vector code must be enabled and run
--time checks must be supported.  I.e.:
--
--#if PNG_RISCV_RVV_OPT > 0
--#ifdef PNG_RISCV_RVV_CHECK_SUPPORTED
--
--This is done in a 'configure' build by passing configure the argument:
--
--   --enable-riscv-rvv=check
--
--Apart from the basic Linux implementation in contrib/riscv-rvv/linux.c this
--code is unsupported.  That means that it is not even compiled on a regular
--basis and may be broken in any given minor release.
--
--FILE FORMAT
-------------
--
--Each file documents its testing status as of the last time it was tested (which
--may have been a long time ago):
--
--STATUS: one of:
--   SUPPORTED: This indicates that the file is included in the regularly
--         performed test builds and bugs are fixed when discovered.
--   COMPILED: This indicates that the code did compile at least once.  See the
--         more detailed description for the extent to which the result was
--         successful.
--   TESTED: This means the code was fully compiled into the libpng test programs
--         and these were run at least once.
--
--BUG REPORTS: an email address to which to send reports of problems
--
--The file is a fragment of C code. It should not define any 'extern' symbols;
--everything should be static.  It must define the function:
--
--static int png_have_rvv(png_structp png_ptr);
--
--That function must return 1 if RISC-V Vector instructions are supported, 0 if
--not.  It must not execute png_error unless it detects a bug.  A png_error will
--prevent the reading of the PNG and in the future, writing too.
--
--BUG REPORTS
-------------
--
--If you mail a bug report for any file that is not SUPPORTED there may only be
--limited response.  Consider fixing it and sending a patch to fix the problem -
--this is more likely to result in action.
--
--CONTRIBUTIONS
---------------
--
--You may send contributions of new implementations to
--png-mng-implement@sourceforge.net.  Please write code in strict C90 C where
--possible.  Obviously OS dependencies are to be expected.  If you submit code you
--must have the authors permission and it must have a license that is acceptable
--to the current maintainer; in particular that license must permit modification
--and redistribution.
--
--Please try to make the contribution a single file and give the file a clear and
--unambiguous name that identifies the target OS.  If multiple files really are
--required put them all in a sub-directory.
--
--You must also be prepared to handle bug reports from users of the code, either
--by joining the png-mng-implement mailing list or by providing an email for the
--"BUG REPORTS" entry or both.  Please make sure that the header of the file
--contains the STATUS and BUG REPORTS fields as above.
--
--Please list the OS requirements as precisely as possible.  Ideally you should
--also list the environment in which the code has been tested and certainly list
--any environments where you suspect it might not work.
-diff --git a/contrib/riscv-rvv/linux.c b/contrib/riscv-rvv/linux.c
-deleted file mode 100644
-index c3a0ff808a..0000000000
---- a/contrib/riscv-rvv/linux.c
-+++ /dev/null
-@@ -1,36 +0,0 @@
--/* contrib/riscv-rvv/linux.c
-- *
-- * Copyright (c) 2023 Google LLC
-- * Written by Dragoș Tiselice <dtiselice@google.com>, May 2023.
-- *
-- * This code is released under the libpng license.
-- * For conditions of distribution and use, see the disclaimer
-- * and license in png.h
-- *
-- * SEE contrib/riscv-rvv/README before reporting bugs
-- *
-- * STATUS: SUPPORTED
-- * BUG REPORTS: png-mng-implement@sourceforge.net
-- *
-- * png_have_rvv implemented for Linux by looking for COMPAT_HWCAP_ISA_V
-- * via hardware capabilites API.
-- *
-- * This code is strict ANSI-C and is probably moderately portable; it does
-- * however use <stdio.h> and it assumes that /proc/cpuinfo is never localized.
-- */
--
--#if defined(__linux__)
--#include <asm/hwcap.h>
--#include <sys/auxv.h>
--#endif
--
--static int
--png_have_rvv() {
--#if defined(__linux__)
--   return getauxval (AT_HWCAP) & COMPAT_HWCAP_ISA_V ? 1 : 0;
--#else
--#pragma message(                                                               \
--   "warning: RISC-V Vector not supported for this platform")
--   return 0;
--#endif
--}
-diff --git a/riscv/riscv_init.c b/riscv/riscv_init.c
-index 1d9982436a..11b1cb4fd6 100644
---- a/riscv/riscv_init.c
-+++ b/riscv/riscv_init.c
-@@ -12,25 +12,10 @@
- 
- #ifdef PNG_READ_SUPPORTED
- 
--#if PNG_RISCV_RVV_OPT > 0
-+#if PNG_RISCV_RVV_IMPLEMENTATION > 0
- 
- #include <riscv_vector.h>
- 
--#include <signal.h>
--
--#ifndef PNG_RISCV_RVV_FILE
--#  if defined(__linux__)
--#    define PNG_RISCV_RVV_FILE "contrib/riscv-rvv/linux.c"
--#  else
--#    error "No support for run-time RISC-V Vector checking; use compile-time options"
--#  endif
--#endif
--
--static int png_have_rvv();
--#ifdef PNG_RISCV_RVV_FILE
--#  include PNG_RISCV_RVV_FILE
--#endif
--
- #ifndef PNG_ALIGNED_MEMORY_SUPPORTED
- #  error "ALIGNED_MEMORY is required; set: -DPNG_ALIGNED_MEMORY_SUPPORTED"
- #endif
-@@ -38,16 +23,9 @@ static int png_have_rvv();
- void
- png_init_filter_functions_rvv(png_structp pp, unsigned int bpp)
- {
-+#if __riscv_v == 1000000
-    png_debug(1, "in png_init_filter_functions_rvv");
- 
--   static volatile sig_atomic_t no_rvv = -1; /* not checked */
--
--   if (no_rvv < 0)
--      no_rvv = !png_have_rvv();
--
--   if (no_rvv)
--      return;
--
-    pp->read_filter[PNG_FILTER_VALUE_UP-1] = png_read_filter_row_up_rvv;
- 
-    if (bpp == 3)
-@@ -62,7 +40,11 @@ png_init_filter_functions_rvv(png_structp pp, unsigned int bpp)
-       pp->read_filter[PNG_FILTER_VALUE_PAETH-1] = png_read_filter_row_paeth4_rvv;
-       pp->read_filter[PNG_FILTER_VALUE_SUB-1] = png_read_filter_row_sub4_rvv;
-    }
-+#else
-+   PNG_UNUSED(pp);
-+   PNG_UNUSED(bpp);
-+#endif /* __riscv_v == 1000000 */
- }
- 
--#endif /* PNG_RISCV_RVV_OPT > 0 */
-+#endif /* PNG_RISCV_RVV_IMPLEMENTATION > 0 */
- #endif /* PNG_READ_SUPPORTED */
diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index b3740250a7..fc4aeba85a 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.50/
-sha1  ecd92ba84628a8ace430706c85fd2fb26ba0882c  libpng-1.6.50.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.51/
+sha1  8fd6ff93769fac269ab9197c106d4e0808521b04  libpng-1.6.51.tar.xz
 # Locally computed:
-sha256  4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307  libpng-1.6.50.tar.xz
+sha256  a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2  libpng-1.6.51.tar.xz
 sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 8191b318c1..e78115146b 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.50
+LIBPNG_VERSION = 1.6.51
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)

--===============3704336687148575448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3704336687148575448==--
