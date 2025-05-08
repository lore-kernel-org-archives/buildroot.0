Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7439C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 825EB60F35;
	Mon, 19 May 2025 10:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7V5dy7LI8ngb; Mon, 19 May 2025 10:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B19B76138F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19B76138F;
	Mon, 19 May 2025 10:47:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B914E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF0AE41888
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQ3MH2J_gK1o for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08D81417FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08D81417FB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04C0B82A2E; Mon, 19 May 2025 10:40:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 May 2025 19:13:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6d09b25d08fe72e9781578fb512d5aa391b08c3f
X-Git-Newrev: b79316096489f09e62c3f1675936f8afe8cdd3b6
X-Patchwork-Hint: ignore
Message-Id: <20250519104000.04C0B82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: bump 16.x series
 to 16.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b79316096489f09e62c3f1675936f8afe8cdd3b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes:

 Set GDB version number to 16.3.
 gstack: [downstream regression] Output file names and line numbers
 Fix build failure for gdbserver's raw_compare self test
 Fix gdbserver crashes on SVE/SME-enabled systems
 gdb: allow selecting default fg/bg colors in tui mode
 gdb: Fix assertion failure when inline frame #0 is duplicated
 [gdb/tdep] Rewrite i386_canonicalize_syscall
 [gdb/record] Fix out-of-bounds write in aarch64_record_asimd_load_store
 gdb/dwarf: save DWARF version in dwarf2_loclist_baton, remove it from dwarf2_per_cu
 Fix segfault if target_fileio_read_alloc fails
 gdb/tui: use wrefresh if output is not surpressed
 [gdb/corefiles] Fix segfault in core_target_open
 Bump GDB's version number to 16.2.90.DATE-git.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                    | 18 +++++++++---------
 ...ace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  0
 ...ce-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  0
 .../gdb/{16.2 => 16.3}/0003-use-asm-sgidefs.h.patch    |  0
 .../0004-gdbserver-fix-build-for-m68k.patch            |  0
 ...0005-nat-fork-inferior-include-linux-ptrace.h.patch |  0
 ...0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch |  0
 .../{16.2 => 16.3}/0007-fix-musl-build-on-riscv.patch  |  0
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch     |  0
 .../0009-gdb-Fix-native-build-on-xtensa.patch          |  0
 package/gdb/Config.in.host                             |  2 +-
 package/gdb/gdb.hash                                   |  2 +-
 12 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 038e3d6dc6..27b1b2be68 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -502,15 +502,15 @@ package/gdb/15.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
 package/gdb/15.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/15.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/15.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
-package/gdb/16.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
-package/gdb/16.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
-package/gdb/16.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
-package/gdb/16.2/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
-package/gdb/16.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
-package/gdb/16.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
-package/gdb/16.2/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
-package/gdb/16.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
-package/gdb/16.2/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
+package/gdb/16.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
+package/gdb/16.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
+package/gdb/16.3/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
+package/gdb/16.3/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
+package/gdb/16.3/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
+package/gdb/16.3/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
+package/gdb/16.3/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
+package/gdb/16.3/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
+package/gdb/16.3/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
 package/gerbera/S99gerbera lib_sysv.Indent
diff --git a/package/gdb/16.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/16.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/16.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/16.3/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/16.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/16.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/16.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/16.3/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/16.2/0003-use-asm-sgidefs.h.patch b/package/gdb/16.3/0003-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/16.2/0003-use-asm-sgidefs.h.patch
rename to package/gdb/16.3/0003-use-asm-sgidefs.h.patch
diff --git a/package/gdb/16.2/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/16.3/0004-gdbserver-fix-build-for-m68k.patch
similarity index 100%
rename from package/gdb/16.2/0004-gdbserver-fix-build-for-m68k.patch
rename to package/gdb/16.3/0004-gdbserver-fix-build-for-m68k.patch
diff --git a/package/gdb/16.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/16.3/0005-nat-fork-inferior-include-linux-ptrace.h.patch
similarity index 100%
rename from package/gdb/16.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
rename to package/gdb/16.3/0005-nat-fork-inferior-include-linux-ptrace.h.patch
diff --git a/package/gdb/16.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/16.3/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
similarity index 100%
rename from package/gdb/16.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
rename to package/gdb/16.3/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
diff --git a/package/gdb/16.2/0007-fix-musl-build-on-riscv.patch b/package/gdb/16.3/0007-fix-musl-build-on-riscv.patch
similarity index 100%
rename from package/gdb/16.2/0007-fix-musl-build-on-riscv.patch
rename to package/gdb/16.3/0007-fix-musl-build-on-riscv.patch
diff --git a/package/gdb/16.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/16.3/0008-gdbserver-Makefile.in-fix-NLS-build.patch
similarity index 100%
rename from package/gdb/16.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
rename to package/gdb/16.3/0008-gdbserver-Makefile.in-fix-NLS-build.patch
diff --git a/package/gdb/16.2/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/16.3/0009-gdb-Fix-native-build-on-xtensa.patch
similarity index 100%
rename from package/gdb/16.2/0009-gdb-Fix-native-build-on-xtensa.patch
rename to package/gdb/16.3/0009-gdb-Fix-native-build-on-xtensa.patch
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 42e3928a19..40fe4cf6d2 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -71,5 +71,5 @@ config BR2_GDB_VERSION
 	default "arc-2023.09-release" if BR2_arc
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "15.1"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
-	default "16.2"	   if BR2_GDB_VERSION_16
+	default "16.3"	   if BR2_GDB_VERSION_16
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 0336e4a7a4..3e2d5a9655 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,7 @@
 # From https://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
 sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c390d8d5d5550cc515c16519de1071d8eef96aa58e38056c7e37da1d8b  gdb-15.1.tar.xz
-sha512  f04a6335dbdee371edb7e3213294fcbb878ac39adedb73f7e17e621f54350488f5f5bea9bc742639239c122d590bed158771a74fc3aaeaa7fa0ae304232576a3  gdb-16.2.tar.xz
+sha512  fffd6689c3405466a179670b04720dc825e4f210a761f63dd2b33027432f8cd5d1c059c431a5ec9e165eedd1901220b5329d73c522f9a444788888c731b29e9c  gdb-16.3.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
