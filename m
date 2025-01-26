Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E63C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B4747072F;
	Fri, 28 Feb 2025 17:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zTIUL-8Fwui; Fri, 28 Feb 2025 17:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1969370953
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1969370953;
	Fri, 28 Feb 2025 17:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19AA01DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5651B424FF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9piSA_mWCTZ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A79342EC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A79342EC3
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21FF487A09; Fri, 28 Feb 2025 16:30:21 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 16:46:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 149ed404d22d6f2bae40c81a212ce479b90a1450
X-Git-Newrev: a941bef9f92fc6c4c0b23714bb934133e659ec51
X-Patchwork-Hint: ignore
Message-Id: <20250228163021.21FF487A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: remove version
 13.x
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
Content-Type: multipart/mixed; boundary="===============7773834928827652618=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7773834928827652618==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a941bef9f92fc6c4c0b23714bb934133e659ec51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that gdb 16.x has been added, and gdb 15.x made the default, let's
remove support for gdb 13.x.

Aside from the usual removal, we also simplify things a bit as GDB
13.x was the last version that did not require MPFR. As it is now a
mandatory dependencies, things can be simplified.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  9 ----
 Config.in.legacy                                   |  7 +++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 -------------------
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 ---------------
 package/gdb/13.2/0003-use-asm-sgidefs.h.patch      | 40 --------------
 .../13.2/0004-gdbserver-fix-build-for-m68k.patch   | 63 ----------------------
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 53 ------------------
 ...-Fix-getrandom-compile-for-uclibc-v1.0.35.patch | 39 --------------
 .../gdb/13.2/0007-fix-musl-build-on-riscv.patch    | 60 ---------------------
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch | 38 -------------
 .../13.2/0009-gdb-Fix-native-build-on-xtensa.patch | 57 --------------------
 package/gdb/Config.in                              |  2 +-
 package/gdb/Config.in.host                         |  4 --
 package/gdb/gdb.hash                               |  1 -
 package/gdb/gdb.mk                                 | 24 +++------
 15 files changed, 14 insertions(+), 481 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 378976a0cc..65d017116e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -490,15 +490,6 @@ package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patc
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
 package/gcc/8.4.0/0004-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch lib_patch.Upstream
-package/gdb/13.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
-package/gdb/13.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
-package/gdb/13.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
-package/gdb/13.2/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
-package/gdb/13.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
-package/gdb/13.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
-package/gdb/13.2/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
-package/gdb/13.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
-package/gdb/13.2/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/gdb/14.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
 package/gdb/14.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
 package/gdb/14.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index e091fd8c0a..abc65d0c9a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_GDB_VERSION_13
+	bool "gdb 13.x has been removed"
+	select BR2_LEGACY
+	help
+	  GDB 13.x support has been removed, a newer version should be
+	  used instead.
+
 config BR2_nios2
 	bool "nios2 architecture removed"
 	select BR2_LEGACY
diff --git a/package/gdb/13.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/13.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
deleted file mode 100644
index adf605203e..0000000000
--- a/package/gdb/13.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 2edb66509607289ea7462db99e247de1200454c1 Mon Sep 17 00:00:00 2001
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
-index c84f9146bbd..8c8580c95e1 100644
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
-index fdf74727e39..f64afd09b7a 100644
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
-2.41.0
-
diff --git a/package/gdb/13.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/13.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
deleted file mode 100644
index 30bffea6dc..0000000000
--- a/package/gdb/13.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2dd3ed43936f26d2929d0e42b200f29e128d4f0d Mon Sep 17 00:00:00 2001
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
-index 782b8292010..e42f29b845a 100644
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
-2.41.0
-
diff --git a/package/gdb/13.2/0003-use-asm-sgidefs.h.patch b/package/gdb/13.2/0003-use-asm-sgidefs.h.patch
deleted file mode 100644
index acb80e6f33..0000000000
--- a/package/gdb/13.2/0003-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7f05121278d5d5a1939276cfd9f913a0bbe004e1 Mon Sep 17 00:00:00 2001
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
-index 972b5db8e76..e3d838dd9a4 100644
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
-2.41.0
-
diff --git a/package/gdb/13.2/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/13.2/0004-gdbserver-fix-build-for-m68k.patch
deleted file mode 100644
index d4c417375b..0000000000
--- a/package/gdb/13.2/0004-gdbserver-fix-build-for-m68k.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From e1eef0a642f7aa8aa6071b99b7c0119c436dec11 Mon Sep 17 00:00:00 2001
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
-index 6094fd914f5..3613d9f642a 100644
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
-2.41.0
-
diff --git a/package/gdb/13.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/13.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
deleted file mode 100644
index e898645982..0000000000
--- a/package/gdb/13.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 1527c8a790f50be8386eef413483248ff281ed28 Mon Sep 17 00:00:00 2001
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
-index 968983b2021..8ef620c7193 100644
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
-2.41.0
-
diff --git a/package/gdb/13.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/13.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
deleted file mode 100644
index 27ff834215..0000000000
--- a/package/gdb/13.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From a9a4213216d95b4e7cbe4f96d993233bfa2f21e6 Mon Sep 17 00:00:00 2001
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
-index e1468730933..3948d8d552a 100644
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
-2.41.0
-
diff --git a/package/gdb/13.2/0007-fix-musl-build-on-riscv.patch b/package/gdb/13.2/0007-fix-musl-build-on-riscv.patch
deleted file mode 100644
index 9b494f6b71..0000000000
--- a/package/gdb/13.2/0007-fix-musl-build-on-riscv.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From dcadf89351e1944986d3f8c96081142b65f131eb Mon Sep 17 00:00:00 2001
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
-index d676233cc31..b620aab5b72 100644
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
-index 129bc3b138b..a813a897de4 100644
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
-2.41.0
-
diff --git a/package/gdb/13.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/13.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
deleted file mode 100644
index c8a40ab5e5..0000000000
--- a/package/gdb/13.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a4535ce245a0675399877c62a9a12fb0fd36b510 Mon Sep 17 00:00:00 2001
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
-index 040f0b6faa0..07ca24cef5c 100644
---- a/gdbserver/Makefile.in
-+++ b/gdbserver/Makefile.in
-@@ -389,7 +389,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
- 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
- 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
- 		 $(CXXFLAGS) \
--		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread
-+		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread $(INTL)
- 
- # Put the proper machine-specific files first, so M-. on a machine
- # specific routine gets the one for the correct machine.
--- 
-2.41.0
-
diff --git a/package/gdb/13.2/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/13.2/0009-gdb-Fix-native-build-on-xtensa.patch
deleted file mode 100644
index 553ef2785b..0000000000
--- a/package/gdb/13.2/0009-gdb-Fix-native-build-on-xtensa.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From ed34c23325270b3eada8202f5478b8d53fb5846a Mon Sep 17 00:00:00 2001
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
-index e3da3c6a7a5..61834bc28d0 100644
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
-2.41.0
-
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 8cbd52cff5..b1678e0d63 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP
-	select BR2_PACKAGE_MPFR if !(BR2_GDB_VERSION_13)
+	select BR2_PACKAGE_MPFR
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ZLIB
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 699c6a96c4..3d21fc2a3f 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -46,9 +46,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_13
-	bool "gdb 13.x"
-
 config BR2_GDB_VERSION_14
 	bool "gdb 14.x"
 
@@ -72,7 +69,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "arc-2023.09-release" if BR2_arc
-	default "13.2"     if BR2_GDB_VERSION_13
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "15.1"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "16.1"	   if BR2_GDB_VERSION_16
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index c6c0376852..405fb764ac 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From https://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
 sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
 sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c390d8d5d5550cc515c16519de1071d8eef96aa58e38056c7e37da1d8b  gdb-15.1.tar.xz
 sha512  17b322fde0655a849506851c879aba9ad1f8bfee804b900efc718806091bec75511383bd4d632b8b32a32ef207233331581501157df18a8df528abe6ff667577  gdb-16.1.tar.xz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 69f7979149..b39b103d00 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -54,8 +54,8 @@ GDB_DEPENDENCIES += host-flex host-bison
 HOST_GDB_DEPENDENCIES += host-flex host-bison
 endif
 
-# All newer versions of GDB need host-gmp
-HOST_GDB_DEPENDENCIES += host-gmp
+# All newer versions of GDB need host-gmp and host-mpfr
+HOST_GDB_DEPENDENCIES += host-gmp host-mpfr
 
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
@@ -160,11 +160,8 @@ GDB_CONF_OPTS += \
 GDB_DEPENDENCIES += gmp
 endif
 
-# Starting from GDB 14.x, mpfr is needed as a dependency to build full
-# gdb.
-# GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
-# requires MPFR as well.
-ifeq ($(BR2_PACKAGE_GDB_DEBUGGER):$(BR2_GDB_VERSION_13),y:)
+# mpfr is needed as a dependency to build full gdb
+ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
 GDB_DEPENDENCIES += mpfr
 GDB_CONF_OPTS += --with-mpfr=$(STAGING_DIR)
 else
@@ -265,17 +262,8 @@ HOST_GDB_CONF_OPTS = \
 	--with-system-zlib \
 	--with-curses \
 	--disable-source-highlight \
-	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
-
-# GDB newer than 14.x need host-mpfr
-# GDB fork from ARC GNU tools 2023.09 is based on GDB14 branch and so
-# requires MPFR as well.
-ifeq ($(BR2_GDB_VERSION_13),)
-HOST_GDB_DEPENDENCIES += host-mpfr
-HOST_GDB_CONF_OPTS += --with-mpfr=$(HOST_DIR)
-else
-HOST_GDB_CONF_OPTS += --without-mpfr
-endif
+	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
+	--with-mpfr=$(HOST_DIR)
 
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
 HOST_GDB_CONF_OPTS += --enable-tui

--===============7773834928827652618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7773834928827652618==--
