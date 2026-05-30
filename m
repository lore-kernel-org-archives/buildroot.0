Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78DACD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E57E42F09;
	Sat, 30 May 2026 13:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apmGkA87FrAK; Sat, 30 May 2026 13:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D907442F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780149179;
	bh=OOIu/WlBGiK3gT/jUY5CMUFGKrr8LDw8Ya+fCyu/ek0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M/bgfhkN7HrOMqj/dTvz9qfVtKz4qhmAz6h2ivYFjd+RZ4dL9j1JHWE2eV2wceeZb
	 3gSVPTLzFtRe+jHpCFqMPiDueoHWeMnsHXTW04w2XDLdKLRMdJx2NM8mL08eZQTq8R
	 riTwaagES3Qe5vDs1Q0A9LznrBIEK7a3O58ArKnRjqD2n0pS+B9AVfv743Vz5jPj56
	 UwHOQ9desO/ibrXWax8r9+S7XyBvVJHE/Dh8ASgd272Xpx0BCQB2sSvPXPwe34fjfI
	 pIPTLlCPiQMaWgRLOnZz2DsjZG0K3JS/rBUBlVQBf3m6X16x8L17YMaFpFnZV8KPW0
	 LQ4cLbXEtEmeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D907442F0E;
	Sat, 30 May 2026 13:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11389F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B85B42EA2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfmgBAlv-wVO for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B770242ED0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B770242ED0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:52:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAABA8750B; Sat, 30 May 2026 13:52:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 11344cb3fc44bfebd19380525f750eb353a70a83
X-Git-Newrev: 1b290781cf3782576091dbeacdd7d1a30b051856
X-Patchwork-Hint: ignore
Message-Id: <20260530135221.BAABA8750B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gcc: add version 16.1.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b290781cf3782576091dbeacdd7d1a30b051856
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Added libatomic to HOST_GCC_INITIAL_EXCLUDES to fix linking error with
libc:

output/host/lib/gcc/x86_64-buildroot-linux-gnu/16.0.1/../../../../x86_64-buildroot-linux-gnu/bin/ld:
 cannot find -latomic_asneeded: No such file or directory

caused by upstream commit
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e63cf4b130b86dd7dde1bf499d3d40faca10ea2e
which added libatomic/ to $bootstrap_target_libs.

For details see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81358

Copied patches 0001 & 0003 from package/gcc/15.2.0/
Patch 0002 was applied upstream:
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7894c00982c570d684fe5b82d8fb3aafc34d6986

Added patch 0003 to fix build error on or1k.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 +
 ...disable-split-stack-for-non-thread-builds.patch | 26 +++++++
 ...2-gcc-config-microblaze-fix-ira-for-GCC15.patch | 56 ++++++++++++++
 ...-Allow-SImode-for-condition-flag-register.patch | 90 ++++++++++++++++++++++
 package/gcc/Config.in.host                         |  9 +++
 package/gcc/gcc-initial/gcc-initial.mk             |  2 +-
 package/gcc/gcc.hash                               |  2 +
 7 files changed, 185 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9a06d5526a..9fcb16b6ec 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -357,6 +357,7 @@ package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/15.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
diff --git a/package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..c3b600cfb8
--- /dev/null
+++ b/package/gcc/16.1.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 7d5f59e035341430e20f47420535d0e987516e55 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.50.1
+
diff --git a/package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch b/package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
new file mode 100644
index 0000000000..663aab7218
--- /dev/null
+++ b/package/gcc/16.1.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
@@ -0,0 +1,56 @@
+From d2fdbd8c4abe67eea86877dfb3b3b9d8508c165f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 6 Aug 2025 22:32:30 +0200
+Subject: [PATCH] gcc/config/microblaze: fix ira for GCC15
+
+Add new hooks for callee-save on microblaze defined by [1] and
+return 1 to restore the old behavior prior to the commit [3].
+
+Tested with qemu_microblazeel_mmu_defconfig and used to generate
+Microblaze toolchains for the Bootlin toolchains 2025.08-1 [4][5].
+
+Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b191e8bdecf881d11c1544c441e38f4c18392a15
+[2] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/i386.cc;h=3128973ba79cccfc6761f451dcb716b9558cc4da;hb=d3ff498c478acefce35de04402f99171b4f64a1a#l20606
+[3] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b
+[4] https://lore.kernel.org/buildroot/87sehzndtp.fsf@dell.be.48ers.dk/T/#mce7decd0b3f6a41008d5de577538a8525c91b374
+[5] https://toolchains.bootlin.com/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/microblaze/microblaze.cc | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 78b9428ef3b..84ea7e8d55a 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -3228,6 +3228,14 @@ microblaze_secondary_reload (bool in_p ATTRIBUTE_UNUSED, rtx x ATTRIBUTE_UNUSED,
+   return NO_REGS;
+ }
+ 
++/* Implement TARGET_CALLEE_SAVE_COST.  */
++static int
++microblaze_callee_save_cost (spill_cost_type, unsigned int hard_regno, machine_mode,
++		       unsigned int, int mem_cost, const HARD_REG_SET &, bool)
++{
++  return 1;
++}
++
+ static void
+ microblaze_globalize_label (FILE * stream, const char *name)
+ {
+@@ -4066,6 +4074,9 @@ microblaze_starting_frame_offset (void)
+ #undef TARGET_SECONDARY_RELOAD
+ #define TARGET_SECONDARY_RELOAD		microblaze_secondary_reload
+ 
++#undef TARGET_CALLEE_SAVE_COST
++#define TARGET_CALLEE_SAVE_COST microblaze_callee_save_cost
++
+ #undef  TARGET_ASM_OUTPUT_MI_THUNK
+ #define TARGET_ASM_OUTPUT_MI_THUNK      microblaze_asm_output_mi_thunk
+ 
+-- 
+2.50.1
+
diff --git a/package/gcc/16.1.0/0003-or1k-Allow-SImode-for-condition-flag-register.patch b/package/gcc/16.1.0/0003-or1k-Allow-SImode-for-condition-flag-register.patch
new file mode 100644
index 0000000000..dfb3abcb13
--- /dev/null
+++ b/package/gcc/16.1.0/0003-or1k-Allow-SImode-for-condition-flag-register.patch
@@ -0,0 +1,90 @@
+From 3f1812fd97467bbc69c53169c663a9c4d26c1550 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Mon, 4 May 2026 05:08:51 +0800
+Subject: or1k: Allow SImode for condition flag register
+
+Commit
+
+eb2ea476db2 emit-rtl: Allow extra checks for paradoxical subregs [PR119966]
+
+changed validate_subreg to return false on the paradoxical SImode subreg
+of the OpenRISC condition flag register (reg:BI sr_f), which triggered
+
+internal compiler error: in emit_move_multi_word, at expr.cc:4497
+
+c0694f95f59 or1k: Fix ICE in libgcc caused by recent validate_subreg changes
+
+changed or1k_can_change_mode_class to allow changing flags mode from BI
+to SI.  But or1k_hard_regno_mode_ok still returns false for condition
+flag register in SImode.  Update or1k_hard_regno_mode_ok to also allow
+condition flag register in SImode.
+
+Tested with or1k Linux cross compiler for or1k glibc build.
+
+gcc/
+
+	PR target/120587
+	PR target/125155
+	* config/or1k/or1k.cc (or1k_hard_regno_mode_ok): Allow condition
+	condition flag register in SImode.
+
+gcc/testsuite/
+
+	PR target/120587
+	PR target/125155
+	* gcc.target/or1k/pr125155.c: New test.
+
+Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
+(cherry picked from commit 710581c80b2fd39fa7a8674eccf7dca8cbc7c9c0)
+
+Upstream: https://gcc.gnu.org/cgit/gcc/commit/?h=releases/gcc-16&id=3f1812fd97467bbc69c53169c663a9c4d26c1550
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ gcc/config/or1k/or1k.cc                  |  7 ++++---
+ gcc/testsuite/gcc.target/or1k/pr125155.c | 14 ++++++++++++++
+ 2 files changed, 18 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/or1k/pr125155.c
+
+diff --git a/gcc/config/or1k/or1k.cc b/gcc/config/or1k/or1k.cc
+index 17240e3ee48d..66fd784f8b91 100644
+--- a/gcc/config/or1k/or1k.cc
++++ b/gcc/config/or1k/or1k.cc
+@@ -1389,10 +1389,11 @@ or1k_trampoline_init (rtx m_tramp, tree fndecl, rtx chain)
+ static bool
+ or1k_hard_regno_mode_ok (unsigned int regno, machine_mode mode)
+ {
+-  /* For OpenRISC, GENERAL_REGS can hold anything, while
+-     FLAG_REGS are really single bits within SP[SR].  */
++  /* For OpenRISC, GENERAL_REGS can hold anything, while FLAG_REGS are
++     really single bits within SP[SR].  Also allow condition flag register
++     in SImode to match or1k_can_change_mode_class.  */
+   if (REGNO_REG_CLASS (regno) == FLAG_REGS)
+-    return mode == BImode;
++    return mode == BImode || mode == SImode;
+   return true;
+ }
+ 
+diff --git a/gcc/testsuite/gcc.target/or1k/pr125155.c b/gcc/testsuite/gcc.target/or1k/pr125155.c
+new file mode 100644
+index 000000000000..8ca95475b666
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/or1k/pr125155.c
+@@ -0,0 +1,14 @@
++/* { dg-do compile } */
++/* { dg-options "-O2" } */
++
++int __pthread_keys_0_0;
++int
++___pthread_key_delete (void)
++{
++  int result = 22;
++  int __atg3_old = 0;
++  if (__atomic_compare_exchange_n (&__pthread_keys_0_0, &__atg3_old,
++				   0, 0, 2, 0))
++    result = 0;
++  return result;
++}
+-- 
+cgit 
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 21581487df..b9dd37471f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -46,6 +46,14 @@ config BR2_GCC_VERSION_15_X
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 
+config BR2_GCC_VERSION_16_X
+	bool "gcc 16.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_17
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_POWERPC_CPU_HAS_SPE
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_16
+
 endchoice
 
 config BR2_GCC_SUPPORTS_DLANG
@@ -71,6 +79,7 @@ config BR2_GCC_VERSION
 	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.3.0"    if BR2_GCC_VERSION_14_X
 	default "15.2.0"    if BR2_GCC_VERSION_15_X
+	default "16.1.0"    if BR2_GCC_VERSION_16_X
 	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1f8b76a942..18d5cef0f8 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -17,7 +17,7 @@ HOST_GCC_INITIAL_DL_SUBDIR = gcc
 
 HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
 
-HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES)
+HOST_GCC_INITIAL_EXCLUDES = $(HOST_GCC_EXCLUDES) libatomic
 
 ifneq ($(ARCH_XTENSA_OVERLAY_FILE),)
 HOST_GCC_INITIAL_POST_EXTRACT_HOOKS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index deb7c40fa3..da6aa6e879 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,6 +6,8 @@ sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9b
 sha512  cb4e3259640721bbd275c723fe4df53d12f9b1673afb3db274c22c6aa457865dccf2d6ea20b4fd4c591f6152e6d4b87516c402015900f06ce9d43af66d3b7a93  gcc-14.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum
 sha512  89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.1.0/sha512.sum
+sha512  b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  7f08ae335d9112be65e92c3744c095d8fa265994b8282274948f99fe37409531e627e6dadfb77b138a82fa09d012c56d8c075b482a5a5186814a57f9db63c29e  gcc-arc-2024.12-release.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
