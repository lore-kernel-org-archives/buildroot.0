Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968B1C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BE47419B6;
	Sun, 11 Sep 2022 08:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BE47419B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZzh-dgJ472e; Sun, 11 Sep 2022 08:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1912419DF;
	Sun, 11 Sep 2022 08:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1912419DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6FF81BF9A4
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6521D612A4
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6521D612A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOBo8HF3lwCY for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D79C460B68
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D79C460B68
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D42028361F; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 17:53:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a493f6288baf4d4ea71c2ce7b93e7dbe868f926e
X-Git-Newrev: 5c89b00a205232745aa41e307d44498f325da94a
X-Patchwork-Hint: ignore
Message-Id: <20220911084823.D42028361F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: remove support for 9.2
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
Content-Type: multipart/mixed; boundary="===============7523012529303783726=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7523012529303783726==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5c89b00a205232745aa41e307d44498f325da94a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |   8 +
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  55 -----
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  43 ----
 package/gdb/9.2/0003-use-asm-sgidefs.h.patch       |  40 ----
 .../9.2/0004-gdbserver-fix-build-for-m68k.patch    |  62 ------
 ...-nat-fork-inferior-include-linux-ptrace.h.patch |  53 -----
 ...-sim-ppc-Fix-linker-error-with-fno-common.patch | 101 ---------
 ...07-Fix-Python3.9-related-runtime-problems.patch | 227 ---------------------
 ...re.tgt-build-gdbserver-with-m68k-and-ucli.patch |  41 ----
 package/gdb/Config.in.host                         |   6 -
 package/gdb/gdb.hash                               |   1 -
 11 files changed, 8 insertions(+), 629 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 80c443d9fb..3b6e875c0c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2022.11"
+
+config BR2_GDB_VERSION_9_2
+	bool "gdb 9.2 removed"
+	help
+	  Support for GDB 9.2 has been removed. A new version has
+	  automatically been selected.
+
 comment "Legacy options removed in 2022.08"
 
 config BR2_ECLIPSE_REGISTER
diff --git a/package/gdb/9.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/9.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
deleted file mode 100644
index ab8dc626f0..0000000000
--- a/package/gdb/9.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 72ee19f54fd35595465b2e35eccf1f3d65fe21c6 Mon Sep 17 00:00:00 2001
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
- gdb/gdbserver/linux-ppc-low.c | 6 ++++++
- gdb/nat/ppc-linux.h           | 6 ++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 1b695e53fe9..1978347c02c 100644
---- a/gdb/gdbserver/linux-ppc-low.c
-+++ b/gdb/gdbserver/linux-ppc-low.c
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
-diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index f1561b3b357..40399361c09 100644
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
--- 
-2.21.0
-
diff --git a/package/gdb/9.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/9.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
deleted file mode 100644
index 9d508fbf1e..0000000000
--- a/package/gdb/9.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ef630288fdc2d4d22651702672f9d5c9cd767e5b Mon Sep 17 00:00:00 2001
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
- gdb/gdbserver/linux-sh-low.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/gdb/gdbserver/linux-sh-low.c b/gdb/gdbserver/linux-sh-low.c
-index 0953721a190..c331c1382f7 100644
---- a/gdb/gdbserver/linux-sh-low.c
-+++ b/gdb/gdbserver/linux-sh-low.c
-@@ -27,7 +27,15 @@ extern const struct target_desc *tdesc_sh;
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
-2.21.0
-
diff --git a/package/gdb/9.2/0003-use-asm-sgidefs.h.patch b/package/gdb/9.2/0003-use-asm-sgidefs.h.patch
deleted file mode 100644
index 2909f62c68..0000000000
--- a/package/gdb/9.2/0003-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 19a0f664809b6858e69aa98188eb739415de044c Mon Sep 17 00:00:00 2001
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
-index e68ed1e4da9..bc42aa59685 100644
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
-2.21.0
-
diff --git a/package/gdb/9.2/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/9.2/0004-gdbserver-fix-build-for-m68k.patch
deleted file mode 100644
index d718293899..0000000000
--- a/package/gdb/9.2/0004-gdbserver-fix-build-for-m68k.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 448e481aab86c823d908530038e20a14213db0a2 Mon Sep 17 00:00:00 2001
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
- gdb/gdbserver/linux-m68k-low.c | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/gdb/gdbserver/linux-m68k-low.c b/gdb/gdbserver/linux-m68k-low.c
-index 16f639d02fc..969d9973737 100644
---- a/gdb/gdbserver/linux-m68k-low.c
-+++ b/gdb/gdbserver/linux-m68k-low.c
-@@ -17,16 +17,17 @@
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
- /* Defined in auto-generated file reg-m68k.c.  */
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
-2.21.0
-
diff --git a/package/gdb/9.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/9.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
deleted file mode 100644
index 1df5452682..0000000000
--- a/package/gdb/9.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d84ecfa3a8c8fbade89229ac66c09f2a97ab00fb Mon Sep 17 00:00:00 2001
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
-index fe9360a5039..626fe7c1fbf 100644
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
-2.21.0
-
diff --git a/package/gdb/9.2/0006-sim-ppc-Fix-linker-error-with-fno-common.patch b/package/gdb/9.2/0006-sim-ppc-Fix-linker-error-with-fno-common.patch
deleted file mode 100644
index 813a1054a5..0000000000
--- a/package/gdb/9.2/0006-sim-ppc-Fix-linker-error-with-fno-common.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From ad8464f799a4c96c7ab8bdfec3f95846cf54f9b0 Mon Sep 17 00:00:00 2001
-From: Sebastian Huber <sebastian.huber@embedded-brains.de>
-Date: Wed, 1 Jul 2020 19:29:55 +0200
-Subject: [PATCH] sim/ppc: Fix linker error with -fno-common
-
-GCC 10 enables -fno-common by default.  This resulted in a multiple
-definition linker error since global variables were declared and defined
-in a header file:
-
-  ld: ld-insn.o:sim/ppc/ld-insn.h:221: multiple definition of
-  `max_model_fields_len'; igen.o:sim/ppc/ld-insn.h:221: first defined here
-
-sim/ppc
-
-	* ld-insn.h (last_model, last_model_data, last_model_function,
-	last_model_internal, last_model_macro, last_model_static):
-	Delete.
-	(max_model_fields_len, model_data, model_functions,
-	model_internal, model_macros, model_static, models): Declare, but do not
-	define.
-	* ld-insn.c (last_model, last_model_data, last_model_function,
-	last_model_internal, last_model_macro, last_model_static,
-	max_model_fields_len, model_data, model_functions,
-	model_internal, model_macros, model_static, models): Define.
-
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
-Fetch from: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=ad8464f799a4c96c7ab8bdfec3f95846cf54f9b0
----
- sim/ppc/ld-insn.c | 18 ++++++++++++++++++
- sim/ppc/ld-insn.h | 24 +++++++-----------------
- 2 files changed, 25 insertions(+), 17 deletions(-)
-
-diff --git a/sim/ppc/ld-insn.c b/sim/ppc/ld-insn.c
-index e39131ca133..585071a861f 100644
---- a/sim/ppc/ld-insn.c
-+++ b/sim/ppc/ld-insn.c
-@@ -28,6 +28,24 @@
- 
- #include "igen.h"
- 
-+static model *last_model;
-+
-+static insn *last_model_macro;
-+static insn *last_model_function;
-+static insn *last_model_internal;
-+static insn *last_model_static;
-+static insn *last_model_data;
-+
-+model *models;
-+
-+insn *model_macros;
-+insn *model_functions;
-+insn *model_internal;
-+insn *model_static;
-+insn *model_data;
-+
-+int max_model_fields_len;
-+
- static void
- update_depth(insn_table *entry,
- 	     lf *file,
-diff --git a/sim/ppc/ld-insn.h b/sim/ppc/ld-insn.h
-index 88318ffa2b3..52baeaa2d84 100644
---- a/sim/ppc/ld-insn.h
-+++ b/sim/ppc/ld-insn.h
-@@ -200,25 +200,15 @@ extern insn_table *load_insn_table
-  table_include *includes,
-  cache_table **cache_rules);
- 
--model *models;
--model *last_model;
-+extern model *models;
- 
--insn *model_macros;
--insn *last_model_macro;
-+extern insn *model_macros;
-+extern insn *model_functions;
-+extern insn *model_internal;
-+extern insn *model_static;
-+extern insn *model_data;
- 
--insn *model_functions;
--insn *last_model_function;
--
--insn *model_internal;
--insn *last_model_internal;
--
--insn *model_static;
--insn *last_model_static;
--
--insn *model_data;
--insn *last_model_data;
--
--int max_model_fields_len;
-+extern int max_model_fields_len;
- 
- extern void insn_table_insert_insn
- (insn_table *table,
--- 
-2.18.4
-
diff --git a/package/gdb/9.2/0007-Fix-Python3.9-related-runtime-problems.patch b/package/gdb/9.2/0007-Fix-Python3.9-related-runtime-problems.patch
deleted file mode 100644
index 89b0cdc4a0..0000000000
--- a/package/gdb/9.2/0007-Fix-Python3.9-related-runtime-problems.patch
+++ /dev/null
@@ -1,227 +0,0 @@
-From c47bae859a5af0d95224d90000df0e529f7c5aa0 Mon Sep 17 00:00:00 2001
-From: Kevin Buettner <kevinb@redhat.com>
-Date: Wed, 27 May 2020 20:05:40 -0700
-Subject: [PATCH] Fix Python3.9 related runtime problems
-
-Python3.9b1 is now available on Rawhide.  GDB w/ Python 3.9 support
-can be built using the configure switch -with-python=/usr/bin/python3.9.
-
-Attempting to run gdb/Python3.9 segfaults on startup:
-
-    #0  0x00007ffff7b0582c in PyEval_ReleaseLock () from /lib64/libpython3.9.so.1.0
-    #1  0x000000000069ccbf in do_start_initialization ()
-	at worktree-test1/gdb/python/python.c:1789
-    #2  _initialize_python ()
-	at worktree-test1/gdb/python/python.c:1877
-    #3  0x00000000007afb0a in initialize_all_files () at init.c:237
-    ...
-
-Consulting the the documentation...
-
-https://docs.python.org/3/c-api/init.html
-
-...we find that PyEval_ReleaseLock() has been deprecated since version
-3.2.  It recommends using PyEval_SaveThread or PyEval_ReleaseThread()
-instead.  In do_start_initialization, in gdb/python/python.c, we
-can replace the calls to PyThreadState_Swap() and PyEval_ReleaseLock()
-with a single call to PyEval_SaveThread.   (Thanks to Keith Seitz
-for working this out.)
-
-With that in place, GDB gets a little bit further.  It still dies
-on startup, but the backtrace is different:
-
-    #0  0x00007ffff7b04306 in PyOS_InterruptOccurred ()
-       from /lib64/libpython3.9.so.1.0
-    #1  0x0000000000576e86 in check_quit_flag ()
-	at worktree-test1/gdb/extension.c:776
-    #2  0x0000000000576f8a in set_active_ext_lang (now_active=now_active@entry=0x983c00 <extension_language_python>)
-	at worktree-test1/gdb/extension.c:705
-    #3  0x000000000069d399 in gdbpy_enter::gdbpy_enter (this=0x7fffffffd2d0,
-	gdbarch=0x0, language=0x0)
-	at worktree-test1/gdb/python/python.c:211
-    #4  0x0000000000686e00 in python_new_inferior (inf=0xddeb10)
-	at worktree-test1/gdb/python/py-inferior.c:251
-    #5  0x00000000005d9fb9 in std::function<void (inferior*)>::operator()(inferior*) const (__args#0=<optimized out>, this=0xccad20)
-	at /usr/include/c++/10/bits/std_function.h:617
-    #6  gdb::observers::observable<inferior*>::notify (args#0=0xddeb10,
-	this=<optimized out>)
-	at worktree-test1/gdb/../gdbsupport/observable.h:106
-    #7  add_inferior_silent (pid=0)
-	at worktree-test1/gdb/inferior.c:113
-    #8  0x00000000005dbcb8 in initialize_inferiors ()
-	at worktree-test1/gdb/inferior.c:947
-    ...
-
-We checked with some Python Developers and were told that we should
-acquire the GIL prior to calling any Python C API function.  We
-definitely don't have the GIL for calls of PyOS_InterruptOccurred().
-
-I moved class_gdbpy_gil earlier in the file and use it in
-gdbpy_check_quit_flag() to acquire (and automatically release) the
-GIL.
-
-With those changes in place, I was able to run to a GDB prompt.  But,
-when trying to quit, it segfaulted again due to due to some other
-problems with gdbpy_check_quit_flag():
-
-    Thread 1 "gdb" received signal SIGSEGV, Segmentation fault.
-    0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
-    (top-gdb) bt 8
-    #0  0x00007ffff7bbab0c in new_threadstate () from /lib64/libpython3.9.so.1.0
-    #1  0x00007ffff7afa5ea in PyGILState_Ensure.cold ()
-       from /lib64/libpython3.9.so.1.0
-    #2  0x000000000069b58c in gdbpy_gil::gdbpy_gil (this=<synthetic pointer>)
-	at worktree-test1/gdb/python/python.c:278
-    #3  gdbpy_check_quit_flag (extlang=<optimized out>)
-	at worktree-test1/gdb/python/python.c:278
-    #4  0x0000000000576e96 in check_quit_flag ()
-	at worktree-test1/gdb/extension.c:776
-    #5  0x000000000057700c in restore_active_ext_lang (previous=0xe9c050)
-	at worktree-test1/gdb/extension.c:729
-    #6  0x000000000088913a in do_my_cleanups (
-	pmy_chain=0xc31870 <final_cleanup_chain>,
-	old_chain=0xae5720 <sentinel_cleanup>)
-	at worktree-test1/gdbsupport/cleanups.cc:131
-    #7  do_final_cleanups ()
-	at worktree-test1/gdbsupport/cleanups.cc:143
-
-In this case, we're trying to call a Python C API function after
-Py_Finalize() has been called from finalize_python().  I made
-finalize_python set gdb_python_initialized to false and then cause
-check_quit_flag() to return early when it's false.
-
-With these changes in place, GDB seems to be working again with
-Python3.9b1.  I think it likely that there are other problems lurking.
-I wouldn't be surprised to find that there are other calls into Python
-where we don't first make sure that we have the GIL.  Further changes
-may well be needed.
-
-I see no regressions testing on Rawhide using a GDB built with the
-default Python version (3.8.3) versus one built using Python 3.9b1.
-
-I've also tested on Fedora 28, 29, 30, 31, and 32 (all x86_64) using
-the default (though updated) system installed versions of Python on
-those OSes.  This means that I've tested against Python versions
-2.7.15, 2.7.17, 2.7.18, 3.7.7, 3.8.2, and 3.8.3.  In each case GDB
-still builds without problem and shows no regressions after applying
-this patch.
-
-gdb/ChangeLog:
-
-2020-MM-DD  Kevin Buettner  <kevinb@redhat.com>
-	    Keith Seitz  <keiths@redhat.com>
-
-	* python/python.c (do_start_initialization): For Python 3.9 and
-	later, call PyEval_SaveThread instead of PyEval_ReleaseLock.
-	(class gdbpy_gil): Move to earlier in file.
-	(finalize_python): Set gdb_python_initialized.
-	(gdbpy_check_quit_flag): Acquire GIL via gdbpy_gil.  Return early
-	when not initialized.
-
-
-[import into Buildroot, removing ChangeLog change to avoid conflict]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-
----
- gdb/ChangeLog       | 10 ++++++++
- gdb/python/python.c | 56 ++++++++++++++++++++++++---------------------
- 2 files changed, 40 insertions(+), 26 deletions(-)
-
-diff --git a/gdb/python/python.c b/gdb/python/python.c
-index 67f362b852d..4bdd2201abc 100644
---- a/gdb/python/python.c
-+++ b/gdb/python/python.c
-@@ -238,6 +238,30 @@ gdbpy_enter::~gdbpy_enter ()
-   PyGILState_Release (m_state);
- }
- 
-+/* A helper class to save and restore the GIL, but without touching
-+   the other globals that are handled by gdbpy_enter.  */
-+
-+class gdbpy_gil
-+{
-+public:
-+
-+  gdbpy_gil ()
-+    : m_state (PyGILState_Ensure ())
-+  {
-+  }
-+
-+  ~gdbpy_gil ()
-+  {
-+    PyGILState_Release (m_state);
-+  }
-+
-+  DISABLE_COPY_AND_ASSIGN (gdbpy_gil);
-+
-+private:
-+
-+  PyGILState_STATE m_state;
-+};
-+
- /* Set the quit flag.  */
- 
- static void
-@@ -251,6 +275,10 @@ gdbpy_set_quit_flag (const struct extension_language_defn *extlang)
- static int
- gdbpy_check_quit_flag (const struct extension_language_defn *extlang)
- {
-+  if (!gdb_python_initialized)
-+    return 0;
-+
-+  gdbpy_gil gil;
-   return PyOS_InterruptOccurred ();
- }
- 
-@@ -943,30 +971,6 @@ gdbpy_source_script (const struct extension_language_defn *extlang,
- 
- /* Posting and handling events.  */
- 
--/* A helper class to save and restore the GIL, but without touching
--   the other globals that are handled by gdbpy_enter.  */
--
--class gdbpy_gil
--{
--public:
--
--  gdbpy_gil ()
--    : m_state (PyGILState_Ensure ())
--  {
--  }
--
--  ~gdbpy_gil ()
--  {
--    PyGILState_Release (m_state);
--  }
--
--  DISABLE_COPY_AND_ASSIGN (gdbpy_gil);
--
--private:
--
--  PyGILState_STATE m_state;
--};
--
- /* A single event.  */
- struct gdbpy_event
- {
-@@ -1616,6 +1620,7 @@ finalize_python (void *ignore)
- 
-   Py_Finalize ();
- 
-+  gdb_python_initialized = false;
-   restore_active_ext_lang (previous_active);
- }
- 
-@@ -1785,8 +1790,7 @@ do_start_initialization ()
-     return false;
- 
-   /* Release the GIL while gdb runs.  */
--  PyThreadState_Swap (NULL);
--  PyEval_ReleaseLock ();
-+  PyEval_SaveThread ();
- 
-   make_final_cleanup (finalize_python, NULL);
- 
--- 
-2.26.3
-
diff --git a/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch b/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch
deleted file mode 100644
index 5cdafae7a8..0000000000
--- a/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 808601f075fe3dd8ca101e31c9121a4e87f0bfc7 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 6 May 2021 07:45:00 +0200
-Subject: [PATCH] gdb/configure.tgt: build gdbserver with m68k and
- uclibc
-
-Allow to build gdbserver with m68k and uclibc:
-
-checking whether gdbserver is supported on this host... no
-configure: error: Automatic gdbserver build is not supported for this configuration
-
-Fixes:
- - http://autobuild.buildroot.org/results/f4d6d9d8418c0da48a3db4ad5a82e19bd16eae34
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- gdb/configure.tgt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/configure.tgt b/gdb/configure.tgt
-index caa42be1c01..8666bc5d0bf 100644
---- a/gdb/configure.tgt
-+++ b/gdb/configure.tgt
-@@ -372,12 +372,12 @@ m68hc11*-*-*|m6811*-*-*)
- 	gdb_sim=../sim/m68hc11/libsim.a
- 	;;
- 
--m68*-*-aout* | m68*-*-coff* | m68*-*-elf* | m68*-*-rtems* | m68*-*-uclinux* | \
-+m68*-*-aout* | m68*-*-coff* | m68*-*-elf* | m68*-*-rtems* | \
- fido-*-elf*)
- 	# Target: Motorola m68k embedded
- 	gdb_target_obs="m68k-tdep.o"
- 	;;
--m68*-*-linux*)
-+m68*-*-*linux*)
- 	# Target: Motorola m68k with a.out and ELF
- 	gdb_target_obs="m68k-tdep.o m68k-linux-tdep.o solib-svr4.o \
- 			linux-tdep.o glibc-tdep.o symfile-mem.o"
--- 
-2.30.2
-
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 9ee0b3f913..9876c4e8bc 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -46,11 +46,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_9_2
-	bool "gdb 9.2.x"
-	# gdbserver support missing
-	depends on !BR2_riscv
-
 config BR2_GDB_VERSION_10
 	bool "gdb 10.x"
 
@@ -68,7 +63,6 @@ endif
 config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
-	default "9.2"      if BR2_GDB_VERSION_9_2
 	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
 	default "11.2"     if BR2_GDB_VERSION_11
 	default "12.1"     if BR2_GDB_VERSION_12
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 3a1027dbb5..04c7d02d2f 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
 sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
 sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
 sha512  425568d2e84672177d0fb87b1ad7daafdde097648d605e30cf0656970f66adc6a82ca2d83375ea4be583e9683a340e5bfdf5819668ddf66728200141ae50ff2d  gdb-12.1.tar.xz

--===============7523012529303783726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7523012529303783726==--
