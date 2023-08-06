Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8CBC001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B782B81E7C;
	Sun,  6 Aug 2023 14:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B782B81E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-ucnlNWy-pJ; Sun,  6 Aug 2023 14:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D22A681DE2;
	Sun,  6 Aug 2023 14:42:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D22A681DE2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EBB61BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A204C607BC
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A204C607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iB6zXnVAU4ub for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:41:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C79B760AA7
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:41:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C79B760AA7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B42F9844E0; Sun,  6 Aug 2023 14:41:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:41:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8568bcd38a4e83ad1a2827b8362278ec73a4feb1
X-Git-Newrev: 809fdb3a7a3e4da8e7734a0d7cec48a4b3b99ec5
X-Patchwork-Hint: ignore
Message-Id: <20230806144139.B42F9844E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdb: remove gdb 10.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7895643865870622605=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7895643865870622605==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=809fdb3a7a3e4da8e7734a0d7cec48a4b3b99ec5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that gdb 13.x has been added, and 12.x made the default, follow
our usual logic of dropping the oldest gdb version: 10.x.

Only the special ARC release still needs some special handling of the
GMP dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  9 ----
 Config.in.legacy                                   |  6 +++
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 -------------------
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 ---------------
 package/gdb/10.2/0003-use-asm-sgidefs.h.patch      | 40 --------------
 .../10.2/0004-gdbserver-fix-build-for-m68k.patch   | 63 ----------------------
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 53 ------------------
 ...-Fix-getrandom-compile-for-uclibc-v1.0.35.patch | 39 --------------
 .../gdb/10.2/0007-fix-musl-build-on-riscv.patch    | 60 ---------------------
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch | 38 -------------
 .../10.2/0009-gdb-Fix-native-build-on-xtensa.patch | 57 --------------------
 package/gdb/Config.in                              |  2 +-
 package/gdb/Config.in.host                         |  6 ---
 package/gdb/gdb.mk                                 |  8 +--
 14 files changed, 11 insertions(+), 468 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 75da7fa923..1d96ae5ca0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -495,15 +495,6 @@ package/gcc/arc-2020.09-release/0002-libsanitizer-Remove-cyclades-from-libsaniti
 package/gcc/arc-2020.09-release/0100-uclibc-conf.patch Upstream
 package/gcr/0001-meson-Fix-unknown-kw-argument-in-gnome.generate_gir.patch Upstream
 package/gdal/0001-fix-uclibc-build-without-NPTL.patch Upstream
-package/gdb/10.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch Upstream
-package/gdb/10.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch Upstream
-package/gdb/10.2/0003-use-asm-sgidefs.h.patch Upstream
-package/gdb/10.2/0004-gdbserver-fix-build-for-m68k.patch Upstream
-package/gdb/10.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch Upstream
-package/gdb/10.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch Upstream
-package/gdb/10.2/0007-fix-musl-build-on-riscv.patch Upstream
-package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch Upstream
-package/gdb/10.2/0009-gdb-Fix-native-build-on-xtensa.patch Upstream
 package/gdb/11.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch Upstream
 package/gdb/11.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch Upstream
 package/gdb/11.2/0003-use-asm-sgidefs.h.patch Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index d32ff09216..d5bf4f08f3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.08"
 
+config BR2_GDB_VERSION_10
+	bool "gdb 10.x removed"
+	select BR2_LEGACY
+	help
+	  gdb 10.x has been removed, use a newer version.
+
 config BR2_BINUTILS_VERSION_2_38_X
 	bool "binutils 2.38.x has been removed"
 	select BR2_LEGACY
diff --git a/package/gdb/10.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/10.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
deleted file mode 100644
index 9369a14d2c..0000000000
--- a/package/gdb/10.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 64b8ab56118d2fea027adfb7ebbc01668b29528e Mon Sep 17 00:00:00 2001
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
-index d937a65b69c..1fd54b4a0e0 100644
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
-index 337d555aee7..5d518f37268 100644
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
-2.29.2
-
diff --git a/package/gdb/10.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/10.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
deleted file mode 100644
index 2f96d29820..0000000000
--- a/package/gdb/10.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d205f398e1e36f9673f50f368a3f29fd1dfaa794 Mon Sep 17 00:00:00 2001
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
-index a6d3fc60047..b83cce6b9fe 100644
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
-2.29.2
-
diff --git a/package/gdb/10.2/0003-use-asm-sgidefs.h.patch b/package/gdb/10.2/0003-use-asm-sgidefs.h.patch
deleted file mode 100644
index e04ebd1dd5..0000000000
--- a/package/gdb/10.2/0003-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00 2001
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
-index 38ff461a35b..b6cf194b2bf 100644
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
-2.29.2
-
diff --git a/package/gdb/10.2/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/10.2/0004-gdbserver-fix-build-for-m68k.patch
deleted file mode 100644
index 846f7ed293..0000000000
--- a/package/gdb/10.2/0004-gdbserver-fix-build-for-m68k.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 90ebe548922538b854de52e8b687384f44360984 Mon Sep 17 00:00:00 2001
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
-index 838ba353b0b..36679682b9a 100644
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
-2.29.2
-
diff --git a/package/gdb/10.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/10.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
deleted file mode 100644
index 33dce4d940..0000000000
--- a/package/gdb/10.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From c8454711eca2e79437e17ed1e1e68b48b4c8d927 Mon Sep 17 00:00:00 2001
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
-index 7ba0126871d..53e1ec72f09 100644
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
-2.29.2
-
diff --git a/package/gdb/10.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/10.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
deleted file mode 100644
index 4b212e2d03..0000000000
--- a/package/gdb/10.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From bb894a9cfb1c3cf0e0a174c496ad848f589ee7da Mon Sep 17 00:00:00 2001
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
-index 030a78b..7b24350 100644
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
-2.33.1
-
diff --git a/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch b/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
deleted file mode 100644
index 34ab08a97a..0000000000
--- a/package/gdb/10.2/0007-fix-musl-build-on-riscv.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From c3fdbc0a24c83246f951ba79c7167547da979ae5 Mon Sep 17 00:00:00 2001
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
-index 837b1707e0f..667c013006a 100644
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
-index 8bf97ea4aa3..1142dbc7b16 100644
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
-2.33.0
-
diff --git a/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
deleted file mode 100644
index 3d7534a48a..0000000000
--- a/package/gdb/10.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c098500aee945ee7a3021649eb0a2655b004103c Mon Sep 17 00:00:00 2001
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
-index 71c3c4ad959..e69fbc4dae4 100644
---- a/gdbserver/Makefile.in
-+++ b/gdbserver/Makefile.in
-@@ -383,7 +383,7 @@ $(IPA_LIB): $(sort $(IPA_OBJS)) ${CDEPS}
-	$(SILENCE) rm -f $(IPA_LIB)
- 	$(ECHO_CXXLD) $(CC_LD) -shared -fPIC -Wl,--soname=$(IPA_LIB) \
- 		-Wl,--no-undefined $(INTERNAL_CFLAGS) $(INTERNAL_LDFLAGS) \
--		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread
-+		-o $(IPA_LIB) ${IPA_OBJS} -ldl -pthread $(INTL)
- 
- # Put the proper machine-specific files first, so M-. on a machine
- # specific routine gets the one for the correct machine.
--- 
-2.33.0
-
diff --git a/package/gdb/10.2/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/10.2/0009-gdb-Fix-native-build-on-xtensa.patch
deleted file mode 100644
index 927bf20de5..0000000000
--- a/package/gdb/10.2/0009-gdb-Fix-native-build-on-xtensa.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 02d9e6a3bc47dfe138ef4511aaeeae26b7dbd1ba Mon Sep 17 00:00:00 2001
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
-index b2b3db182bc..b230e08b69f 100644
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
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index d1813fd7b9..20fd262c93 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -59,7 +59,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	bool "full debugger"
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
-	select BR2_PACKAGE_GMP if !BR2_GDB_VERSION_10 && !BR2_arc
+	select BR2_PACKAGE_GMP if !BR2_arc
 	select BR2_PACKAGE_NCURSES
 
 comment "full gdb on target needs a toolchain w/ wchar"
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 14efb10c76..9ba987222a 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -46,11 +46,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_10
-	bool "gdb 10.x"
-	# gdbserver support missing
-	depends on !BR2_or1k
-
 config BR2_GDB_VERSION_11
 	bool "gdb 11.x"
 	# gdbserver support missing
@@ -70,7 +65,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
-	default "10.2"	   if BR2_GDB_VERSION_10
 	default "11.2"     if BR2_GDB_VERSION_11
 	default "12.1"     if BR2_GDB_VERSION_12 || !BR2_PACKAGE_HOST_GDB
 	default "13.2"     if BR2_GDB_VERSION_13
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 4b9c5c6b70..ec4cc24137 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -59,7 +59,7 @@ endif
 
 # All newer versions of GDB need host-gmp, so it's only for older
 # versions that the dependency can be avoided.
-ifeq ($(BR2_GDB_VERSION_10)$(BR2_arc),)
+ifeq ($(BR2_arc),)
 HOST_GDB_DEPENDENCIES += host-gmp
 endif
 
@@ -149,9 +149,9 @@ GDB_CONF_OPTS += \
 endif
 
 # Starting from GDB 11.x, gmp is needed as a dependency to build full
-# gdb. So we avoid the dependency only for GDB 10.x and the special
-# version used on ARC.
-ifeq ($(BR2_GDB_VERSION_10)$(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),:y)
+# gdb. So we avoid the dependency only for the special version used on
+# ARC.
+ifeq ($(BR2_arc):$(BR2_PACKAGE_GDB_DEBUGGER),:y)
 GDB_CONF_OPTS += \
 	--with-libgmp-prefix=$(STAGING_DIR)/usr
 GDB_DEPENDENCIES += gmp

--===============7895643865870622605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7895643865870622605==--
