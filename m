Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CADC433FE
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD3D460F22
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD3D460F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2AB4042D;
	Sun, 10 Oct 2021 17:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCi49TpbV82O; Sun, 10 Oct 2021 17:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1C8A40425;
	Sun, 10 Oct 2021 17:42:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6EC1BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F02B3400DE
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5yth8HbK_4l for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:41:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB050400EE
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:41:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 52A9E95287; Sun, 10 Oct 2021 17:39:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 19:40:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02972acf3f676d94e360f4b562b412d36133d246
X-Git-Newrev: 5b2a5cd386301f16959f880a81e2418ae3182171
X-Patchwork-Hint: ignore
Message-Id: <20211010173900.52A9E95287@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: drop support for version 8.3.x
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
Content-Type: multipart/mixed; boundary="===============6236872709928310917=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6236872709928310917==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5b2a5cd386301f16959f880a81e2418ae3182171
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that gdb 11.x has been added, that 10.x is the default, we can
drop version 8.3.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                                   |   6 +
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  55 ------
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  43 -----
 package/gdb/8.3.1/0003-use-asm-sgidefs.h.patch     |  40 -----
 .../8.3.1/0004-gdbserver-fix-build-for-m68k.patch  |  62 -------
 ...-nat-fork-inferior-include-linux-ptrace.h.patch |  53 ------
 ...ct-use-of-is-operator-for-comparison-in-p.patch |  42 -----
 ...07-Fix-Python3.9-related-runtime-problems.patch | 193 ---------------------
 package/gdb/Config.in.host                         |   6 -
 package/gdb/gdb.hash                               |   1 -
 10 files changed, 6 insertions(+), 495 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 06bd962d9b..3ec48edb87 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_GDB_VERSION_8_3
+	bool "gdb version 8.3.x removed"
+	select BR2_LEGACY
+	help
+	  gdb 8.3.x has been removed, use a newer version instead.
+
 config BR2_PACKAGE_PYTHON_MELD3
 	bool "python-meld3 package removed"
 	select BR2_LEGACY
diff --git a/package/gdb/8.3.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.3.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
deleted file mode 100644
index ab8dc626f0..0000000000
--- a/package/gdb/8.3.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
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
diff --git a/package/gdb/8.3.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.3.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
deleted file mode 100644
index 9d508fbf1e..0000000000
--- a/package/gdb/8.3.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
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
diff --git a/package/gdb/8.3.1/0003-use-asm-sgidefs.h.patch b/package/gdb/8.3.1/0003-use-asm-sgidefs.h.patch
deleted file mode 100644
index 2909f62c68..0000000000
--- a/package/gdb/8.3.1/0003-use-asm-sgidefs.h.patch
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
diff --git a/package/gdb/8.3.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/8.3.1/0004-gdbserver-fix-build-for-m68k.patch
deleted file mode 100644
index d718293899..0000000000
--- a/package/gdb/8.3.1/0004-gdbserver-fix-build-for-m68k.patch
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
diff --git a/package/gdb/8.3.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/8.3.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
deleted file mode 100644
index 394e7a2c2a..0000000000
--- a/package/gdb/8.3.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
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
- #include "common/pathstuff.h"
- #include "common/signals-state-save-restore.h"
- #include "common/gdb_tilde_expand.h"
-+#include "linux-ptrace.h"
- #include <vector>
- 
- extern char **environ;
--- 
-2.21.0
-
diff --git a/package/gdb/8.3.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch b/package/gdb/8.3.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
deleted file mode 100644
index 989a5b1347..0000000000
--- a/package/gdb/8.3.1/0006-Fix-incorrect-use-of-is-operator-for-comparison-in-p.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e00c211d51bec301cf04719b77076a8783ef44b5 Mon Sep 17 00:00:00 2001
-From: Raul Tambre <raul@tambre.ee>
-Date: Sat, 4 May 2019 15:48:17 -0400
-Subject: [PATCH] Fix incorrect use of 'is' operator for comparison in
- python/lib/gdb/command/prompt.py
-
-The 'is' operator is not meant to be used for comparisons. It currently working
-is an implementation detail of CPython.  CPython 3.8 has added a SyntaxWarning
-for this.
-
-(cherry picked from commit b6484282f85bf7f11451b2441599c241d302ad9d)
-[Romain: backport to gdb 8.x]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- gdb/python/lib/gdb/command/prompt.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/python/lib/gdb/command/prompt.py b/gdb/python/lib/gdb/command/prompt.py
-index 3d662a7d3f..04b9e49c22 100644
---- a/gdb/python/lib/gdb/command/prompt.py
-+++ b/gdb/python/lib/gdb/command/prompt.py
-@@ -45,7 +45,7 @@ The currently defined substitutions are:
-         self.hook_set = False
- 
-     def get_show_string (self, pvalue):
--        if self.value is not '':
-+        if self.value:
-            return "The extended prompt is: " + self.value
-         else:
-            return "The extended prompt is not set."
-@@ -57,7 +57,7 @@ The currently defined substitutions are:
-         return ""
- 
-     def before_prompt_hook(self, current):
--        if self.value is not '':
-+        if self.value:
-             return gdb.prompt.substitute_prompt(self.value)
-         else:
-             return None
--- 
-2.25.4
-
diff --git a/package/gdb/8.3.1/0007-Fix-Python3.9-related-runtime-problems.patch b/package/gdb/8.3.1/0007-Fix-Python3.9-related-runtime-problems.patch
deleted file mode 100644
index 63cfa1bd3e..0000000000
--- a/package/gdb/8.3.1/0007-Fix-Python3.9-related-runtime-problems.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From 51ef4f6ec819259d4a57fa4155ee78700918f8ff Mon Sep 17 00:00:00 2001
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
-[import into Buildroot, removing ChangeLog change to avoid conflict]
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
----
- gdb/python/python.c | 32 ++++++++++++++++++++++++++++++--
- 1 file changed, 30 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/python/python.c b/gdb/python/python.c
-index c23db2c1261..0b77354630e 100644
---- a/gdb/python/python.c
-+++ b/gdb/python/python.c
-@@ -235,6 +235,30 @@ gdbpy_enter::~gdbpy_enter ()
-   restore_active_ext_lang (m_previous_active);
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
-@@ -248,6 +272,10 @@ gdbpy_set_quit_flag (const struct extension_language_defn *extlang)
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
-@@ -1573,6 +1601,7 @@ finalize_python (void *ignore)
- 
-   Py_Finalize ();
- 
-+  gdb_python_initialized = false;
-   restore_active_ext_lang (previous_active);
- }
- 
-@@ -1736,8 +1765,7 @@ do_start_initialization ()
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
-2.31.1
-
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index fd739f3969..a6e1d7f53c 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -67,11 +67,6 @@ choice
 	help
 	  Select the version of gdb you wish to use.
 
-config BR2_GDB_VERSION_8_3
-	bool "gdb 8.3.x"
-	# gdbserver support missing
-	depends on !BR2_riscv
-
 config BR2_GDB_VERSION_9_2
 	bool "gdb 9.2.x"
 	# gdbserver support missing
@@ -92,7 +87,6 @@ config BR2_GDB_VERSION
 	string
 	default "arc-2020.09-release-gdb" if BR2_arc
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
-	default "8.3.1"    if BR2_GDB_VERSION_8_3
 	default "9.2"      if BR2_GDB_VERSION_9_2
 	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
 	default "11.1"     if BR2_GDB_VERSION_11
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index e3b867b042..d3e83af0b9 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,5 +1,4 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
-sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
 sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
 sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
 sha512  c40bf970e2f7c2107b29c5aa6a7150daa709d75ddadb73ac20742419d4637d158e3063a4c6ff6e47fae8ca8e1d36253973f85ea15445d004be6d5d7a2dd9bd46  gdb-11.1.tar.xz

--===============6236872709928310917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6236872709928310917==--
