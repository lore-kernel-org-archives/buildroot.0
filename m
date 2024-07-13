Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F135C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 15:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D14D607BE;
	Sat, 13 Jul 2024 15:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqUou9kOIErr; Sat, 13 Jul 2024 15:50:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8354607A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8354607A5;
	Sat, 13 Jul 2024 15:50:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C55B51BF406
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD61940D77
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 15:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7gIEj9zVs4Z for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3757410B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3757410B0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A4A98655A; Sat, 13 Jul 2024 15:50:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 17:47:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 177da3cf8fef47546bfee4275c62b0611acdb6b2
X-Git-Newrev: 93ecb99976918de398ce0dd736d451a18a79aa66
X-Patchwork-Hint: ignore
Message-Id: <20240713155026.3A4A98655A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: remove support for version
 12.x
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3947761404138709691=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3947761404138709691==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=93ecb99976918de398ce0dd736d451a18a79aa66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that GDB 15.x has been introduced, GDB 14.x made the default,
let's drop support for GDB 12.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                |  9 ----
 Config.in.legacy                                   |  7 +++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 -------------------
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 ---------------
 package/gdb/12.1/0003-use-asm-sgidefs.h.patch      | 40 --------------
 .../12.1/0004-gdbserver-fix-build-for-m68k.patch   | 63 ----------------------
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 53 ------------------
 ...-Fix-getrandom-compile-for-uclibc-v1.0.35.patch | 39 --------------
 .../gdb/12.1/0007-fix-musl-build-on-riscv.patch    | 60 ---------------------
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch | 38 -------------
 .../12.1/0009-gdb-Fix-native-build-on-xtensa.patch | 57 --------------------
 package/gdb/Config.in.host                         |  4 --
 package/gdb/gdb.hash                               |  1 -
 13 files changed, 7 insertions(+), 462 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2dd331451b..db28680f40 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -586,15 +586,6 @@ package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patc
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
 package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch lib_patch.Upstream
-package/gdb/12.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
-package/gdb/12.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
-package/gdb/12.1/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
-package/gdb/12.1/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
-package/gdb/12.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
-package/gdb/12.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
-package/gdb/12.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
-package/gdb/12.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
-package/gdb/12.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/gdb/13.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
 package/gdb/13.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
 package/gdb/13.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 36efcfb7af..d942576d1e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_GDB_VERSION_12
+	bool "gdb 12.x has been removed"
+	select BR2_LEGACY
+	help
+	  GDB 12.x has been removed. The new default version of GDB
+	  14.x has been automatically selected instead.
+
 config BR2_TARGET_BEAGLEV_DDRINIT
 	bool "beaglev-ddrinit has been removed"
 	select BR2_LEGACY
diff --git a/package/gdb/12.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/12.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
deleted file mode 100644
index 8821bb497b..0000000000
--- a/package/gdb/12.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From bca7617f325787550e2133fe082dbe4da7716fc6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 6 Aug 2016 17:32:50 -0700
-Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Rebase on gdb 8.3]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/nat/ppc-linux.h        | 6 ++++++
- gdbserver/linux-ppc-low.cc | 6 ++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 1094f6b0be3..d8588a646c2 100644
---- a/gdb/nat/ppc-linux.h
-+++ b/gdb/nat/ppc-linux.h
-@@ -18,7 +18,13 @@
- #ifndef NAT_PPC_LINUX_H
- #define NAT_PPC_LINUX_H
- 
-+#if !defined(__GLIBC__)
-+# define pt_regs uapi_pt_regs
-+#endif
- #include <asm/ptrace.h>
-+#if !defined(__GLIBC__)
-+# undef pt_regs
-+#endif
- #include <asm/cputable.h>
- 
- /* This sometimes isn't defined.  */
-diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index 08824887003..69afbae5359 100644
---- a/gdbserver/linux-ppc-low.cc
-+++ b/gdbserver/linux-ppc-low.cc
-@@ -23,7 +23,13 @@
- #include "elf/common.h"
- #include <sys/uio.h>
- #include <elf.h>
-+#if !defined(__GLIBC__)
-+# define pt_regs uapi_pt_regs
-+#endif
- #include <asm/ptrace.h>
-+#if !defined(__GLIBC__)
-+# undef pt_regs
-+#endif
- 
- #include "arch/ppc-linux-common.h"
- #include "arch/ppc-linux-tdesc.h"
--- 
-2.37.1
-
diff --git a/package/gdb/12.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/12.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
deleted file mode 100644
index 74769b7c57..0000000000
--- a/package/gdb/12.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a3b84f1777bd75bdc5914f4ce5f52c55e723cd9a Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 3 Jun 2017 21:23:52 +0200
-Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
- systems
-
-Fixes a pt_{dsp,}regs redefinition when building with the musl C library
-on SuperH.
-
-Inspired by
-http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
-adapted for SuperH.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Rebase	on gdb 8.0]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdbserver/linux-sh-low.cc | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/gdbserver/linux-sh-low.cc b/gdbserver/linux-sh-low.cc
-index 966bdeb8ba7..1e3ce53b4d5 100644
---- a/gdbserver/linux-sh-low.cc
-+++ b/gdbserver/linux-sh-low.cc
-@@ -76,7 +76,15 @@ extern const struct target_desc *tdesc_sh;
- #include <sys/reg.h>
- #endif
- 
-+#if !defined(__GLIBC__)
-+# define pt_regs uapi_pt_regs
-+# define pt_dspregs uapi_pt_dspregs
-+#endif
- #include <asm/ptrace.h>
-+#if !defined(__GLIBC__)
-+# undef pt_regs
-+# undef pt_dspregs
-+#endif
- 
- #define sh_num_regs 41
- 
--- 
-2.37.1
-
diff --git a/package/gdb/12.1/0003-use-asm-sgidefs.h.patch b/package/gdb/12.1/0003-use-asm-sgidefs.h.patch
deleted file mode 100644
index 637e4a29ee..0000000000
--- a/package/gdb/12.1/0003-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 8c94bf2b40d51c500c364ac03a2da1e9f9a94287 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <amccurdy@gmail.com>
-Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH] use <asm/sgidefs.h>
-
-Build fix for MIPS with musl libc
-
-The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
-but not by musl. Regardless of the libc, the kernel headers provide
-<asm/sgidefs.h> which provides the same definitions, so use that
-instead.
-
-Upstream-Status: Pending
-
-[Vincent:
-Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- gdb/mips-linux-nat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 20e12b6889e..1e66e98a013 100644
---- a/gdb/mips-linux-nat.c
-+++ b/gdb/mips-linux-nat.c
-@@ -31,7 +31,7 @@
- #include "gdb_proc_service.h"
- #include "gregset.h"
- 
--#include <sgidefs.h>
-+#include <asm/sgidefs.h>
- #include "nat/gdb_ptrace.h"
- #include <asm/ptrace.h>
- #include "inf-ptrace.h"
--- 
-2.37.1
-
diff --git a/package/gdb/12.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/12.1/0004-gdbserver-fix-build-for-m68k.patch
deleted file mode 100644
index 435f705382..0000000000
--- a/package/gdb/12.1/0004-gdbserver-fix-build-for-m68k.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 48af20f76b468c5d274d286677a2887136c4c7c4 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Fri, 22 Jun 2018 22:40:26 +0200
-Subject: [PATCH] gdbserver: fix build for m68k
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
-the build fails on m68k with the following diagnostics:
-
-In file included from ./../nat/linux-ptrace.h:28:0,
-                 from linux-low.h:27,
-                 from linux-m68k-low.c:20:
-[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
-   PT_D1 = 0,
-   ^
-[...]usr/include/sys/reg.h:26:3: error: expected « } » before numeric constant
-[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
-In file included from linux-m68k-low.c:27:0:
-[...]usr/include/sys/reg.h:99:1: error: expected declaration before « } » token
- };
- ^
-
-Fix this by moving <sys/reg.h> on top of "linux-low.h".
-
-[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdbserver/linux-m68k-low.cc | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/gdbserver/linux-m68k-low.cc b/gdbserver/linux-m68k-low.cc
-index 7a433ffab5e..bb3fbd69bd7 100644
---- a/gdbserver/linux-m68k-low.cc
-+++ b/gdbserver/linux-m68k-low.cc
-@@ -17,6 +17,11 @@
-    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
- 
- #include "server.h"
-+
-+#ifdef HAVE_SYS_REG_H
-+#include <sys/reg.h>
-+#endif
-+
- #include "linux-low.h"
- 
- /* Linux target op definitions for the m68k architecture.  */
-@@ -80,10 +85,6 @@ m68k_target::low_decr_pc_after_break ()
- void init_registers_m68k (void);
- extern const struct target_desc *tdesc_m68k;
- 
--#ifdef HAVE_SYS_REG_H
--#include <sys/reg.h>
--#endif
--
- #define m68k_num_regs 29
- #define m68k_num_gregs 18
- 
--- 
-2.37.1
-
diff --git a/package/gdb/12.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/12.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
deleted file mode 100644
index b1ecc2097c..0000000000
--- a/package/gdb/12.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From cbcb73a86dea0c0b9917b49b37095463155c5377 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 24 Jun 2018 23:33:55 +0200
-Subject: [PATCH] nat/fork-inferior: include linux-ptrace.h
-
-To decide whether fork() or vfork() should be used, fork-inferior.c
-uses the following test:
-
-  #if !(defined(__UCLIBC__) && defined(HAS_NOMMU))
-
-However, HAS_NOMMU is never defined, because it gets defined in
-linux-ptrace.h, which is not included by fork-inferior.c. Due to this,
-gdbserver fails to build on noMMU architectures. This commit fixes
-that by simply including linux-ptrace.h.
-
-This bug was introduced by commit
-2090129c36c7e582943b7d300968d19b46160d84 ("Share fork_inferior et al
-with gdbserver"). Indeed, the same fork()/vfork() selection was done,
-but in another file where linux-ptrace.h was included.
-
-Fixes the following build issue:
-
-../nat/fork-inferior.c: In function 'pid_t fork_inferior(const char*, const string&, char**, void (*)(), void (*)(int), void (*)(), const char*, void (*)(const char*, char* const*, char* const*))':
-../nat/fork-inferior.c:376:11: error: 'fork' was not declared in this scope
-     pid = fork ();
-           ^~~~
-../nat/fork-inferior.c:376:11: note: suggested alternative: 'vfork'
-     pid = fork ();
-           ^~~~
-           vfork
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Romain: rebase on gdb 8.3]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/nat/fork-inferior.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
-index 4df9a98047e..9bf0f6059f5 100644
---- a/gdb/nat/fork-inferior.c
-+++ b/gdb/nat/fork-inferior.c
-@@ -27,6 +27,7 @@
- #include "gdbsupport/pathstuff.h"
- #include "gdbsupport/signals-state-save-restore.h"
- #include "gdbsupport/gdb_tilde_expand.h"
-+#include "linux-ptrace.h"
- #include <vector>
- 
- extern char **environ;
--- 
-2.37.1
-
diff --git a/package/gdb/12.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/12.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
deleted file mode 100644
index ab936975e0..0000000000
--- a/package/gdb/12.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 03efe04b5748703234516836cb0186d25b052556 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 6 Nov 2021 10:06:25 +0100
-Subject: [PATCH] Fix getrandom compile for uclibc < v1.0.35
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-- fix getrandom compile for uclibc < v1.0.35, add missing stddef.h
-  include (fixed in uclibc since v1.0.35, see [1])
-
-Fixes:
-
-  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name ‘size_t’
-     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
-        |                                   ^~~~~~
-
-[1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=00972c02c2b6e0a95d5def4a71bdfb188e091782t
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- gnulib/import/getrandom.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gnulib/import/getrandom.c b/gnulib/import/getrandom.c
-index 41212fb329d..0ad3f9648d2 100644
---- a/gnulib/import/getrandom.c
-+++ b/gnulib/import/getrandom.c
-@@ -19,6 +19,7 @@
- 
- #include <config.h>
- 
-+#include <stddef.h>
- #include <sys/random.h>
- 
- #include <errno.h>
--- 
-2.37.1
-
diff --git a/package/gdb/12.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/12.1/0007-fix-musl-build-on-riscv.patch
deleted file mode 100644
index 7b4133341a..0000000000
--- a/package/gdb/12.1/0007-fix-musl-build-on-riscv.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From f2dd94dce490d8e8301fba9e4684cfb8d7bc7756 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 10 Nov 2021 23:14:54 +0100
-Subject: [PATCH] fix musl build on riscv
-
-Fix the following build failure raised with musl:
-
-../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
-../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
-  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
-      |                   ^~~~~~~~~~
-      |                   ELF_NGREG
-
-musl fixed the issue with
-https://git.musl-libc.org/cgit/musl/commit/?id=e5d2823631bbfebacf48e1a34ed28f28d7cb2570
-
-Fixes:
- - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- gdb/nat/riscv-linux-tdesc.c  | 5 +++++
- gdbserver/linux-riscv-low.cc | 5 +++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/gdb/nat/riscv-linux-tdesc.c b/gdb/nat/riscv-linux-tdesc.c
-index 07b49c0f16e..1ff58cce16f 100644
---- a/gdb/nat/riscv-linux-tdesc.c
-+++ b/gdb/nat/riscv-linux-tdesc.c
-@@ -31,6 +31,11 @@
- # define NFPREG 33
- #endif
- 
-+/* Work around musl breakage since version 1.1.24.  */
-+#ifndef ELF_NFPREG
-+# define ELF_NFPREG 33
-+#endif
-+
- /* See nat/riscv-linux-tdesc.h.  */
- 
- struct riscv_gdbarch_features
-diff --git a/gdbserver/linux-riscv-low.cc b/gdbserver/linux-riscv-low.cc
-index 6b2902e422d..ead54db09a8 100644
---- a/gdbserver/linux-riscv-low.cc
-+++ b/gdbserver/linux-riscv-low.cc
-@@ -30,6 +30,11 @@
- # define NFPREG 33
- #endif
- 
-+/* Work around musl breakage since version 1.1.24.  */
-+#ifndef ELF_NFPREG
-+# define ELF_NFPREG 33
-+#endif
-+
- /* Linux target op definitions for the RISC-V architecture.  */
- 
- class riscv_target : public linux_process_target
--- 
-2.37.1
-
diff --git a/package/gdb/12.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/12.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
deleted file mode 100644
index 355ac480ee..0000000000
--- a/package/gdb/12.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 73487022cb629415c3b0c2d9e125035b6e5c2d32 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 18 Nov 2021 22:52:08 +0100
-Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
-
-Fix the following build failure raised since gdb version 10.1 and
-https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
-
-  CXXLD  libinproctrace.so
-/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
-/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
-
-Fixes:
- - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://sourceware.org/pipermail/gdb-patches/2021-November/183580.html]
----
- gdbserver/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 47648b8d962..9d862bcb9c9 100644
---- a/gdbserver/Makefile.in
-+++ b/gdbserver/Makefile.in
-@@ -383,7 +383,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
- 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
- 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
- 		 $(CXXFLAGS) \
--		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread
-+		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread $(INTL)
- 
- # Put the proper machine-specific files first, so M-. on a machine
- # specific routine gets the one for the correct machine.
--- 
-2.37.1
-
diff --git a/package/gdb/12.1/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/12.1/0009-gdb-Fix-native-build-on-xtensa.patch
deleted file mode 100644
index 4ff3828f2a..0000000000
--- a/package/gdb/12.1/0009-gdb-Fix-native-build-on-xtensa.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 222cb32acf044fe90e8534b064f9168ad0d8c705 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 28 Aug 2022 23:21:37 +0200
-Subject: [PATCH] gdb: Fix native build on xtensa
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Apply a similar fix than for Alpha architecture on gdb 9:
-https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a27b85f6d9b5eea9bd1493f903158fbea4b2231
-
-Fixes:
-
-../../gdb/xtensa-linux-nat.c: In function ‘void fill_gregset(const regcache*, elf_greg_t (*)[128], int)’:
-../../gdb/xtensa-linux-nat.c:66:17: error: ‘gdbarch_pc_regnum’ was not declared in this scope
-   66 |   if (regnum == gdbarch_pc_regnum (gdbarch) || regnum == -1)
-      |                 ^~~~~~~~~~~~~~~~~
-  CXX    complaints.o
-../../gdb/xtensa-linux-nat.c:68:17: error: ‘gdbarch_ps_regnum’ was not declared in this scope
-   68 |   if (regnum == gdbarch_ps_regnum (gdbarch) || regnum == -1)
-      |                 ^~~~~~~~~~~~~~~~~
-../../gdb/xtensa-linux-nat.c:71:38: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
-   71 |   if (regnum == gdbarch_tdep (gdbarch)->wb_regnum || regnum == -1)
-      |                                      ^
-In file included from ../../gdb/xtensa-linux-nat.c:38:
-../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘gdbarch_tdep::gdbarch_tdep()’
-  160 | struct gdbarch_tdep
-      |        ^~~~~~~~~~~~
-../../gdb/xtensa-tdep.h:160:8: note:   candidate expects 0 arguments, 1 provided
-../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(const gdbarch_tdep&)’
-../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘const gdbarch_tdep&’
-../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(gdbarch_tdep&&)’
-../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘gdbarch_tdep&&’
-../../gdb/xtensa-linux-nat.c:72:49: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
-   72 |     regcache->raw_collect (gdbarch_tdep (gdbarch)->wb_regnum,
-      |                                                 ^
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/xtensa-linux-nat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
-index 097d7bd6f96..4e4290fe038 100644
---- a/gdb/xtensa-linux-nat.c
-+++ b/gdb/xtensa-linux-nat.c
-@@ -36,6 +36,7 @@
- 
- #include "gregset.h"
- #include "xtensa-tdep.h"
-+#include "gdbarch.h"
- 
- /* Defines ps_err_e, struct ps_prochandle.  */
- #include "gdb_proc_service.h"
--- 
-2.37.2
-
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 76f5cf8b4d..36462a0f66 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -46,9 +46,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_12
-	bool "gdb 12.x"
-
 config BR2_GDB_VERSION_13
 	bool "gdb 13.x"
 
@@ -71,7 +68,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "arc-2023.09-release" if BR2_arc
-	default "12.1"     if BR2_GDB_VERSION_12
 	default "13.2"     if BR2_GDB_VERSION_13
 	default "14.2"     if BR2_GDB_VERSION_14 || !BR2_PACKAGE_HOST_GDB
 	default "15.1"	   if BR2_GDB_VERSION_15
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 1b6b7b20bd..98170c96e8 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,6 @@
 # From https://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
 sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
-sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
 sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
 sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
 sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c390d8d5d5550cc515c16519de1071d8eef96aa58e38056c7e37da1d8b  gdb-15.1.tar.xz

--===============3947761404138709691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3947761404138709691==--
