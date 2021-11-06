Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3226DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:52:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7DC061027
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7DC061027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFA8340135;
	Sat,  6 Nov 2021 10:52:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fmJwbXUXk-a; Sat,  6 Nov 2021 10:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E7B740138;
	Sat,  6 Nov 2021 10:52:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 556751BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52BD282542
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kkh4FzbRRT6W for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1E55827A8
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:52:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2B8328B3F4; Sat,  6 Nov 2021 10:48:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 6 Nov 2021 11:52:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2502a6506cd31b4f48185bc2b4f633a2597a26a4
X-Git-Newrev: 80623ea83743039f8f629563c040b5e893c27fc3
X-Patchwork-Hint: ignore
Message-Id: <20211106104826.2B8328B3F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu: update defconfigs to Linux
 5.15
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
Content-Type: multipart/mixed; boundary="===============3194293479469608711=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3194293479469608711==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=80623ea83743039f8f629563c040b5e893c27fc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch:

0001-sparc64-avoid-stringop-overread-warning-to-access-Ma.patch
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=fc7c028dcdbfe981bca75d2a7b95f363eb691ef3

0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=1d7ba0165d8206ac073f7ac3b14fc0836b66eae7

0001-arch-s390-disable-SSP-when-needed.patch [3]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=42e8d652438f5ddf04e5dac299cb5e623d113dc0

Tested on gitlab:
https://gitlab.com/kubu93/buildroot/-/pipelines/402999845

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-include-hi-and-lo-in-clobber-list-for-R6.patch | 149 --------------------
 ...-include-hi-and-lo-in-clobber-list-for-R6.patch | 149 --------------------
 ...-include-hi-and-lo-in-clobber-list-for-R6.patch | 149 --------------------
 board/qemu/mips64r6el-malta/linux.config           |   8 +-
 ...-include-hi-and-lo-in-clobber-list-for-R6.patch | 149 --------------------
 .../0001-arch-s390-disable-SSP-when-needed.patch   |  47 -------
 ...id-stringop-overread-warning-to-access-Ma.patch | 154 ---------------------
 configs/qemu_aarch64_virt_defconfig                |   6 +-
 configs/qemu_arm_versatile_defconfig               |   6 +-
 configs/qemu_arm_vexpress_defconfig                |   6 +-
 configs/qemu_arm_vexpress_tz_defconfig             |   6 +-
 configs/qemu_m68k_mcf5208_defconfig                |   6 +-
 configs/qemu_m68k_q800_defconfig                   |   6 +-
 configs/qemu_microblazebe_mmu_defconfig            |   6 +-
 configs/qemu_microblazeel_mmu_defconfig            |   6 +-
 configs/qemu_mips32r2_malta_defconfig              |   6 +-
 configs/qemu_mips32r2el_malta_defconfig            |   6 +-
 configs/qemu_mips32r6_malta_defconfig              |   7 +-
 configs/qemu_mips32r6el_malta_defconfig            |   7 +-
 configs/qemu_mips64_malta_defconfig                |   6 +-
 configs/qemu_mips64el_malta_defconfig              |   6 +-
 configs/qemu_mips64r6_malta_defconfig              |   7 +-
 configs/qemu_mips64r6el_malta_defconfig            |   7 +-
 configs/qemu_nios2_10m50_defconfig                 |   6 +-
 configs/qemu_or1k_defconfig                        |   6 +-
 configs/qemu_riscv32_virt_defconfig                |   6 +-
 configs/qemu_riscv64_virt_defconfig                |   6 +-
 configs/qemu_s390x_defconfig                       |   7 +-
 configs/qemu_sh4_r2d_defconfig                     |   6 +-
 configs/qemu_sh4eb_r2d_defconfig                   |   6 +-
 configs/qemu_sparc64_sun4u_defconfig               |   9 +-
 configs/qemu_sparc_ss10_defconfig                  |   6 +-
 configs/qemu_x86_64_defconfig                      |   7 +-
 configs/qemu_x86_defconfig                         |   6 +-
 configs/qemu_xtensa_lx60_defconfig                 |   6 +-
 configs/qemu_xtensa_lx60_nommu_defconfig           |   6 +-
 36 files changed, 91 insertions(+), 897 deletions(-)

diff --git a/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
deleted file mode 100644
index 01d78f6ffe..0000000000
--- a/board/qemu/mips32r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From b9af6f34e43bf5264d75933f2080f16b8741048d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 25 Jul 2020 11:46:01 +0200
-Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-From [1]
-"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
-available to be present in the clobber list anymore, resulting in build failure
-for mips*r6 targets in form of:
-...
-.../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
-  146 |  __asm__ volatile (      \
-      |  ^~~~~~~
-
-This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
-This patch provides the alternative clobber list for r6 targets that won't include
-those registers."
-
-Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
-for mips r6 cpus with gcc 10 for the same reason as glibc.
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
-[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
- 1 file changed, 45 insertions(+)
-
-diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
-index 2203e2d0ae2a..e28096faecf6 100644
---- a/arch/mips/include/asm/vdso/gettimeofday.h
-+++ b/arch/mips/include/asm/vdso/gettimeofday.h
-@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
- 	register long nr asm("v0") = __NR_gettimeofday;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (tv), "r" (tz), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (tv), "r" (tz), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
- #endif
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
- #endif
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
- 	register long nr asm("v0") = __NR_clock_gettime;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
- 	register long nr asm("v0") = __NR_clock_getres;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
--- 
-2.17.1
-
diff --git a/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
deleted file mode 100644
index 01d78f6ffe..0000000000
--- a/board/qemu/mips32r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From b9af6f34e43bf5264d75933f2080f16b8741048d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 25 Jul 2020 11:46:01 +0200
-Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-From [1]
-"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
-available to be present in the clobber list anymore, resulting in build failure
-for mips*r6 targets in form of:
-...
-.../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
-  146 |  __asm__ volatile (      \
-      |  ^~~~~~~
-
-This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
-This patch provides the alternative clobber list for r6 targets that won't include
-those registers."
-
-Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
-for mips r6 cpus with gcc 10 for the same reason as glibc.
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
-[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
- 1 file changed, 45 insertions(+)
-
-diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
-index 2203e2d0ae2a..e28096faecf6 100644
---- a/arch/mips/include/asm/vdso/gettimeofday.h
-+++ b/arch/mips/include/asm/vdso/gettimeofday.h
-@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
- 	register long nr asm("v0") = __NR_gettimeofday;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (tv), "r" (tz), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (tv), "r" (tz), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
- #endif
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
- #endif
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
- 	register long nr asm("v0") = __NR_clock_gettime;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
- 	register long nr asm("v0") = __NR_clock_getres;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
--- 
-2.17.1
-
diff --git a/board/qemu/mips64r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips64r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
deleted file mode 100644
index 01d78f6ffe..0000000000
--- a/board/qemu/mips64r6-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From b9af6f34e43bf5264d75933f2080f16b8741048d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 25 Jul 2020 11:46:01 +0200
-Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-From [1]
-"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
-available to be present in the clobber list anymore, resulting in build failure
-for mips*r6 targets in form of:
-...
-.../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
-  146 |  __asm__ volatile (      \
-      |  ^~~~~~~
-
-This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
-This patch provides the alternative clobber list for r6 targets that won't include
-those registers."
-
-Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
-for mips r6 cpus with gcc 10 for the same reason as glibc.
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
-[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
- 1 file changed, 45 insertions(+)
-
-diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
-index 2203e2d0ae2a..e28096faecf6 100644
---- a/arch/mips/include/asm/vdso/gettimeofday.h
-+++ b/arch/mips/include/asm/vdso/gettimeofday.h
-@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
- 	register long nr asm("v0") = __NR_gettimeofday;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (tv), "r" (tz), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (tv), "r" (tz), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
- #endif
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
- #endif
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
- 	register long nr asm("v0") = __NR_clock_gettime;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
- 	register long nr asm("v0") = __NR_clock_getres;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
--- 
-2.17.1
-
diff --git a/board/qemu/mips64r6el-malta/linux.config b/board/qemu/mips64r6el-malta/linux.config
index 0ebfdbdb05..020e02f1d1 100644
--- a/board/qemu/mips64r6el-malta/linux.config
+++ b/board/qemu/mips64r6el-malta/linux.config
@@ -15,11 +15,9 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_PCNET32=y
 CONFIG_INPUT_EVDEV=y
diff --git a/board/qemu/mips64r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch b/board/qemu/mips64r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
deleted file mode 100644
index 01d78f6ffe..0000000000
--- a/board/qemu/mips64r6el-malta/patches/linux/0001-mips-Do-not-include-hi-and-lo-in-clobber-list-for-R6.patch
+++ /dev/null
@@ -1,149 +0,0 @@
-From b9af6f34e43bf5264d75933f2080f16b8741048d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 25 Jul 2020 11:46:01 +0200
-Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-From [1]
-"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
-available to be present in the clobber list anymore, resulting in build failure
-for mips*r6 targets in form of:
-...
-.../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
-  146 |  __asm__ volatile (      \
-      |  ^~~~~~~
-
-This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
-This patch provides the alternative clobber list for r6 targets that won't include
-those registers."
-
-Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
-for mips r6 cpus with gcc 10 for the same reason as glibc.
-
-[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
-[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
- 1 file changed, 45 insertions(+)
-
-diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
-index 2203e2d0ae2a..e28096faecf6 100644
---- a/arch/mips/include/asm/vdso/gettimeofday.h
-+++ b/arch/mips/include/asm/vdso/gettimeofday.h
-@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
- 	register long nr asm("v0") = __NR_gettimeofday;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (tv), "r" (tz), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (tv), "r" (tz), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
- #endif
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
- #endif
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
- 	register long nr asm("v0") = __NR_clock_gettime;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
-@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
- 	register long nr asm("v0") = __NR_clock_getres;
- 	register long error asm("a3");
- 
-+#if MIPS_ISA_REV >= 6
-+	asm volatile(
-+	"       syscall\n"
-+	: "=r" (ret), "=r" (error)
-+	: "r" (clkid), "r" (ts), "r" (nr)
-+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-+	  "$14", "$15", "$24", "$25", "memory");
-+#else
- 	asm volatile(
- 	"       syscall\n"
- 	: "=r" (ret), "=r" (error)
- 	: "r" (clkid), "r" (ts), "r" (nr)
- 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
- 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
-+#endif
- 
- 	return error ? -ret : ret;
- }
--- 
-2.17.1
-
diff --git a/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch b/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch
deleted file mode 100644
index c8199d4fd6..0000000000
--- a/board/qemu/s390x/patches/linux/0001-arch-s390-disable-SSP-when-needed.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 8a054081678ed0b0e56f829bac0a4656e3a198b9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 8 May 2021 22:03:11 +0200
-Subject: [PATCH] arch/s390: disable SSP when needed
-
-Though -nostdlib is passed in PURGATORY_LDFLAGS and -ffreestanding in
-KBUILD_CFLAGS_DECOMPRESSOR, -fno-stack-protector must also be passed to
-avoid linking errors related to undefined references to
-'__stack_chk_guard' and '__stack_chk_fail' if toolchain enforces
--fstack-protector.
-
-Fixes:
- - https://gitlab.com/kubu93/buildroot/-/jobs/1247043361
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- arch/s390/Makefile           | 1 +
- arch/s390/purgatory/Makefile | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/arch/s390/Makefile b/arch/s390/Makefile
-index e443ed9947bd..098abe3a56f3 100644
---- a/arch/s390/Makefile
-+++ b/arch/s390/Makefile
-@@ -28,6 +28,7 @@ KBUILD_CFLAGS_DECOMPRESSOR += -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY
- KBUILD_CFLAGS_DECOMPRESSOR += -fno-delete-null-pointer-checks -msoft-float -mbackchain
- KBUILD_CFLAGS_DECOMPRESSOR += -fno-asynchronous-unwind-tables
- KBUILD_CFLAGS_DECOMPRESSOR += -ffreestanding
-+KBUILD_CFLAGS_DECOMPRESSOR += -fno-stack-protector
- KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-disable-warning, address-of-packed-member)
- KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),-g)
- KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO_DWARF4), $(call cc-option, -gdwarf-4,))
-diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
-index c57f8c40e992..21c4ebe29b9a 100644
---- a/arch/s390/purgatory/Makefile
-+++ b/arch/s390/purgatory/Makefile
-@@ -24,6 +24,7 @@ KBUILD_CFLAGS := -fno-strict-aliasing -Wall -Wstrict-prototypes
- KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
- KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
- KBUILD_CFLAGS += -c -MD -Os -m64 -msoft-float -fno-common
-+KBUILD_CFLAGS += -fno-stack-protector
- KBUILD_CFLAGS += $(CLANG_FLAGS)
- KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
- KBUILD_AFLAGS := $(filter-out -DCC_USING_EXPOLINE,$(KBUILD_AFLAGS))
--- 
-2.30.2
-
diff --git a/board/qemu/sparc64-sun4u/patches/linux/0001-sparc64-avoid-stringop-overread-warning-to-access-Ma.patch b/board/qemu/sparc64-sun4u/patches/linux/0001-sparc64-avoid-stringop-overread-warning-to-access-Ma.patch
deleted file mode 100644
index c02704696d..0000000000
--- a/board/qemu/sparc64-sun4u/patches/linux/0001-sparc64-avoid-stringop-overread-warning-to-access-Ma.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From 82d91965519c20639c24aadd022b2859461562bc Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Tue, 27 Apr 2021 14:54:28 +0200
-Subject: [PATCH] sparc64: avoid stringop-overread warning to access Machine
- description datas
-
-gcc-11 warns about what appears to be an out-of-range array access but
-stop the build due to -Werror added to cflags:
-
-arch/sparc/kernel/mdesc.c: In function 'mdesc_node_by_name':
-arch/sparc/kernel/mdesc.c:647:22: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
-  647 |                 if (!strcmp(names + ep[ret].name_offset, name))
-      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
-   77 |         struct mdesc_hdr        mdesc;
-      |                                 ^~~~~
-arch/sparc/kernel/mdesc.c: In function 'mdesc_get_property':
-arch/sparc/kernel/mdesc.c:692:22: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
-  692 |                 if (!strcmp(names + ep->name_offset, name)) {
-      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
-   77 |         struct mdesc_hdr        mdesc;
-      |                                 ^~~~~
-arch/sparc/kernel/mdesc.c: In function 'mdesc_next_arc':
-arch/sparc/kernel/mdesc.c:719:21: error: 'strcmp' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
-  719 |                 if (strcmp(names + ep->name_offset, arc_type))
-      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-arch/sparc/kernel/mdesc.c:77:33: note: at offset 16 into source object 'mdesc' of size 16
-   77 |         struct mdesc_hdr        mdesc;
-      |                                 ^~~~~
-cc1: all warnings being treated as errors
-
-The issue was initially reported to gcc [1] where it was analized.
-As suggested, change the struct mdesc_elem * accesses from the end
-of mdesc to those from the beginning of the data array.
-
-Update the prototype of node_block(), name_block() and data_block()
-since the code really seems to want to do is to compute the address
-somewhere into the chunk pointed to by hp.
-
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=100262
-
-Upstream status: Pending 
-https://www.spinics.net/lists/sparclinux/msg26385.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/sparc/kernel/mdesc.c | 37 +++++++++++++++++++++----------------
- 1 file changed, 21 insertions(+), 16 deletions(-)
-
-diff --git a/arch/sparc/kernel/mdesc.c b/arch/sparc/kernel/mdesc.c
-index 8e645ddac58e..3403555aa1e2 100644
---- a/arch/sparc/kernel/mdesc.c
-+++ b/arch/sparc/kernel/mdesc.c
-@@ -75,6 +75,7 @@ struct mdesc_handle {
- 	refcount_t		refcnt;
- 	unsigned int		handle_size;
- 	struct mdesc_hdr	mdesc;
-+	char			data[];
- };
- 
- typedef int (*mdesc_node_info_get_f)(struct mdesc_handle *, u64,
-@@ -610,26 +611,30 @@ int mdesc_get_node_info(struct mdesc_handle *hp, u64 node,
- }
- EXPORT_SYMBOL(mdesc_get_node_info);
- 
--static struct mdesc_elem *node_block(struct mdesc_hdr *mdesc)
-+static struct mdesc_elem *node_block(struct mdesc_handle *hp)
- {
--	return (struct mdesc_elem *) (mdesc + 1);
-+	return (struct mdesc_elem *) hp + offsetof(struct mdesc_handle, data);
- }
- 
--static void *name_block(struct mdesc_hdr *mdesc)
-+static void *name_block(struct mdesc_handle *hp)
- {
--	return ((void *) node_block(mdesc)) + mdesc->node_sz;
-+	struct mdesc_hdr *mdesc = &hp->mdesc;
-+
-+	return ((void *) node_block(hp)) + mdesc->node_sz;
- }
- 
--static void *data_block(struct mdesc_hdr *mdesc)
-+static void *data_block(struct mdesc_handle *hp)
- {
--	return ((void *) name_block(mdesc)) + mdesc->name_sz;
-+	struct mdesc_hdr *mdesc = &hp->mdesc;
-+
-+	return ((void *) name_block(hp)) + mdesc->name_sz;
- }
- 
- u64 mdesc_node_by_name(struct mdesc_handle *hp,
- 		       u64 from_node, const char *name)
- {
--	struct mdesc_elem *ep = node_block(&hp->mdesc);
--	const char *names = name_block(&hp->mdesc);
-+	struct mdesc_elem *ep = node_block(hp);
-+	const char *names = name_block(hp);
- 	u64 last_node = hp->mdesc.node_sz / 16;
- 	u64 ret;
- 
-@@ -657,15 +662,15 @@ EXPORT_SYMBOL(mdesc_node_by_name);
- const void *mdesc_get_property(struct mdesc_handle *hp, u64 node,
- 			       const char *name, int *lenp)
- {
--	const char *names = name_block(&hp->mdesc);
-+	const char *names = name_block(hp);
- 	u64 last_node = hp->mdesc.node_sz / 16;
--	void *data = data_block(&hp->mdesc);
-+	void *data = data_block(hp);
- 	struct mdesc_elem *ep;
- 
- 	if (node == MDESC_NODE_NULL || node >= last_node)
- 		return NULL;
- 
--	ep = node_block(&hp->mdesc) + node;
-+	ep = node_block(hp) + node;
- 	ep++;
- 	for (; ep->tag != MD_NODE_END; ep++) {
- 		void *val = NULL;
-@@ -702,8 +707,8 @@ EXPORT_SYMBOL(mdesc_get_property);
- 
- u64 mdesc_next_arc(struct mdesc_handle *hp, u64 from, const char *arc_type)
- {
--	struct mdesc_elem *ep, *base = node_block(&hp->mdesc);
--	const char *names = name_block(&hp->mdesc);
-+	struct mdesc_elem *ep, *base = node_block(hp);
-+	const char *names = name_block(hp);
- 	u64 last_node = hp->mdesc.node_sz / 16;
- 
- 	if (from == MDESC_NODE_NULL || from >= last_node)
-@@ -728,7 +733,7 @@ EXPORT_SYMBOL(mdesc_next_arc);
- 
- u64 mdesc_arc_target(struct mdesc_handle *hp, u64 arc)
- {
--	struct mdesc_elem *ep, *base = node_block(&hp->mdesc);
-+	struct mdesc_elem *ep, *base = node_block(hp);
- 
- 	ep = base + arc;
- 
-@@ -738,8 +743,8 @@ EXPORT_SYMBOL(mdesc_arc_target);
- 
- const char *mdesc_node_name(struct mdesc_handle *hp, u64 node)
- {
--	struct mdesc_elem *ep, *base = node_block(&hp->mdesc);
--	const char *names = name_block(&hp->mdesc);
-+	struct mdesc_elem *ep, *base = node_block(hp);
-+	const char *names = name_block(hp);
- 	u64 last_node = hp->mdesc.node_sz / 16;
- 
- 	if (node == MDESC_NODE_NULL || node >= last_node)
--- 
-2.30.2
-
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index aa00ddf831..e6b72d8838 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 10dd9e52b4..a039c47729 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 20fdbb4062..dafcc37bc0 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -19,13 +19,13 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 # Qemu >= 5.1 requires an SD card size to be a power of 2, e.g. 64 MiB.
 BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 2f5189b8eb..327762277b 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -16,13 +16,13 @@ BR2_TARGET_ROOTFS_CPIO_GZIP=y
 BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 5.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
 
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index c45a775556..1dcd8272c3 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index abd0560cb1..7bf8b4061f 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 638c6629da..0508f92c36 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 6e62cc3304..10811e284e 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index 434e3d9530..c08ca862c5 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 2b8b2e8df1..0bb16b9320 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index bf1306a2b2..f7b218c62a 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -13,17 +13,16 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/mips32r6-malta/patches"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 5edf591bcf..d0f118ff90 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -13,17 +13,16 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/mips32r6el-malta/patches"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index ec841b5a09..fe03b911c5 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 680ccbbd60..c6d428226c 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index 53c5c09788..9cf651a4ba 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -14,17 +14,16 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/mips64r6-malta/patches"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 8230b1a9f9..0d02a5b4df 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -14,17 +14,16 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/mips64r6el-malta/patches"
 
 # Serial port config
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index d562e941b7..44afb928e3 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -1,7 +1,7 @@
 BR2_nios2=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
@@ -10,8 +10,8 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel needs mkimage
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 21d86e22ce..9d55cb3420 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
 
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index 1042088988..e2753cfcfd 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="rv32"
 BR2_LINUX_KERNEL_IMAGE=y
 
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index 93d38b1ec2..07f20776f0 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_IMAGE=y
 
diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index ba8f3b2908..86ac1fd024 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -11,16 +11,15 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.41"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/s390x/patches"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index a14277dd05..c8177e6096 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 4911ba0353..f334569779 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 6a999298eb..941439d338 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -2,9 +2,6 @@
 BR2_sparc64=y
 BR2_sparc_v9=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/sparc64-sun4u/patches"
-
 # System
 BR2_SYSTEM_DHCP="eth0"
 
@@ -16,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
 
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 0181f16846..62d3acb16b 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
 
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 25e0d43f49..1bca76df44 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -15,15 +15,16 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86_64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index bcd325b7ec..54cf8e9794 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -16,13 +16,13 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/x86/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
 
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 50c1c4ccf0..1db3fd3ce4 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index baf72da9b8..d4c07b574c 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -19,13 +19,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y

--===============3194293479469608711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3194293479469608711==--
