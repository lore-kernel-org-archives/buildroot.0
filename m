Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EC6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 16:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1D98317B;
	Sat, 23 Apr 2022 16:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPyKm4gRqcwj; Sat, 23 Apr 2022 16:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F88B830DE;
	Sat, 23 Apr 2022 16:14:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7E31BF5DF
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AD9C830DE
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 16:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kwcy3X9LHcd9 for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 16:13:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96E2B8308B
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 16:13:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 43D5084155; Sat, 23 Apr 2022 16:03:49 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 18:09:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc68bcf9b57e9b7324c6b567a766b72522580b8a
X-Git-Newrev: e831353d8f476cefd8320e38f2eb0d9f00359f3a
X-Patchwork-Hint: ignore
Message-Id: <20220423160349.43D5084155@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/google-breakpad: bump to latest
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
Content-Type: multipart/mixed; boundary="===============6964330229209229552=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6964330229209229552==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e831353d8f476cefd8320e38f2eb0d9f00359f3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes compatibility with GCC-11.
Doesn't require any local patches (all applied upstream or no longer
required).

LICENSE adds three new licenses:
- MIT for code copied from libunwind;
- Apple Public Source License for Mac-specific code;
- BSD-4-Clause also for Mac-specific code.

Since the latter two are Mac-specific, we don't mention them in
_LICENSE.

linux-syscall-support bumped to the verion in DEPS. It now has a license
file so use that instead of the header file.

Signed-off-by: Nuno Gonçalves <nunojpg@gmail.com>
[Arnout: update licenses, license files and hashes]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-add-missing-asm-ptrace-include.patch      |  31 ---
 ...aining-references-to-struct-ucontext-with.patch | 257 ---------------------
 ...linux-handler-exception_handler.cc-rename.patch |  59 -----
 .../0004-Fix-for-non-constant-SIGSTKSZ.patch       |  34 ---
 package/google-breakpad/google-breakpad.hash       |   4 +-
 package/google-breakpad/google-breakpad.mk         |   4 +-
 .../linux-syscall-support.hash                     |   4 +-
 .../linux-syscall-support/linux-syscall-support.mk |   4 +-
 8 files changed, 8 insertions(+), 389 deletions(-)

diff --git a/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch b/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
deleted file mode 100644
index 281c7a042a..0000000000
--- a/package/google-breakpad/0001-add-missing-asm-ptrace-include.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Include <asm/ptrace.h> to get necessary definitions on AArch64
-
-In glibc commit
-https://sourceware.org/git/?p=glibc.git;a=commit;h=7d05a8168b45c0580e1f9a79c2dd26c8f0d31fca,
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
-===================================================================
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
diff --git a/package/google-breakpad/0002-Replace-remaining-references-to-struct-ucontext-with.patch b/package/google-breakpad/0002-Replace-remaining-references-to-struct-ucontext-with.patch
deleted file mode 100644
index e02ae268b9..0000000000
--- a/package/google-breakpad/0002-Replace-remaining-references-to-struct-ucontext-with.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 7975a962e1d6dbad5a46792a54e647abd7caf5f1 Mon Sep 17 00:00:00 2001
-From: Mark Mentovai <mark@chromium.org>
-Date: Tue, 19 Sep 2017 22:48:30 -0400
-Subject: [PATCH] Replace remaining references to 'struct ucontext' with
- 'ucontext_t'
-
-This relands
-https://chromium.googlesource.com/breakpad/breakpad/src/+/e3035bc406cee8a4d765e59ad46eb828705f17f4,
-which was accidentally committed to breakpad/breakpad/src, the read-only
-mirror of src in breakpad/breakpad. (Well, it should have been
-read-only.) See https://crbug.com/766164.
-
-This fixes issues with glibc-2.26.
-
-See https://bugs.gentoo.org/show_bug.cgi?id=628782 ,
-https://sourceware.org/git/?p=glibc.git;h=251287734e89a52da3db682a8241eb6bccc050c9 , and
-https://sourceware.org/ml/libc-alpha/2017-08/msg00010.html for context.
-Change-Id: Id66f474d636dd2afa450bab925c5514a800fdd6f
-Reviewed-on: https://chromium-review.googlesource.com/674304
-Reviewed-by: Mark Mentovai <mark@chromium.org>
-
-(cherry picked from commit bddcc58860f522a0d4cbaa7e9d04058caee0db9d)
-[Romain: backport from upstream]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- .../linux/dump_writer_common/ucontext_reader.cc    | 32 +++++++++++-----------
- .../linux/dump_writer_common/ucontext_reader.h     | 14 +++++-----
- src/client/linux/handler/exception_handler.cc      | 10 +++----
- src/client/linux/handler/exception_handler.h       |  6 ++--
- .../linux/microdump_writer/microdump_writer.cc     |  2 +-
- .../linux/minidump_writer/minidump_writer.cc       |  2 +-
- 6 files changed, 33 insertions(+), 33 deletions(-)
-
-diff --git a/src/client/linux/dump_writer_common/ucontext_reader.cc b/src/client/linux/dump_writer_common/ucontext_reader.cc
-index c80724d..052ce37 100644
---- a/src/client/linux/dump_writer_common/ucontext_reader.cc
-+++ b/src/client/linux/dump_writer_common/ucontext_reader.cc
-@@ -36,19 +36,19 @@ namespace google_breakpad {
- 
- // Minidump defines register structures which are different from the raw
- // structures which we get from the kernel. These are platform specific
--// functions to juggle the ucontext and user structures into minidump format.
-+// functions to juggle the ucontext_t and user structures into minidump format.
- 
- #if defined(__i386__)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_ESP];
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_EIP];
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                                     const struct _libc_fpstate* fp) {
-   const greg_t* regs = uc->uc_mcontext.gregs;
- 
-@@ -88,15 +88,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
- 
- #elif defined(__x86_64)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_RSP];
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[REG_RIP];
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                                     const struct _libc_fpstate* fpregs) {
-   const greg_t* regs = uc->uc_mcontext.gregs;
- 
-@@ -145,15 +145,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
- 
- #elif defined(__ARM_EABI__)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.arm_sp;
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.arm_pc;
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc) {
-   out->context_flags = MD_CONTEXT_ARM_FULL;
- 
-   out->iregs[0] = uc->uc_mcontext.arm_r0;
-@@ -184,15 +184,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
- 
- #elif defined(__aarch64__)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.sp;
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.pc;
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                                     const struct fpsimd_context* fpregs) {
-   out->context_flags = MD_CONTEXT_ARM64_FULL;
- 
-@@ -210,15 +210,15 @@ void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc,
- 
- #elif defined(__mips__)
- 
--uintptr_t UContextReader::GetStackPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetStackPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.gregs[MD_CONTEXT_MIPS_REG_SP];
- }
- 
--uintptr_t UContextReader::GetInstructionPointer(const struct ucontext* uc) {
-+uintptr_t UContextReader::GetInstructionPointer(const ucontext_t* uc) {
-   return uc->uc_mcontext.pc;
- }
- 
--void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext *uc) {
-+void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc) {
- #if _MIPS_SIM == _ABI64
-   out->context_flags = MD_CONTEXT_MIPS64_FULL;
- #elif _MIPS_SIM == _ABIO32
-diff --git a/src/client/linux/dump_writer_common/ucontext_reader.h b/src/client/linux/dump_writer_common/ucontext_reader.h
-index b6e77b4..2de80b7 100644
---- a/src/client/linux/dump_writer_common/ucontext_reader.h
-+++ b/src/client/linux/dump_writer_common/ucontext_reader.h
-@@ -39,23 +39,23 @@
- 
- namespace google_breakpad {
- 
--// Wraps platform-dependent implementations of accessors to ucontext structs.
-+// Wraps platform-dependent implementations of accessors to ucontext_t structs.
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
-diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
-index b63f973..3d809b8 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -439,9 +439,9 @@ bool ExceptionHandler::HandleSignal(int sig, siginfo_t* info, void* uc) {
-   // Fill in all the holes in the struct to make Valgrind happy.
-   memset(&g_crash_context_, 0, sizeof(g_crash_context_));
-   memcpy(&g_crash_context_.siginfo, info, sizeof(siginfo_t));
--  memcpy(&g_crash_context_.context, uc, sizeof(struct ucontext));
-+  memcpy(&g_crash_context_.context, uc, sizeof(ucontext_t));
- #if defined(__aarch64__)
--  struct ucontext* uc_ptr = (struct ucontext*)uc;
-+  ucontext_t* uc_ptr = (ucontext_t*)uc;
-   struct fpsimd_context* fp_ptr =
-       (struct fpsimd_context*)&uc_ptr->uc_mcontext.__reserved;
-   if (fp_ptr->head.magic == FPSIMD_MAGIC) {
-@@ -450,9 +450,9 @@ bool ExceptionHandler::HandleSignal(int sig, siginfo_t* info, void* uc) {
-   }
- #elif !defined(__ARM_EABI__) && !defined(__mips__)
-   // FP state is not part of user ABI on ARM Linux.
--  // In case of MIPS Linux FP state is already part of struct ucontext
-+  // In case of MIPS Linux FP state is already part of ucontext_t
-   // and 'float_state' is not a member of CrashContext.
--  struct ucontext* uc_ptr = (struct ucontext*)uc;
-+  ucontext_t* uc_ptr = (ucontext_t*)uc;
-   if (uc_ptr->uc_mcontext.fpregs) {
-     memcpy(&g_crash_context_.float_state, uc_ptr->uc_mcontext.fpregs,
-            sizeof(g_crash_context_.float_state));
-@@ -476,7 +476,7 @@ bool ExceptionHandler::SimulateSignalDelivery(int sig) {
-   // ExceptionHandler::HandleSignal().
-   siginfo.si_code = SI_USER;
-   siginfo.si_pid = getpid();
--  struct ucontext context;
-+  ucontext_t context;
-   getcontext(&context);
-   return HandleSignal(sig, &siginfo, &context);
- }
-diff --git a/src/client/linux/handler/exception_handler.h b/src/client/linux/handler/exception_handler.h
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
-     // #ifdef this out because FP state is not part of user ABI for Linux ARM.
--    // In case of MIPS Linux FP state is already part of struct
--    // ucontext so 'float_state' is not required.
-+    // In case of MIPS Linux FP state is already part of ucontext_t so
-+    // 'float_state' is not required.
-     fpstate_t float_state;
- #endif
-   };
-diff --git a/src/client/linux/microdump_writer/microdump_writer.cc b/src/client/linux/microdump_writer/microdump_writer.cc
-index 6f5b435..a508667 100644
---- a/src/client/linux/microdump_writer/microdump_writer.cc
-+++ b/src/client/linux/microdump_writer/microdump_writer.cc
-@@ -571,7 +571,7 @@ class MicrodumpWriter {
- 
-   void* Alloc(unsigned bytes) { return dumper_->allocator()->Alloc(bytes); }
- 
--  const struct ucontext* const ucontext_;
-+  const ucontext_t* const ucontext_;
- #if !defined(__ARM_EABI__) && !defined(__mips__)
-   const google_breakpad::fpstate_t* const float_state_;
- #endif
-diff --git a/src/client/linux/minidump_writer/minidump_writer.cc b/src/client/linux/minidump_writer/minidump_writer.cc
-index 86009b9..f2aec73 100644
---- a/src/client/linux/minidump_writer/minidump_writer.cc
-+++ b/src/client/linux/minidump_writer/minidump_writer.cc
-@@ -1248,7 +1248,7 @@ class MinidumpWriter {
-   const int fd_;  // File descriptor where the minidum should be written.
-   const char* path_;  // Path to the file where the minidum should be written.
- 
--  const struct ucontext* const ucontext_;  // also from the signal handler
-+  const ucontext_t* const ucontext_;  // also from the signal handler
- #if !defined(__ARM_EABI__) && !defined(__mips__)
-   const google_breakpad::fpstate_t* const float_state_;  // ditto
- #endif
--- 
-2.9.5
-
diff --git a/package/google-breakpad/0003-src-client-linux-handler-exception_handler.cc-rename.patch b/package/google-breakpad/0003-src-client-linux-handler-exception_handler.cc-rename.patch
deleted file mode 100644
index 579e7f3457..0000000000
--- a/package/google-breakpad/0003-src-client-linux-handler-exception_handler.cc-rename.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 2fa414c8655c421e7eb0bb1719928babb0ecf7c6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 26 Dec 2019 22:21:33 +0100
-Subject: [PATCH] src/client/linux/handler/exception_handler.cc: rename tgkill
- to BreakpadTgkill()
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Since glibc 2.30, a tgkill() function was added in the C library, and
-its definition obviously conflicts with the internal definition of
-google-breakpad, causing build failures:
-
-src/client/linux/handler/exception_handler.cc:109:12: error: ‘int tgkill(pid_t, pid_t, int)’ was declared ‘extern’ and later ‘static’ [-fpermissive]
-  109 | static int tgkill(pid_t tgid, pid_t tid, int sig) {
-      |            ^~~~~~
-In file included from /usr/include/signal.h:374,
-                 from ./src/client/linux/handler/exception_handler.h:33,
-                 from src/client/linux/handler/exception_handler.cc:66:
-/usr/include/bits/signal_ext.h:29:12: note: previous declaration of ‘int tgkill(__pid_t, __pid_t, int)’
-   29 | extern int tgkill (__pid_t __tgid, __pid_t __tid, int __signal);
-      |            ^~~~~~
-
-Upstream google-breakpad simply dropped the use of the internal
-tgkill() in commit
-https://chromium.googlesource.com/breakpad/breakpad/+/7e3c165000d44fa153a3270870ed500bc8bbb461. However,
-this is not realistic for Buildroot, since we do support old systems
-where the system C library will not necessarily provide tgkill().
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- src/client/linux/handler/exception_handler.cc | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
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
-@@ -387,7 +387,7 @@ void ExceptionHandler::SignalHandler(int sig, siginfo_t* info, void* uc) {
-     // In order to retrigger it, we have to queue a new signal by calling
-     // kill() ourselves.  The special case (si_pid == 0 && sig == SIGABRT) is
-     // due to the kernel sending a SIGABRT from a user request via SysRQ.
--    if (tgkill(getpid(), syscall(__NR_gettid), sig) < 0) {
-+    if (BreakpadTgkill(getpid(), syscall(__NR_gettid), sig) < 0) {
-       // If we failed to kill ourselves (e.g. because a sandbox disallows us
-       // to do so), we instead resort to terminating our process. This will
-       // result in an incorrect exit code.
--- 
-2.24.1
-
diff --git a/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch b/package/google-breakpad/0004-Fix-for-non-constant-SIGSTKSZ.patch
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
-http://sourceware-org.1504.n7.nabble.com/PATCH-sysconf-Add-SC-MINSIGSTKSZ-SC-SIGSTKSZ-BZ-20305-td650948.html
-
-Cast the two arguments to `max` to `unsigned`, which is the type of the variable
-we're storing the result in anyway, so that it works both with the old-style constant
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
-diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
-index ca353c4..3788829 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -138,7 +138,7 @@
-   // SIGSTKSZ may be too small to prevent the signal handlers from overrunning
-   // the alternative stack. Ensure that the size of the alternative stack is
-   // large enough.
--  static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
-+  static const unsigned kSigStackSize = std::max((unsigned) 16384, (unsigned) SIGSTKSZ);
- 
-   // Only set an alternative stack if there isn't already one, or if the current
-   // one is too small.
diff --git a/package/google-breakpad/google-breakpad.hash b/package/google-breakpad/google-breakpad.hash
index 09f9a0cf91..03719816b5 100644
--- a/package/google-breakpad/google-breakpad.hash
+++ b/package/google-breakpad/google-breakpad.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3504639ee5d7536e7f7939b80520dfcb98863e9b50673dd577d0ab2a07105acb  google-breakpad-7515ab13768c7edc09f0f2ec2354dc6c928239a6-br1.tar.gz
-sha256  f9752a0a4ac5215eaa3a4f0ec29cd52563c883de5d7870525cc0bc3a21cb8e15  LICENSE
+sha256  52716d140ba528d36b40591ae2c7485b18023f6610414bba0057f0cc13caf256  google-breakpad-c85eb4a59b618f3beaad5445ceb1f865ffa8efdf-br1.tar.gz
+sha256  8d5d1311342ed55b486d778a6763f54a26002698ac0cbab64026b98033300dfd  LICENSE
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index 8ae5f99bc7..cafe1359f3 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-GOOGLE_BREAKPAD_VERSION = 7515ab13768c7edc09f0f2ec2354dc6c928239a6
+GOOGLE_BREAKPAD_VERSION = c85eb4a59b618f3beaad5445ceb1f865ffa8efdf
 GOOGLE_BREAKPAD_SITE = https://chromium.googlesource.com/breakpad/breakpad
 GOOGLE_BREAKPAD_SITE_METHOD = git
 GOOGLE_BREAKPAD_CONF_OPTS = --disable-processor --disable-tools
 # Only a static library is installed
 GOOGLE_BREAKPAD_INSTALL_TARGET = NO
 GOOGLE_BREAKPAD_INSTALL_STAGING = YES
-GOOGLE_BREAKPAD_LICENSE = BSD-3-Clause
+GOOGLE_BREAKPAD_LICENSE = BSD-3-Clause, MIT
 GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
 GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support
 
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index 3445bf1398..9d8855cf23 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  498efb6915ac6e65c82c712fadd3c30f9472764114c835849e02f2c092bacd2d  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb-br1.tar.gz
-sha256  4c1fc9acc9f3867e5c81b5d5f57c52fb9a932662bd4e2e5e43b3fe95390035f5  linux_syscall_support.h
+sha256  2a12703ce59773ec714b603e46c733b03f3fbf9b4763195fae40d0042e5da3f6  linux-syscall-support-e1e7b0ad8ee99a875b272c8e33e308472e897660-br1.tar.gz
+sha256  c180f12840c00224cceed7139192018d2c7e6061db4ce4310b8626f7ad10bf26  LICENSE
diff --git a/package/linux-syscall-support/linux-syscall-support.mk b/package/linux-syscall-support/linux-syscall-support.mk
index 050c5058ab..a4cadf03c3 100644
--- a/package/linux-syscall-support/linux-syscall-support.mk
+++ b/package/linux-syscall-support/linux-syscall-support.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 # Use the same version that the one used by Google-breakpad (see DEPS file)
-LINUX_SYSCALL_SUPPORT_VERSION = 3f6478ac95edf86cd3da300c2c0d34a438f5dbeb
+LINUX_SYSCALL_SUPPORT_VERSION = e1e7b0ad8ee99a875b272c8e33e308472e897660
 LINUX_SYSCALL_SUPPORT_SITE = https://chromium.googlesource.com/linux-syscall-support
 LINUX_SYSCALL_SUPPORT_SITE_METHOD = git
 LINUX_SYSCALL_SUPPORT_LICENSE = BSD-3-Clause
-LINUX_SYSCALL_SUPPORT_LICENSE_FILES = linux_syscall_support.h
+LINUX_SYSCALL_SUPPORT_LICENSE_FILES = LICENSE
 
 # Provide only one header file.
 LINUX_SYSCALL_SUPPORT_INSTALL_TARGET = NO

--===============6964330229209229552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6964330229209229552==--
