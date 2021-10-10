Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FF7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3077660F22
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3077660F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E10BF400DE;
	Sun, 10 Oct 2021 17:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5O2i5ofwcriy; Sun, 10 Oct 2021 17:42:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7298D400EE;
	Sun, 10 Oct 2021 17:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47EA21BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 446A340422
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0X67QlCBQ1Vv for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:41:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC9A0403CF
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:41:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3CB7C95284; Sun, 10 Oct 2021 17:39:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Oct 2021 19:35:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e064f9bb5250a2bd89086ca56b45699ac45a1bad
X-Git-Newrev: bc7322fe544bb4a99b7204a79c5f15cbe23ebe75
X-Patchwork-Hint: ignore
Message-Id: <20211010173900.3CB7C95284@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: add support for gdb 11.x
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
Content-Type: multipart/mixed; boundary="===============8050033369398201418=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8050033369398201418==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bc7322fe544bb4a99b7204a79c5f15cbe23ebe75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patch from gdb 10.2 are kept.

Starting from version 11.x, gdb needs the gmp library. The target
variant needs a bit of care: if BR2_GDB_VERSION_11 is not set, either
the host gdb is not enabled, in which case the default for the target
gdb is 9.x, or the host gdb is enabled, and another version is selected.

Signed-off-by: Michael Fischer <mf@go-sys.de>
[Thomas:
 - fix how the gmp dependency is handled
 - set BR2_PACKAGE_GDB_TOPLEVEL to y for gdb 11.x
 - fix how BR2_GDB_VERSION is set for gdb 11.x]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - only select target gmp if using gdb 11
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 +++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++++
 package/gdb/11.1/0003-use-asm-sgidefs.h.patch      | 40 ++++++++++++++
 .../11.1/0004-gdbserver-fix-build-for-m68k.patch   | 63 ++++++++++++++++++++++
 ...-nat-fork-inferior-include-linux-ptrace.h.patch | 53 ++++++++++++++++++
 package/gdb/Config.in                              |  1 +
 package/gdb/Config.in.host                         |  5 ++
 package/gdb/gdb.hash                               |  1 +
 package/gdb/gdb.mk                                 | 14 +++++
 9 files changed, 275 insertions(+)

diff --git a/package/gdb/11.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/11.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000000..9369a14d2c
--- /dev/null
+++ b/package/gdb/11.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,55 @@
+From 64b8ab56118d2fea027adfb7ebbc01668b29528e Mon Sep 17 00:00:00 2001
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
+index d937a65b69c..1fd54b4a0e0 100644
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
+index 337d555aee7..5d518f37268 100644
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
+2.29.2
+
diff --git a/package/gdb/11.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/11.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000000..2f96d29820
--- /dev/null
+++ b/package/gdb/11.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,43 @@
+From d205f398e1e36f9673f50f368a3f29fd1dfaa794 Mon Sep 17 00:00:00 2001
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
+index a6d3fc60047..b83cce6b9fe 100644
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
+2.29.2
+
diff --git a/package/gdb/11.1/0003-use-asm-sgidefs.h.patch b/package/gdb/11.1/0003-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..e04ebd1dd5
--- /dev/null
+++ b/package/gdb/11.1/0003-use-asm-sgidefs.h.patch
@@ -0,0 +1,40 @@
+From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00 2001
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
+index 38ff461a35b..b6cf194b2bf 100644
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
+2.29.2
+
diff --git a/package/gdb/11.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/11.1/0004-gdbserver-fix-build-for-m68k.patch
new file mode 100644
index 0000000000..846f7ed293
--- /dev/null
+++ b/package/gdb/11.1/0004-gdbserver-fix-build-for-m68k.patch
@@ -0,0 +1,63 @@
+From 90ebe548922538b854de52e8b687384f44360984 Mon Sep 17 00:00:00 2001
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
+index 838ba353b0b..36679682b9a 100644
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
+2.29.2
+
diff --git a/package/gdb/11.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/11.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
new file mode 100644
index 0000000000..33dce4d940
--- /dev/null
+++ b/package/gdb/11.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
@@ -0,0 +1,53 @@
+From c8454711eca2e79437e17ed1e1e68b48b4c8d927 Mon Sep 17 00:00:00 2001
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
+index 7ba0126871d..53e1ec72f09 100644
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
+2.29.2
+
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 246748131e..6f1a883de7 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -54,6 +54,7 @@ config BR2_PACKAGE_GDB_DEBUGGER
 	depends on BR2_USE_WCHAR
 	depends on !BR2_sh
 	depends on !BR2_csky
+	select BR2_PACKAGE_GMP if BR2_GDB_VERSION_11
 	select BR2_PACKAGE_NCURSES
 
 comment "full gdb on target needs a toolchain w/ wchar"
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 142bf1458a..2f9790f6e1 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -80,6 +80,9 @@ config BR2_GDB_VERSION_9_2
 config BR2_GDB_VERSION_10
 	bool "gdb 10.x"
 
+config BR2_GDB_VERSION_11
+	bool "gdb 11.x"
+
 endchoice
 
 endif
@@ -92,6 +95,7 @@ config BR2_GDB_VERSION
 	default "8.3.1"    if BR2_GDB_VERSION_8_3
 	default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB && !BR2_riscv)
 	default "10.2"	   if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB && BR2_riscv)
+	default "11.1"     if BR2_GDB_VERSION_11
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 
 # recent gdb versions (>= 10) have gdbserver moved at the top-level,
@@ -100,5 +104,6 @@ config BR2_PACKAGE_GDB_TOPLEVEL
 	bool
 	default y if BR2_arc
 	default y if BR2_GDB_VERSION_10
+	default y if BR2_GDB_VERSION_11
 	default y if !BR2_PACKAGE_HOST_GDB && BR2_riscv
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index c45ee7329f..e3b867b042 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,7 @@
 sha512  9053a2dc6b9eb921907afbc4cecc75d635aa76df5e8c4f0e5824ccf57cb206b299c19b127fff000b65c334826ff8304a54ff6098428365a8e997cca886c39e9a  gdb-8.3.1.tar.xz
 sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
 sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
+sha512  c40bf970e2f7c2107b29c5aa6a7150daa709d75ddadb73ac20742419d4637d158e3063a4c6ff6e47fae8ca8e1d36253973f85ea15445d004be6d5d7a2dd9bd46  gdb-11.1.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 4ead75289e..15515d6d33 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -71,6 +71,20 @@ GDB_DEPENDENCIES += host-flex host-bison
 HOST_GDB_DEPENDENCIES += host-flex host-bison
 endif
 
+# When BR2_GDB_VERSION_11=y, we're going to build gdb 11.x for the
+# host (if enabled), so we add the necessary gmp dependency.
+ifeq ($(BR2_GDB_VERSION_11),y)
+HOST_GDB_DEPENDENCIES += host-gmp
+endif
+
+# When BR2_GDB_VERSION_11=y (because it's enabled for the host) and
+# we're building the full gdb for the target, we need gmp as a
+# dependency. For now the default gdb version in Buildroot doesn't
+# require gmp.
+ifeq ($(BR2_GDB_VERSION_11)$(BR2_PACKAGE_GDB_DEBUGGER),yy)
+GDB_DEPENDENCIES += gmp
+endif
+
 # When gdb sources are fetched from the binutils-gdb repository, they
 # also contain the binutils sources, but binutils shouldn't be built,
 # so we disable it (additionally the option --disable-install-libbfd

--===============8050033369398201418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8050033369398201418==--
