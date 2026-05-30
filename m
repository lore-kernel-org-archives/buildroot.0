Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C893ACD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72BA58594D;
	Tue,  9 Jun 2026 13:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yoW83bgeg-62; Tue,  9 Jun 2026 13:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D2B858E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010173;
	bh=AA2jMpek6FfT59NpdVUL5vjNzaEGiGwYVeSdKKjvpZQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EolHiJoB5zsoU+DKatVstwccRyvyBg0ZXLO7L2S54bSi/c7me01l7CQvmJNzeXw5f
	 gOM602XZ/AEt+lrwj8dGx8xJXY1Woucf0m1L3CATUMZGXYC4mp/N7ehaw4zyMsB3Lw
	 ncVCVdoudnkcyZFtxriplM/fNJ/UyHBPC7DMiTMFDKKIdC1cibL4FLNBUcrRFkG0jz
	 mpjMP55Rrg51AHyup5k4eeVeIzp42uau/WDnf8ltsrPD+ocABLyt703sEkFF+6D02z
	 6wIjjI4wWWBCSiDLJA5RC+IpldEw7pVT37NjyBMLJKrSG33ooNiMumWGBfCBXX6eRe
	 a3qKF9tCHhn9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D2B858E2;
	Tue,  9 Jun 2026 13:02:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D7192EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0AF98560C
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uUKWEWNql5FC for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4851E855E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4851E855E5
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73B2D87E68; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 12:15:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d7800b210b535f98b959de4a00d88482fe983e2
X-Git-Newrev: 4868e0dd621013ff3d3b6e81a86d0d981ae21646
X-Patchwork-Hint: ignore
Message-Id: <20260609130121.73B2D87E68@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: add support for GDB 17.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1965062032053207467=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1965062032053207467==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4868e0dd621013ff3d3b6e81a86d0d981ae21646
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

All patches that were applicable to GDB 16.1 are also applicable to
GDB 17.1. Rebased patch 0005. Added upstream patch 0010 to fix build
error with musl and upstream patch 0011 to fix build error on sparc.

Details about the 17.1 release:

  https://sourceware.org/gdb/download/ANNOUNCEMENT

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore                                |   9 ++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  55 +++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  43 +++++++++
 package/gdb/17.1/0003-use-asm-sgidefs.h.patch      |  40 ++++++++
 .../17.1/0004-gdbserver-fix-build-for-m68k.patch   |  64 +++++++++++++
 ...-nat-fork-inferior-include-linux-ptrace.h.patch |  55 +++++++++++
 ...-Fix-getrandom-compile-for-uclibc-v1.0.35.patch |  39 ++++++++
 .../gdb/17.1/0007-fix-musl-build-on-riscv.patch    |  60 ++++++++++++
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch |  38 ++++++++
 .../17.1/0009-gdb-Fix-native-build-on-xtensa.patch |  57 +++++++++++
 ...x-fix-musl-build-failure-when-setting-cus.patch | 104 +++++++++++++++++++++
 ...x-work-around-conflicting-types-for-tcfla.patch |  77 +++++++++++++++
 package/gdb/Config.in.host                         |   7 +-
 package/gdb/gdb.hash                               |   1 +
 14 files changed, 648 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 25c94b9562..139a5ee81c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -389,6 +389,15 @@ package/gdb/16.3/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
 package/gdb/16.3/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/16.3/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/16.3/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
+package/gdb/17.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
+package/gdb/17.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
+package/gdb/17.1/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
+package/gdb/17.1/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
+package/gdb/17.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
+package/gdb/17.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
+package/gdb/17.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
+package/gdb/17.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
+package/gdb/17.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
 package/gerbera/S99gerbera lib_sysv.Indent
diff --git a/package/gdb/17.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/17.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000000..5118e929df
--- /dev/null
+++ b/package/gdb/17.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,55 @@
+From 7fbcc55c3b2dac91dcb0a8dc6daa5514ff323185 Mon Sep 17 00:00:00 2001
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
+index 3efc1b9a9bf..635d07486de 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef GDB_NAT_PPC_LINUX_H
+ #define GDB_NAT_PPC_LINUX_H
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
+index 3ce978f4c7c..38534297cdf 100644
+--- a/gdbserver/linux-ppc-low.cc
++++ b/gdbserver/linux-ppc-low.cc
+@@ -22,7 +22,13 @@
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
+2.48.1
+
diff --git a/package/gdb/17.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/17.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000000..878239a82e
--- /dev/null
+++ b/package/gdb/17.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,43 @@
+From ab3ce973d6423552de732a05ac9da04c22b21411 Mon Sep 17 00:00:00 2001
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
+index 64e6de3480b..4770e652614 100644
+--- a/gdbserver/linux-sh-low.cc
++++ b/gdbserver/linux-sh-low.cc
+@@ -75,7 +75,15 @@ extern const struct target_desc *tdesc_sh;
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
+2.48.1
+
diff --git a/package/gdb/17.1/0003-use-asm-sgidefs.h.patch b/package/gdb/17.1/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..b36d3730de
--- /dev/null
+++ b/package/gdb/17.1/0003-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From aa66834f88463c23a641c12e967bce68799cda47 Mon Sep 17 00:00:00 2001
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
+index 3d072ea935c..d763c9b8f7e 100644
+--- a/gdb/mips-linux-nat.c
++++ b/gdb/mips-linux-nat.c
+@@ -30,7 +30,7 @@
+ #include "gdb_proc_service.h"
+ #include "gregset.h"
+ 
+-#include <sgidefs.h>
++#include <asm/sgidefs.h>
+ #include "nat/gdb_ptrace.h"
+ #include <asm/ptrace.h>
+ #include "inf-ptrace.h"
+-- 
+2.48.1
+
diff --git a/package/gdb/17.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/17.1/0004-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..8711190747
--- /dev/null
+++ b/package/gdb/17.1/0004-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,64 @@
+From cec7ed0cb055f960a689f2403a871a7e3e852e6e Mon Sep 17 00:00:00 2001
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
+ gdbserver/linux-m68k-low.cc | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/gdbserver/linux-m68k-low.cc b/gdbserver/linux-m68k-low.cc
+index 8020e49ac6e..d9ba6235288 100644
+--- a/gdbserver/linux-m68k-low.cc
++++ b/gdbserver/linux-m68k-low.cc
+@@ -16,6 +16,12 @@
+    You should have received a copy of the GNU General Public License
+    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
+ 
++#include "server.h"
++
++#ifdef HAVE_SYS_REG_H
++#include <sys/reg.h>
++#endif
++
+ #include "linux-low.h"
+ 
+ /* Linux target op definitions for the m68k architecture.  */
+@@ -79,10 +85,6 @@ m68k_target::low_decr_pc_after_break ()
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
+2.48.1
+
diff --git a/package/gdb/17.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/17.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
new file mode 100644
index 0000000000..c5a08ad45c
--- /dev/null
+++ b/package/gdb/17.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
@@ -0,0 +1,55 @@
+From 11b382a75cae8f4599e9d3f8b85815d2d95a58fa Mon Sep 17 00:00:00 2001
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
+[Bernd: rebased for version 17.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gdb/nat/fork-inferior.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/nat/fork-inferior.c b/gdb/nat/fork-inferior.c
+index 41765b102bc..a44a1d48722 100644
+--- a/gdb/nat/fork-inferior.c
++++ b/gdb/nat/fork-inferior.c
+@@ -29,6 +29,7 @@
+ #include "gdbsupport/gdb_signals.h"
+ #include "gdbsupport/buildargv.h"
+ #include "gdbsupport/gdb_argv_vec.h"
++#include "linux-ptrace.h"
+ #include <vector>
+ 
+ extern char **environ;
+-- 
+2.48.1
+
diff --git a/package/gdb/17.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/17.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
new file mode 100644
index 0000000000..6d205279da
--- /dev/null
+++ b/package/gdb/17.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
@@ -0,0 +1,39 @@
+From 95d6a5a844083585f4f7b235cba14be94595b04a Mon Sep 17 00:00:00 2001
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
+2.48.1
+
diff --git a/package/gdb/17.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/17.1/0007-fix-musl-build-on-riscv.patch
new file mode 100644
index 0000000000..aea5eef84a
--- /dev/null
+++ b/package/gdb/17.1/0007-fix-musl-build-on-riscv.patch
@@ -0,0 +1,60 @@
+From 76bee99c13ab44949c25582f49528cd0c661cdb3 Mon Sep 17 00:00:00 2001
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
+index 0cd38435b22..c1f39037ad7 100644
+--- a/gdb/nat/riscv-linux-tdesc.c
++++ b/gdb/nat/riscv-linux-tdesc.c
+@@ -30,6 +30,11 @@
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
+index 44c805bb6d6..d43c3b9fe02 100644
+--- a/gdbserver/linux-riscv-low.cc
++++ b/gdbserver/linux-riscv-low.cc
+@@ -29,6 +29,11 @@
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
+2.48.1
+
diff --git a/package/gdb/17.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/17.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
new file mode 100644
index 0000000000..10156407cb
--- /dev/null
+++ b/package/gdb/17.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
@@ -0,0 +1,38 @@
+From e5a09ecd2a222168a6c58eb57a171f64e75ad053 Mon Sep 17 00:00:00 2001
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
+index 365dcf23650..42e1b7bcf6d 100644
+--- a/gdbserver/Makefile.in
++++ b/gdbserver/Makefile.in
+@@ -407,7 +407,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
+ 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
+ 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
+ 		 $(CXXFLAGS) \
+-		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread
++		-o $(IPA_LIB) ${IPA_OBJS} $(LIBIBERTY_FOR_SHLIB) -ldl -pthread $(INTL)
+ 
+ # Put the proper machine-specific files first, so M-. on a machine
+ # specific routine gets the one for the correct machine.
+-- 
+2.48.1
+
diff --git a/package/gdb/17.1/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/17.1/0009-gdb-Fix-native-build-on-xtensa.patch
new file mode 100644
index 0000000000..4d5a171aff
--- /dev/null
+++ b/package/gdb/17.1/0009-gdb-Fix-native-build-on-xtensa.patch
@@ -0,0 +1,57 @@
+From 43501f9838e7aefd7d5d19aede49491591c34c98 Mon Sep 17 00:00:00 2001
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
+index f8509b02e07..794be827f9a 100644
+--- a/gdb/xtensa-linux-nat.c
++++ b/gdb/xtensa-linux-nat.c
+@@ -35,6 +35,7 @@
+ 
+ #include "gregset.h"
+ #include "xtensa-tdep.h"
++#include "gdbarch.h"
+ 
+ /* Defines ps_err_e, struct ps_prochandle.  */
+ #include "gdb_proc_service.h"
+-- 
+2.48.1
+
diff --git a/package/gdb/17.1/0010-gdb-ser-unix-fix-musl-build-failure-when-setting-cus.patch b/package/gdb/17.1/0010-gdb-ser-unix-fix-musl-build-failure-when-setting-cus.patch
new file mode 100644
index 0000000000..593f9fcc4a
--- /dev/null
+++ b/package/gdb/17.1/0010-gdb-ser-unix-fix-musl-build-failure-when-setting-cus.patch
@@ -0,0 +1,104 @@
+From 56c4ba5d7b530fea8277704a231be5e64fca04fc Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Tue, 24 Mar 2026 09:45:26 -0700
+Subject: [PATCH] gdb/ser-unix: fix musl build failure when setting custom baud
+ rates
+
+On musl-based systems, <asm/termbits.h> may expose BOTHER even though
+struct termios does not define c_ispeed/c_ospeed.  This causes the
+Linux-specific custom baud rate path to be compiled and fail to build.
+
+Fix the problem at the macro level by requiring
+HAVE_STRUCT_TERMIOS_C_OSPEED (obtained via AC_CHECK_MEMBERS) together
+with BOTHER in the HAVE_CUSTOM_BAUDRATE_SUPPORT guard.  This prevents
+the Linux-specific code from being compiled on musl while leaving
+set_custom_baudrate_linux unchanged.
+
+This is a pure build fix with no functional or behavioural change on
+any existing platform.
+
+Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+Approved-by: Kevin Buettner <kevinb@redhat.com>
+(cherry picked from commit 94d58b3add01b6d29382fbb68a2e098166072ee2)
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=56c4ba5d7b530fea8277704a231be5e64fca04fc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gdb/config.in    |  3 +++
+ gdb/configure    | 13 +++++++++++++
+ gdb/configure.ac |  3 +++
+ gdb/ser-unix.c   |  4 +++-
+ 4 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/gdb/config.in b/gdb/config.in
+index efc3100cb9e..62ceb846824 100644
+--- a/gdb/config.in
++++ b/gdb/config.in
+@@ -517,6 +517,9 @@
+ /* Define to 1 if `st_blocks' is a member of `struct stat'. */
+ #undef HAVE_STRUCT_STAT_ST_BLOCKS
+ 
++/* Define to 1 if `c_ospeed' is a member of `struct termios'. */
++#undef HAVE_STRUCT_TERMIOS_C_OSPEED
++
+ /* Define to 1 if `td_pcb' is a member of `struct thread'. */
+ #undef HAVE_STRUCT_THREAD_TD_PCB
+ 
+diff --git a/gdb/configure b/gdb/configure
+index d0bdba6eb36..3c321d6220b 100755
+--- a/gdb/configure
++++ b/gdb/configure
+@@ -27336,6 +27336,19 @@ if test "$ac_res" != no; then :
+ fi
+ 
+ 
++# Check for members required by the legacy Linux custom baud rate path.
++ac_fn_c_check_member "$LINENO" "struct termios" "c_ospeed" "ac_cv_member_struct_termios_c_ospeed" "#include <termios.h>
++"
++if test "x$ac_cv_member_struct_termios_c_ospeed" = xyes; then :
++
++cat >>confdefs.h <<_ACEOF
++#define HAVE_STRUCT_TERMIOS_C_OSPEED 1
++_ACEOF
++
++
++fi
++
++
+ 
+ 
+ # Check whether --with-jit-reader-dir was given.
+diff --git a/gdb/configure.ac b/gdb/configure.ac
+index 52924106bca..9d3377f3c40 100644
+--- a/gdb/configure.ac
++++ b/gdb/configure.ac
+@@ -733,6 +733,9 @@ AC_CONFIG_FILES([jit-reader.h:jit-reader.in])
+ 
+ AC_SEARCH_LIBS(dlopen, dl)
+ 
++# Check for members required by the legacy Linux custom baud rate path.
++AC_CHECK_MEMBERS([struct termios.c_ospeed], [], [], [[#include <termios.h>]])
++
+ GDB_AC_WITH_DIR([JIT_READER_DIR], [jit-reader-dir],
+                 [directory to load the JIT readers from],
+                 [${libdir}/gdb])
+diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
+index 6f2766518be..ffd721ad599 100644
+--- a/gdb/ser-unix.c
++++ b/gdb/ser-unix.c
+@@ -53,7 +53,9 @@
+ 
+ #include "gdbsupport/scoped_ignore_sigttou.h"
+ 
+-#if defined(HAVE_SYS_IOCTL_H) && (defined(BOTHER) || defined(IOSSIOSPEED))
++#if (defined(HAVE_SYS_IOCTL_H) \
++     && ((defined(BOTHER) && defined(HAVE_STRUCT_TERMIOS_C_OSPEED)) \
++	  || defined(IOSSIOSPEED)))
+ #  define HAVE_CUSTOM_BAUDRATE_SUPPORT 1
+ #endif
+ 
+-- 
+2.43.7
+
diff --git a/package/gdb/17.1/0011-gdb-ser-unix-work-around-conflicting-types-for-tcfla.patch b/package/gdb/17.1/0011-gdb-ser-unix-work-around-conflicting-types-for-tcfla.patch
new file mode 100644
index 0000000000..a08d6c611a
--- /dev/null
+++ b/package/gdb/17.1/0011-gdb-ser-unix-work-around-conflicting-types-for-tcfla.patch
@@ -0,0 +1,77 @@
+From 6b84377e146794446f21371f8455b870a029cc8e Mon Sep 17 00:00:00 2001
+From: Simon Marchi <simon.marchi@efficios.com>
+Date: Mon, 17 Nov 2025 16:25:18 -0500
+Subject: [PATCH] gdb/ser-unix: work around conflicting types for tcflag_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+When trying to cross-compile GDB to sparc-buildroot-linux-uclibc, I get:
+
+      CXX    ser-unix.o
+    In file included from /data1/smarchi/many-buildroots/toolchains/sparc/sparc-buildroot-linux-uclibc/sysroot/usr/include/termios.h:39,
+                     from /home/smarchi/src/binutils-gdb/gdb/ser-unix.c:51:
+    /data1/smarchi/many-buildroots/toolchains/sparc/sparc-buildroot-linux-uclibc/sysroot/usr/include/bits/termios.h:26:22: error: conflicting declaration âtypedef unsigned int tcflag_tâ
+       26 | typedef unsigned int tcflag_t;
+          |                      ^~~~~~~~
+    In file included from /home/smarchi/src/binutils-gdb/gdb/ser-unix.c:46:
+    /data1/smarchi/many-buildroots/toolchains/sparc/sparc-buildroot-linux-uclibc/sysroot/usr/include/asm/termbits.h:13:25: note: previous declaration as âtypedef long unsigned int tcflag_tâ
+       13 | typedef unsigned long   tcflag_t;
+          |                         ^~~~~~~~
+
+uClibc and the kernel don't agree on the definition of tcflag_t for this
+architecture.  Here' uClibc [1]:
+
+    typedef unsigned int tcflag_t;
+
+And here's the kernel [2]:
+
+    #if defined(__sparc__) && defined(__arch64__)
+    typedef unsigned int	tcflag_t;
+    #else
+    typedef unsigned long	tcflag_t; <--- that branch is take
+    #endif
+
+glibc [3] has the same definition as uClibc, so we would get the same
+problem.
+
+I propose to work around this the same way as we handle differences in
+the termios structure, by renaming the version from the kernel.
+
+I opened a bug on the glibc bugzilla [4] to ask if this is something
+that would need to be fixed on the libc side, but in the mean time we
+need to work around it.
+
+[1] https://github.com/kraj/uClibc/blob/ca1c74d67dd115d059a875150e10b8560a9c35a8/libc/sysdeps/linux/sparc/bits/termios.h#L26
+[2] https://github.com/torvalds/linux/blob/e7c375b181600caf135cfd03eadbc45eb530f2cb/arch/sparc/include/uapi/asm/termbits.h#L7-L11
+[3] https://gitlab.com/gnutools/glibc/-/blob/efc8642051e6c4fe5165e8986c1338ba2c180de6/bits/termios.h#L104
+[4] https://sourceware.org/bugzilla/show_bug.cgi?id=33643
+
+Change-Id: I71c6e0df5ac8e2ff3db3233a2220faaf70c3df6d
+Approved-By: Tom Tromey <tom@tromey.com>
+
+Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=6b84377e146794446f21371f8455b870a029cc8e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gdb/ser-unix.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gdb/ser-unix.c b/gdb/ser-unix.c
+index 553220e5b08..f9ef8441629 100644
+--- a/gdb/ser-unix.c
++++ b/gdb/ser-unix.c
+@@ -43,8 +43,10 @@
+ /* Workaround to resolve conflicting declarations of termios
+    in <asm/termbits.h> and <termios.h>.  */
+ #  define termios asmtermios
++#  define tcflag_t asmtcflag_t
+ #  include <asm/termbits.h>
+ #  undef termios
++#  undef tcflag_t
+ #endif
+ 
+ #ifdef HAVE_TERMIOS_H
+-- 
+2.43.7
+
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 963c46129d..a2caa3d58a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -61,7 +61,11 @@ config BR2_GDB_VERSION_16
 	bool "gdb 16.x"
 	depends on BR2_HOST_GCC_AT_LEAST_9 && BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
-comment "gdb 15.x/16.x need host and target gcc >= 9"
+config BR2_GDB_VERSION_17
+	bool "gdb 17.x"
+	depends on BR2_HOST_GCC_AT_LEAST_9 && BR2_TOOLCHAIN_GCC_AT_LEAST_9
+
+comment "gdb 15.x/16.x/17.x need host and target gcc >= 9"
 	depends on !BR2_HOST_GCC_AT_LEAST_9 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
@@ -76,4 +80,5 @@ config BR2_GDB_VERSION
 	default "14.2"     if BR2_GDB_VERSION_14 || (!BR2_PACKAGE_HOST_GDB && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "15.2"	   if BR2_GDB_VERSION_15 || (!BR2_PACKAGE_HOST_GDB && BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 	default "16.3"	   if BR2_GDB_VERSION_16
+	default "17.1"	   if BR2_GDB_VERSION_17
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 7844b765e6..e2a250c0c7 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,7 @@
 sha512  7e07941f1fe661288cc571b4964012ceabc1760624fce20320db2f470c01439b2386f859b5288da13204b758e2e3b22a74c68c012178db93b9529b06f1e22ede  gdb-14.2.tar.xz
 sha512  624007deceb5b15ba89c0725883d1a699fa46714ef30887f3d0165e17c5d65d634671740a135aa69e437d916218abb08cfa2a38ed309ff19d48f51da56b2a8ba  gdb-15.2.tar.xz
 sha512  fffd6689c3405466a179670b04720dc825e4f210a761f63dd2b33027432f8cd5d1c059c431a5ec9e165eedd1901220b5329d73c522f9a444788888c731b29e9c  gdb-16.3.tar.xz
+sha512  f1a6751e439a2128fecf3eae8b57c1608a0dc7cfe79b4356a937874e5a42bb2df0aba36eb6a9452c41966908b9a59076c7cad9720f684688ab956b65080f1d7c  gdb-17.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  a909a687abf6e9623c7ec99a8b2cbb03ab6fdeccee9ebd33ce34fffdb2bed5e4d519113aeb29ba3ca8db52e9bdbb63b59973914c74e3eebf4a4a2a6033b9e784  gdb-arc-2024.12-release-gdb.tar.gz

--===============1965062032053207467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1965062032053207467==--
