Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D67AC38150
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 19:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2DA061059;
	Fri,  5 Jul 2024 19:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PI2RBEiCvIKF; Fri,  5 Jul 2024 19:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F715610CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F715610CD;
	Fri,  5 Jul 2024 19:31:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63E921BF98E
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F68784941
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcysDV0Vzic6 for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6361984940
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6361984940
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50B0C83C19; Fri,  5 Jul 2024 19:30:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jul 2024 21:27:56 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 18a7440bb86e9a34641899523e9754d084419666
X-Git-Newrev: b54a3e5a3d4ad3e248f97625c9018e44e641c1f6
X-Patchwork-Hint: ignore
Message-Id: <20240705193056.50B0C83C19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/glibc: security
 bump to 2.39-74 for post-2.39 security fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b54a3e5a3d4ad3e248f97625c9018e44e641c1f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fixes the following security issues:

  GLIBC-SA-2024-0004:
    ISO-2022-CN-EXT: fix out-of-bound writes when writing escape
    sequence (CVE-2024-2961)

  GLIBC-SA-2024-0005:
    nscd: Stack-based buffer overflow in netgroup cache (CVE-2024-33599)

  GLIBC-SA-2024-0006:
    nscd: Null pointer crash after notfound response (CVE-2024-33600)

  GLIBC-SA-2024-0007:
    nscd: netgroup cache may terminate daemon on memory allocation
    failure (CVE-2024-33601)

  GLIBC-SA-2024-0008:
    nscd: netgroup cache assumes NSS callback uses in-buffer strings
    (CVE-2024-33602)

In addition, the following bugs are fixed:

  [19622] network: Support aliasing with struct sockaddr
  [30701] time: getutxent misbehaves on 32-bit x86 when _TIME_BITS=64
  [30994] REP MOVSB performance suffers from page aliasing on Zen 4
  [31339] libc: arm32 loader crash after cleanup in 2.36
  [31325] mips: clone3 is wrong for o32
  [31335] math: Compile glibc with -march=x86-64-v3 should disable FMA4
    multi-arch version
  [31402] libc: clone (NULL, NULL, ...) clobbers %r7 register on
    s390{,x}
  [31479] libc: Missing #include <sys/rseq.h> in sched_getcpu.c may
    result in a loss of rseq acceleration
  [31316] build: Fails test misc/tst-dirname "Didn't expect signal from
    child: got `Illegal instruction'" on non SSE CPUs
  [31371] x86-64: APX and Tile registers aren't preserved in ld.so
    trampoline
  [31372] dynamic-link: _dl_tlsdesc_dynamic doesn't preserve all caller-
    saved registers
  [31429] build: Glibc failed to build with -march=x86-64-v3
  [31501] dynamic-link: _dl_tlsdesc_dynamic_xsavec may clobber %rbx
  [31640] dynamic-link: POWER10 ld.so crashes in
    elf_machine_load_address with GCC 14
  [31676] Configuring with CC="gcc -march=x86-64-v3"
    --with-rtld-early-cflags=-march=x86-64 results in linker failure
  [31677] nscd: nscd: netgroup cache: invalid memcpy under low
    memory/storage conditions
  [31678] nscd: nscd: Null pointer dereferences after failed netgroup
    cache insertion
  [31679] nscd: nscd: netgroup cache may terminate daemon on memory
    allocation failure
  [31680] nscd: nscd: netgroup cache assumes NSS callback uses in-buffer
    strings
  [31686] dynamic-link: Stack-based buffer overflow in
    parse_tunables_string
  [31719] dynamic-link: --enable-hardcoded-path-in-tests doesn't work
    with -Wl,--enable-new-dtags
  [31782] Test build failure with recent GCC trunk
    (x86/tst-cpu-features-supports.c:69:3: error: parameter to builtin
    not valid: avx5124fmaps)
  [31798] pidfd_getpid.c is miscompiled by GCC 6.4
  [31867] build: "CPU ISA level is lower than required" on SSE2-free
    CPUs
  [31883] build: ISA level support configure check relies on bashism /
    is otherwise broken for arithmetic

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7bfea9372f1842279a8f57b5fc4428bbae822e91)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 14 +++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 94b7819a30..aaf7848a7c 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  2ba018b344e0e8330dcadd6130f4174f0fc2502b2e032210345e0e5a2f7ed12e  glibc-2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e.tar.gz
+sha256  2858e8e47c4c0df32b526c56d5590ec939e8178201ee9526bb070999ce4aa1f2  glibc-2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 8bc4cd4666..db6fa55819 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e
+GLIBC_VERSION = 2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -24,6 +24,18 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
+# Fixed by glibc-2.39-31-g31da30f23cddd36db29d5b6a1c7619361b271fb4
+GLIBC_IGNORE_CVES += CVE-2024-2961
+
+# Fixed by glibc-2.39-35-g1263d583d2e28afb8be53f8d6922f0842036f35d
+GLIBC_IGNORE_CVES += CVE-2024-33599
+
+# Fixed by glibc-2.39-37-gc99f886de54446cd4447db6b44be93dabbdc2f8b
+GLIBC_IGNORE_CVES += CVE-2024-33600
+
+# Fixed by glibc-2.39-38-ga9a8d3eebb145779a18d90e3966009a1daa63cd
+GLIBC_IGNORE_CVES += CVE-2024-33601 CVE-2024-33602
+
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index f304ba8021..6940900f8d 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.39-5-ge0910f1d3278f05439fb434ee528fc9be1b6bd5e
+LOCALEDEF_VERSION = 2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
