Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B43C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 21:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E078377F;
	Wed, 27 Dec 2023 21:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E078377F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0va1IMMqhAwx; Wed, 27 Dec 2023 21:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE78D837AC;
	Wed, 27 Dec 2023 21:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE78D837AC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4273E1BF2A3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C0D18378A
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 21:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C0D18378A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h9a1qJjBEF6S for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 21:40:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F5908377F
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 21:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F5908377F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A05183732; Wed, 27 Dec 2023 21:40:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Dec 2023 22:38:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b93aade5d48ead736a9ccc01e9ff0d59e32151a
X-Git-Newrev: a9a56ab6fd98125ca09078bdeb7c8d55d53aa35e
X-Patchwork-Hint: ignore
Message-Id: <20231227214032.1A05183732@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: add support for GDB 14.1
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
Content-Type: multipart/mixed; boundary="===============2791239464597805073=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2791239464597805073==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a9a56ab6fd98125ca09078bdeb7c8d55d53aa35e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches are still relevant, and have been rebased on top of GDB
14.1.

GDB 14.1 now needs mpfr unconditionally, so it is added as a
dependency of host-gdb, and of gdb when the full debugger is built.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - add comment about selecting mpfr for 14.x or later
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  9 ++++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 +++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++++
 package/gdb/14.1/0003-use-asm-sgidefs.h.patch      | 40 ++++++++++++++
 .../14.1/0004-gdbserver-fix-build-for-m68k.patch   | 63 ++++++++++++++++++++++
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 53 ++++++++++++++++++
 ...-Fix-getrandom-compile-for-uclibc-v1.0.35.patch | 39 ++++++++++++++
 .../gdb/14.1/0007-fix-musl-build-on-riscv.patch    | 60 +++++++++++++++++++++
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch | 38 +++++++++++++
 .../14.1/0009-gdb-Fix-native-build-on-xtensa.patch | 57 ++++++++++++++++++++
 package/gdb/Config.in                              |  1 +
 package/gdb/Config.in.host                         |  6 +++
 package/gdb/gdb.hash                               |  1 +
 package/gdb/gdb.mk                                 | 19 ++++++-
 14 files changed, 482 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4e6c688380..5aae566ba9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -485,6 +485,15 @@ package/gdb/13.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch Upstream
 package/gdb/13.2/0007-fix-musl-build-on-riscv.patch Upstream
 package/gdb/13.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch Upstream
 package/gdb/13.2/0009-gdb-Fix-native-build-on-xtensa.patch Upstream
+package/gdb/14.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch Upstream
+package/gdb/14.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch Upstream
+package/gdb/14.1/0003-use-asm-sgidefs.h.patch Upstream
+package/gdb/14.1/0004-gdbserver-fix-build-for-m68k.patch Upstream
+package/gdb/14.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch Upstream
+package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch Upstream
+package/gdb/14.1/0007-fix-musl-build-on-riscv.patch Upstream
+package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch Upstream
+package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch Upstream
 package/gengetopt/0001-configure.ac-add-disable-doc-option.patch Upstream
 package/genpart/0001-fix-return-code.patch Upstream
 package/genromfs/0001-build-system.patch Sob Upstream
diff --git a/package/gdb/14.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/14.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000000..b213ba5a09
--- /dev/null
+++ b/package/gdb/14.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,55 @@
+From ee74f5a6fa98b43c45c9c56a26c00abc21aeeaa1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2016 17:32:50 -0700
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebase on gdb 8.3]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/nat/ppc-linux.h        | 6 ++++++
+ gdbserver/linux-ppc-low.cc | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index c84f9146bbd..8c8580c95e1 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef NAT_PPC_LINUX_H
+ #define NAT_PPC_LINUX_H
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ #include <asm/cputable.h>
+ 
+ /* This sometimes isn't defined.  */
+diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
+index 86fbc8f5d96..8a1a39bc750 100644
+--- a/gdbserver/linux-ppc-low.cc
++++ b/gdbserver/linux-ppc-low.cc
+@@ -23,7 +23,13 @@
+ #include "elf/common.h"
+ #include <sys/uio.h>
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "arch/ppc-linux-common.h"
+ #include "arch/ppc-linux-tdesc.h"
+-- 
+2.43.0
+
diff --git a/package/gdb/14.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/14.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000000..b070c4fc05
--- /dev/null
+++ b/package/gdb/14.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,43 @@
+From 57b2606e39b2ac90a3810baccbd73161ffdb5f2d Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 3 Jun 2017 21:23:52 +0200
+Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on !GLIBC
+ systems
+
+Fixes a pt_{dsp,}regs redefinition when building with the musl C library
+on SuperH.
+
+Inspired by
+http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
+adapted for SuperH.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebase	on gdb 8.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdbserver/linux-sh-low.cc | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gdbserver/linux-sh-low.cc b/gdbserver/linux-sh-low.cc
+index 782b8292010..e42f29b845a 100644
+--- a/gdbserver/linux-sh-low.cc
++++ b/gdbserver/linux-sh-low.cc
+@@ -76,7 +76,15 @@ extern const struct target_desc *tdesc_sh;
+ #include <sys/reg.h>
+ #endif
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++# define pt_dspregs uapi_pt_dspregs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++# undef pt_dspregs
++#endif
+ 
+ #define sh_num_regs 41
+ 
+-- 
+2.43.0
+
diff --git a/package/gdb/14.1/0003-use-asm-sgidefs.h.patch b/package/gdb/14.1/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..12f0885b34
--- /dev/null
+++ b/package/gdb/14.1/0003-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From 5288e2a3dcb2928e1367cd1d4c31da3b8310f3a0 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+[Vincent:
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ gdb/mips-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
+index 8a7cc95f2a4..3686f43abfd 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -31,7 +31,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include "nat/gdb_ptrace.h"
+ #include <asm/ptrace.h>
+ #include "inf-ptrace.h"
+-- 
+2.43.0
+
diff --git a/package/gdb/14.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/14.1/0004-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..21509b3283
--- /dev/null
+++ b/package/gdb/14.1/0004-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,63 @@
+From 5e352184c2fc696c5b7aff1985098c460686a638 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 22 Jun 2018 22:40:26 +0200
+Subject: [PATCH] gdbserver: fix build for m68k
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+As for strace [1], when <sys/reg.h> is included after <linux/ptrace.h>,
+the build fails on m68k with the following diagnostics:
+
+In file included from ./../nat/linux-ptrace.h:28:0,
+                 from linux-low.h:27,
+                 from linux-m68k-low.c:20:
+[...]/usr/include/sys/reg.h:26:3: error: expected identifier before numeric constant
+   PT_D1 = 0,
+   ^
+[...]usr/include/sys/reg.h:26:3: error: expected « } » before numeric constant
+[...]usr/include/sys/reg.h:26:3: error: expected unqualified-id before numeric constant
+In file included from linux-m68k-low.c:27:0:
+[...]usr/include/sys/reg.h:99:1: error: expected declaration before « } » token
+ };
+ ^
+
+Fix this by moving <sys/reg.h> on top of "linux-low.h".
+
+[1] https://github.com/strace/strace/commit/6ebf6c4f9e5ebca123a5b5f24afe67cf0473cf92
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdbserver/linux-m68k-low.cc | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/gdbserver/linux-m68k-low.cc b/gdbserver/linux-m68k-low.cc
+index 6094fd914f5..3613d9f642a 100644
+--- a/gdbserver/linux-m68k-low.cc
++++ b/gdbserver/linux-m68k-low.cc
+@@ -17,6 +17,11 @@
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
+ #include "server.h"
++
++#ifdef HAVE_SYS_REG_H
++#include <sys/reg.h>
++#endif
++
+ #include "linux-low.h"
+ 
+ /* Linux target op definitions for the m68k architecture.  */
+@@ -80,10 +85,6 @@ m68k_target::low_decr_pc_after_break ()
+ void init_registers_m68k (void);
+ extern const struct target_desc *tdesc_m68k;
+ 
+-#ifdef HAVE_SYS_REG_H
+-#include <sys/reg.h>
+-#endif
+-
+ #define m68k_num_regs 29
+ #define m68k_num_gregs 18
+ 
+-- 
+2.43.0
+
diff --git a/package/gdb/14.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/14.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
new file mode 100644
index 0000000000..43ed3778ca
--- /dev/null
+++ b/package/gdb/14.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
@@ -0,0 +1,53 @@
+From 3e55ad5448f5379e3d7e079f17a18904e905cebf Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 24 Jun 2018 23:33:55 +0200
+Subject: [PATCH] nat/fork-inferior: include linux-ptrace.h
+
+To decide whether fork() or vfork() should be used, fork-inferior.c
+uses the following test:
+
+  #if !(defined(__UCLIBC__) && defined(HAS_NOMMU))
+
+However, HAS_NOMMU is never defined, because it gets defined in
+linux-ptrace.h, which is not included by fork-inferior.c. Due to this,
+gdbserver fails to build on noMMU architectures. This commit fixes
+that by simply including linux-ptrace.h.
+
+This bug was introduced by commit
+2090129c36c7e582943b7d300968d19b46160d84 ("Share fork_inferior et al
+with gdbserver"). Indeed, the same fork()/vfork() selection was done,
+but in another file where linux-ptrace.h was included.
+
+Fixes the following build issue:
+
+../nat/fork-inferior.c: In function 'pid_t fork_inferior(const char*, const string&, char**, void (*)(), void (*)(int), void (*)(), const char*, void (*)(const char*, char* const*, char* const*))':
+../nat/fork-inferior.c:376:11: error: 'fork' was not declared in this scope
+     pid = fork ();
+           ^~~~
+../nat/fork-inferior.c:376:11: note: suggested alternative: 'vfork'
+     pid = fork ();
+           ^~~~
+           vfork
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Romain: rebase on gdb 8.3]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/nat/fork-inferior.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
+index 968983b2021..8ef620c7193 100644
+--- a/gdb/nat/fork-inferior.c
++++ b/gdb/nat/fork-inferior.c
+@@ -27,6 +27,7 @@
+ #include "gdbsupport/pathstuff.h"
+ #include "gdbsupport/signals-state-save-restore.h"
+ #include "gdbsupport/gdb_tilde_expand.h"
++#include "linux-ptrace.h"
+ #include <vector>
+ 
+ extern char **environ;
+-- 
+2.43.0
+
diff --git a/package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
new file mode 100644
index 0000000000..7fed8266df
--- /dev/null
+++ b/package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
@@ -0,0 +1,39 @@
+From c87940ff1c2efd22c3dab9cd712531281144ed89 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 6 Nov 2021 10:06:25 +0100
+Subject: [PATCH] Fix getrandom compile for uclibc < v1.0.35
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- fix getrandom compile for uclibc < v1.0.35, add missing stddef.h
+  include (fixed in uclibc since v1.0.35, see [1])
+
+Fixes:
+
+  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name ‘size_t’
+     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+        |                                   ^~~~~~
+
+[1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=00972c02c2b6e0a95d5def4a71bdfb188e091782t
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gnulib/import/getrandom.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gnulib/import/getrandom.c b/gnulib/import/getrandom.c
+index e1468730933..3948d8d552a 100644
+--- a/gnulib/import/getrandom.c
++++ b/gnulib/import/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+-- 
+2.43.0
+
diff --git a/package/gdb/14.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/14.1/0007-fix-musl-build-on-riscv.patch
new file mode 100644
index 0000000000..ca6af2522f
--- /dev/null
+++ b/package/gdb/14.1/0007-fix-musl-build-on-riscv.patch
@@ -0,0 +1,60 @@
+From f297ef653008b47fdaa4eebbccf2705f3d0996a8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 10 Nov 2021 23:14:54 +0100
+Subject: [PATCH] fix musl build on riscv
+
+Fix the following build failure raised with musl:
+
+../../gdbserver/linux-riscv-low.cc: In function 'void riscv_fill_fpregset(regcache*, void*)':
+../../gdbserver/linux-riscv-low.cc:140:19: error: 'ELF_NFPREG' was not declared in this scope; did you mean 'ELF_NGREG'?
+  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
+      |                   ^~~~~~~~~~
+      |                   ELF_NGREG
+
+musl fixed the issue with
+https://git.musl-libc.org/cgit/musl/commit/?id=e5d2823631bbfebacf48e1a34ed28f28d7cb2570
+
+Fixes:
+ - http://autobuild.buildroot.org/results/16b19198980ce9c81a618b3f6e8dc9fe28247a28
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdb/nat/riscv-linux-tdesc.c  | 5 +++++
+ gdbserver/linux-riscv-low.cc | 5 +++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/gdb/nat/riscv-linux-tdesc.c b/gdb/nat/riscv-linux-tdesc.c
+index d676233cc31..b620aab5b72 100644
+--- a/gdb/nat/riscv-linux-tdesc.c
++++ b/gdb/nat/riscv-linux-tdesc.c
+@@ -31,6 +31,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* See nat/riscv-linux-tdesc.h.  */
+ 
+ struct riscv_gdbarch_features
+diff --git a/gdbserver/linux-riscv-low.cc b/gdbserver/linux-riscv-low.cc
+index 4c251bb179c..77a48ac9ee1 100644
+--- a/gdbserver/linux-riscv-low.cc
++++ b/gdbserver/linux-riscv-low.cc
+@@ -30,6 +30,11 @@
+ # define NFPREG 33
+ #endif
+ 
++/* Work around musl breakage since version 1.1.24.  */
++#ifndef ELF_NFPREG
++# define ELF_NFPREG 33
++#endif
++
+ /* Linux target op definitions for the RISC-V architecture.  */
+ 
+ class riscv_target : public linux_process_target
+-- 
+2.43.0
+
diff --git a/package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
new file mode 100644
index 0000000000..05fedfc960
--- /dev/null
+++ b/package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
@@ -0,0 +1,38 @@
+From 49cc0d8a7a930eab1eb8c848101150ca83145334 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 18 Nov 2021 22:52:08 +0100
+Subject: [PATCH] gdbserver/Makefile.in: fix NLS build
+
+Fix the following build failure raised since gdb version 10.1 and
+https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=9a665d62266e75f0519f3a663784c458885b5c63:
+
+  CXXLD  libinproctrace.so
+/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/9.3.0/../../../../i586-buildroot-linux-musl/bin/ld: gdbsupport/tdesc-ipa.o: in function `print_xml_feature::visit(tdesc_type_builtin const*)':
+/home/buildroot/autobuild/instance-2/output-1/build/gdb-10.2/build/gdbserver/../../gdbserver/../gdbsupport/tdesc.cc:310: undefined reference to `libintl_gettext'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/faacc874fe9d32b74cb3d3dea988ef661cb0e3d0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceware.org/pipermail/gdb-patches/2021-November/183580.html]
+---
+ gdbserver/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
+index b597515d428..54cc7ccb0f6 100644
+--- a/gdbserver/Makefile.in
++++ b/gdbserver/Makefile.in
+@@ -389,7 +389,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
+ 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
+ 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
+ 		 $(CXXFLAGS) \
+-		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread
++		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread $(INTL)
+ 
+ # Put the proper machine-specific files first, so M-. on a machine
+ # specific routine gets the one for the correct machine.
+-- 
+2.43.0
+
diff --git a/package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch
new file mode 100644
index 0000000000..10302a4bb6
--- /dev/null
+++ b/package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch
@@ -0,0 +1,57 @@
+From 0533122983d2ac973453915cb1331b87d8d7fc0a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 Aug 2022 23:21:37 +0200
+Subject: [PATCH] gdb: Fix native build on xtensa
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Apply a similar fix than for Alpha architecture on gdb 9:
+https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=7a27b85f6d9b5eea9bd1493f903158fbea4b2231
+
+Fixes:
+
+../../gdb/xtensa-linux-nat.c: In function ‘void fill_gregset(const regcache*, elf_greg_t (*)[128], int)’:
+../../gdb/xtensa-linux-nat.c:66:17: error: ‘gdbarch_pc_regnum’ was not declared in this scope
+   66 |   if (regnum == gdbarch_pc_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+  CXX    complaints.o
+../../gdb/xtensa-linux-nat.c:68:17: error: ‘gdbarch_ps_regnum’ was not declared in this scope
+   68 |   if (regnum == gdbarch_ps_regnum (gdbarch) || regnum == -1)
+      |                 ^~~~~~~~~~~~~~~~~
+../../gdb/xtensa-linux-nat.c:71:38: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   71 |   if (regnum == gdbarch_tdep (gdbarch)->wb_regnum || regnum == -1)
+      |                                      ^
+In file included from ../../gdb/xtensa-linux-nat.c:38:
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘gdbarch_tdep::gdbarch_tdep()’
+  160 | struct gdbarch_tdep
+      |        ^~~~~~~~~~~~
+../../gdb/xtensa-tdep.h:160:8: note:   candidate expects 0 arguments, 1 provided
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(const gdbarch_tdep&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘const gdbarch_tdep&’
+../../gdb/xtensa-tdep.h:160:8: note: candidate: ‘constexpr gdbarch_tdep::gdbarch_tdep(gdbarch_tdep&&)’
+../../gdb/xtensa-tdep.h:160:8: note:   no known conversion for argument 1 from ‘gdbarch*’ to ‘gdbarch_tdep&&’
+../../gdb/xtensa-linux-nat.c:72:49: error: no matching function for call to ‘gdbarch_tdep::gdbarch_tdep(gdbarch*&)’
+   72 |     regcache->raw_collect (gdbarch_tdep (gdbarch)->wb_regnum,
+      |                                                 ^
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/xtensa-linux-nat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/xtensa-linux-nat.c b/gdb/xtensa-linux-nat.c
+index e3da3c6a7a5..61834bc28d0 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -36,6 +36,7 @@
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
++#include "gdbarch.h"
+ 
+ /* Defines ps_err_e, struct ps_prochandle.  */
+ #include "gdb_proc_service.h"
+-- 
+2.43.0
+
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index e4ab39a2bd..7251dce668 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -59,6 +59,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
 	select BR2_PACKAGE_GMP if !BR2_arc
+	select BR2_PACKAGE_MPFR if BR2_GDB_VERSION_14
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_ZLIB
 
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9ba987222a..670818cb0e 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -57,6 +57,9 @@ config BR2_GDB_VERSION_12
 config BR2_GDB_VERSION_13
 	bool "gdb 13.x"
 
+config BR2_GDB_VERSION_14
+	bool "gdb 14.x"
+
 endchoice
 
 endif
@@ -68,4 +71,7 @@ config BR2_GDB_VERSION
 	default "11.2"     if BR2_GDB_VERSION_11
 	default "12.1"     if BR2_GDB_VERSION_12 || !BR2_PACKAGE_HOST_GDB
 	default "13.2"     if BR2_GDB_VERSION_13
+	# When making 14.x the default, or 14.x becomes the oldest version,
+	# be sure to update the target variant to properly select mpfr.
+	default "14.1"     if BR2_GDB_VERSION_14
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index ebe5647dab..ba90bff5d6 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -3,6 +3,7 @@ sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb748
 sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
 sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz
 sha512  8185d3e11ab60dafff5860a5016577bfe7dd7547ef01ebc867bc247603d82b74ff74c4f29492c7d2aee57076f52be33e289f4c6b414a4b870d4b3004909f4c34  gdb-13.2.tar.xz
+sha512  575e198105076fc4a88f68591aa114ab9c1196e84386a3f7b9b58fe5f30cdeed33f6a5f957b68f08c47284ec922bb60c964627e238471419673fd913575ce427  gdb-14.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ea710f0c1f..af40f7f986 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -135,7 +135,6 @@ GDB_CONF_OPTS = \
 	--disable-werror \
 	--enable-static \
 	--disable-shared \
-	--without-mpfr \
 	--disable-source-highlight
 
 ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
@@ -167,6 +166,15 @@ GDB_CONF_OPTS += \
 GDB_DEPENDENCIES += gmp
 endif
 
+# Starting from GDB 14.x, mpfr is needed as a dependency to build full
+# gdb.
+ifeq ($(BR2_GDB_VERSION_14)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
+GDB_DEPENDENCIES += mpfr
+GDB_CONF_OPTS += --with-mpfr=$(STAGING_DIR)
+else
+GDB_CONF_OPTS += --without-mpfr
+endif
+
 ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
 GDB_CONF_OPTS += --enable-gdbserver
 GDB_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
@@ -267,10 +275,17 @@ HOST_GDB_CONF_OPTS = \
 	--without-included-gettext \
 	--with-system-zlib \
 	--with-curses \
-	--without-mpfr \
 	--disable-source-highlight \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
 
+# GDB newer than 14.x need host-mpfr
+ifeq ($(BR2_GDB_VERSION_14),y)
+HOST_GDB_DEPENDENCIES += host-mpfr
+HOST_GDB_CONF_OPTS += --with-mpfr=$(HOST_DIR)
+else
+HOST_GDB_CONF_OPTS += --without-mpfr
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
 HOST_GDB_CONF_OPTS += --enable-tui
 else

--===============2791239464597805073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2791239464597805073==--
