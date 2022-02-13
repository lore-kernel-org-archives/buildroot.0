Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724B2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B1C81551;
	Sun, 13 Feb 2022 22:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMPGWqD1BjWV; Sun, 13 Feb 2022 22:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C6CC815AB;
	Sun, 13 Feb 2022 22:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D88D1BF475
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 624A940323
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:01:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHIw3kjYGsz7 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:01:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB7C4402FB
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:01:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6625E1BF20A;
 Sun, 13 Feb 2022 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644789677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aC6jhyCkBHmbSQW5q4HjpJtv/t1Ns3cUA8G8QBdchjg=;
 b=Gwt+Zng1Un8FG9+NIdYrTZvGcgjQwlXCu1tf+J/dg/c+OJwd0BzOOv8tMcSdTqAUDc5H7n
 F+eXKC4F+E+VaG3cn3pZedLOmnwh6NKpcg4u3txhE0+w1hH7IZlxbOg2euN+4cLxWba9gk
 oM0Og+YNtzVM9x+psFhykxIOWWIlQsuyHQse73bYRgtNXAGbSlxZJK3qP87hIrKWHnKFXd
 phnbrFJ1ghdlhJhM9kYRWPZnXRDsI9SxxWn2b3EQZ3vvslrJ5pIZCa0vjGEyjfJa+GhRY8
 92u3dwyKiLd9TOLmja9VB20HQz3yNGlLfTBTkvIOae7rzzR2/5XGpcwZX1Nniw==
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:01:15 +0100
Message-Id: <20220213220116.144141-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gdb: bump 11.x version to 11.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a minor corrective release over GDB 11.1, fixing the following issues:

  PR sim/28302 (gdb fails to build with glibc 2.34)
  PR build/28318 (std::thread support configure check does not use
  CXX_DIALECT)
  PR gdb/28405 (arm-none-eabi: internal-error: ptid_t
  remote_target::select_thread_for_ambiguous_stop_reply(const
  target_waitstatus*): Assertion `first_resumed_thread != nullptr'
  failed)
  PR tui/28483 ([gdb/tui] breakpoint creation not displayed)
  PR build/28555 (uclibc compile failure since commit 4655f8509fd44e6efabefa373650d9982ff37fd6)
  PR rust/28637 (Rust characters will be encoded using DW_ATE_UTF)
  PR gdb/28758 (GDB 11 doesn't work correctly on binaries with a SHT_RELR (.relr.dyn) section)
  PR gdb/28785 (Support SHT_RELR (.relr.dyn) section)

Drop patch 0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch, which was
merged upstream as commit 17d6f2152b583cdc7defafa7813b727a304bac5b.

Drop patch 0008-Fix-build-on-rhES5.patch, which was merged upstream as
commit df9ebc472a162306dee8ba6e02b99963c2babb7c?

Drop patch 0009-gdbserver-aarch64-support.patch, which was merged
upstream as commit eb79b2318066cafb75ffdce310e3bbd44f7c79e3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sim-filter-out-SIGSTKSZ-PR-sim-28302.patch | 110 ------
 .../gdb/11.1/0008-Fix-build-on-rhES5.patch    | 194 -----------
 .../11.1/0010-gdbserver-aarch64-support.patch | 320 ------------------
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |   0
 ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |   0
 .../0003-use-asm-sgidefs.h.patch              |   0
 .../0004-gdbserver-fix-build-for-m68k.patch   |   0
 ...fork-inferior-include-linux-ptrace.h.patch |   0
 ...etrandom-compile-for-uclibc-v1.0.35.patch} |   0
 .../0007-fix-musl-build-on-riscv.patch        |   0
 ...gdbserver-Makefile.in-fix-NLS-build.patch} |   0
 package/gdb/Config.in.host                    |   2 +-
 package/gdb/gdb.hash                          |   2 +-
 13 files changed, 2 insertions(+), 626 deletions(-)
 delete mode 100644 package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch
 delete mode 100644 package/gdb/11.1/0008-Fix-build-on-rhES5.patch
 delete mode 100644 package/gdb/11.1/0010-gdbserver-aarch64-support.patch
 rename package/gdb/{11.1 => 11.2}/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch (100%)
 rename package/gdb/{11.1 => 11.2}/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch (100%)
 rename package/gdb/{11.1 => 11.2}/0003-use-asm-sgidefs.h.patch (100%)
 rename package/gdb/{11.1 => 11.2}/0004-gdbserver-fix-build-for-m68k.patch (100%)
 rename package/gdb/{11.1 => 11.2}/0005-nat-fork-inferior-include-linux-ptrace.h.patch (100%)
 rename package/gdb/{11.1/0007-Fix-getrandom-compile-for-uclibc-v1.0.35.patch => 11.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch} (100%)
 rename package/gdb/{11.1 => 11.2}/0007-fix-musl-build-on-riscv.patch (100%)
 rename package/gdb/{11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch => 11.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch} (100%)

diff --git a/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch b/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch
deleted file mode 100644
index d969d98831..0000000000
--- a/package/gdb/11.1/0006-sim-filter-out-SIGSTKSZ-PR-sim-28302.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 7b3df9b8938357c2b0dcf2624e599a76fc4edc02 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Sun, 3 Oct 2021 12:02:53 -0400
-Subject: [PATCH] sim: filter out SIGSTKSZ [PR sim/28302]
-
-We map target signals to host signals so we can propagate signals
-between the host & simulated worlds.  That means we need to know
-the symbolic names & values of all signals that might be sent.
-
-The tools that generate that list use signal.h and include all
-symbols that start with "SIG" so as to automatically include any
-new symbols that the C library might add.  Unfortunately, this
-also picks up "SIGSTKSZ" which is not actually a signal itself,
-but a signal related setting -- it's the size of the stack when
-a signal is handled.
-
-By itself this doesn't super matter as we will never see a signal
-with that same value (since the range of valid signals tend to be
-way less than 1024, and the size of the default signal stack will
-never be that small).  But with recent glibc changes that make this
-into a dynamic value instead of a compile-time constant, some users
-see build failures when building the sim.
-
-As suggested by Adam Sampson, update our scripts to ignore this
-symbol to simplify everything and avoid the build failure.
-
-Bug: https://sourceware.org/PR28302
-
-[Upstream: https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=39d53d04357606a15efd400147fa7369d71baf2c]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- sim/bfin/linux-targ-map.h | 5 +----
- sim/common/gennltvals.py  | 6 ++++--
- sim/common/nltvals.def    | 1 -
- 3 files changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/sim/bfin/linux-targ-map.h b/sim/bfin/linux-targ-map.h
-index e9c8c8f..0340ed5 100644
---- a/sim/bfin/linux-targ-map.h
-+++ b/sim/bfin/linux-targ-map.h
-@@ -30,6 +30,7 @@ echo
- # XXX: nothing uses this ?
- echo '#include <signal.h>' | \
- bfin-uclinux-gcc -E -dD -P - | \
-+grep -v SIGSTKSZ | \
- sed -r -n \
-     -e '1istatic CB_TARGET_DEFS_MAP cb_linux_signal_map[] = {' \
-     -e '$i\ \ { 0, -1, -1 }\n};' \
-@@ -1987,10 +1988,6 @@ static CB_TARGET_DEFS_MAP cb_linux_signal_map[] =
- #ifdef SIG_SETMASK
- # define TARGET_LINUX_SIG_SETMASK 2
-   { "SIG_SETMASK", SIG_SETMASK, TARGET_LINUX_SIG_SETMASK },
--#endif
--#ifdef SIGSTKSZ
--# define TARGET_LINUX_SIGSTKSZ 8192
--  { "SIGSTKSZ", SIGSTKSZ, TARGET_LINUX_SIGSTKSZ },
- #endif
-   { 0, -1, -1 }
- };
-diff --git a/sim/common/gennltvals.py b/sim/common/gennltvals.py
-index b3e558d..bd4d7e9 100755
---- a/sim/common/gennltvals.py
-+++ b/sim/common/gennltvals.py
-@@ -67,6 +67,7 @@ FILE_HEADER = f"""\
- def gentvals(output: TextIO, cpp: str, srctype: str, srcdir: Path,
-              headers: Iterable[str],
-              pattern: str,
-+             filter: str = r'^$',
-              target: str = None):
-     """Extract constants from the specified files using a regular expression.
- 
-@@ -94,12 +95,13 @@ def gentvals(output: TextIO, cpp: str, srctype: str, srcdir: Path,
-     srcfile = ''.join(f'#include <{x}>\n' for x in headers)
-     syms = set()
-     define_pattern = re.compile(r'^#\s*define\s+(' + pattern + ')')
-+    filter_pattern = re.compile(filter)
-     for header in headers:
-         with open(srcdir / header, 'r', encoding='utf-8') as fp:
-             data = fp.read()
-         for line in data.splitlines():
-             m = define_pattern.match(line)
--            if m:
-+            if m and not filter_pattern.search(line):
-                 syms.add(m.group(1))
-     for sym in sorted(syms):
-         srcfile += f'#ifdef {sym}\nDEFVAL {{ "{sym}", {sym} }},\n#endif\n'
-@@ -129,7 +131,7 @@ def gen_common(output: TextIO, newlib: Path, cpp: str):
-              ('errno.h', 'sys/errno.h'), 'E[A-Z0-9]*')
- 
-     gentvals(output, cpp, 'signal', newlib / 'newlib/libc/include',
--             ('signal.h', 'sys/signal.h'), r'SIG[A-Z0-9]*')
-+             ('signal.h', 'sys/signal.h'), r'SIG[A-Z0-9]*', filter=r'SIGSTKSZ')
- 
-     gentvals(output, cpp, 'open', newlib / 'newlib/libc/include',
-              ('fcntl.h', 'sys/fcntl.h', 'sys/_default_fcntl.h'), r'O_[A-Z0-9]*')
-diff --git a/sim/common/nltvals.def b/sim/common/nltvals.def
-index 8ae8839..8bc6ae5 100644
---- a/sim/common/nltvals.def
-+++ b/sim/common/nltvals.def
-@@ -116,7 +116,6 @@
-  { "SIGPROF", 27 },
-  { "SIGQUIT", 3 },
-  { "SIGSEGV", 11 },
-- { "SIGSTKSZ", 8192 },
-  { "SIGSTOP", 17 },
-  { "SIGSYS", 12 },
-  { "SIGTERM", 15 },
--- 
-2.33.1
-
diff --git a/package/gdb/11.1/0008-Fix-build-on-rhES5.patch b/package/gdb/11.1/0008-Fix-build-on-rhES5.patch
deleted file mode 100644
index 2d4e30ffe1..0000000000
--- a/package/gdb/11.1/0008-Fix-build-on-rhES5.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From db3aaeda1d6b156100d969edb8c0e674bca6b201 Mon Sep 17 00:00:00 2001
-From: Tom Tromey <tromey@adacore.com>
-Date: Wed, 12 May 2021 12:39:22 -0600
-Subject: [PATCH] Fix build on rhES5
-
-The rhES5 build failed due to an upstream import a while back.  The
-bug here is that, while the 'personality' function exists,
-ADDR_NO_RANDOMIZE is only defined in <linux/personality.h>, not
-<sys/personality.h>.
-
-However, <linux/personality.h> does not declare the 'personality'
-function, and <sys/personality.h> and <linux/personality.h> cannot
-both be included.
-
-This patch restores one of the removed configure checks and updates
-the code to check it.
-
-We had this as a local patch at AdaCore, because it seemed like there
-was no interest upstream.  However, now it turns out that this fixes
-PR build/28555, so I'm sending it now.
-
-[Upstream: https://sourceware.org/git?p=binutils-gdb.git;h=0b03c6f03d51f441d999e0cee92f81af543d9373]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- gdb/config.in               |  4 ++++
- gdb/configure               | 16 ++++++++++++++++
- gdb/nat/linux-personality.c |  4 ++++
- gdbserver/config.in         |  4 ++++
- gdbserver/configure         | 16 ++++++++++++++++
- gdbsupport/common.m4        |  5 +++++
- gdbsupport/config.in        |  4 ++++
- gdbsupport/configure        | 16 ++++++++++++++++
- 8 files changed, 69 insertions(+)
-
-diff --git a/gdb/config.in b/gdb/config.in
-index 2c30504..776bee9 100644
---- a/gdb/config.in
-+++ b/gdb/config.in
-@@ -96,6 +96,10 @@
- /* define if the compiler supports basic C++11 syntax */
- #undef HAVE_CXX11
- 
-+/* Define to 1 if you have the declaration of `ADDR_NO_RANDOMIZE', and to 0 if
-+   you don't. */
-+#undef HAVE_DECL_ADDR_NO_RANDOMIZE
-+
- /* Define to 1 if you have the declaration of `asprintf', and to 0 if you
-    don't. */
- #undef HAVE_DECL_ASPRINTF
-diff --git a/gdb/configure b/gdb/configure
-index 5d89635..27e3194 100755
---- a/gdb/configure
-+++ b/gdb/configure
-@@ -13838,6 +13838,22 @@ fi
- done
- 
- 
-+  # This is needed for RHEL 5 and uclibc-ng < 1.0.39.
-+  # These did not define ADDR_NO_RANDOMIZE in sys/personality.h,
-+  # only in linux/personality.h.
-+  ac_fn_c_check_decl "$LINENO" "ADDR_NO_RANDOMIZE" "ac_cv_have_decl_ADDR_NO_RANDOMIZE" "#include <sys/personality.h>
-+"
-+if test "x$ac_cv_have_decl_ADDR_NO_RANDOMIZE" = xyes; then :
-+  ac_have_decl=1
-+else
-+  ac_have_decl=0
-+fi
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_DECL_ADDR_NO_RANDOMIZE $ac_have_decl
-+_ACEOF
-+
-+
-   ac_fn_c_check_decl "$LINENO" "strstr" "ac_cv_have_decl_strstr" "$ac_includes_default"
- if test "x$ac_cv_have_decl_strstr" = xyes; then :
-   ac_have_decl=1
-diff --git a/gdb/nat/linux-personality.c b/gdb/nat/linux-personality.c
-index 9ce345b..27999fd 100644
---- a/gdb/nat/linux-personality.c
-+++ b/gdb/nat/linux-personality.c
-@@ -22,6 +22,10 @@
- 
- #include <sys/personality.h>
- 
-+# if !HAVE_DECL_ADDR_NO_RANDOMIZE
-+#  define ADDR_NO_RANDOMIZE 0x0040000
-+# endif /* ! HAVE_DECL_ADDR_NO_RANDOMIZE */
-+
- /* See comment on nat/linux-personality.h.  */
- 
- maybe_disable_address_space_randomization::
-diff --git a/gdbserver/config.in b/gdbserver/config.in
-index cf06c56..c9258b3 100644
---- a/gdbserver/config.in
-+++ b/gdbserver/config.in
-@@ -31,6 +31,10 @@
- /* define if the compiler supports basic C++11 syntax */
- #undef HAVE_CXX11
- 
-+/* Define to 1 if you have the declaration of `ADDR_NO_RANDOMIZE', and to 0 if
-+   you don't. */
-+#undef HAVE_DECL_ADDR_NO_RANDOMIZE
-+
- /* Define to 1 if you have the declaration of `asprintf', and to 0 if you
-    don't. */
- #undef HAVE_DECL_ASPRINTF
-diff --git a/gdbserver/configure b/gdbserver/configure
-index b227167..d399d71 100755
---- a/gdbserver/configure
-+++ b/gdbserver/configure
-@@ -7131,6 +7131,22 @@ fi
- done
- 
- 
-+  # This is needed for RHEL 5 and uclibc-ng < 1.0.39.
-+  # These did not define ADDR_NO_RANDOMIZE in sys/personality.h,
-+  # only in linux/personality.h.
-+  ac_fn_c_check_decl "$LINENO" "ADDR_NO_RANDOMIZE" "ac_cv_have_decl_ADDR_NO_RANDOMIZE" "#include <sys/personality.h>
-+"
-+if test "x$ac_cv_have_decl_ADDR_NO_RANDOMIZE" = xyes; then :
-+  ac_have_decl=1
-+else
-+  ac_have_decl=0
-+fi
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_DECL_ADDR_NO_RANDOMIZE $ac_have_decl
-+_ACEOF
-+
-+
-   ac_fn_c_check_decl "$LINENO" "strstr" "ac_cv_have_decl_strstr" "$ac_includes_default"
- if test "x$ac_cv_have_decl_strstr" = xyes; then :
-   ac_have_decl=1
-diff --git a/gdbsupport/common.m4 b/gdbsupport/common.m4
-index 901c454..56a355e 100644
---- a/gdbsupport/common.m4
-+++ b/gdbsupport/common.m4
-@@ -55,6 +55,11 @@ AC_DEFUN([GDB_AC_COMMON], [
- 		  ptrace64 sbrk setns sigaltstack sigprocmask \
- 		  setpgid setpgrp getrusage getauxval sigtimedwait])
- 
-+  # This is needed for RHEL 5 and uclibc-ng < 1.0.39.
-+  # These did not define ADDR_NO_RANDOMIZE in sys/personality.h,
-+  # only in linux/personality.h.
-+  AC_CHECK_DECLS([ADDR_NO_RANDOMIZE],,, [#include <sys/personality.h>])
-+
-   AC_CHECK_DECLS([strstr])
- 
-   # ----------------------- #
-diff --git a/gdbsupport/config.in b/gdbsupport/config.in
-index f46e261..6945a62 100644
---- a/gdbsupport/config.in
-+++ b/gdbsupport/config.in
-@@ -28,6 +28,10 @@
- /* define if the compiler supports basic C++11 syntax */
- #undef HAVE_CXX11
- 
-+/* Define to 1 if you have the declaration of `ADDR_NO_RANDOMIZE', and to 0 if
-+   you don't. */
-+#undef HAVE_DECL_ADDR_NO_RANDOMIZE
-+
- /* Define to 1 if you have the declaration of `asprintf', and to 0 if you
-    don't. */
- #undef HAVE_DECL_ASPRINTF
-diff --git a/gdbsupport/configure b/gdbsupport/configure
-index a9dd02c..243a03f 100755
---- a/gdbsupport/configure
-+++ b/gdbsupport/configure
-@@ -8144,6 +8144,22 @@ fi
- done
- 
- 
-+  # This is needed for RHEL 5 and uclibc-ng < 1.0.39.
-+  # These did not define ADDR_NO_RANDOMIZE in sys/personality.h,
-+  # only in linux/personality.h.
-+  ac_fn_c_check_decl "$LINENO" "ADDR_NO_RANDOMIZE" "ac_cv_have_decl_ADDR_NO_RANDOMIZE" "#include <sys/personality.h>
-+"
-+if test "x$ac_cv_have_decl_ADDR_NO_RANDOMIZE" = xyes; then :
-+  ac_have_decl=1
-+else
-+  ac_have_decl=0
-+fi
-+
-+cat >>confdefs.h <<_ACEOF
-+#define HAVE_DECL_ADDR_NO_RANDOMIZE $ac_have_decl
-+_ACEOF
-+
-+
-   ac_fn_c_check_decl "$LINENO" "strstr" "ac_cv_have_decl_strstr" "$ac_includes_default"
- if test "x$ac_cv_have_decl_strstr" = xyes; then :
-   ac_have_decl=1
--- 
-2.33.1
-
diff --git a/package/gdb/11.1/0010-gdbserver-aarch64-support.patch b/package/gdb/11.1/0010-gdbserver-aarch64-support.patch
deleted file mode 100644
index 3718b1b6fd..0000000000
--- a/package/gdb/11.1/0010-gdbserver-aarch64-support.patch
+++ /dev/null
@@ -1,320 +0,0 @@
-From eb79b2318066cafb75ffdce310e3bbd44f7c79e3 Mon Sep 17 00:00:00 2001
-From: Luis Machado <luis.machado@linaro.org>
-Date: Fri, 29 Oct 2021 14:54:36 -0300
-Subject: [PATCH] [AArch64] Make gdbserver register set selection dynamic
-
-The current register set selection mechanism for AArch64 is static, based
-on a pre-populated array of register sets.
-
-This means that we might potentially probe register sets that are not
-available. This is OK if the kernel errors out during ptrace, but probing the
-tag_ctl register, for example, does not result in a ptrace error if the kernel
-supports the tagged address ABI but not MTE (PR 28355).
-
-Making the register set selection dynamic, based on feature checks, solves
-this and simplifies the code a bit. It allows us to list all of the register
-sets only once, and pick and choose based on HWCAP/HWCAP2 or other properties.
-
-gdb/ChangeLog:
-
-2021-11-03  Luis Machado  <luis.machado@linaro.org>
-
-	PR gdb/28355
-
-	* arch/aarch64.h (struct aarch64_features): New struct.
-
-gdbserver/ChangeLog:
-
-2021-11-03  Luis Machado  <luis.machado@linaro.org>
-
-	PR gdb/28355
-
-	* linux-aarch64-low.cc (is_sve_tdesc): Remove.
-	(aarch64_target::low_arch_setup): Rework to adjust the register sets.
-	(aarch64_regsets): Update to list all register sets.
-	(aarch64_regsets_info, regs_info_aarch64): Replace NULL with nullptr.
-	(aarch64_sve_regsets, aarch64_sve_regsets_info)
-	(regs_info_aarch64_sve): Remove.
-	(aarch64_adjust_register_sets): New.
-	(aarch64_target::get_regs_info): Remove references to removed structs.
-	(initialize_low_arch): Likewise.
-
-Backported from: eb79b2318066cafb75ffdce310e3bbd44f7c79e3
-Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
----
- gdb/arch/aarch64.h             |   9 ++
- gdbserver/linux-aarch64-low.cc | 186 ++++++++++++++++++---------------
- 4 files changed, 130 insertions(+), 85 deletions(-)
-
-diff --git a/gdb/arch/aarch64.h b/gdb/arch/aarch64.h
-index 0eb702c5b5e..95edb664b55 100644
---- a/gdb/arch/aarch64.h
-+++ b/gdb/arch/aarch64.h
-@@ -22,6 +22,15 @@
- 
- #include "gdbsupport/tdesc.h"
- 
-+/* Holds information on what architectural features are available.  This is
-+   used to select register sets.  */
-+struct aarch64_features
-+{
-+  bool sve = false;
-+  bool pauth = false;
-+  bool mte = false;
-+};
-+
- /* Create the aarch64 target description.  A non zero VQ value indicates both
-    the presence of SVE and the Vector Quotient - the number of 128bit chunks in
-    an SVE Z register.  HAS_PAUTH_P indicates the presence of the PAUTH
-diff --git a/gdbserver/linux-aarch64-low.cc b/gdbserver/linux-aarch64-low.cc
-index daccfef746e..9a8cb4169a7 100644
---- a/gdbserver/linux-aarch64-low.cc
-+++ b/gdbserver/linux-aarch64-low.cc
-@@ -196,16 +196,6 @@ is_64bit_tdesc (void)
-   return register_size (regcache->tdesc, 0) == 8;
- }
- 
--/* Return true if the regcache contains the number of SVE registers.  */
--
--static bool
--is_sve_tdesc (void)
--{
--  struct regcache *regcache = get_thread_regcache (current_thread, 0);
--
--  return tdesc_contains_feature (regcache->tdesc, "org.gnu.gdb.aarch64.sve");
--}
--
- static void
- aarch64_fill_gregset (struct regcache *regcache, void *buf)
- {
-@@ -680,40 +670,6 @@ aarch64_target::low_new_fork (process_info *parent,
-   *child->priv->arch_private = *parent->priv->arch_private;
- }
- 
--/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwcap.h.  */
--#define AARCH64_HWCAP_PACA (1 << 30)
--
--/* Implementation of linux target ops method "low_arch_setup".  */
--
--void
--aarch64_target::low_arch_setup ()
--{
--  unsigned int machine;
--  int is_elf64;
--  int tid;
--
--  tid = lwpid_of (current_thread);
--
--  is_elf64 = linux_pid_exe_is_elf_64_file (tid, &machine);
--
--  if (is_elf64)
--    {
--      uint64_t vq = aarch64_sve_get_vq (tid);
--      unsigned long hwcap = linux_get_hwcap (8);
--      unsigned long hwcap2 = linux_get_hwcap2 (8);
--      bool pauth_p = hwcap & AARCH64_HWCAP_PACA;
--      /* MTE is AArch64-only.  */
--      bool mte_p = hwcap2 & HWCAP2_MTE;
--
--      current_process ()->tdesc
--	= aarch64_linux_read_description (vq, pauth_p, mte_p);
--    }
--  else
--    current_process ()->tdesc = aarch32_linux_read_description ();
--
--  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
--}
--
- /* Wrapper for aarch64_sve_regs_copy_to_reg_buf.  */
- 
- static void
-@@ -730,21 +686,36 @@ aarch64_sve_regs_copy_from_regcache (struct regcache *regcache, void *buf)
-   return aarch64_sve_regs_copy_from_reg_buf (regcache, buf);
- }
- 
-+/* Array containing all the possible register sets for AArch64/Linux.  During
-+   architecture setup, these will be checked against the HWCAP/HWCAP2 bits for
-+   validity and enabled/disabled accordingly.
-+
-+   Their sizes are set to 0 here, but they will be adjusted later depending
-+   on whether each register set is available or not.  */
- static struct regset_info aarch64_regsets[] =
- {
-+  /* GPR registers.  */
-   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
--    sizeof (struct user_pt_regs), GENERAL_REGS,
-+    0, GENERAL_REGS,
-     aarch64_fill_gregset, aarch64_store_gregset },
-+  /* Floating Point (FPU) registers.  */
-   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_FPREGSET,
--    sizeof (struct user_fpsimd_state), FP_REGS,
-+    0, FP_REGS,
-     aarch64_fill_fpregset, aarch64_store_fpregset
-   },
-+  /* Scalable Vector Extension (SVE) registers.  */
-+  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
-+    0, EXTENDED_REGS,
-+    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regcache
-+  },
-+  /* PAC registers.  */
-   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
--    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
--    NULL, aarch64_store_pauthregset },
-+    0, OPTIONAL_REGS,
-+    nullptr, aarch64_store_pauthregset },
-+  /* Tagged address control / MTE registers.  */
-   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
--    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
--    aarch64_store_mteregset },
-+    0, OPTIONAL_REGS,
-+    aarch64_fill_mteregset, aarch64_store_mteregset },
-   NULL_REGSET
- };
- 
-@@ -752,47 +723,95 @@ static struct regsets_info aarch64_regsets_info =
-   {
-     aarch64_regsets, /* regsets */
-     0, /* num_regsets */
--    NULL, /* disabled_regsets */
-+    nullptr, /* disabled_regsets */
-   };
- 
- static struct regs_info regs_info_aarch64 =
-   {
--    NULL, /* regset_bitmap */
--    NULL, /* usrregs */
-+    nullptr, /* regset_bitmap */
-+    nullptr, /* usrregs */
-     &aarch64_regsets_info,
-   };
- 
--static struct regset_info aarch64_sve_regsets[] =
-+/* Given FEATURES, adjust the available register sets by setting their
-+   sizes.  A size of 0 means the register set is disabled and won't be
-+   used.  */
-+
-+static void
-+aarch64_adjust_register_sets (const struct aarch64_features &features)
- {
--  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
--    sizeof (struct user_pt_regs), GENERAL_REGS,
--    aarch64_fill_gregset, aarch64_store_gregset },
--  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
--    SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE), EXTENDED_REGS,
--    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regcache
--  },
--  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
--    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
--    NULL, aarch64_store_pauthregset },
--  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
--    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
--    aarch64_store_mteregset },
--  NULL_REGSET
--};
-+  struct regset_info *regset;
- 
--static struct regsets_info aarch64_sve_regsets_info =
--  {
--    aarch64_sve_regsets, /* regsets.  */
--    0, /* num_regsets.  */
--    NULL, /* disabled_regsets.  */
--  };
-+  for (regset = aarch64_regsets; regset->size >= 0; regset++)
-+    {
-+      switch (regset->nt_type)
-+	{
-+	case NT_PRSTATUS:
-+	  /* General purpose registers are always present.  */
-+	  regset->size = sizeof (struct user_pt_regs);
-+	  break;
-+	case NT_FPREGSET:
-+	  /* This is unavailable when SVE is present.  */
-+	  if (!features.sve)
-+	    regset->size = sizeof (struct user_fpsimd_state);
-+	  break;
-+	case NT_ARM_SVE:
-+	  if (features.sve)
-+	    regset->size = SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE);
-+	  break;
-+	case NT_ARM_PAC_MASK:
-+	  if (features.pauth)
-+	    regset->size = AARCH64_PAUTH_REGS_SIZE;
-+	  break;
-+	case NT_ARM_TAGGED_ADDR_CTRL:
-+	  if (features.mte)
-+	    regset->size = AARCH64_LINUX_SIZEOF_MTE;
-+	  break;
-+	default:
-+	  gdb_assert_not_reached ("Unknown register set found.");
-+	}
-+    }
-+}
- 
--static struct regs_info regs_info_aarch64_sve =
--  {
--    NULL, /* regset_bitmap.  */
--    NULL, /* usrregs.  */
--    &aarch64_sve_regsets_info,
--  };
-+/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwcap.h.  */
-+#define AARCH64_HWCAP_PACA (1 << 30)
-+
-+/* Implementation of linux target ops method "low_arch_setup".  */
-+
-+void
-+aarch64_target::low_arch_setup ()
-+{
-+  unsigned int machine;
-+  int is_elf64;
-+  int tid;
-+
-+  tid = lwpid_of (current_thread);
-+
-+  is_elf64 = linux_pid_exe_is_elf_64_file (tid, &machine);
-+
-+  if (is_elf64)
-+    {
-+      struct aarch64_features features;
-+
-+      uint64_t vq = aarch64_sve_get_vq (tid);
-+      features.sve = (vq > 0);
-+      /* A-profile PAC is 64-bit only.  */
-+      features.pauth = linux_get_hwcap (8) & AARCH64_HWCAP_PACA;
-+      /* A-profile MTE is 64-bit only.  */
-+      features.mte = linux_get_hwcap2 (8) & HWCAP2_MTE;
-+
-+      current_process ()->tdesc
-+	= aarch64_linux_read_description (vq, features.pauth, features.mte);
-+
-+      /* Adjust the register sets we should use for this particular set of
-+	 features.  */
-+      aarch64_adjust_register_sets (features);
-+    }
-+  else
-+    current_process ()->tdesc = aarch32_linux_read_description ();
-+
-+  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
-+}
- 
- /* Implementation of linux target ops method "get_regs_info".  */
- 
-@@ -802,9 +821,7 @@ aarch64_target::get_regs_info ()
-   if (!is_64bit_tdesc ())
-     return &regs_info_aarch32;
- 
--  if (is_sve_tdesc ())
--    return &regs_info_aarch64_sve;
--
-+  /* AArch64 64-bit registers.  */
-   return &regs_info_aarch64;
- }
- 
-@@ -3294,5 +3311,4 @@ initialize_low_arch (void)
-   initialize_low_arch_aarch32 ();
- 
-   initialize_regsets_info (&aarch64_regsets_info);
--  initialize_regsets_info (&aarch64_sve_regsets_info);
- }
--- 
-2.27.0
-
diff --git a/package/gdb/11.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/11.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/11.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/11.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/11.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/11.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/11.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/11.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/11.1/0003-use-asm-sgidefs.h.patch b/package/gdb/11.2/0003-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/11.1/0003-use-asm-sgidefs.h.patch
rename to package/gdb/11.2/0003-use-asm-sgidefs.h.patch
diff --git a/package/gdb/11.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/11.2/0004-gdbserver-fix-build-for-m68k.patch
similarity index 100%
rename from package/gdb/11.1/0004-gdbserver-fix-build-for-m68k.patch
rename to package/gdb/11.2/0004-gdbserver-fix-build-for-m68k.patch
diff --git a/package/gdb/11.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/11.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
similarity index 100%
rename from package/gdb/11.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
rename to package/gdb/11.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
diff --git a/package/gdb/11.1/0007-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/11.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
similarity index 100%
rename from package/gdb/11.1/0007-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
rename to package/gdb/11.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
diff --git a/package/gdb/11.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/11.2/0007-fix-musl-build-on-riscv.patch
similarity index 100%
rename from package/gdb/11.1/0007-fix-musl-build-on-riscv.patch
rename to package/gdb/11.2/0007-fix-musl-build-on-riscv.patch
diff --git a/package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/11.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
similarity index 100%
rename from package/gdb/11.1/0009-gdbserver-Makefile.in-fix-NLS-build.patch
rename to package/gdb/11.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 56999fa9e0..d3dea0b0a7 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -71,7 +71,7 @@ config BR2_GDB_VERSION
 	default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
 	default "9.2"      if BR2_GDB_VERSION_9_2
 	default "10.2"	   if BR2_GDB_VERSION_10 || !BR2_PACKAGE_HOST_GDB
-	default "11.1"     if BR2_GDB_VERSION_11
+	default "11.2"     if BR2_GDB_VERSION_11
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
 
 # recent gdb versions (>= 10) have gdbserver moved at the top-level,
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index d3e83af0b9..e7933374f1 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/gdb/releases/sha512.sum
 sha512  73635f00f343117aa5e2436f1e1597099e2bfb31ef7bb162b273fa1ea282c3fa9b0f52762e70bfc7ad0334addb8d159e9ac7cbe5998ca4f755ea8cf90714d274  gdb-9.2.tar.xz
 sha512  3653762ac008e065c37cd641653184c9ff7ce51ee2222ade1122bec9d6cc64dffd4fb74888ef11ac1942064a08910e96b7865112ad37f4602eb0a16bed074caa  gdb-10.2.tar.xz
-sha512  c40bf970e2f7c2107b29c5aa6a7150daa709d75ddadb73ac20742419d4637d158e3063a4c6ff6e47fae8ca8e1d36253973f85ea15445d004be6d5d7a2dd9bd46  gdb-11.1.tar.xz
+sha512  07e9026423438049b11f4f784d57401ece4e940570f613bd6958b3714fe7fbc2c048470bcce3e7d7d9f93331cdf3881d30dcc964cb113a071143a02b28e5b127  gdb-11.2.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  5a2acf2fd33ab2ff589e1037ca40abda54328997dcff26b2b49b874bd3be980be5a63342962254f3c3bda98e32ce7a33af704d37353352833dee193135600458  gdb-arc-2020.09-release-gdb.tar.gz
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
