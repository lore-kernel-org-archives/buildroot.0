Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB0EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 12:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391B283438;
	Wed, 20 Apr 2022 12:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZF8BkkZxMyW; Wed, 20 Apr 2022 12:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5071D82D0C;
	Wed, 20 Apr 2022 12:25:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 709751BF30D
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 12:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 629BB419BF
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 12:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHzsOF3c0rta for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 12:25:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B55D4190D
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 12:24:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b24so2033721edu.10
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 05:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=kkHQT2NU7YiRksovx/m6Os9w9+HZ5xH2MEB1Lq58wuA=;
 b=IUt9MYgJfvzA7KqKASg1QcIjAbK+1ziFNkZ1OCdyfr5iiX1rKxskqJb/6yA1veGPD1
 8xSwC0C+rgoJJHiP3TZOTY6uGLPDMpHTyEnfSNl534eJhk7Df9bGSVKIP6vKfiMJXP0j
 p9nVwBIocHDA+WY4h0RIxalT5L7B7p5iM+FZo2JFNVe4w6Cpgrzh2ksH23uZi06Xlcyf
 tOBbqWlzc/vQ2jGJEsn6eLYB8bwSbDUGCgbs2EgYGw/7krhn3xGL+Ge8Rzp4v68NlqrC
 qi9RCSgWaTh2Vy5UIThMc+tLfxVqrCDYFO7eBob+vwhhViLvjzibSL1ENjJVwdVvM+GB
 GWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kkHQT2NU7YiRksovx/m6Os9w9+HZ5xH2MEB1Lq58wuA=;
 b=M3V7h8MF8DCs9YnHviRLnecvyzPySTOL61fn/N4j5z8pVyBdBX7WMO0KDZ6XFDzqCc
 XlYTN+V+20UuMSipsJ7dAicH+dP1RivaMgED8Agb7ALr/cbUp3SNmU0qTcmXYAVk/8zn
 2a6dSAmbcpoNKURW/+k668RiUZjHgVY29H8lDkXtAMqmDxDqMgn85WWNR80mS9LnWZuH
 xfpgfvetHeEvY/sdknka6khx5OgGdzpltM0bIosXbKcDnwH2o9lvyyIyAb1RQezys/E8
 Sc2Jzqgoh3WtyYD/hhMTX0uEKWEwOSCDh+x3owm4LctvGHi7mU3r0Yy8pIvnaA0OryXt
 UA3Q==
X-Gm-Message-State: AOAM5318eucdQyDloZruaumAhlf9ZlI3y2pMRzHqDMKzfcx9JfDO5FIw
 Aj5vc5MB3/bO3llS5zPOzTY0fses6kzVAOJ4pwHNjzofkU/fcQ==
X-Google-Smtp-Source: ABdhPJyYtDk1CXoNxK4kdXgUeIqfLLWDHoRYPF5+5O2/DDbfKmTEVvDMOqv1Wii3esdp0ELKe9RJ4NmRx1FQ8Ugi2JE=
X-Received: by 2002:a05:6402:438c:b0:423:f57a:596f with SMTP id
 o12-20020a056402438c00b00423f57a596fmr11655063edc.367.1650457497081; Wed, 20
 Apr 2022 05:24:57 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Wed, 20 Apr 2022 13:24:45 +0100
Message-ID: <CAEXMXLQ8XkxgAsPzT35NhTS37Ti7wS8uRo5i1Ks2SLL_J_Q7nw@mail.gmail.com>
To: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="000000000000d4b8a705dd151439"
Subject: [Buildroot] [PATCH] package/google-breakpad: bump to latest
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--000000000000d4b8a705dd151439
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fixes compatibility with GCC-11.
Doesn't require any local patches.

linux-syscall-support bumped to the verion in DEPS.

Signed-off-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
---
 .../0001-add-missing-asm-ptrace-include.patch |  31 ---
 ...g-references-to-struct-ucontext-with.patch | 257 ------------------
 ...-handler-exception_handler.cc-rename.patch |  59 ----
 .../0004-Fix-for-non-constant-SIGSTKSZ.patch  |  34 ---
 package/google-breakpad/google-breakpad.hash  |   2 +-
 package/google-breakpad/google-breakpad.mk    |   2 +-
 .../linux-syscall-support.hash                |   2 +-
 .../linux-syscall-support.mk                  |   2 +-
 8 files changed, 4 insertions(+), 385 deletions(-)
 delete mode 100644
package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
 delete mode 100644
package/google-breakpad/0002-Replace-remaining-references-to-struct-ucontex=
t-with.patch
 delete mode 100644
package/google-breakpad/0003-src-client-linux-handler-exception_handler.cc-=
rename.patch
 delete mode 100644
package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch

diff --git a/package/google-breakpad/0001-add-missing-asm-ptrace-include.pa=
tch
b/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
deleted file mode 100644
index 281c7a042a..0000000000
--- a/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Include <asm/ptrace.h> to get necessary definitions on AArch64
-
-In glibc commit
-https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D7d05a8168b45c0580=
e1f9a79c2dd26c8f0d31fca,
-including <asm/ptrace.h> from <sys/user.h> on AArch64 has been
-removed. So the Google Breakpad code, which used to build fine on
-glibc 2.18 (CodeSourcery toolchain for example), no longer builds with
-glibc 2.19 (Linaro toolchain for example).
-
-To fix this, this patch adds the missing <asm/ptrace.h> include (for
-AArch64 only, to be conservative).
-
-This patch has not been submitted upstream, since more recent versions
-of Google Breakpad have completely changed this part of the code.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/client/linux/minidump_writer/linux_dumper.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- a/src/client/linux/minidump_writer/linux_dumper.h
-+++ b/src/client/linux/minidump_writer/linux_dumper.h
-@@ -43,6 +43,9 @@
- #include <stdint.h>
- #include <sys/types.h>
- #include <sys/user.h>
-+#if defined(__aarch64__)
-+#include <asm/ptrace.h>
-+#endif
-
- #include "common/memory.h"
- #include "google_breakpad/common/minidump_format.h"
diff --git a/package/google-breakpad/0002-Replace-remaining-references-to-s=
truct-ucontext-with.patch
b/package/google-breakpad/0002-Replace-remaining-references-to-struct-ucont=
ext-with.patch
deleted file mode 100644
index e02ae268b9..0000000000
--- a/package/google-breakpad/0002-Replace-remaining-references-to-struct-u=
context-with.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 7975a962e1d6dbad5a46792a54e647abd7caf5f1 Mon Sep 17 00:00:00 2001
-From: Mark Mentovai <mark@chromium.org>
-Date: Tue, 19 Sep 2017 22:48:30 -0400
-Subject: [PATCH] Replace remaining references to 'struct ucontext' with
- 'ucontext_t'
-
-This relands
-https://chromium.googlesource.com/breakpad/breakpad/src/+/e3035bc406cee8a4=
d765e59ad46eb828705f17f4,
-which was accidentally committed to breakpad/breakpad/src, the read-only
-mirror of src in breakpad/breakpad. (Well, it should have been
-read-only.) See https://crbug.com/766164.
-
-This fixes issues with glibc-2.26.
-
-See https://bugs.gentoo.org/show_bug.cgi?id=3D628782 ,
-https://sourceware.org/git/?p=3Dglibc.git;h=3D251287734e89a52da3db682a8241=
eb6bccc050c9
, and
-https://sourceware.org/ml/libc-alpha/2017-08/msg00010.html for context.
-Change-Id: Id66f474d636dd2afa450bab925c5514a800fdd6f
-Reviewed-on: https://chromium-review.googlesource.com/674304
-Reviewed-by: Mark Mentovai <mark@chromium.org>
-
-(cherry picked from commit bddcc58860f522a0d4cbaa7e9d04058caee0db9d)
-[Romain: backport from upstream]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- .../linux/dump_writer_common/ucontext_reader.cc    | 32 +++++++++++------=
-----
- .../linux/dump_writer_common/ucontext_reader.h     | 14 +++++-----
- src/client/linux/handler/exception_handler.cc      | 10 +++----
- src/client/linux/handler/exception_handler.h       |  6 ++--
- .../linux/microdump_writer/microdump_writer.cc     |  2 +-
- .../linux/minidump_writer/minidump_writer.cc       |  2 +-
- 6 files changed, 33 insertions(+), 33 deletions(-)
-
-diff --git a/src/client/linux/dump_writer_common/ucontext_reader.cc
b/src/client/linux/dump_writer_common/ucontext_reader.cc
-index c80724d..052ce37 100644
---- a/src/client/linux/dump_writer_common/ucontext_reader.cc
-+++ b/src/client/linux/dump_writer_common/ucontext_reader.cc
-@@ -36,19 +36,19 @@ namespace google_breakpad {
-
- // Minidump defines register structures which are different from the raw
- // structures which we get from the kernel. These are platform specific
--// functions to juggle the ucontext and user structures into minidump for=
mat.
-+// functions to juggle the ucontext_t and user structures into
minidump format.
-
- #if defined(__i386__)
-
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_ESP];
- }
-
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc=
) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_EIP];
- }
-
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *u=
c,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t =
*uc,
-                                     const struct _libc_fpstate* fp) {
-   const greg_t* regs =3D uc->uc_mcontext.gregs;
-
-@@ -88,15 +88,15 @@ void UContextReader::FillCPUContext(RawContextCPU
*out, const ucontext *uc,
-
- #elif defined(__x86_64)
-
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_RSP];
- }
-
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc=
) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_RIP];
- }
-
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *u=
c,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t =
*uc,
-                                     const struct _libc_fpstate* fpregs) {
-   const greg_t* regs =3D uc->uc_mcontext.gregs;
-
-@@ -145,15 +145,15 @@ void
UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
-
- #elif defined(__ARM_EABI__)
-
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.arm_sp;
- }
-
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc=
) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.arm_pc;
- }
-
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *u=
c) {
-+void UContextReader::FillCPUContext(RawContextCPU *out, const
ucontext_t *uc) {
-   out->context_flags =3D MD_CONTEXT_ARM_FULL;
-
-   out->iregs[0] =3D uc->uc_mcontext.arm_r0;
-@@ -184,15 +184,15 @@ void
UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc)
{
-
- #elif defined(__aarch64__)
-
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.sp;
- }
-
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc=
) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.pc;
- }
-
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *u=
c,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t =
*uc,
-                                     const struct fpsimd_context* fpregs) =
{
-   out->context_flags =3D MD_CONTEXT_ARM64_FULL;
-
-@@ -210,15 +210,15 @@ void
UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
-
- #elif defined(__mips__)
-
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[MD_CONTEXT_MIPS_REG_SP];
- }
-
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc=
) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.pc;
- }
-
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *u=
c) {
-+void UContextReader::FillCPUContext(RawContextCPU *out, const
ucontext_t *uc) {
- #if _MIPS_SIM =3D=3D _ABI64
-   out->context_flags =3D MD_CONTEXT_MIPS64_FULL;
- #elif _MIPS_SIM =3D=3D _ABIO32
-diff --git a/src/client/linux/dump_writer_common/ucontext_reader.h
b/src/client/linux/dump_writer_common/ucontext_reader.h
-index b6e77b4..2de80b7 100644
---- a/src/client/linux/dump_writer_common/ucontext_reader.h
-+++ b/src/client/linux/dump_writer_common/ucontext_reader.h
-@@ -39,23 +39,23 @@
-
- namespace google_breakpad {
-
--// Wraps platform-dependent implementations of accessors to ucontext stru=
cts.
-+// Wraps platform-dependent implementations of accessors to
ucontext_t structs.
- struct UContextReader {
--  static uintptr_t GetStackPointer(const struct ucontext* uc);
-+  static uintptr_t GetStackPointer(const ucontext_t* uc);
-
--  static uintptr_t GetInstructionPointer(const struct ucontext* uc);
-+  static uintptr_t GetInstructionPointer(const ucontext_t* uc);
-
--  // Juggle a arch-specific ucontext into a minidump format
-+  // Juggle a arch-specific ucontext_t into a minidump format
-   //   out: the minidump structure
-   //   info: the collection of register structures.
- #if defined(__i386__) || defined(__x86_64)
--  static void FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                              const struct _libc_fpstate* fp);
- #elif defined(__aarch64__)
--  static void FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                              const struct fpsimd_context* fpregs);
- #else
--  static void FillCPUContext(RawContextCPU *out, const ucontext *uc);
-+  static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc);
- #endif
- };
-
-diff --git a/src/client/linux/handler/exception_handler.cc
b/src/client/linux/handler/exception_handler.cc
-index b63f973..3d809b8 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -439,9 +439,9 @@ bool ExceptionHandler::HandleSignal(int sig,
siginfo_t* info, void* uc) {
-   // Fill in all the holes in the struct to make Valgrind happy.
-   memset(&g_crash_context_, 0, sizeof(g_crash_context_));
-   memcpy(&g_crash_context_.siginfo, info, sizeof(siginfo_t));
--  memcpy(&g_crash_context_.context, uc, sizeof(struct ucontext));
-+  memcpy(&g_crash_context_.context, uc, sizeof(ucontext_t));
- #if defined(__aarch64__)
--  struct ucontext* uc_ptr =3D (struct ucontext*)uc;
-+  ucontext_t* uc_ptr =3D (ucontext_t*)uc;
-   struct fpsimd_context* fp_ptr =3D
-       (struct fpsimd_context*)&uc_ptr->uc_mcontext.__reserved;
-   if (fp_ptr->head.magic =3D=3D FPSIMD_MAGIC) {
-@@ -450,9 +450,9 @@ bool ExceptionHandler::HandleSignal(int sig,
siginfo_t* info, void* uc) {
-   }
- #elif !defined(__ARM_EABI__) && !defined(__mips__)
-   // FP state is not part of user ABI on ARM Linux.
--  // In case of MIPS Linux FP state is already part of struct ucontext
-+  // In case of MIPS Linux FP state is already part of ucontext_t
-   // and 'float_state' is not a member of CrashContext.
--  struct ucontext* uc_ptr =3D (struct ucontext*)uc;
-+  ucontext_t* uc_ptr =3D (ucontext_t*)uc;
-   if (uc_ptr->uc_mcontext.fpregs) {
-     memcpy(&g_crash_context_.float_state, uc_ptr->uc_mcontext.fpregs,
-            sizeof(g_crash_context_.float_state));
-@@ -476,7 +476,7 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig)=
 {
-   // ExceptionHandler::HandleSignal().
-   siginfo.si_code =3D SI_USER;
-   siginfo.si_pid =3D getpid();
--  struct ucontext context;
-+  ucontext_t context;
-   getcontext(&context);
-   return HandleSignal(sig, &siginfo, &context);
- }
-diff --git a/src/client/linux/handler/exception_handler.h
b/src/client/linux/handler/exception_handler.h
-index 591c310..42f4055 100644
---- a/src/client/linux/handler/exception_handler.h
-+++ b/src/client/linux/handler/exception_handler.h
-@@ -191,11 +191,11 @@ class ExceptionHandler {
-   struct CrashContext {
-     siginfo_t siginfo;
-     pid_t tid;  // the crashing thread.
--    struct ucontext context;
-+    ucontext_t context;
- #if !defined(__ARM_EABI__) && !defined(__mips__)
-     // #ifdef this out because FP state is not part of user ABI for Linux=
 ARM.
--    // In case of MIPS Linux FP state is already part of struct
--    // ucontext so 'float_state' is not required.
-+    // In case of MIPS Linux FP state is already part of ucontext_t so
-+    // 'float_state' is not required.
-     fpstate_t float_state;
- #endif
-   };
-diff --git a/src/client/linux/microdump_writer/microdump_writer.cc
b/src/client/linux/microdump_writer/microdump_writer.cc
-index 6f5b435..a508667 100644
---- a/src/client/linux/microdump_writer/microdump_writer.cc
-+++ b/src/client/linux/microdump_writer/microdump_writer.cc
-@@ -571,7 +571,7 @@ class MicrodumpWriter {
-
-   void* Alloc(unsigned bytes) { return dumper_->allocator()->Alloc(bytes)=
; }
-
--  const struct ucontext* const ucontext_;
-+  const ucontext_t* const ucontext_;
- #if !defined(__ARM_EABI__) && !defined(__mips__)
-   const google_breakpad::fpstate_t* const float_state_;
- #endif
-diff --git a/src/client/linux/minidump_writer/minidump_writer.cc
b/src/client/linux/minidump_writer/minidump_writer.cc
-index 86009b9..f2aec73 100644
---- a/src/client/linux/minidump_writer/minidump_writer.cc
-+++ b/src/client/linux/minidump_writer/minidump_writer.cc
-@@ -1248,7 +1248,7 @@ class MinidumpWriter {
-   const int fd_;  // File descriptor where the minidum should be written.
-   const char* path_;  // Path to the file where the minidum should be wri=
tten.
-
--  const struct ucontext* const ucontext_;  // also from the signal handle=
r
-+  const ucontext_t* const ucontext_;  // also from the signal handler
- #if !defined(__ARM_EABI__) && !defined(__mips__)
-   const google_breakpad::fpstate_t* const float_state_;  // ditto
- #endif
---
-2.9.5
-
diff --git a/package/google-breakpad/0003-src-client-linux-handler-exceptio=
n_handler.cc-rename.patch
b/package/google-breakpad/0003-src-client-linux-handler-exception_handler.c=
c-rename.patch
deleted file mode 100644
index 579e7f3457..0000000000
--- a/package/google-breakpad/0003-src-client-linux-handler-exception_handl=
er.cc-rename.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 2fa414c8655c421e7eb0bb1719928babb0ecf7c6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 26 Dec 2019 22:21:33 +0100
-Subject: [PATCH] src/client/linux/handler/exception_handler.cc: rename tgk=
ill
- to BreakpadTgkill()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Since glibc 2.30, a tgkill() function was added in the C library, and
-its definition obviously conflicts with the internal definition of
-google-breakpad, causing build failures:
-
-src/client/linux/handler/exception_handler.cc:109:12: error: =E2=80=98int
tgkill(pid_t, pid_t, int)=E2=80=99 was declared =E2=80=98extern=E2=80=99 an=
d later =E2=80=98static=E2=80=99
[-fpermissive]
-  109 | static int tgkill(pid_t tgid, pid_t tid, int sig) {
-      |            ^~~~~~
-In file included from /usr/include/signal.h:374,
-                 from ./src/client/linux/handler/exception_handler.h:33,
-                 from src/client/linux/handler/exception_handler.cc:66:
-/usr/include/bits/signal_ext.h:29:12: note: previous declaration of
=E2=80=98int tgkill(__pid_t, __pid_t, int)=E2=80=99
-   29 | extern int tgkill (__pid_t __tgid, __pid_t __tid, int __signal);
-      |            ^~~~~~
-
-Upstream google-breakpad simply dropped the use of the internal
-tgkill() in commit
-https://chromium.googlesource.com/breakpad/breakpad/+/7e3c165000d44fa153a3=
270870ed500bc8bbb461.
However,
-this is not realistic for Buildroot, since we do support old systems
-where the system C library will not necessarily provide tgkill().
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/client/linux/handler/exception_handler.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/client/linux/handler/exception_handler.cc
b/src/client/linux/handler/exception_handler.cc
-index b63f973b..b4c279b8 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -106,7 +106,7 @@
- #endif
-
- // A wrapper for the tgkill syscall: send a signal to a specific thread.
--static int tgkill(pid_t tgid, pid_t tid, int sig) {
-+static int BreakpadTgkill(pid_t tgid, pid_t tid, int sig) {
-   return syscall(__NR_tgkill, tgid, tid, sig);
-   return 0;
- }
-@@ -387,7 +387,7 @@ void ExceptionHandler::SignalHandler(int sig,
siginfo_t* info, void* uc) {
-     // In order to retrigger it, we have to queue a new signal by calling
-     // kill() ourselves.  The special case (si_pid =3D=3D 0 && sig =3D=3D=
 SIGABRT) is
-     // due to the kernel sending a SIGABRT from a user request via SysRQ.
--    if (tgkill(getpid(), syscall(__NR_gettid), sig) < 0) {
-+    if (BreakpadTgkill(getpid(), syscall(__NR_gettid), sig) < 0) {
-       // If we failed to kill ourselves (e.g. because a sandbox disallows=
 us
-       // to do so), we instead resort to terminating our process. This wi=
ll
-       // result in an incorrect exit code.
---
-2.24.1
-
diff --git a/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.pat=
ch
b/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
deleted file mode 100644
index 4291216c61..0000000000
--- a/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 4a332d01186b09a9d46390b845024d914d9149cb Mon Sep 17 00:00:00 2001
-From: Michel Alexandre Salim <michel@michel-slm.name>
-Date: Sun, 21 Mar 2021 13:17:00 -0700
-Subject: [PATCH] Fix for non-constant SIGSTKSZ
-
-On glibc > 2.33, `SIGSTKSZ` might not be constant (in which case
-it expands to a call to `sysconf` which returns a `long int`); see
-http://sourceware-org.1504.n7.nabble.com/PATCH-sysconf-Add-SC-MINSIGSTKSZ-=
SC-SIGSTKSZ-BZ-20305-td650948.html
-
-Cast the two arguments to `max` to `unsigned`, which is the type of
the variable
-we're storing the result in anyway, so that it works both with the
old-style constant
-`SIGSTKSZ` and the new configurable one.
-
-Signed-off-by: Michel Alexandre Salim <michel@michel-slm.name>
-Change-Id: I3d87048561a87c6b9fcdbb14b3d53dd45b0a00f0
-
-[Retrieved from:
-https://chromium-review.googlesource.com/c/breakpad/breakpad/+/2776379]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
-
-diff --git a/src/client/linux/handler/exception_handler.cc
b/src/client/linux/handler/exception_handler.cc
-index ca353c4..3788829 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -138,7 +138,7 @@
-   // SIGSTKSZ may be too small to prevent the signal handlers from overru=
nning
-   // the alternative stack. Ensure that the size of the alternative stack=
 is
-   // large enough.
--  static const unsigned kSigStackSize =3D std::max(16384, SIGSTKSZ);
-+  static const unsigned kSigStackSize =3D std::max((unsigned) 16384,
(unsigned) SIGSTKSZ);
-
-   // Only set an alternative stack if there isn't already one, or if
the current
-   // one is too small.
diff --git a/package/google-breakpad/google-breakpad.hash
b/package/google-breakpad/google-breakpad.hash
index 09f9a0cf91..c184da1113 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3504639ee5d7536e7f7939b80520dfcb98863e9b50673dd577d0ab2a07105acb
 google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6-br1.tar.gz
+sha256  52716d140ba528d36b40591ae2c7485b18023f6610414bba0057f0cc13caf256
 google-breakpad-c85eb4a59b618f3beaad5445ceb1f865ffa8efdf-br1.tar.gz
 sha256  f9752a0a4ac5215eaa3a4f0ec29cd52563c883de5d7870525cc0bc3a21cb8e15
 LICENSE
diff --git a/package/google-breakpad/google-breakpad.mk
b/package/google-breakpad/google-breakpad.mk
index 8ae5f99bc7..20755a1c2a 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -4,7 +4,7 @@
 #
 ##########################################################################=
######

-GOOGLE_BREAKPAD_VERSION =3D 7515ab13768c7edc09f0f2ec2354dc6c928239a6
+GOOGLE_BREAKPAD_VERSION =3D c85eb4a59b618f3beaad5445ceb1f865ffa8efdf
 GOOGLE_BREAKPAD_SITE =3D https://chromium.googlesource.com/breakpad/breakp=
ad
 GOOGLE_BREAKPAD_SITE_METHOD =3D git
 GOOGLE_BREAKPAD_CONF_OPTS =3D --disable-processor --disable-tools
diff --git a/package/linux-syscall-support/linux-syscall-support.hash
b/package/linux-syscall-support/linux-syscall-support.hash
index 3445bf1398..f45f07ac56 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  498efb6915ac6e65c82c712fadd3c30f9472764114c835849e02f2c092bacd2d
 linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb-br1.tar.gz
+sha256  2a12703ce59773ec714b603e46c733b03f3fbf9b4763195fae40d0042e5da3f6
 linux-syscall-support-e1e7b0ad8ee99a875b272c8e33e308472e897660-br1.tar.gz
 sha256  4c1fc9acc9f3867e5c81b5d5f57c52fb9a932662bd4e2e5e43b3fe95390035f5
 linux_syscall_support.h
diff --git a/package/linux-syscall-support/linux-syscall-support.mk
b/package/linux-syscall-support/linux-syscall-support.mk
index 050c5058ab..c0c7c4c3b2 100644
--- a/package/linux-syscall-support/linux-syscall-support.mk
+++ b/package/linux-syscall-support/linux-syscall-support.mk
@@ -5,7 +5,7 @@
 ##########################################################################=
######

 # Use the same version that the one used by Google-breakpad (see DEPS file=
)
-LINUX_SYSCALL_SUPPORT_VERSION =3D 3f6478ac95edf86cd3da300c2c0d34a438f5dbeb
+LINUX_SYSCALL_SUPPORT_VERSION =3D e1e7b0ad8ee99a875b272c8e33e308472e897660
 LINUX_SYSCALL_SUPPORT_SITE =3D
https://chromium.googlesource.com/linux-syscall-support
 LINUX_SYSCALL_SUPPORT_SITE_METHOD =3D git
 LINUX_SYSCALL_SUPPORT_LICENSE =3D BSD-3-Clause
--=20
2.32.0

--000000000000d4b8a705dd151439
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-package-google-breakpad-bump-to-latest.patch"
Content-Disposition: attachment; 
	filename="0001-package-google-breakpad-bump-to-latest.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l27jrsat0>
X-Attachment-Id: f_l27jrsat0

RnJvbSA1MWRhNzc4NzI5NThlMjM0ZDBlMjhlMmY2M2U2NmEyOGQ3YTEwMjViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOdW5vIEdvbmNhbHZlcyA8bnVub2dAZnIyNC5jb20+CkRhdGU6
IFdlZCwgMjAgQXByIDIwMjIgMTM6MTI6NTQgKzAxMDAKU3ViamVjdDogW1BBVENIXSBwYWNrYWdl
L2dvb2dsZS1icmVha3BhZDogYnVtcCB0byBsYXRlc3QKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVu
dC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rp
bmc6IDhiaXQKCkZpeGVzIGNvbXBhdGlsaWJpdHkgd2l0aCBHQ0MtMTEuCkRvZXNuJ3QgcmVxdWly
ZSBhbnkgbG9jYWwgcGF0Y2hlcy4KCmxpbnV4LXN5c2NhbGwtc3VwcG9ydCBidW1wZWQgdG8gdGhl
IHZlcmlvbiBpbiBERVBTLgoKU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vanBn
QGdtYWlsLmNvbT4KLS0tCiAuLi4vMDAwMS1hZGQtbWlzc2luZy1hc20tcHRyYWNlLWluY2x1ZGUu
cGF0Y2ggfCAgMzEgLS0tCiAuLi5nLXJlZmVyZW5jZXMtdG8tc3RydWN0LXVjb250ZXh0LXdpdGgu
cGF0Y2ggfCAyNTcgLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4taGFuZGxlci1leGNlcHRpb25faGFu
ZGxlci5jYy1yZW5hbWUucGF0Y2ggfCAgNTkgLS0tLQogLi4uLzAwMDQtRml4LWZvci1ub24tY29u
c3RhbnQtU0lHU1RLU1oucGF0Y2ggIHwgIDM0IC0tLQogcGFja2FnZS9nb29nbGUtYnJlYWtwYWQv
Z29vZ2xlLWJyZWFrcGFkLmhhc2ggIHwgICAyICstCiBwYWNrYWdlL2dvb2dsZS1icmVha3BhZC9n
b29nbGUtYnJlYWtwYWQubWsgICAgfCAgIDIgKy0KIC4uLi9saW51eC1zeXNjYWxsLXN1cHBvcnQu
aGFzaCAgICAgICAgICAgICAgICB8ICAgMiArLQogLi4uL2xpbnV4LXN5c2NhbGwtc3VwcG9ydC5t
ayAgICAgICAgICAgICAgICAgIHwgICAyICstCiA4IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMzg1IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ29vZ2xl
LWJyZWFrcGFkLzAwMDEtYWRkLW1pc3NpbmctYXNtLXB0cmFjZS1pbmNsdWRlLnBhdGNoCiBkZWxl
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMi1SZXBsYWNlLXJlbWFp
bmluZy1yZWZlcmVuY2VzLXRvLXN0cnVjdC11Y29udGV4dC13aXRoLnBhdGNoCiBkZWxldGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMy1zcmMtY2xpZW50LWxpbnV4LWhh
bmRsZXItZXhjZXB0aW9uX2hhbmRsZXIuY2MtcmVuYW1lLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwNC1GaXgtZm9yLW5vbi1jb25zdGFudC1TSUdT
VEtTWi5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkLzAwMDEtYWRk
LW1pc3NpbmctYXNtLXB0cmFjZS1pbmNsdWRlLnBhdGNoIGIvcGFja2FnZS9nb29nbGUtYnJlYWtw
YWQvMDAwMS1hZGQtbWlzc2luZy1hc20tcHRyYWNlLWluY2x1ZGUucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDI4MWM3YTA0MmEuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9n
b29nbGUtYnJlYWtwYWQvMDAwMS1hZGQtbWlzc2luZy1hc20tcHRyYWNlLWluY2x1ZGUucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSwzMSArMCwwIEBACi1JbmNsdWRlIDxhc20vcHRyYWNlLmg+IHRv
IGdldCBuZWNlc3NhcnkgZGVmaW5pdGlvbnMgb24gQUFyY2g2NAotCi1JbiBnbGliYyBjb21taXQK
LWh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWNvbW1pdDtoPTdkMDVh
ODE2OGI0NWMwNTgwZTFmOWE3OWMyZGQyNmM4ZjBkMzFmY2EsCi1pbmNsdWRpbmcgPGFzbS9wdHJh
Y2UuaD4gZnJvbSA8c3lzL3VzZXIuaD4gb24gQUFyY2g2NCBoYXMgYmVlbgotcmVtb3ZlZC4gU28g
dGhlIEdvb2dsZSBCcmVha3BhZCBjb2RlLCB3aGljaCB1c2VkIHRvIGJ1aWxkIGZpbmUgb24KLWds
aWJjIDIuMTggKENvZGVTb3VyY2VyeSB0b29sY2hhaW4gZm9yIGV4YW1wbGUpLCBubyBsb25nZXIg
YnVpbGRzIHdpdGgKLWdsaWJjIDIuMTkgKExpbmFybyB0b29sY2hhaW4gZm9yIGV4YW1wbGUpLgot
Ci1UbyBmaXggdGhpcywgdGhpcyBwYXRjaCBhZGRzIHRoZSBtaXNzaW5nIDxhc20vcHRyYWNlLmg+
IGluY2x1ZGUgKGZvcgotQUFyY2g2NCBvbmx5LCB0byBiZSBjb25zZXJ2YXRpdmUpLgotCi1UaGlz
IHBhdGNoIGhhcyBub3QgYmVlbiBzdWJtaXR0ZWQgdXBzdHJlYW0sIHNpbmNlIG1vcmUgcmVjZW50
IHZlcnNpb25zCi1vZiBHb29nbGUgQnJlYWtwYWQgaGF2ZSBjb21wbGV0ZWx5IGNoYW5nZWQgdGhp
cyBwYXJ0IG9mIHRoZSBjb2RlLgotCi1TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0
aG9tYXMucGV0YXp6b25pQGZyZWUtZWxlY3Ryb25zLmNvbT4KLQotSW5kZXg6IGIvc3JjL2NsaWVu
dC9saW51eC9taW5pZHVtcF93cml0ZXIvbGludXhfZHVtcGVyLmgKLT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBh
L3NyYy9jbGllbnQvbGludXgvbWluaWR1bXBfd3JpdGVyL2xpbnV4X2R1bXBlci5oCi0rKysgYi9z
cmMvY2xpZW50L2xpbnV4L21pbmlkdW1wX3dyaXRlci9saW51eF9kdW1wZXIuaAotQEAgLTQzLDYg
KzQzLDkgQEAKLSAjaW5jbHVkZSA8c3RkaW50Lmg+Ci0gI2luY2x1ZGUgPHN5cy90eXBlcy5oPgot
ICNpbmNsdWRlIDxzeXMvdXNlci5oPgotKyNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQotKyNpbmNs
dWRlIDxhc20vcHRyYWNlLmg+Ci0rI2VuZGlmCi0gCi0gI2luY2x1ZGUgImNvbW1vbi9tZW1vcnku
aCIKLSAjaW5jbHVkZSAiZ29vZ2xlX2JyZWFrcGFkL2NvbW1vbi9taW5pZHVtcF9mb3JtYXQuaCIK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkLzAwMDItUmVwbGFjZS1yZW1haW5p
bmctcmVmZXJlbmNlcy10by1zdHJ1Y3QtdWNvbnRleHQtd2l0aC5wYXRjaCBiL3BhY2thZ2UvZ29v
Z2xlLWJyZWFrcGFkLzAwMDItUmVwbGFjZS1yZW1haW5pbmctcmVmZXJlbmNlcy10by1zdHJ1Y3Qt
dWNvbnRleHQtd2l0aC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTAyYWUy
NjhiOS4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC8wMDAyLVJlcGxh
Y2UtcmVtYWluaW5nLXJlZmVyZW5jZXMtdG8tc3RydWN0LXVjb250ZXh0LXdpdGgucGF0Y2gKKysr
IC9kZXYvbnVsbApAQCAtMSwyNTcgKzAsMCBAQAotRnJvbSA3OTc1YTk2MmUxZDZkYmFkNWE0Njc5
MmE1NGU2NDdhYmQ3Y2FmNWYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogTWFyayBN
ZW50b3ZhaSA8bWFya0BjaHJvbWl1bS5vcmc+Ci1EYXRlOiBUdWUsIDE5IFNlcCAyMDE3IDIyOjQ4
OjMwIC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0hdIFJlcGxhY2UgcmVtYWluaW5nIHJlZmVyZW5jZXMg
dG8gJ3N0cnVjdCB1Y29udGV4dCcgd2l0aAotICd1Y29udGV4dF90JwotCi1UaGlzIHJlbGFuZHMK
LWh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9icmVha3BhZC9icmVha3BhZC9zcmMv
Ky9lMzAzNWJjNDA2Y2VlOGE0ZDc2NWU1OWFkNDZlYjgyODcwNWYxN2Y0LAotd2hpY2ggd2FzIGFj
Y2lkZW50YWxseSBjb21taXR0ZWQgdG8gYnJlYWtwYWQvYnJlYWtwYWQvc3JjLCB0aGUgcmVhZC1v
bmx5Ci1taXJyb3Igb2Ygc3JjIGluIGJyZWFrcGFkL2JyZWFrcGFkLiAoV2VsbCwgaXQgc2hvdWxk
IGhhdmUgYmVlbgotcmVhZC1vbmx5LikgU2VlIGh0dHBzOi8vY3JidWcuY29tLzc2NjE2NC4KLQot
VGhpcyBmaXhlcyBpc3N1ZXMgd2l0aCBnbGliYy0yLjI2LgotCi1TZWUgaHR0cHM6Ly9idWdzLmdl
bnRvby5vcmcvc2hvd19idWcuY2dpP2lkPTYyODc4MiAsCi1odHRwczovL3NvdXJjZXdhcmUub3Jn
L2dpdC8/cD1nbGliYy5naXQ7aD0yNTEyODc3MzRlODlhNTJkYTNkYjY4MmE4MjQxZWI2YmNjYzA1
MGM5ICwgYW5kCi1odHRwczovL3NvdXJjZXdhcmUub3JnL21sL2xpYmMtYWxwaGEvMjAxNy0wOC9t
c2cwMDAxMC5odG1sIGZvciBjb250ZXh0LgotQ2hhbmdlLUlkOiBJZDY2ZjQ3NGQ2MzZkZDJhZmE0
NTBiYWI5MjVjNTUxNGE4MDBmZGQ2ZgotUmV2aWV3ZWQtb246IGh0dHBzOi8vY2hyb21pdW0tcmV2
aWV3Lmdvb2dsZXNvdXJjZS5jb20vNjc0MzA0Ci1SZXZpZXdlZC1ieTogTWFyayBNZW50b3ZhaSA8
bWFya0BjaHJvbWl1bS5vcmc+Ci0KLShjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IGJkZGNjNTg4
NjBmNTIyYTBkNGNiYWE3ZTlkMDQwNThjYWVlMGRiOWQpCi1bUm9tYWluOiBiYWNrcG9ydCBmcm9t
IHVwc3RyZWFtXQotU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21h
aWwuY29tPgotLS0tCi0gLi4uL2xpbnV4L2R1bXBfd3JpdGVyX2NvbW1vbi91Y29udGV4dF9yZWFk
ZXIuY2MgICAgfCAzMiArKysrKysrKysrKy0tLS0tLS0tLS0tCi0gLi4uL2xpbnV4L2R1bXBfd3Jp
dGVyX2NvbW1vbi91Y29udGV4dF9yZWFkZXIuaCAgICAgfCAxNCArKysrKy0tLS0tCi0gc3JjL2Ns
aWVudC9saW51eC9oYW5kbGVyL2V4Y2VwdGlvbl9oYW5kbGVyLmNjICAgICAgfCAxMCArKystLS0t
Ci0gc3JjL2NsaWVudC9saW51eC9oYW5kbGVyL2V4Y2VwdGlvbl9oYW5kbGVyLmggICAgICAgfCAg
NiArKy0tCi0gLi4uL2xpbnV4L21pY3JvZHVtcF93cml0ZXIvbWljcm9kdW1wX3dyaXRlci5jYyAg
ICAgfCAgMiArLQotIC4uLi9saW51eC9taW5pZHVtcF93cml0ZXIvbWluaWR1bXBfd3JpdGVyLmNj
ICAgICAgIHwgIDIgKy0KLSA2IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDMzIGRl
bGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2NsaWVudC9saW51eC9kdW1wX3dyaXRlcl9j
b21tb24vdWNvbnRleHRfcmVhZGVyLmNjIGIvc3JjL2NsaWVudC9saW51eC9kdW1wX3dyaXRlcl9j
b21tb24vdWNvbnRleHRfcmVhZGVyLmNjCi1pbmRleCBjODA3MjRkLi4wNTJjZTM3IDEwMDY0NAot
LS0tIGEvc3JjL2NsaWVudC9saW51eC9kdW1wX3dyaXRlcl9jb21tb24vdWNvbnRleHRfcmVhZGVy
LmNjCi0rKysgYi9zcmMvY2xpZW50L2xpbnV4L2R1bXBfd3JpdGVyX2NvbW1vbi91Y29udGV4dF9y
ZWFkZXIuY2MKLUBAIC0zNiwxOSArMzYsMTkgQEAgbmFtZXNwYWNlIGdvb2dsZV9icmVha3BhZCB7
Ci0gCi0gLy8gTWluaWR1bXAgZGVmaW5lcyByZWdpc3RlciBzdHJ1Y3R1cmVzIHdoaWNoIGFyZSBk
aWZmZXJlbnQgZnJvbSB0aGUgcmF3Ci0gLy8gc3RydWN0dXJlcyB3aGljaCB3ZSBnZXQgZnJvbSB0
aGUga2VybmVsLiBUaGVzZSBhcmUgcGxhdGZvcm0gc3BlY2lmaWMKLS0vLyBmdW5jdGlvbnMgdG8g
anVnZ2xlIHRoZSB1Y29udGV4dCBhbmQgdXNlciBzdHJ1Y3R1cmVzIGludG8gbWluaWR1bXAgZm9y
bWF0LgotKy8vIGZ1bmN0aW9ucyB0byBqdWdnbGUgdGhlIHVjb250ZXh0X3QgYW5kIHVzZXIgc3Ry
dWN0dXJlcyBpbnRvIG1pbmlkdW1wIGZvcm1hdC4KLSAKLSAjaWYgZGVmaW5lZChfX2kzODZfXykK
LSAKLS11aW50cHRyX3QgVUNvbnRleHRSZWFkZXI6OkdldFN0YWNrUG9pbnRlcihjb25zdCBzdHJ1
Y3QgdWNvbnRleHQqIHVjKSB7Ci0rdWludHB0cl90IFVDb250ZXh0UmVhZGVyOjpHZXRTdGFja1Bv
aW50ZXIoY29uc3QgdWNvbnRleHRfdCogdWMpIHsKLSAgIHJldHVybiB1Yy0+dWNfbWNvbnRleHQu
Z3JlZ3NbUkVHX0VTUF07Ci0gfQotIAotLXVpbnRwdHJfdCBVQ29udGV4dFJlYWRlcjo6R2V0SW5z
dHJ1Y3Rpb25Qb2ludGVyKGNvbnN0IHN0cnVjdCB1Y29udGV4dCogdWMpIHsKLSt1aW50cHRyX3Qg
VUNvbnRleHRSZWFkZXI6OkdldEluc3RydWN0aW9uUG9pbnRlcihjb25zdCB1Y29udGV4dF90KiB1
YykgewotICAgcmV0dXJuIHVjLT51Y19tY29udGV4dC5ncmVnc1tSRUdfRUlQXTsKLSB9Ci0gCi0t
dm9pZCBVQ29udGV4dFJlYWRlcjo6RmlsbENQVUNvbnRleHQoUmF3Q29udGV4dENQVSAqb3V0LCBj
b25zdCB1Y29udGV4dCAqdWMsCi0rdm9pZCBVQ29udGV4dFJlYWRlcjo6RmlsbENQVUNvbnRleHQo
UmF3Q29udGV4dENQVSAqb3V0LCBjb25zdCB1Y29udGV4dF90ICp1YywKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgX2xpYmNfZnBzdGF0ZSogZnApIHsK
LSAgIGNvbnN0IGdyZWdfdCogcmVncyA9IHVjLT51Y19tY29udGV4dC5ncmVnczsKLSAKLUBAIC04
OCwxNSArODgsMTUgQEAgdm9pZCBVQ29udGV4dFJlYWRlcjo6RmlsbENQVUNvbnRleHQoUmF3Q29u
dGV4dENQVSAqb3V0LCBjb25zdCB1Y29udGV4dCAqdWMsCi0gCi0gI2VsaWYgZGVmaW5lZChfX3g4
Nl82NCkKLSAKLS11aW50cHRyX3QgVUNvbnRleHRSZWFkZXI6OkdldFN0YWNrUG9pbnRlcihjb25z
dCBzdHJ1Y3QgdWNvbnRleHQqIHVjKSB7Ci0rdWludHB0cl90IFVDb250ZXh0UmVhZGVyOjpHZXRT
dGFja1BvaW50ZXIoY29uc3QgdWNvbnRleHRfdCogdWMpIHsKLSAgIHJldHVybiB1Yy0+dWNfbWNv
bnRleHQuZ3JlZ3NbUkVHX1JTUF07Ci0gfQotIAotLXVpbnRwdHJfdCBVQ29udGV4dFJlYWRlcjo6
R2V0SW5zdHJ1Y3Rpb25Qb2ludGVyKGNvbnN0IHN0cnVjdCB1Y29udGV4dCogdWMpIHsKLSt1aW50
cHRyX3QgVUNvbnRleHRSZWFkZXI6OkdldEluc3RydWN0aW9uUG9pbnRlcihjb25zdCB1Y29udGV4
dF90KiB1YykgewotICAgcmV0dXJuIHVjLT51Y19tY29udGV4dC5ncmVnc1tSRUdfUklQXTsKLSB9
Ci0gCi0tdm9pZCBVQ29udGV4dFJlYWRlcjo6RmlsbENQVUNvbnRleHQoUmF3Q29udGV4dENQVSAq
b3V0LCBjb25zdCB1Y29udGV4dCAqdWMsCi0rdm9pZCBVQ29udGV4dFJlYWRlcjo6RmlsbENQVUNv
bnRleHQoUmF3Q29udGV4dENQVSAqb3V0LCBjb25zdCB1Y29udGV4dF90ICp1YywKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgX2xpYmNfZnBzdGF0ZSog
ZnByZWdzKSB7Ci0gICBjb25zdCBncmVnX3QqIHJlZ3MgPSB1Yy0+dWNfbWNvbnRleHQuZ3JlZ3M7
Ci0gCi1AQCAtMTQ1LDE1ICsxNDUsMTUgQEAgdm9pZCBVQ29udGV4dFJlYWRlcjo6RmlsbENQVUNv
bnRleHQoUmF3Q29udGV4dENQVSAqb3V0LCBjb25zdCB1Y29udGV4dCAqdWMsCi0gCi0gI2VsaWYg
ZGVmaW5lZChfX0FSTV9FQUJJX18pCi0gCi0tdWludHB0cl90IFVDb250ZXh0UmVhZGVyOjpHZXRT
dGFja1BvaW50ZXIoY29uc3Qgc3RydWN0IHVjb250ZXh0KiB1YykgewotK3VpbnRwdHJfdCBVQ29u
dGV4dFJlYWRlcjo6R2V0U3RhY2tQb2ludGVyKGNvbnN0IHVjb250ZXh0X3QqIHVjKSB7Ci0gICBy
ZXR1cm4gdWMtPnVjX21jb250ZXh0LmFybV9zcDsKLSB9Ci0gCi0tdWludHB0cl90IFVDb250ZXh0
UmVhZGVyOjpHZXRJbnN0cnVjdGlvblBvaW50ZXIoY29uc3Qgc3RydWN0IHVjb250ZXh0KiB1Yykg
ewotK3VpbnRwdHJfdCBVQ29udGV4dFJlYWRlcjo6R2V0SW5zdHJ1Y3Rpb25Qb2ludGVyKGNvbnN0
IHVjb250ZXh0X3QqIHVjKSB7Ci0gICByZXR1cm4gdWMtPnVjX21jb250ZXh0LmFybV9wYzsKLSB9
Ci0gCi0tdm9pZCBVQ29udGV4dFJlYWRlcjo6RmlsbENQVUNvbnRleHQoUmF3Q29udGV4dENQVSAq
b3V0LCBjb25zdCB1Y29udGV4dCAqdWMpIHsKLSt2b2lkIFVDb250ZXh0UmVhZGVyOjpGaWxsQ1BV
Q29udGV4dChSYXdDb250ZXh0Q1BVICpvdXQsIGNvbnN0IHVjb250ZXh0X3QgKnVjKSB7Ci0gICBv
dXQtPmNvbnRleHRfZmxhZ3MgPSBNRF9DT05URVhUX0FSTV9GVUxMOwotIAotICAgb3V0LT5pcmVn
c1swXSA9IHVjLT51Y19tY29udGV4dC5hcm1fcjA7Ci1AQCAtMTg0LDE1ICsxODQsMTUgQEAgdm9p
ZCBVQ29udGV4dFJlYWRlcjo6RmlsbENQVUNvbnRleHQoUmF3Q29udGV4dENQVSAqb3V0LCBjb25z
dCB1Y29udGV4dCAqdWMpIHsKLSAKLSAjZWxpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQotIAotLXVp
bnRwdHJfdCBVQ29udGV4dFJlYWRlcjo6R2V0U3RhY2tQb2ludGVyKGNvbnN0IHN0cnVjdCB1Y29u
dGV4dCogdWMpIHsKLSt1aW50cHRyX3QgVUNvbnRleHRSZWFkZXI6OkdldFN0YWNrUG9pbnRlcihj
b25zdCB1Y29udGV4dF90KiB1YykgewotICAgcmV0dXJuIHVjLT51Y19tY29udGV4dC5zcDsKLSB9
Ci0gCi0tdWludHB0cl90IFVDb250ZXh0UmVhZGVyOjpHZXRJbnN0cnVjdGlvblBvaW50ZXIoY29u
c3Qgc3RydWN0IHVjb250ZXh0KiB1YykgewotK3VpbnRwdHJfdCBVQ29udGV4dFJlYWRlcjo6R2V0
SW5zdHJ1Y3Rpb25Qb2ludGVyKGNvbnN0IHVjb250ZXh0X3QqIHVjKSB7Ci0gICByZXR1cm4gdWMt
PnVjX21jb250ZXh0LnBjOwotIH0KLSAKLS12b2lkIFVDb250ZXh0UmVhZGVyOjpGaWxsQ1BVQ29u
dGV4dChSYXdDb250ZXh0Q1BVICpvdXQsIGNvbnN0IHVjb250ZXh0ICp1YywKLSt2b2lkIFVDb250
ZXh0UmVhZGVyOjpGaWxsQ1BVQ29udGV4dChSYXdDb250ZXh0Q1BVICpvdXQsIGNvbnN0IHVjb250
ZXh0X3QgKnVjLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0
cnVjdCBmcHNpbWRfY29udGV4dCogZnByZWdzKSB7Ci0gICBvdXQtPmNvbnRleHRfZmxhZ3MgPSBN
RF9DT05URVhUX0FSTTY0X0ZVTEw7Ci0gCi1AQCAtMjEwLDE1ICsyMTAsMTUgQEAgdm9pZCBVQ29u
dGV4dFJlYWRlcjo6RmlsbENQVUNvbnRleHQoUmF3Q29udGV4dENQVSAqb3V0LCBjb25zdCB1Y29u
dGV4dCAqdWMsCi0gCi0gI2VsaWYgZGVmaW5lZChfX21pcHNfXykKLSAKLS11aW50cHRyX3QgVUNv
bnRleHRSZWFkZXI6OkdldFN0YWNrUG9pbnRlcihjb25zdCBzdHJ1Y3QgdWNvbnRleHQqIHVjKSB7
Ci0rdWludHB0cl90IFVDb250ZXh0UmVhZGVyOjpHZXRTdGFja1BvaW50ZXIoY29uc3QgdWNvbnRl
eHRfdCogdWMpIHsKLSAgIHJldHVybiB1Yy0+dWNfbWNvbnRleHQuZ3JlZ3NbTURfQ09OVEVYVF9N
SVBTX1JFR19TUF07Ci0gfQotIAotLXVpbnRwdHJfdCBVQ29udGV4dFJlYWRlcjo6R2V0SW5zdHJ1
Y3Rpb25Qb2ludGVyKGNvbnN0IHN0cnVjdCB1Y29udGV4dCogdWMpIHsKLSt1aW50cHRyX3QgVUNv
bnRleHRSZWFkZXI6OkdldEluc3RydWN0aW9uUG9pbnRlcihjb25zdCB1Y29udGV4dF90KiB1Yykg
ewotICAgcmV0dXJuIHVjLT51Y19tY29udGV4dC5wYzsKLSB9Ci0gCi0tdm9pZCBVQ29udGV4dFJl
YWRlcjo6RmlsbENQVUNvbnRleHQoUmF3Q29udGV4dENQVSAqb3V0LCBjb25zdCB1Y29udGV4dCAq
dWMpIHsKLSt2b2lkIFVDb250ZXh0UmVhZGVyOjpGaWxsQ1BVQ29udGV4dChSYXdDb250ZXh0Q1BV
ICpvdXQsIGNvbnN0IHVjb250ZXh0X3QgKnVjKSB7Ci0gI2lmIF9NSVBTX1NJTSA9PSBfQUJJNjQK
LSAgIG91dC0+Y29udGV4dF9mbGFncyA9IE1EX0NPTlRFWFRfTUlQUzY0X0ZVTEw7Ci0gI2VsaWYg
X01JUFNfU0lNID09IF9BQklPMzIKLWRpZmYgLS1naXQgYS9zcmMvY2xpZW50L2xpbnV4L2R1bXBf
d3JpdGVyX2NvbW1vbi91Y29udGV4dF9yZWFkZXIuaCBiL3NyYy9jbGllbnQvbGludXgvZHVtcF93
cml0ZXJfY29tbW9uL3Vjb250ZXh0X3JlYWRlci5oCi1pbmRleCBiNmU3N2I0Li4yZGU4MGI3IDEw
MDY0NAotLS0tIGEvc3JjL2NsaWVudC9saW51eC9kdW1wX3dyaXRlcl9jb21tb24vdWNvbnRleHRf
cmVhZGVyLmgKLSsrKyBiL3NyYy9jbGllbnQvbGludXgvZHVtcF93cml0ZXJfY29tbW9uL3Vjb250
ZXh0X3JlYWRlci5oCi1AQCAtMzksMjMgKzM5LDIzIEBACi0gCi0gbmFtZXNwYWNlIGdvb2dsZV9i
cmVha3BhZCB7Ci0gCi0tLy8gV3JhcHMgcGxhdGZvcm0tZGVwZW5kZW50IGltcGxlbWVudGF0aW9u
cyBvZiBhY2Nlc3NvcnMgdG8gdWNvbnRleHQgc3RydWN0cy4KLSsvLyBXcmFwcyBwbGF0Zm9ybS1k
ZXBlbmRlbnQgaW1wbGVtZW50YXRpb25zIG9mIGFjY2Vzc29ycyB0byB1Y29udGV4dF90IHN0cnVj
dHMuCi0gc3RydWN0IFVDb250ZXh0UmVhZGVyIHsKLS0gIHN0YXRpYyB1aW50cHRyX3QgR2V0U3Rh
Y2tQb2ludGVyKGNvbnN0IHN0cnVjdCB1Y29udGV4dCogdWMpOwotKyAgc3RhdGljIHVpbnRwdHJf
dCBHZXRTdGFja1BvaW50ZXIoY29uc3QgdWNvbnRleHRfdCogdWMpOwotIAotLSAgc3RhdGljIHVp
bnRwdHJfdCBHZXRJbnN0cnVjdGlvblBvaW50ZXIoY29uc3Qgc3RydWN0IHVjb250ZXh0KiB1Yyk7
Ci0rICBzdGF0aWMgdWludHB0cl90IEdldEluc3RydWN0aW9uUG9pbnRlcihjb25zdCB1Y29udGV4
dF90KiB1Yyk7Ci0gCi0tICAvLyBKdWdnbGUgYSBhcmNoLXNwZWNpZmljIHVjb250ZXh0IGludG8g
YSBtaW5pZHVtcCBmb3JtYXQKLSsgIC8vIEp1Z2dsZSBhIGFyY2gtc3BlY2lmaWMgdWNvbnRleHRf
dCBpbnRvIGEgbWluaWR1bXAgZm9ybWF0Ci0gICAvLyAgIG91dDogdGhlIG1pbmlkdW1wIHN0cnVj
dHVyZQotICAgLy8gICBpbmZvOiB0aGUgY29sbGVjdGlvbiBvZiByZWdpc3RlciBzdHJ1Y3R1cmVz
LgotICNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0KQotLSAgc3RhdGlj
IHZvaWQgRmlsbENQVUNvbnRleHQoUmF3Q29udGV4dENQVSAqb3V0LCBjb25zdCB1Y29udGV4dCAq
dWMsCi0rICBzdGF0aWMgdm9pZCBGaWxsQ1BVQ29udGV4dChSYXdDb250ZXh0Q1BVICpvdXQsIGNv
bnN0IHVjb250ZXh0X3QgKnVjLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qg
c3RydWN0IF9saWJjX2Zwc3RhdGUqIGZwKTsKLSAjZWxpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKQot
LSAgc3RhdGljIHZvaWQgRmlsbENQVUNvbnRleHQoUmF3Q29udGV4dENQVSAqb3V0LCBjb25zdCB1
Y29udGV4dCAqdWMsCi0rICBzdGF0aWMgdm9pZCBGaWxsQ1BVQ29udGV4dChSYXdDb250ZXh0Q1BV
ICpvdXQsIGNvbnN0IHVjb250ZXh0X3QgKnVjLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IGZwc2ltZF9jb250ZXh0KiBmcHJlZ3MpOwotICNlbHNlCi0tICBzdGF0
aWMgdm9pZCBGaWxsQ1BVQ29udGV4dChSYXdDb250ZXh0Q1BVICpvdXQsIGNvbnN0IHVjb250ZXh0
ICp1Yyk7Ci0rICBzdGF0aWMgdm9pZCBGaWxsQ1BVQ29udGV4dChSYXdDb250ZXh0Q1BVICpvdXQs
IGNvbnN0IHVjb250ZXh0X3QgKnVjKTsKLSAjZW5kaWYKLSB9OwotIAotZGlmZiAtLWdpdCBhL3Ny
Yy9jbGllbnQvbGludXgvaGFuZGxlci9leGNlcHRpb25faGFuZGxlci5jYyBiL3NyYy9jbGllbnQv
bGludXgvaGFuZGxlci9leGNlcHRpb25faGFuZGxlci5jYwotaW5kZXggYjYzZjk3My4uM2Q4MDli
OCAxMDA2NDQKLS0tLSBhL3NyYy9jbGllbnQvbGludXgvaGFuZGxlci9leGNlcHRpb25faGFuZGxl
ci5jYwotKysrIGIvc3JjL2NsaWVudC9saW51eC9oYW5kbGVyL2V4Y2VwdGlvbl9oYW5kbGVyLmNj
Ci1AQCAtNDM5LDkgKzQzOSw5IEBAIGJvb2wgRXhjZXB0aW9uSGFuZGxlcjo6SGFuZGxlU2lnbmFs
KGludCBzaWcsIHNpZ2luZm9fdCogaW5mbywgdm9pZCogdWMpIHsKLSAgIC8vIEZpbGwgaW4gYWxs
IHRoZSBob2xlcyBpbiB0aGUgc3RydWN0IHRvIG1ha2UgVmFsZ3JpbmQgaGFwcHkuCi0gICBtZW1z
ZXQoJmdfY3Jhc2hfY29udGV4dF8sIDAsIHNpemVvZihnX2NyYXNoX2NvbnRleHRfKSk7Ci0gICBt
ZW1jcHkoJmdfY3Jhc2hfY29udGV4dF8uc2lnaW5mbywgaW5mbywgc2l6ZW9mKHNpZ2luZm9fdCkp
OwotLSAgbWVtY3B5KCZnX2NyYXNoX2NvbnRleHRfLmNvbnRleHQsIHVjLCBzaXplb2Yoc3RydWN0
IHVjb250ZXh0KSk7Ci0rICBtZW1jcHkoJmdfY3Jhc2hfY29udGV4dF8uY29udGV4dCwgdWMsIHNp
emVvZih1Y29udGV4dF90KSk7Ci0gI2lmIGRlZmluZWQoX19hYXJjaDY0X18pCi0tICBzdHJ1Y3Qg
dWNvbnRleHQqIHVjX3B0ciA9IChzdHJ1Y3QgdWNvbnRleHQqKXVjOwotKyAgdWNvbnRleHRfdCog
dWNfcHRyID0gKHVjb250ZXh0X3QqKXVjOwotICAgc3RydWN0IGZwc2ltZF9jb250ZXh0KiBmcF9w
dHIgPQotICAgICAgIChzdHJ1Y3QgZnBzaW1kX2NvbnRleHQqKSZ1Y19wdHItPnVjX21jb250ZXh0
Ll9fcmVzZXJ2ZWQ7Ci0gICBpZiAoZnBfcHRyLT5oZWFkLm1hZ2ljID09IEZQU0lNRF9NQUdJQykg
ewotQEAgLTQ1MCw5ICs0NTAsOSBAQCBib29sIEV4Y2VwdGlvbkhhbmRsZXI6OkhhbmRsZVNpZ25h
bChpbnQgc2lnLCBzaWdpbmZvX3QqIGluZm8sIHZvaWQqIHVjKSB7Ci0gICB9Ci0gI2VsaWYgIWRl
ZmluZWQoX19BUk1fRUFCSV9fKSAmJiAhZGVmaW5lZChfX21pcHNfXykKLSAgIC8vIEZQIHN0YXRl
IGlzIG5vdCBwYXJ0IG9mIHVzZXIgQUJJIG9uIEFSTSBMaW51eC4KLS0gIC8vIEluIGNhc2Ugb2Yg
TUlQUyBMaW51eCBGUCBzdGF0ZSBpcyBhbHJlYWR5IHBhcnQgb2Ygc3RydWN0IHVjb250ZXh0Ci0r
ICAvLyBJbiBjYXNlIG9mIE1JUFMgTGludXggRlAgc3RhdGUgaXMgYWxyZWFkeSBwYXJ0IG9mIHVj
b250ZXh0X3QKLSAgIC8vIGFuZCAnZmxvYXRfc3RhdGUnIGlzIG5vdCBhIG1lbWJlciBvZiBDcmFz
aENvbnRleHQuCi0tICBzdHJ1Y3QgdWNvbnRleHQqIHVjX3B0ciA9IChzdHJ1Y3QgdWNvbnRleHQq
KXVjOwotKyAgdWNvbnRleHRfdCogdWNfcHRyID0gKHVjb250ZXh0X3QqKXVjOwotICAgaWYgKHVj
X3B0ci0+dWNfbWNvbnRleHQuZnByZWdzKSB7Ci0gICAgIG1lbWNweSgmZ19jcmFzaF9jb250ZXh0
Xy5mbG9hdF9zdGF0ZSwgdWNfcHRyLT51Y19tY29udGV4dC5mcHJlZ3MsCi0gICAgICAgICAgICBz
aXplb2YoZ19jcmFzaF9jb250ZXh0Xy5mbG9hdF9zdGF0ZSkpOwotQEAgLTQ3Niw3ICs0NzYsNyBA
QCBib29sIEV4Y2VwdGlvbkhhbmRsZXI6OlNpbXVsYXRlU2lnbmFsRGVsaXZlcnkoaW50IHNpZykg
ewotICAgLy8gRXhjZXB0aW9uSGFuZGxlcjo6SGFuZGxlU2lnbmFsKCkuCi0gICBzaWdpbmZvLnNp
X2NvZGUgPSBTSV9VU0VSOwotICAgc2lnaW5mby5zaV9waWQgPSBnZXRwaWQoKTsKLS0gIHN0cnVj
dCB1Y29udGV4dCBjb250ZXh0OwotKyAgdWNvbnRleHRfdCBjb250ZXh0OwotICAgZ2V0Y29udGV4
dCgmY29udGV4dCk7Ci0gICByZXR1cm4gSGFuZGxlU2lnbmFsKHNpZywgJnNpZ2luZm8sICZjb250
ZXh0KTsKLSB9Ci1kaWZmIC0tZ2l0IGEvc3JjL2NsaWVudC9saW51eC9oYW5kbGVyL2V4Y2VwdGlv
bl9oYW5kbGVyLmggYi9zcmMvY2xpZW50L2xpbnV4L2hhbmRsZXIvZXhjZXB0aW9uX2hhbmRsZXIu
aAotaW5kZXggNTkxYzMxMC4uNDJmNDA1NSAxMDA2NDQKLS0tLSBhL3NyYy9jbGllbnQvbGludXgv
aGFuZGxlci9leGNlcHRpb25faGFuZGxlci5oCi0rKysgYi9zcmMvY2xpZW50L2xpbnV4L2hhbmRs
ZXIvZXhjZXB0aW9uX2hhbmRsZXIuaAotQEAgLTE5MSwxMSArMTkxLDExIEBAIGNsYXNzIEV4Y2Vw
dGlvbkhhbmRsZXIgewotICAgc3RydWN0IENyYXNoQ29udGV4dCB7Ci0gICAgIHNpZ2luZm9fdCBz
aWdpbmZvOwotICAgICBwaWRfdCB0aWQ7ICAvLyB0aGUgY3Jhc2hpbmcgdGhyZWFkLgotLSAgICBz
dHJ1Y3QgdWNvbnRleHQgY29udGV4dDsKLSsgICAgdWNvbnRleHRfdCBjb250ZXh0OwotICNpZiAh
ZGVmaW5lZChfX0FSTV9FQUJJX18pICYmICFkZWZpbmVkKF9fbWlwc19fKQotICAgICAvLyAjaWZk
ZWYgdGhpcyBvdXQgYmVjYXVzZSBGUCBzdGF0ZSBpcyBub3QgcGFydCBvZiB1c2VyIEFCSSBmb3Ig
TGludXggQVJNLgotLSAgICAvLyBJbiBjYXNlIG9mIE1JUFMgTGludXggRlAgc3RhdGUgaXMgYWxy
ZWFkeSBwYXJ0IG9mIHN0cnVjdAotLSAgICAvLyB1Y29udGV4dCBzbyAnZmxvYXRfc3RhdGUnIGlz
IG5vdCByZXF1aXJlZC4KLSsgICAgLy8gSW4gY2FzZSBvZiBNSVBTIExpbnV4IEZQIHN0YXRlIGlz
IGFscmVhZHkgcGFydCBvZiB1Y29udGV4dF90IHNvCi0rICAgIC8vICdmbG9hdF9zdGF0ZScgaXMg
bm90IHJlcXVpcmVkLgotICAgICBmcHN0YXRlX3QgZmxvYXRfc3RhdGU7Ci0gI2VuZGlmCi0gICB9
OwotZGlmZiAtLWdpdCBhL3NyYy9jbGllbnQvbGludXgvbWljcm9kdW1wX3dyaXRlci9taWNyb2R1
bXBfd3JpdGVyLmNjIGIvc3JjL2NsaWVudC9saW51eC9taWNyb2R1bXBfd3JpdGVyL21pY3JvZHVt
cF93cml0ZXIuY2MKLWluZGV4IDZmNWI0MzUuLmE1MDg2NjcgMTAwNjQ0Ci0tLS0gYS9zcmMvY2xp
ZW50L2xpbnV4L21pY3JvZHVtcF93cml0ZXIvbWljcm9kdW1wX3dyaXRlci5jYwotKysrIGIvc3Jj
L2NsaWVudC9saW51eC9taWNyb2R1bXBfd3JpdGVyL21pY3JvZHVtcF93cml0ZXIuY2MKLUBAIC01
NzEsNyArNTcxLDcgQEAgY2xhc3MgTWljcm9kdW1wV3JpdGVyIHsKLSAKLSAgIHZvaWQqIEFsbG9j
KHVuc2lnbmVkIGJ5dGVzKSB7IHJldHVybiBkdW1wZXJfLT5hbGxvY2F0b3IoKS0+QWxsb2MoYnl0
ZXMpOyB9Ci0gCi0tICBjb25zdCBzdHJ1Y3QgdWNvbnRleHQqIGNvbnN0IHVjb250ZXh0XzsKLSsg
IGNvbnN0IHVjb250ZXh0X3QqIGNvbnN0IHVjb250ZXh0XzsKLSAjaWYgIWRlZmluZWQoX19BUk1f
RUFCSV9fKSAmJiAhZGVmaW5lZChfX21pcHNfXykKLSAgIGNvbnN0IGdvb2dsZV9icmVha3BhZDo6
ZnBzdGF0ZV90KiBjb25zdCBmbG9hdF9zdGF0ZV87Ci0gI2VuZGlmCi1kaWZmIC0tZ2l0IGEvc3Jj
L2NsaWVudC9saW51eC9taW5pZHVtcF93cml0ZXIvbWluaWR1bXBfd3JpdGVyLmNjIGIvc3JjL2Ns
aWVudC9saW51eC9taW5pZHVtcF93cml0ZXIvbWluaWR1bXBfd3JpdGVyLmNjCi1pbmRleCA4NjAw
OWI5Li5mMmFlYzczIDEwMDY0NAotLS0tIGEvc3JjL2NsaWVudC9saW51eC9taW5pZHVtcF93cml0
ZXIvbWluaWR1bXBfd3JpdGVyLmNjCi0rKysgYi9zcmMvY2xpZW50L2xpbnV4L21pbmlkdW1wX3dy
aXRlci9taW5pZHVtcF93cml0ZXIuY2MKLUBAIC0xMjQ4LDcgKzEyNDgsNyBAQCBjbGFzcyBNaW5p
ZHVtcFdyaXRlciB7Ci0gICBjb25zdCBpbnQgZmRfOyAgLy8gRmlsZSBkZXNjcmlwdG9yIHdoZXJl
IHRoZSBtaW5pZHVtIHNob3VsZCBiZSB3cml0dGVuLgotICAgY29uc3QgY2hhciogcGF0aF87ICAv
LyBQYXRoIHRvIHRoZSBmaWxlIHdoZXJlIHRoZSBtaW5pZHVtIHNob3VsZCBiZSB3cml0dGVuLgot
IAotLSAgY29uc3Qgc3RydWN0IHVjb250ZXh0KiBjb25zdCB1Y29udGV4dF87ICAvLyBhbHNvIGZy
b20gdGhlIHNpZ25hbCBoYW5kbGVyCi0rICBjb25zdCB1Y29udGV4dF90KiBjb25zdCB1Y29udGV4
dF87ICAvLyBhbHNvIGZyb20gdGhlIHNpZ25hbCBoYW5kbGVyCi0gI2lmICFkZWZpbmVkKF9fQVJN
X0VBQklfXykgJiYgIWRlZmluZWQoX19taXBzX18pCi0gICBjb25zdCBnb29nbGVfYnJlYWtwYWQ6
OmZwc3RhdGVfdCogY29uc3QgZmxvYXRfc3RhdGVfOyAgLy8gZGl0dG8KLSAjZW5kaWYKLS0tIAot
Mi45LjUKLQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMy1zcmMtY2xp
ZW50LWxpbnV4LWhhbmRsZXItZXhjZXB0aW9uX2hhbmRsZXIuY2MtcmVuYW1lLnBhdGNoIGIvcGFj
a2FnZS9nb29nbGUtYnJlYWtwYWQvMDAwMy1zcmMtY2xpZW50LWxpbnV4LWhhbmRsZXItZXhjZXB0
aW9uX2hhbmRsZXIuY2MtcmVuYW1lLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCA1NzllN2YzNDU3Li4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkLzAw
MDMtc3JjLWNsaWVudC1saW51eC1oYW5kbGVyLWV4Y2VwdGlvbl9oYW5kbGVyLmNjLXJlbmFtZS5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDU5ICswLDAgQEAKLUZyb20gMmZhNDE0Yzg2NTVjNDIx
ZTdlYjBiYjE3MTk5MjhiYWJiMGVjZjdjNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci1EYXRlOiBU
aHUsIDI2IERlYyAyMDE5IDIyOjIxOjMzICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHNyYy9jbGll
bnQvbGludXgvaGFuZGxlci9leGNlcHRpb25faGFuZGxlci5jYzogcmVuYW1lIHRna2lsbAotIHRv
IEJyZWFrcGFkVGdraWxsKCkKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQot
U2luY2UgZ2xpYmMgMi4zMCwgYSB0Z2tpbGwoKSBmdW5jdGlvbiB3YXMgYWRkZWQgaW4gdGhlIEMg
bGlicmFyeSwgYW5kCi1pdHMgZGVmaW5pdGlvbiBvYnZpb3VzbHkgY29uZmxpY3RzIHdpdGggdGhl
IGludGVybmFsIGRlZmluaXRpb24gb2YKLWdvb2dsZS1icmVha3BhZCwgY2F1c2luZyBidWlsZCBm
YWlsdXJlczoKLQotc3JjL2NsaWVudC9saW51eC9oYW5kbGVyL2V4Y2VwdGlvbl9oYW5kbGVyLmNj
OjEwOToxMjogZXJyb3I6IOKAmGludCB0Z2tpbGwocGlkX3QsIHBpZF90LCBpbnQp4oCZIHdhcyBk
ZWNsYXJlZCDigJhleHRlcm7igJkgYW5kIGxhdGVyIOKAmHN0YXRpY+KAmSBbLWZwZXJtaXNzaXZl
XQotICAxMDkgfCBzdGF0aWMgaW50IHRna2lsbChwaWRfdCB0Z2lkLCBwaWRfdCB0aWQsIGludCBz
aWcpIHsKLSAgICAgIHwgICAgICAgICAgICBefn5+fn4KLUluIGZpbGUgaW5jbHVkZWQgZnJvbSAv
dXNyL2luY2x1ZGUvc2lnbmFsLmg6Mzc0LAotICAgICAgICAgICAgICAgICBmcm9tIC4vc3JjL2Ns
aWVudC9saW51eC9oYW5kbGVyL2V4Y2VwdGlvbl9oYW5kbGVyLmg6MzMsCi0gICAgICAgICAgICAg
ICAgIGZyb20gc3JjL2NsaWVudC9saW51eC9oYW5kbGVyL2V4Y2VwdGlvbl9oYW5kbGVyLmNjOjY2
OgotL3Vzci9pbmNsdWRlL2JpdHMvc2lnbmFsX2V4dC5oOjI5OjEyOiBub3RlOiBwcmV2aW91cyBk
ZWNsYXJhdGlvbiBvZiDigJhpbnQgdGdraWxsKF9fcGlkX3QsIF9fcGlkX3QsIGludCnigJkKLSAg
IDI5IHwgZXh0ZXJuIGludCB0Z2tpbGwgKF9fcGlkX3QgX190Z2lkLCBfX3BpZF90IF9fdGlkLCBp
bnQgX19zaWduYWwpOwotICAgICAgfCAgICAgICAgICAgIF5+fn5+fgotCi1VcHN0cmVhbSBnb29n
bGUtYnJlYWtwYWQgc2ltcGx5IGRyb3BwZWQgdGhlIHVzZSBvZiB0aGUgaW50ZXJuYWwKLXRna2ls
bCgpIGluIGNvbW1pdAotaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2JyZWFrcGFk
L2JyZWFrcGFkLysvN2UzYzE2NTAwMGQ0NGZhMTUzYTMyNzA4NzBlZDUwMGJjOGJiYjQ2MS4gSG93
ZXZlciwKLXRoaXMgaXMgbm90IHJlYWxpc3RpYyBmb3IgQnVpbGRyb290LCBzaW5jZSB3ZSBkbyBz
dXBwb3J0IG9sZCBzeXN0ZW1zCi13aGVyZSB0aGUgc3lzdGVtIEMgbGlicmFyeSB3aWxsIG5vdCBu
ZWNlc3NhcmlseSBwcm92aWRlIHRna2lsbCgpLgotCi1TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0
YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0tCi0gc3JjL2NsaWVudC9s
aW51eC9oYW5kbGVyL2V4Y2VwdGlvbl9oYW5kbGVyLmNjIHwgNCArKy0tCi0gMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3NyYy9j
bGllbnQvbGludXgvaGFuZGxlci9leGNlcHRpb25faGFuZGxlci5jYyBiL3NyYy9jbGllbnQvbGlu
dXgvaGFuZGxlci9leGNlcHRpb25faGFuZGxlci5jYwotaW5kZXggYjYzZjk3M2IuLmI0YzI3OWI4
IDEwMDY0NAotLS0tIGEvc3JjL2NsaWVudC9saW51eC9oYW5kbGVyL2V4Y2VwdGlvbl9oYW5kbGVy
LmNjCi0rKysgYi9zcmMvY2xpZW50L2xpbnV4L2hhbmRsZXIvZXhjZXB0aW9uX2hhbmRsZXIuY2MK
LUBAIC0xMDYsNyArMTA2LDcgQEAKLSAjZW5kaWYKLSAKLSAvLyBBIHdyYXBwZXIgZm9yIHRoZSB0
Z2tpbGwgc3lzY2FsbDogc2VuZCBhIHNpZ25hbCB0byBhIHNwZWNpZmljIHRocmVhZC4KLS1zdGF0
aWMgaW50IHRna2lsbChwaWRfdCB0Z2lkLCBwaWRfdCB0aWQsIGludCBzaWcpIHsKLStzdGF0aWMg
aW50IEJyZWFrcGFkVGdraWxsKHBpZF90IHRnaWQsIHBpZF90IHRpZCwgaW50IHNpZykgewotICAg
cmV0dXJuIHN5c2NhbGwoX19OUl90Z2tpbGwsIHRnaWQsIHRpZCwgc2lnKTsKLSAgIHJldHVybiAw
OwotIH0KLUBAIC0zODcsNyArMzg3LDcgQEAgdm9pZCBFeGNlcHRpb25IYW5kbGVyOjpTaWduYWxI
YW5kbGVyKGludCBzaWcsIHNpZ2luZm9fdCogaW5mbywgdm9pZCogdWMpIHsKLSAgICAgLy8gSW4g
b3JkZXIgdG8gcmV0cmlnZ2VyIGl0LCB3ZSBoYXZlIHRvIHF1ZXVlIGEgbmV3IHNpZ25hbCBieSBj
YWxsaW5nCi0gICAgIC8vIGtpbGwoKSBvdXJzZWx2ZXMuICBUaGUgc3BlY2lhbCBjYXNlIChzaV9w
aWQgPT0gMCAmJiBzaWcgPT0gU0lHQUJSVCkgaXMKLSAgICAgLy8gZHVlIHRvIHRoZSBrZXJuZWwg
c2VuZGluZyBhIFNJR0FCUlQgZnJvbSBhIHVzZXIgcmVxdWVzdCB2aWEgU3lzUlEuCi0tICAgIGlm
ICh0Z2tpbGwoZ2V0cGlkKCksIHN5c2NhbGwoX19OUl9nZXR0aWQpLCBzaWcpIDwgMCkgewotKyAg
ICBpZiAoQnJlYWtwYWRUZ2tpbGwoZ2V0cGlkKCksIHN5c2NhbGwoX19OUl9nZXR0aWQpLCBzaWcp
IDwgMCkgewotICAgICAgIC8vIElmIHdlIGZhaWxlZCB0byBraWxsIG91cnNlbHZlcyAoZS5nLiBi
ZWNhdXNlIGEgc2FuZGJveCBkaXNhbGxvd3MgdXMKLSAgICAgICAvLyB0byBkbyBzbyksIHdlIGlu
c3RlYWQgcmVzb3J0IHRvIHRlcm1pbmF0aW5nIG91ciBwcm9jZXNzLiBUaGlzIHdpbGwKLSAgICAg
ICAvLyByZXN1bHQgaW4gYW4gaW5jb3JyZWN0IGV4aXQgY29kZS4KLS0tIAotMi4yNC4xCi0KZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkLzAwMDQtRml4LWZvci1ub24tY29uc3Rh
bnQtU0lHU1RLU1oucGF0Y2ggYi9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC8wMDA0LUZpeC1mb3It
bm9uLWNvbnN0YW50LVNJR1NUS1NaLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCA0MjkxMjE2YzYxLi4wMDAwMDAwMDAwCi0tLSBhL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkLzAw
MDQtRml4LWZvci1ub24tY29uc3RhbnQtU0lHU1RLU1oucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAt
MSwzNCArMCwwIEBACi1Gcm9tIDRhMzMyZDAxMTg2YjA5YTlkNDYzOTBiODQ1MDI0ZDkxNGQ5MTQ5
Y2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBNaWNoZWwgQWxleGFuZHJlIFNhbGlt
IDxtaWNoZWxAbWljaGVsLXNsbS5uYW1lPgotRGF0ZTogU3VuLCAyMSBNYXIgMjAyMSAxMzoxNzow
MCAtMDcwMAotU3ViamVjdDogW1BBVENIXSBGaXggZm9yIG5vbi1jb25zdGFudCBTSUdTVEtTWgot
Ci1PbiBnbGliYyA+IDIuMzMsIGBTSUdTVEtTWmAgbWlnaHQgbm90IGJlIGNvbnN0YW50IChpbiB3
aGljaCBjYXNlCi1pdCBleHBhbmRzIHRvIGEgY2FsbCB0byBgc3lzY29uZmAgd2hpY2ggcmV0dXJu
cyBhIGBsb25nIGludGApOyBzZWUKLWh0dHA6Ly9zb3VyY2V3YXJlLW9yZy4xNTA0Lm43Lm5hYmJs
ZS5jb20vUEFUQ0gtc3lzY29uZi1BZGQtU0MtTUlOU0lHU1RLU1otU0MtU0lHU1RLU1otQlotMjAz
MDUtdGQ2NTA5NDguaHRtbAotCi1DYXN0IHRoZSB0d28gYXJndW1lbnRzIHRvIGBtYXhgIHRvIGB1
bnNpZ25lZGAsIHdoaWNoIGlzIHRoZSB0eXBlIG9mIHRoZSB2YXJpYWJsZQotd2UncmUgc3Rvcmlu
ZyB0aGUgcmVzdWx0IGluIGFueXdheSwgc28gdGhhdCBpdCB3b3JrcyBib3RoIHdpdGggdGhlIG9s
ZC1zdHlsZSBjb25zdGFudAotYFNJR1NUS1NaYCBhbmQgdGhlIG5ldyBjb25maWd1cmFibGUgb25l
LgotCi1TaWduZWQtb2ZmLWJ5OiBNaWNoZWwgQWxleGFuZHJlIFNhbGltIDxtaWNoZWxAbWljaGVs
LXNsbS5uYW1lPgotQ2hhbmdlLUlkOiBJM2Q4NzA0ODU2MWE4N2M2YjlmY2RiYjE0YjNkNTNkZDQ1
YjBhMDBmMAotCi1bUmV0cmlldmVkIGZyb206Ci1odHRwczovL2Nocm9taXVtLXJldmlldy5nb29n
bGVzb3VyY2UuY29tL2MvYnJlYWtwYWQvYnJlYWtwYWQvKy8yNzc2Mzc5XQotU2lnbmVkLW9mZi1i
eTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLS0KLQot
ZGlmZiAtLWdpdCBhL3NyYy9jbGllbnQvbGludXgvaGFuZGxlci9leGNlcHRpb25faGFuZGxlci5j
YyBiL3NyYy9jbGllbnQvbGludXgvaGFuZGxlci9leGNlcHRpb25faGFuZGxlci5jYwotaW5kZXgg
Y2EzNTNjNC4uMzc4ODgyOSAxMDA2NDQKLS0tLSBhL3NyYy9jbGllbnQvbGludXgvaGFuZGxlci9l
eGNlcHRpb25faGFuZGxlci5jYwotKysrIGIvc3JjL2NsaWVudC9saW51eC9oYW5kbGVyL2V4Y2Vw
dGlvbl9oYW5kbGVyLmNjCi1AQCAtMTM4LDcgKzEzOCw3IEBACi0gICAvLyBTSUdTVEtTWiBtYXkg
YmUgdG9vIHNtYWxsIHRvIHByZXZlbnQgdGhlIHNpZ25hbCBoYW5kbGVycyBmcm9tIG92ZXJydW5u
aW5nCi0gICAvLyB0aGUgYWx0ZXJuYXRpdmUgc3RhY2suIEVuc3VyZSB0aGF0IHRoZSBzaXplIG9m
IHRoZSBhbHRlcm5hdGl2ZSBzdGFjayBpcwotICAgLy8gbGFyZ2UgZW5vdWdoLgotLSAgc3RhdGlj
IGNvbnN0IHVuc2lnbmVkIGtTaWdTdGFja1NpemUgPSBzdGQ6Om1heCgxNjM4NCwgU0lHU1RLU1op
OwotKyAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGtTaWdTdGFja1NpemUgPSBzdGQ6Om1heCgodW5z
aWduZWQpIDE2Mzg0LCAodW5zaWduZWQpIFNJR1NUS1NaKTsKLSAKLSAgIC8vIE9ubHkgc2V0IGFu
IGFsdGVybmF0aXZlIHN0YWNrIGlmIHRoZXJlIGlzbid0IGFscmVhZHkgb25lLCBvciBpZiB0aGUg
Y3VycmVudAotICAgLy8gb25lIGlzIHRvbyBzbWFsbC4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ29v
Z2xlLWJyZWFrcGFkL2dvb2dsZS1icmVha3BhZC5oYXNoIGIvcGFja2FnZS9nb29nbGUtYnJlYWtw
YWQvZ29vZ2xlLWJyZWFrcGFkLmhhc2gKaW5kZXggMDlmOWEwY2Y5MS4uYzE4NGRhMTExMyAxMDA2
NDQKLS0tIGEvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvZ29vZ2xlLWJyZWFrcGFkLmhhc2gKKysr
IGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvZ29vZ2xlLWJyZWFrcGFkLmhhc2gKQEAgLTEsMyAr
MSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAzNTA0NjM5ZWU1ZDc1MzZlN2Y3
OTM5YjgwNTIwZGZjYjk4ODYzZTliNTA2NzNkZDU3N2QwYWIyYTA3MTA1YWNiICBnb29nbGUtYnJl
YWtwYWQtNzUxNWFiMTM3NjhjN2VkYzA5ZjBmMmVjMjM1NGRjNmM5MjgyMzlhNi1icjEudGFyLmd6
CitzaGEyNTYgIDUyNzE2ZDE0MGJhNTI4ZDM2YjQwNTkxYWUyYzc0ODViMTgwMjNmNjYxMDQxNGJi
YTAwNTdmMGNjMTNjYWYyNTYgIGdvb2dsZS1icmVha3BhZC1jODVlYjRhNTliNjE4ZjNiZWFhZDU0
NDVjZWIxZjg2NWZmYThlZmRmLWJyMS50YXIuZ3oKIHNoYTI1NiAgZjk3NTJhMGE0YWM1MjE1ZWFh
M2E0ZjBlYzI5Y2Q1MjU2M2M4ODNkZTVkNzg3MDUyNWNjMGJjM2EyMWNiOGUxNSAgTElDRU5TRQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvZ29vZ2xlLWJyZWFrcGFkLm1rIGIv
cGFja2FnZS9nb29nbGUtYnJlYWtwYWQvZ29vZ2xlLWJyZWFrcGFkLm1rCmluZGV4IDhhZTVmOTli
YzcuLjIwNzU1YTFjMmEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL2dvb2ds
ZS1icmVha3BhZC5taworKysgYi9wYWNrYWdlL2dvb2dsZS1icmVha3BhZC9nb29nbGUtYnJlYWtw
YWQubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1HT09H
TEVfQlJFQUtQQURfVkVSU0lPTiA9IDc1MTVhYjEzNzY4YzdlZGMwOWYwZjJlYzIzNTRkYzZjOTI4
MjM5YTYKK0dPT0dMRV9CUkVBS1BBRF9WRVJTSU9OID0gYzg1ZWI0YTU5YjYxOGYzYmVhYWQ1NDQ1
Y2ViMWY4NjVmZmE4ZWZkZgogR09PR0xFX0JSRUFLUEFEX1NJVEUgPSBodHRwczovL2Nocm9taXVt
Lmdvb2dsZXNvdXJjZS5jb20vYnJlYWtwYWQvYnJlYWtwYWQKIEdPT0dMRV9CUkVBS1BBRF9TSVRF
X01FVEhPRCA9IGdpdAogR09PR0xFX0JSRUFLUEFEX0NPTkZfT1BUUyA9IC0tZGlzYWJsZS1wcm9j
ZXNzb3IgLS1kaXNhYmxlLXRvb2xzCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LXN5c2NhbGwt
c3VwcG9ydC9saW51eC1zeXNjYWxsLXN1cHBvcnQuaGFzaCBiL3BhY2thZ2UvbGludXgtc3lzY2Fs
bC1zdXBwb3J0L2xpbnV4LXN5c2NhbGwtc3VwcG9ydC5oYXNoCmluZGV4IDM0NDViZjEzOTguLmY0
NWYwN2FjNTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGludXgtc3lzY2FsbC1zdXBwb3J0L2xpbnV4
LXN5c2NhbGwtc3VwcG9ydC5oYXNoCisrKyBiL3BhY2thZ2UvbGludXgtc3lzY2FsbC1zdXBwb3J0
L2xpbnV4LXN5c2NhbGwtc3VwcG9ydC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKLXNoYTI1NiAgNDk4ZWZiNjkxNWFjNmU2NWM4MmM3MTJmYWRkM2MzMGY5NDcyNzY0
MTE0YzgzNTg0OWUwMmYyYzA5MmJhY2QyZCAgbGludXgtc3lzY2FsbC1zdXBwb3J0LTNmNjQ3OGFj
OTVlZGY4NmNkM2RhMzAwYzJjMGQzNGE0MzhmNWRiZWItYnIxLnRhci5negorc2hhMjU2ICAyYTEy
NzAzY2U1OTc3M2VjNzE0YjYwM2U0NmM3MzNiMDNmM2ZiZjliNDc2MzE5NWZhZTQwZDAwNDJlNWRh
M2Y2ICBsaW51eC1zeXNjYWxsLXN1cHBvcnQtZTFlN2IwYWQ4ZWU5OWE4NzViMjcyYzhlMzNlMzA4
NDcyZTg5NzY2MC1icjEudGFyLmd6CiBzaGEyNTYgIDRjMWZjOWFjYzlmMzg2N2U1YzgxYjVkNWY1
N2M1MmZiOWE5MzI2NjJiZDRlMmU1ZTQzYjNmZTk1MzkwMDM1ZjUgIGxpbnV4X3N5c2NhbGxfc3Vw
cG9ydC5oCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LXN5c2NhbGwtc3VwcG9ydC9saW51eC1z
eXNjYWxsLXN1cHBvcnQubWsgYi9wYWNrYWdlL2xpbnV4LXN5c2NhbGwtc3VwcG9ydC9saW51eC1z
eXNjYWxsLXN1cHBvcnQubWsKaW5kZXggMDUwYzUwNThhYi4uYzBjN2M0YzNiMiAxMDA2NDQKLS0t
IGEvcGFja2FnZS9saW51eC1zeXNjYWxsLXN1cHBvcnQvbGludXgtc3lzY2FsbC1zdXBwb3J0Lm1r
CisrKyBiL3BhY2thZ2UvbGludXgtc3lzY2FsbC1zdXBwb3J0L2xpbnV4LXN5c2NhbGwtc3VwcG9y
dC5tawpAQCAtNSw3ICs1LDcgQEAKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKICMgVXNlIHRo
ZSBzYW1lIHZlcnNpb24gdGhhdCB0aGUgb25lIHVzZWQgYnkgR29vZ2xlLWJyZWFrcGFkIChzZWUg
REVQUyBmaWxlKQotTElOVVhfU1lTQ0FMTF9TVVBQT1JUX1ZFUlNJT04gPSAzZjY0NzhhYzk1ZWRm
ODZjZDNkYTMwMGMyYzBkMzRhNDM4ZjVkYmViCitMSU5VWF9TWVNDQUxMX1NVUFBPUlRfVkVSU0lP
TiA9IGUxZTdiMGFkOGVlOTlhODc1YjI3MmM4ZTMzZTMwODQ3MmU4OTc2NjAKIExJTlVYX1NZU0NB
TExfU1VQUE9SVF9TSVRFID0gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3VyY2UuY29tL2xpbnV4
LXN5c2NhbGwtc3VwcG9ydAogTElOVVhfU1lTQ0FMTF9TVVBQT1JUX1NJVEVfTUVUSE9EID0gZ2l0
CiBMSU5VWF9TWVNDQUxMX1NVUFBPUlRfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQotLSAKMi4zMi4w
Cgo=
--000000000000d4b8a705dd151439
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000d4b8a705dd151439--
