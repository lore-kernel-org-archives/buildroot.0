Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C78A606A9C2
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cLEQp4Wf;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=ljIp3Q7I
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA7D140758;
	Sat,  7 Nov 2026 15:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZURYXCZB8WA; Sat,  7 Nov 2026 15:17:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D2C034069A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794064629;
	b=qJu4VO/3uHSxXBvKIL2/r+ueOMmVaNZxBCBkgWuQ+9qfO8hTWsY+YHxIS9cV+cjKQTvk
	 yq5RUsfcXs0o957ATuKS4JvIaYKgIIhromyZnS7dP4RrMvrIqKbu1hVMEoNDTp9SgsLxC
	 cr/JNoKKN81P2I1jEy67IA0pUtFkWDOyJ9zIWRdi93THA1spS8/1kimVTwRY/QWkZhL5U
	 GlPGg7OmYnA8eV0vU4OZ30j4PV/1Dnsvwgdgvd4wqxnsvir7mS0wjrlOnGqI9PcXtXlss
	 djQ+maDFEJkIkdWl6GgVG8mPalh99gbuy8rBgmzqA2WVhCB9miBwTvhBouL8c48PlAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794064629;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vdsf4xvOwuhpwwl99kJPN9KkgAxBuZIMsz9CuXIuxto=;
	b=oZfAXA5uJADCHpOqmKhrxDOZthprBFB6BU29sd86/rJ/rZie68NtkER2jXkZrJ8WXzyi
	 o2m48rNAg4RVY88VyTTJlJ1cEBaYZqiRq9qQlgi7pxTP7jgdjjd+0qgkvFKkeDXSK+1kd
	 NTulVee8COgjR1qPnVD75C0WxKGwkjC/P5fbt6auGZ3RwQ7bJiRuQbg8+0g9MOaG4GvH1
	 XvwOZmp/r5gyiDYmvpoBSUDr1m2egMvLfMM+Z34HXGylBUhgFN+h3Cvv+3Jk4kwK4N+jc
	 q2cGT51Qw3tlmwLENT/R+2dc3j32vGZigK7m54o52wZWb/LwSJ8eFRo9O5DQrGeQtbw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794064628;
	bh=vdsf4xvOwuhpwwl99kJPN9KkgAxBuZIMsz9CuXIuxto=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cLEQp4WffUkqaletDP00NGNDbQEPQcK2Ggc/Hr73VPHUgOTQv2hsMALl5vD9WCWM4
	 D08Xoad81zD/VqTJrayYDr/pL6+18PyV8JERgRPIg4Jo7GcPvr0mR+i8rAdGFly5y7
	 Uz907M9IXjMFOEFj9qhprDRQsdXn/1pYH7wIqh6V7VYxqPd2J2rKB+2bMSAf1LBe2q
	 RYSPvNnWA5ULFku7A0r6DhRwspCgqwjq00wvJnYcs2+n7klVF8wfe8ml14j69DD4bL
	 ZX+ejqdIoUVNN0B3Ftphh4qddFnX+pJMdKhGt2t60lgVutJO5VHZEjNZhskrYqy926
	 gmalAirUkCl4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C034069A;
	Sat,  7 Nov 2026 15:17:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 999C41E3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82F8E80F13
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_FKtOJvBJO3 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 15:17:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E96480EC7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E96480EC7
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 15:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1794064620; bh=v8boPVpxQfH4iDwtvBb4cNvM6UrM+NhJu3ek1OvXqTY=;
 h=Date:From:To:Subject:From;
 b=ljIp3Q7IZ8Ouyh9A/qEkvik8hjJJsGUWM7sY6ytQq2cTnywp+DEgh4xvDYev7lo33
 QmL+9PptRrjV2neHlX1gOkvmjT1OdAPtHNXky2onC0z7y9J1kN/zJiYYXfQ0wFEHbh
 wAiOwGgvN/dANJlBXghT9HUgL8FYjmDqY8SITiD3b//PZNPwOOOjm9qLvYvLJLMY0G
 +tHNvavfWafLTCAFmkDFxoN6ePNYtVG6VaPcMZHZ1pAkLSeOWol4e8AusOiMglmxf6
 w/CknVaVp56HMQ+AFZMJEidQezXPLtoCdCCjemNaidJL6o/zsoeTMURo2kILgT3Bvm
 2jcS5dkBnYv3w==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 66B2131E0752; Sat, 07 Nov 2026 16:17:00 +0100 (CET)
Date: Sat, 7 Nov 2026 16:17:00 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <au9A7BZP4DK9CM3t@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH v2] package/uclibc: bump to 1.0.60
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All patches are applied upstream.
See here for changes in this release:
https://github.com/wbx-github/uclibc-ng/commits/v1.0.60/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
 - add hotfix for mips32 build error

---
 .../0001-Fix-SSP-support-for-riscv32.patch    | 174 -------------
 ...s-parenthesize-the-syscall-arguments.patch | 185 ++++++++++++++
 .../0002-ppc-fix-e500-fenv-support.patch      | 237 ------------------
 ...tx-should-be-private-and-not-exposed.patch | 151 -----------
 ...nel-helper-on-every-core-without-CAS.patch | 116 ---------
 ...threads-add-dummy-for-pthread_atfork.patch |  43 ----
 ...l-sys-auxv.h-for-static-builds-again.patch |  57 -----
 ...ar.h-declare-wcsdup-for-POSIX.1-2008.patch |  41 ---
 package/uclibc/uclibc.hash                    |   4 +-
 package/uclibc/uclibc.mk                      |   2 +-
 10 files changed, 188 insertions(+), 822 deletions(-)
 delete mode 100644 package/uclibc/0001-Fix-SSP-support-for-riscv32.patch
 create mode 100644 package/uclibc/0001-mips-parenthesize-the-syscall-arguments.patch
 delete mode 100644 package/uclibc/0002-ppc-fix-e500-fenv-support.patch
 delete mode 100644 package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch
 delete mode 100644 package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch
 delete mode 100644 package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
 delete mode 100644 package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
 delete mode 100644 package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch

diff --git a/package/uclibc/0001-Fix-SSP-support-for-riscv32.patch b/package/uclibc/0001-Fix-SSP-support-for-riscv32.patch
deleted file mode 100644
index b2e38726f5..0000000000
--- a/package/uclibc/0001-Fix-SSP-support-for-riscv32.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From c6efc293a52fdde7d4876243faaaa768fe052719 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sat, 15 Aug 2026 18:20:33 +0200
-Subject: [PATCH] Fix SSP support for riscv32
-
-On modern 32-bit architectures like RISC-V (riscv32), legacy 32-bit
-time syscalls like __NR_gettimeofday are intentionally omitted because
-RV32 implements a strict time64-only ABI to avoid the Year 2038 bug.
-
-Therefore, use AT_RANDOM from the auxiliary vector first, as glibc does,
-to obtain random data for the stack canary. If AT_RANDOM is unavailable,
-fall back to reading random data from /dev/urandom.
-
-Tested with aarch64, riscv32 and riscv32 noMMU targets.
-
-Upstream: https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/WIKMWPXJYAPTVVZ2MMZINUJNPIJXBMOE/
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- extra/Configs/Config.in               | 10 -------
- ldso/include/dl-syscall.h             | 12 --------
- ldso/ldso/ldso.c                      |  4 ++-
- libc/misc/internals/__uClibc_main.c   |  4 ++-
- libc/sysdeps/linux/common/dl-osinfo.h | 40 +++++++++++++++++----------
- 5 files changed, 32 insertions(+), 38 deletions(-)
-
-diff --git a/extra/Configs/Config.in b/extra/Configs/Config.in
-index c3aabf1b4..15a072593 100644
---- a/extra/Configs/Config.in
-+++ b/extra/Configs/Config.in
-@@ -2211,16 +2211,6 @@ config UCLIBC_HAS_SSP
- 
- 	  Most people will answer N.
- 
--config SSP_QUICK_CANARY
--	bool "Use simple guard values without accessing /dev/urandom"
--	depends on UCLIBC_HAS_SSP
--	help
--	  Use gettimeofday(2) to define the __guard without accessing
--	  /dev/urandom.
--	  WARNING: This makes smashing stack protector vulnerable to timing
--	  	attacks.
--	  Most people will answer N.
--
- choice
- 	prompt "Propolice protection blocking signal"
- 	depends on UCLIBC_HAS_SSP
-diff --git a/ldso/include/dl-syscall.h b/ldso/include/dl-syscall.h
-index c143b8d45..e08b2cd41 100644
---- a/ldso/include/dl-syscall.h
-+++ b/ldso/include/dl-syscall.h
-@@ -260,18 +260,6 @@ _dl_pread(int fd, void *buf, size_t count, off_t offset)
- }
- #endif
- 
--#ifdef __UCLIBC_HAS_SSP__
--# include <sys/time.h>
--# define __NR__dl_gettimeofday __NR_gettimeofday
--static __always_inline _syscall2(int, _dl_gettimeofday, struct timeval *, tv,
--# ifdef __USE_BSD
--                        struct timezone *
--# else
--                        void *
--# endif
--						, tz)
--#endif
--
- /* Some architectures always use 12 as page shift for mmap2() eventhough the
-  * real PAGE_SHIFT != 12.  Other architectures use the same value as
-  * PAGE_SHIFT...
-diff --git a/ldso/ldso/ldso.c b/ldso/ldso/ldso.c
-index 55f7d7e45..96ee3d496 100755
---- a/ldso/ldso/ldso.c
-+++ b/ldso/ldso/ldso.c
-@@ -1225,7 +1225,9 @@ of this helper program; chances are you did not intend to run this program.\n\
- #ifdef __UCLIBC_HAS_SSP__
- 	_dl_debug_early("Setting up SSP guards\n");
- 	/* Set up the stack checker's canary.  */
--	stack_chk_guard = _dl_setup_stack_chk_guard ();
-+	stack_chk_guard = _dl_setup_stack_chk_guard (
-+		_dl_auxvt[AT_RANDOM].a_type == AT_RANDOM ?
-+		(void *)_dl_auxvt[AT_RANDOM].a_un.a_val : NULL);
- # ifdef THREAD_SET_STACK_GUARD
- 	THREAD_SET_STACK_GUARD (stack_chk_guard);
- # else
-diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
-index 549606505..bbf471b17 100644
---- a/libc/misc/internals/__uClibc_main.c
-+++ b/libc/misc/internals/__uClibc_main.c
-@@ -296,7 +296,9 @@ void __uClibc_init(void)
- #ifndef SHARED
- # ifdef __UCLIBC_HAS_SSP__
-     /* Set up the stack checker's canary.  */
--    stack_chk_guard = _dl_setup_stack_chk_guard();
-+    stack_chk_guard = _dl_setup_stack_chk_guard(
-+    _dl_auxvt[AT_RANDOM].a_type == AT_RANDOM ?
-+        (void *)_dl_auxvt[AT_RANDOM].a_un.a_val : NULL);
- #  ifdef THREAD_SET_STACK_GUARD
-     THREAD_SET_STACK_GUARD (stack_chk_guard);
- #  else
-diff --git a/libc/sysdeps/linux/common/dl-osinfo.h b/libc/sysdeps/linux/common/dl-osinfo.h
-index 3110cb05d..0a42ea094 100644
---- a/libc/sysdeps/linux/common/dl-osinfo.h
-+++ b/libc/sysdeps/linux/common/dl-osinfo.h
-@@ -21,22 +21,42 @@
- #  ifdef IS_IN_libc
- #   include <fcntl.h>
- #   include <unistd.h>
--#   include <sys/time.h>
-+#   include <string.h>
- #   define OPEN open
- #   define READ read
- #   define CLOSE close
--#   define GETTIMEOFDAY gettimeofday
-+#   define MEMCPY memcpy
- #  else
-+#   include <dl-string.h>
- #   define OPEN _dl_open
- #   define READ _dl_read
- #   define CLOSE _dl_close
--#   define GETTIMEOFDAY _dl_gettimeofday
-+#   define MEMCPY _dl_memcpy
- #  endif
- 
--static __always_inline uintptr_t _dl_setup_stack_chk_guard(void)
-+static __always_inline uintptr_t
-+_dl_setup_stack_chk_guard(void *dl_random)
- {
- 	uintptr_t ret;
--#  ifndef __SSP_QUICK_CANARY__
-+
-+	/*
-+	 * Linux supplies random data through AT_RANDOM.
-+	 * Use it directly when available.
-+	 */
-+	if (dl_random != NULL) {
-+		MEMCPY(&ret, dl_random, sizeof(ret));
-+
-+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
-+		ret &= ~(uintptr_t)0xff;
-+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
-+		ret &= ~((uintptr_t)0xff << (8 * (sizeof(ret) - 1)));
-+#else
-+# error "Unknown byte order"
-+#endif
-+
-+		return ret;
-+	}
-+
- 	{
- 		int fd = OPEN("/dev/urandom", O_RDONLY, 0);
- 		if (fd >= 0) {
-@@ -46,18 +66,10 @@ static __always_inline uintptr_t _dl_setup_stack_chk_guard(void)
- 				return ret;
- 		}
- 	}
--#  endif /* !__SSP_QUICK_CANARY__ */
- 
--	/* Start with the "terminator canary". */
-+	/* Fallback just the "terminator canary". */
- 	ret = 0xFF0A0D00UL;
- 
--	/* Everything failed? Or we are using a weakened model of the
--	 * terminator canary */
--	{
--		struct timeval tv;
--		if (GETTIMEOFDAY(&tv, NULL) != (-1))
--			ret ^= tv.tv_usec ^ tv.tv_sec;
--	}
- 	return ret;
- }
- # endif /* libc || rtld */
--- 
-2.47.3
-
diff --git a/package/uclibc/0001-mips-parenthesize-the-syscall-arguments.patch b/package/uclibc/0001-mips-parenthesize-the-syscall-arguments.patch
new file mode 100644
index 0000000000..e2f9beb29c
--- /dev/null
+++ b/package/uclibc/0001-mips-parenthesize-the-syscall-arguments.patch
@@ -0,0 +1,185 @@
+From bbc1470d5d1c0f206cfdc3e9ebf60f6fd9cd3961 Mon Sep 17 00:00:00 2001
+From: ramin <lordrasmus@gmail.com>
+Date: Sat, 7 Nov 2026 12:04:15 +0100
+Subject: [PATCH] mips: parenthesize the syscall arguments
+
+The register setup in internal_syscallN cast each argument without
+parentheses, (ARG_TYPE) arg2.  An argument like "value ? &itv32 : NULL"
+then reads ((long) value) ? &itv32 : NULL, and the pointer goes into a
+long without a cast.  With UCLIBC_USE_TIME64 on 32-bit mips the build
+stops in getitimer, sched_rr_get_interval, timer_gettime and
+timerfd_gettime:
+
+  error: initialization of 'long int' from 'struct __itimerval32_struct *'
+  makes integer from pointer without a cast [-Wint-conversion]
+
+Upstream: https://github.com/wbx-github/uclibc-ng/commit/bbc1470d5d1c0f206cfdc3e9ebf60f6fd9cd3961
+Signed-off-by: Ramin Moussavi <lordrasmus@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ libc/sysdeps/linux/mips/bits/syscalls.h | 72 ++++++++++++-------------
+ 1 file changed, 36 insertions(+), 36 deletions(-)
+
+diff --git a/libc/sysdeps/linux/mips/bits/syscalls.h b/libc/sysdeps/linux/mips/bits/syscalls.h
+index ee569ee22..10d759a71 100644
+--- a/libc/sysdeps/linux/mips/bits/syscalls.h
++++ b/libc/sysdeps/linux/mips/bits/syscalls.h
+@@ -85,7 +85,7 @@
+ 									\
+ 	{								\
+ 	register ARG_TYPE __v0 __asm__("$2") ncs_init;			\
+-	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) arg1;		\
++	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) (arg1);		\
+ 	register ARG_TYPE __a3 __asm__("$7");				\
+ 	__asm__ __volatile__ (						\
+ 	".set\tnoreorder\n\t"						\
+@@ -107,8 +107,8 @@
+ 									\
+ 	{								\
+ 	register ARG_TYPE __v0 __asm__("$2") ncs_init;			\
+-	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) arg1;		\
+-	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) arg2;		\
++	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) (arg1);		\
++	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) (arg2);		\
+ 	register ARG_TYPE __a3 __asm__("$7");				\
+ 	__asm__ __volatile__ (						\
+ 	".set\tnoreorder\n\t"						\
+@@ -130,9 +130,9 @@
+ 									\
+ 	{								\
+ 	register ARG_TYPE __v0 __asm__("$2") ncs_init;			\
+-	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) arg1;		\
+-	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) arg2;		\
+-	register ARG_TYPE __a2 __asm__("$6") = (ARG_TYPE) arg3;		\
++	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) (arg1);		\
++	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) (arg2);		\
++	register ARG_TYPE __a2 __asm__("$6") = (ARG_TYPE) (arg3);		\
+ 	register ARG_TYPE __a3 __asm__("$7");				\
+ 	__asm__ __volatile__ (						\
+ 	".set\tnoreorder\n\t"						\
+@@ -154,10 +154,10 @@
+ 									\
+ 	{								\
+ 	register ARG_TYPE __v0 __asm__("$2") ncs_init;			\
+-	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) arg1;		\
+-	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) arg2;		\
+-	register ARG_TYPE __a2 __asm__("$6") = (ARG_TYPE) arg3;		\
+-	register ARG_TYPE __a3 __asm__("$7") = (ARG_TYPE) arg4;		\
++	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) (arg1);		\
++	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) (arg2);		\
++	register ARG_TYPE __a2 __asm__("$6") = (ARG_TYPE) (arg3);		\
++	register ARG_TYPE __a3 __asm__("$7") = (ARG_TYPE) (arg4);		\
+ 	__asm__ __volatile__ (						\
+ 	".set\tnoreorder\n\t"						\
+ 	cs_init								\
+@@ -187,10 +187,10 @@
+ 	int* array = FORCE_FRAME_POINTER;				\
+ 	{								\
+ 	register long __v0 __asm__("$2") ncs_init;			\
+-	register long __a0 __asm__("$4") = (long) arg1;			\
+-	register long __a1 __asm__("$5") = (long) arg2;			\
+-	register long __a2 __asm__("$6") = (long) arg3;			\
+-	register long __a3 __asm__("$7") = (long) arg4;			\
++	register long __a0 __asm__("$4") = (long) (arg1);			\
++	register long __a1 __asm__("$5") = (long) (arg2);			\
++	register long __a2 __asm__("$6") = (long) (arg3);			\
++	register long __a3 __asm__("$7") = (long) (arg4);			\
+ 	__asm__ __volatile__ (						\
+ 	".set\tnoreorder\n\t"						\
+ 	"subu\t$29, 32\n\t"                                             \
+@@ -202,7 +202,7 @@
+ 	".set\treorder"						        \
+ 	: "=r" (__v0), "+r" (__a3)					\
+ 	: input, "r" (__a0), "r" (__a1), "r" (__a2),			\
+-	  "r" ((long)arg5), "r" (array)					\
++	  "r" ((long) (arg5)), "r" (array)					\
+ 	: __SYSCALL_CLOBBERS);						\
+ 	err = __a3;							\
+ 	_sys_result = __v0;						\
+@@ -217,10 +217,10 @@
+ 	int* array = FORCE_FRAME_POINTER;				\
+ 	{								\
+ 	register long __v0 __asm__("$2") ncs_init;			\
+-	register long __a0 __asm__("$4") = (long) arg1;			\
+-	register long __a1 __asm__("$5") = (long) arg2;			\
+-	register long __a2 __asm__("$6") = (long) arg3;			\
+-	register long __a3 __asm__("$7") = (long) arg4;			\
++	register long __a0 __asm__("$4") = (long) (arg1);			\
++	register long __a1 __asm__("$5") = (long) (arg2);			\
++	register long __a2 __asm__("$6") = (long) (arg3);			\
++	register long __a3 __asm__("$7") = (long) (arg4);			\
+ 	__asm__ __volatile__ (						\
+ 	".set\tnoreorder\n\t"                                           \
+ 	"subu\t$29, 32\n\t"                                             \
+@@ -233,7 +233,7 @@
+ 	".set\treorder"						        \
+ 	: "=r" (__v0), "+r" (__a3)					\
+ 	: input, "r" (__a0), "r" (__a1), "r" (__a2),			\
+-	  "r" ((long)arg5), "r" ((long)arg6), "r" (array)		\
++	  "r" ((long) (arg5)), "r" ((long) (arg6)), "r" (array)		\
+ 	: __SYSCALL_CLOBBERS);						\
+ 	err = __a3;							\
+ 	_sys_result = __v0;						\
+@@ -248,10 +248,10 @@
+ 	int* array = FORCE_FRAME_POINTER;				\
+ 	{								\
+ 	register long __v0 __asm__("$2") ncs_init;			\
+-	register long __a0 __asm__("$4") = (long) arg1;			\
+-	register long __a1 __asm__("$5") = (long) arg2;			\
+-	register long __a2 __asm__("$6") = (long) arg3;			\
+-	register long __a3 __asm__("$7") = (long) arg4;			\
++	register long __a0 __asm__("$4") = (long) (arg1);			\
++	register long __a1 __asm__("$5") = (long) (arg2);			\
++	register long __a2 __asm__("$6") = (long) (arg3);			\
++	register long __a3 __asm__("$7") = (long) (arg4);			\
+ 	__asm__ __volatile__ (						\
+ 	".set\tnoreorder\n\t"						\
+ 	"subu\t$29, 32\n\t"                                             \
+@@ -265,7 +265,7 @@
+ 	".set\treorder"							\
+ 	: "=r" (__v0), "+r" (__a3)					\
+ 	: input, "r" (__a0), "r" (__a1), "r" (__a2),			\
+-	  "r" ((long)arg5), "r" ((long)arg6), "r" ((long)arg7),		\
++	  "r" ((long) (arg5)), "r" ((long) (arg6)), "r" ((long) (arg7)),		\
+ 	  "r" (array)							\
+ 	: __SYSCALL_CLOBBERS);						\
+ 	err = __a3;							\
+@@ -290,11 +290,11 @@
+ 									\
+ 	{								\
+ 	register ARG_TYPE __v0 __asm__("$2") ncs_init;			\
+-	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) arg1; 	\
+-	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) arg2; 	\
+-	register ARG_TYPE __a2 __asm__("$6") = (ARG_TYPE) arg3; 	\
+-	register ARG_TYPE __a3 __asm__("$7") = (ARG_TYPE) arg4; 	\
+-	register ARG_TYPE __a4 __asm__("$8") = (ARG_TYPE) arg5; 	\
++	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) (arg1); 	\
++	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) (arg2); 	\
++	register ARG_TYPE __a2 __asm__("$6") = (ARG_TYPE) (arg3); 	\
++	register ARG_TYPE __a3 __asm__("$7") = (ARG_TYPE) (arg4); 	\
++	register ARG_TYPE __a4 __asm__("$8") = (ARG_TYPE) (arg5); 	\
+ 	__asm__ __volatile__ ( 						\
+ 	".set\tnoreorder\n\t" 						\
+ 	cs_init								\
+@@ -315,12 +315,12 @@
+ 									\
+ 	{								\
+ 	register ARG_TYPE __v0 __asm__("$2") ncs_init;			\
+-	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) arg1; 	\
+-	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) arg2; 	\
+-	register ARG_TYPE __a2 __asm__("$6") = (ARG_TYPE) arg3; 	\
+-	register ARG_TYPE __a3 __asm__("$7") = (ARG_TYPE) arg4; 	\
+-	register ARG_TYPE __a4 __asm__("$8") = (ARG_TYPE) arg5; 	\
+-	register ARG_TYPE __a5 __asm__("$9") = (ARG_TYPE) arg6; 	\
++	register ARG_TYPE __a0 __asm__("$4") = (ARG_TYPE) (arg1); 	\
++	register ARG_TYPE __a1 __asm__("$5") = (ARG_TYPE) (arg2); 	\
++	register ARG_TYPE __a2 __asm__("$6") = (ARG_TYPE) (arg3); 	\
++	register ARG_TYPE __a3 __asm__("$7") = (ARG_TYPE) (arg4); 	\
++	register ARG_TYPE __a4 __asm__("$8") = (ARG_TYPE) (arg5); 	\
++	register ARG_TYPE __a5 __asm__("$9") = (ARG_TYPE) (arg6); 	\
+ 	__asm__ __volatile__ ( 						\
+ 	".set\tnoreorder\n\t" 						\
+ 	cs_init								\
+-- 
+2.47.3
+
diff --git a/package/uclibc/0002-ppc-fix-e500-fenv-support.patch b/package/uclibc/0002-ppc-fix-e500-fenv-support.patch
deleted file mode 100644
index bc64b8f762..0000000000
--- a/package/uclibc/0002-ppc-fix-e500-fenv-support.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From dff69277d71965cff0a757a030e03994a4a83aa6 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Tue, 18 Aug 2026 06:02:54 +0200
-Subject: [PATCH] ppc: fix e500 fenv support
-
-Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/dff69277d71965cff0a757a030e03994a4a83aa6
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- libm/powerpc/e500/fpu/fclrexcpt.c    | 1 -
- libm/powerpc/e500/fpu/fe_nomask.c    | 1 -
- libm/powerpc/e500/fpu/fedisblxcpt.c  | 1 -
- libm/powerpc/e500/fpu/feenablxcpt.c  | 1 -
- libm/powerpc/e500/fpu/fegetenv.c     | 1 -
- libm/powerpc/e500/fpu/fegetexcept.c  | 1 -
- libm/powerpc/e500/fpu/fegetround.c   | 1 -
- libm/powerpc/e500/fpu/feholdexcpt.c  | 2 --
- libm/powerpc/e500/fpu/fenv_const.c   | 1 -
- libm/powerpc/e500/fpu/fesetenv.c     | 5 +----
- libm/powerpc/e500/fpu/fesetround.c   | 2 --
- libm/powerpc/e500/fpu/feupdateenv.c  | 1 -
- libm/powerpc/e500/fpu/fgetexcptflg.c | 1 -
- libm/powerpc/e500/fpu/fraiseexcpt.c  | 3 ---
- libm/powerpc/e500/fpu/fsetexcptflg.c | 1 -
- libm/powerpc/e500/fpu/ftestexcept.c  | 1 -
- 16 files changed, 1 insertion(+), 23 deletions(-)
-
-diff --git a/libm/powerpc/e500/fpu/fclrexcpt.c b/libm/powerpc/e500/fpu/fclrexcpt.c
-index 805aaa487..02dc4bcf8 100644
---- a/libm/powerpc/e500/fpu/fclrexcpt.c
-+++ b/libm/powerpc/e500/fpu/fclrexcpt.c
-@@ -1,6 +1,5 @@
- /* Clear given exceptions in current floating-point environment.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-    modify it under the terms of the GNU Lesser General Public
-diff --git a/libm/powerpc/e500/fpu/fe_nomask.c b/libm/powerpc/e500/fpu/fe_nomask.c
-index d5915165c..fe709803d 100644
---- a/libm/powerpc/e500/fpu/fe_nomask.c
-+++ b/libm/powerpc/e500/fpu/fe_nomask.c
-@@ -1,6 +1,5 @@
- /* Procedure definition for FE_NOMASK_ENV.
-    Copyright (C) 1997 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-    modify it under the terms of the GNU Lesser General Public
-diff --git a/libm/powerpc/e500/fpu/fedisblxcpt.c b/libm/powerpc/e500/fpu/fedisblxcpt.c
-index 0700f4577..0a54df6fb 100644
---- a/libm/powerpc/e500/fpu/fedisblxcpt.c
-+++ b/libm/powerpc/e500/fpu/fedisblxcpt.c
-@@ -1,6 +1,5 @@
- /* Disable floating-point exceptions.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-diff --git a/libm/powerpc/e500/fpu/feenablxcpt.c b/libm/powerpc/e500/fpu/feenablxcpt.c
-index 9f03181f4..bc1c30a83 100644
---- a/libm/powerpc/e500/fpu/feenablxcpt.c
-+++ b/libm/powerpc/e500/fpu/feenablxcpt.c
-@@ -1,6 +1,5 @@
- /* Enable floating-point exceptions.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-diff --git a/libm/powerpc/e500/fpu/fegetenv.c b/libm/powerpc/e500/fpu/fegetenv.c
-index c1a914dc3..934ac92e9 100644
---- a/libm/powerpc/e500/fpu/fegetenv.c
-+++ b/libm/powerpc/e500/fpu/fegetenv.c
-@@ -1,7 +1,6 @@
- /* Store current floating-point environment.
-    Copyright (C) 2004 Free Software Foundation, Inc.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004
--   This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-    modify it under the terms of the GNU Lesser General Public
-diff --git a/libm/powerpc/e500/fpu/fegetexcept.c b/libm/powerpc/e500/fpu/fegetexcept.c
-index bf0215d62..b932f8036 100644
---- a/libm/powerpc/e500/fpu/fegetexcept.c
-+++ b/libm/powerpc/e500/fpu/fegetexcept.c
-@@ -1,6 +1,5 @@
- /* Get floating-point exceptions.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-diff --git a/libm/powerpc/e500/fpu/fegetround.c b/libm/powerpc/e500/fpu/fegetround.c
-index f501c6ce8..7b54ead30 100644
---- a/libm/powerpc/e500/fpu/fegetround.c
-+++ b/libm/powerpc/e500/fpu/fegetround.c
-@@ -1,6 +1,5 @@
- /* Return current rounding direction.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-diff --git a/libm/powerpc/e500/fpu/feholdexcpt.c b/libm/powerpc/e500/fpu/feholdexcpt.c
-index edeb2cf81..2b0c4ca4c 100644
---- a/libm/powerpc/e500/fpu/feholdexcpt.c
-+++ b/libm/powerpc/e500/fpu/feholdexcpt.c
-@@ -1,6 +1,5 @@
- /* Store current floating-point environment and clear exceptions.
-    Copyright (C) 2004, 2006 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-@@ -41,4 +40,3 @@ feholdexcept (fenv_t *envp)
- 
-   return 0;
- }
--libm_hidden_def (feholdexcept)
-diff --git a/libm/powerpc/e500/fpu/fenv_const.c b/libm/powerpc/e500/fpu/fenv_const.c
-index 3c9f5578a..cfbff0793 100644
---- a/libm/powerpc/e500/fpu/fenv_const.c
-+++ b/libm/powerpc/e500/fpu/fenv_const.c
-@@ -1,6 +1,5 @@
- /* Constants for fenv_bits.h.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-diff --git a/libm/powerpc/e500/fpu/fesetenv.c b/libm/powerpc/e500/fpu/fesetenv.c
-index 392e0c0bf..28d113959 100644
---- a/libm/powerpc/e500/fpu/fesetenv.c
-+++ b/libm/powerpc/e500/fpu/fesetenv.c
-@@ -1,6 +1,5 @@
- /* Install given floating-point environment.
-    Copyright (C) 1997,99,2000,01,02 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-    modify it under the terms of the GNU Lesser General Public
-@@ -21,7 +20,7 @@
- #include <sys/prctl.h>
- 
- int
--__fesetenv (const fenv_t *envp)
-+fesetenv (const fenv_t *envp)
- {
-   fenv_union_t u;
-   INTERNAL_SYSCALL_DECL (err);
-@@ -33,5 +32,3 @@ __fesetenv (const fenv_t *envp)
-   /* Success.  */
-   return 0;
- }
--
--libm_hidden_ver (__fesetenv, fesetenv)
-diff --git a/libm/powerpc/e500/fpu/fesetround.c b/libm/powerpc/e500/fpu/fesetround.c
-index 783541d5b..800a8a4d2 100644
---- a/libm/powerpc/e500/fpu/fesetround.c
-+++ b/libm/powerpc/e500/fpu/fesetround.c
-@@ -1,6 +1,5 @@
- /* Set current rounding direction.
-    Copyright (C) 2004, 2006 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-@@ -33,4 +32,3 @@ fesetround (int round)
- 
-   return 0;
- }
--libm_hidden_def (fesetround)
-diff --git a/libm/powerpc/e500/fpu/feupdateenv.c b/libm/powerpc/e500/fpu/feupdateenv.c
-index 47f316318..6c1f8941c 100644
---- a/libm/powerpc/e500/fpu/feupdateenv.c
-+++ b/libm/powerpc/e500/fpu/feupdateenv.c
-@@ -1,6 +1,5 @@
- /* Install given floating-point environment and raise exceptions.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-diff --git a/libm/powerpc/e500/fpu/fgetexcptflg.c b/libm/powerpc/e500/fpu/fgetexcptflg.c
-index d27356574..d4847ef6d 100644
---- a/libm/powerpc/e500/fpu/fgetexcptflg.c
-+++ b/libm/powerpc/e500/fpu/fgetexcptflg.c
-@@ -1,6 +1,5 @@
- /* Store current representation for exceptions.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-diff --git a/libm/powerpc/e500/fpu/fraiseexcpt.c b/libm/powerpc/e500/fpu/fraiseexcpt.c
-index 0c92b2868..43025fe25 100644
---- a/libm/powerpc/e500/fpu/fraiseexcpt.c
-+++ b/libm/powerpc/e500/fpu/fraiseexcpt.c
-@@ -1,6 +1,5 @@
- /* Raise given exceptions.
-    Copyright (C) 2004, 2006 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-@@ -24,5 +23,3 @@
- #define __FERAISEEXCEPT_INTERNAL feraiseexcept
- 
- #include "../spe-raise.c"
--
--libm_hidden_def (feraiseexcept)
-diff --git a/libm/powerpc/e500/fpu/fsetexcptflg.c b/libm/powerpc/e500/fpu/fsetexcptflg.c
-index 11ea89f16..2fde513a0 100644
---- a/libm/powerpc/e500/fpu/fsetexcptflg.c
-+++ b/libm/powerpc/e500/fpu/fsetexcptflg.c
-@@ -1,6 +1,5 @@
- /* Set floating-point environment exception handling.
-    Copyright (C) 1997,99,2000,01,04 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-    modify it under the terms of the GNU Lesser General Public
-diff --git a/libm/powerpc/e500/fpu/ftestexcept.c b/libm/powerpc/e500/fpu/ftestexcept.c
-index 55f752b25..2c082f509 100644
---- a/libm/powerpc/e500/fpu/ftestexcept.c
-+++ b/libm/powerpc/e500/fpu/ftestexcept.c
-@@ -1,6 +1,5 @@
- /* Test exception in current environment.
-    Copyright (C) 2004 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
-    Contributed by Aldy Hernandez <aldyh@redhat.com>, 2004.
- 
-    The GNU C Library is free software; you can redistribute it and/or
--- 
-2.47.3
-
diff --git a/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch b/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch
deleted file mode 100644
index e77f079dcc..0000000000
--- a/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 1105fd6c97f020f6ca7426e19d29081f404b567d Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Tue, 18 Aug 2026 18:13:29 +0200
-Subject: [PATCH] fenv: struct rm_ctx should be private and not exposed in a
- public header
-
-Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/1105fd6c97f020f6ca7426e19d29081f404b567d
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- include/fenv.h              | 10 ----------
- include/fenv_private.h      | 24 ++++++++++++++++++++++++
- libm/aarch64/fenv_private.h |  1 +
- libm/arc/fenv_private.h     |  1 +
- libm/arm/fenv_private.h     |  1 +
- libm/csky/fenv_private.h    |  1 +
- libm/mips/fenv_private.h    |  1 +
- libm/sparc/fenv_private.h   |  1 +
- 8 files changed, 30 insertions(+), 10 deletions(-)
- create mode 100644 include/fenv_private.h
-
-diff --git a/include/fenv.h b/include/fenv.h
-index 4b532c573..34042d5ac 100644
---- a/include/fenv.h
-+++ b/include/fenv.h
-@@ -1,5 +1,4 @@
- /* Copyright (C) 1997, 1999, 2000 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
- 
-    The GNU C Library is free software; you can redistribute it and/or
-    modify it under the terms of the GNU Lesser General Public
-@@ -131,15 +130,6 @@ extern int fedisableexcept (int __excepts) __THROW;
- extern int fegetexcept (void) __THROW;
- #endif
- 
--/* Rounding mode context.  This allows functions to set/restore rounding mode
--   only when the desired rounding mode is different from the current rounding
--   mode.  */
--struct rm_ctx
--{
--  fenv_t env;
--  bool updated_status;
--};
--
- __END_DECLS
- 
- #endif /* fenv.h */
-diff --git a/include/fenv_private.h b/include/fenv_private.h
-new file mode 100644
-index 000000000..5e81c71aa
---- /dev/null
-+++ b/include/fenv_private.h
-@@ -0,0 +1,24 @@
-+/* Copyright (C) 1997, 1999, 2000 Free Software Foundation, Inc.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <http://www.gnu.org/licenses/>.  */
-+
-+/* Rounding mode context.  This allows functions to set/restore rounding mode
-+   only when the desired rounding mode is different from the current rounding
-+   mode.  */
-+struct rm_ctx
-+{
-+  fenv_t env;
-+  bool updated_status;
-+};
-diff --git a/libm/aarch64/fenv_private.h b/libm/aarch64/fenv_private.h
-index 5afb790ea..3eaf0eb3f 100644
---- a/libm/aarch64/fenv_private.h
-+++ b/libm/aarch64/fenv_private.h
-@@ -19,6 +19,7 @@
- #define AARCH64_FENV_PRIVATE_H 1
- 
- #include <fenv.h>
-+#include <fenv_private.h>
- #include <fpu_control.h>
- 
- static __always_inline void
-diff --git a/libm/arc/fenv_private.h b/libm/arc/fenv_private.h
-index 5f74c5e13..2e985722f 100644
---- a/libm/arc/fenv_private.h
-+++ b/libm/arc/fenv_private.h
-@@ -19,6 +19,7 @@
- #define _FENV_PRIVATE_H 1
- 
- #include <fenv.h>
-+#include <fenv_private.h>
- #include "get-rounding-mode.h"
- 
- /* The standards only specify one variant of the fenv.h interfaces.
-diff --git a/libm/arm/fenv_private.h b/libm/arm/fenv_private.h
-index 566bf443c..61418d9f4 100644
---- a/libm/arm/fenv_private.h
-+++ b/libm/arm/fenv_private.h
-@@ -19,6 +19,7 @@
- #define ARM_FENV_PRIVATE_H 1
- 
- #include <fenv.h>
-+#include <fenv_private.h>
- #include <fpu_control.h>
- 
- static __always_inline void
-diff --git a/libm/csky/fenv_private.h b/libm/csky/fenv_private.h
-index f0f48a88a..e6015abee 100644
---- a/libm/csky/fenv_private.h
-+++ b/libm/csky/fenv_private.h
-@@ -19,6 +19,7 @@
- #define CSKY_FENV_PRIVATE_H 1
- 
- #include <fenv.h>
-+#include <fenv_private.h>
- #include <fpu_control.h>
- #include "fenv_libc.h"
- 
-diff --git a/libm/mips/fenv_private.h b/libm/mips/fenv_private.h
-index bc9be3b62..273d6faf8 100644
---- a/libm/mips/fenv_private.h
-+++ b/libm/mips/fenv_private.h
-@@ -24,6 +24,7 @@
-    code instead.  */
- 
- #include <fenv.h>
-+#include <fenv_private.h>
- #include "fenv_libc.h"
- #include <fpu_control.h>
- 
-diff --git a/libm/sparc/fenv_private.h b/libm/sparc/fenv_private.h
-index b888d8442..c76fbad7f 100644
---- a/libm/sparc/fenv_private.h
-+++ b/libm/sparc/fenv_private.h
-@@ -2,6 +2,7 @@
- #define SPARC_FENV_PRIVATE_H 1
- 
- #include <fenv.h>
-+#include <fenv_private.h>
- #include <fpu_control.h>
- 
- /* For internal use only: access the fp state register.  */
--- 
-2.47.3
-
diff --git a/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch b/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch
deleted file mode 100644
index 3ac756f4c7..0000000000
--- a/package/uclibc/0004-m68k-use-the-kernel-helper-on-every-core-without-CAS.patch
+++ /dev/null
@@ -1,116 +0,0 @@
-From 5222fefffa0270c2f2d50961a4b75ef7f5605c29 Mon Sep 17 00:00:00 2001
-From: ramin <lordrasmus@gmail.com>
-Date: Mon, 24 Aug 2026 13:06:02 +0200
-Subject: [PATCH] m68k: use the kernel helper on every core without CAS, not
- just ColdFire
-
-The atomic header split the world into ColdFire and "the rest", assuming the
-rest was 68020 and up. That holds for the MMU port, but not for the 68000 and
-68010, which have no atomic read-modify-write instruction either. Building for
-one of them stops at the first cas:
-
-  Error: invalid instruction for this architecture; needs 68020 or higher
-         (68020 [68k, 68ec020], 68030 [68ec030], 68040 [68ec040],
-          68060 [68ec060]) -- statement `cas.l %d0,%d1,(%a1)' ignored
-
-Reported by Waldemar Brodkorb from a Buildroot autobuilder failure; Buildroot
-supports m68000 and has at least one user on it.
-
-Decide by the presence of CAS instead. The instruction came with the 68020, so
-the test is the list of the 68020-and-up cores: gcc defines a separate macro
-per core and does not imply __mc68020__ on the later ones, and __mc68000__ is
-no help because it is defined on every m68k, the 68040 and ColdFire included.
-
-Nothing else changes: the kernel's atomic_cmpxchg_32 is syscall 335 "common"
-in arch/m68k/kernel/syscalls/syscall.tbl and has an implementation for the MMU
-as well as the noMMU port, so the branch the old cores now take is the one
-ColdFire has been using all along - including its documented limit that the
-8- and 16-bit variants stay non-atomic, since the helper is 32-bit only.
-
-Checked with a cross gcc over -m68000, -m68010, -m68020, -m68030, -m68040,
--m68060, -mcpu=5206 and -mcpu=5208: the three old cores and both ColdFires
-select the helper, the four others select cas, and each branch assembles for
-the cores that select it.
-
-Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/5222fefffa0270c2f2d50961a4b75ef7f5605c29
-Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- libc/sysdeps/linux/m68k/bits/atomic.h | 32 ++++++++++++++++++---------
- 1 file changed, 22 insertions(+), 10 deletions(-)
-
-diff --git a/libc/sysdeps/linux/m68k/bits/atomic.h b/libc/sysdeps/linux/m68k/bits/atomic.h
-index cf7fd5f65..6acec1ed8 100644
---- a/libc/sysdeps/linux/m68k/bits/atomic.h
-+++ b/libc/sysdeps/linux/m68k/bits/atomic.h
-@@ -3,13 +3,15 @@
- 
-    Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
- 
--   m68k (68020 and up, which is everything the MMU Linux port runs on) has
--   the CAS instruction.  We implement the compare-and-exchange primitive
--   with cas.b/cas.w/cas.l; include/atomic.h derives every higher-level
--   operation from it.
-+   The CAS instruction arrived with the 68020.  Where it exists we implement
-+   the compare-and-exchange primitive with cas.b/cas.w/cas.l and let
-+   include/atomic.h derive every higher-level operation from it.
- 
--   ColdFire has no CAS at all, so there we use the kernel's
--   atomic_cmpxchg_32 helper, which exists for exactly this reason.
-+   ColdFire, 68000 and 68010 have no atomic read-modify-write instruction at
-+   all.  There we use the kernel's atomic_cmpxchg_32 helper, which exists for
-+   exactly this reason and is available on every m68k (syscall 335, "common"
-+   in arch/m68k/kernel/syscalls/syscall.tbl, with an implementation for both
-+   the MMU and the noMMU port).
- 
-    Without this file m68k fell back to the generic non-atomic
-    bits/atomic.h, whose "atomic" compare-and-exchange is a plain
-@@ -22,7 +24,17 @@
- #define _M68K_BITS_ATOMIC_H	1
- 
- #include <stdint.h>
--#ifdef __mcoldfire__
-+
-+/* CAS came with the 68020.  gcc sets a separate macro per core and does not
-+   imply __mc68020__ on the later ones, hence the list; __mc68000__ is no help
-+   here, it is defined on every m68k, the 68040 and ColdFire included.
-+   Everything without CAS - ColdFire, 68000, 68010 - uses the kernel helper.  */
-+#if defined __mc68020__ || defined __mc68030__ \
-+    || defined __mc68040__ || defined __mc68060__
-+# define __M68K_HAVE_CAS	1
-+#endif
-+
-+#ifndef __M68K_HAVE_CAS
- # include <sys/syscall.h>
- #endif
- 
-@@ -58,7 +70,7 @@ typedef uintmax_t uatomic_max_t;
- #define atomic_read_barrier()	atomic_full_barrier ()
- #define atomic_write_barrier()	atomic_full_barrier ()
- 
--#ifndef __mcoldfire__
-+#ifdef __M68K_HAVE_CAS
- 
- /* cas Dc,Du,<ea>: compare <ea> with Dc; if equal store Du, else load <ea>
-    into Dc.  Either way Dc ends up holding the original *MEM, which is the
-@@ -87,7 +99,7 @@ typedef uintmax_t uatomic_max_t;
- 		       : "memory");					\
-      __ret; })
- 
--#else /* __mcoldfire__ */
-+#else /* !__M68K_HAVE_CAS */
- 
- /* d0 = syscall number, d1 = newval, d2 = oldval, a0 = mem; the helper
-    returns the previous value.  The swap happens inside the syscall, so
-@@ -116,7 +128,7 @@ typedef uintmax_t uatomic_max_t;
- #define __arch_compare_and_exchange_val_16_acq(mem, newval, oldval) \
-   __arch_compare_and_exchange_val_8_acq (mem, newval, oldval)
- 
--#endif /* __mcoldfire__ */
-+#endif /* __M68K_HAVE_CAS */
- 
- /* m68k has no 64-bit CAS; NPTL and include/atomic.h only use int- and
-    pointer-sized objects, so the bysize dispatch never reaches this.  */
--- 
-2.47.3
-
diff --git a/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch b/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
deleted file mode 100644
index 66605aa657..0000000000
--- a/package/uclibc/0005-Revert-linuxthreads-add-dummy-for-pthread_atfork.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 2e902dccb925f1f185836bbad2284e2879550cb3 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sun, 11 Oct 2026 16:25:53 +0200
-Subject: [PATCH] Revert "linuxthreads: add dummy for pthread_atfork"
-
-This reverts commit 9e38e0aa45cca21d5023d0af94377f0e1e41d2f4.
-
-As reported on the uClibc-ng mailinglist by Thomas Petazzoni
-this dummy without proper prototype is breaking util-linux
-compilation. My usecase in 2017 was curl+libressl. Since then
-I moved from libressl to libopenssl and that works fine without
-pthread_atfork(). Tested with curl in Qemu for RISCV64 noMMU flat.
-
-Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/2e902dccb925f1f185836bbad2284e2879550cb3
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- libpthread/linuxthreads/ptfork.c | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/libpthread/linuxthreads/ptfork.c b/libpthread/linuxthreads/ptfork.c
-index a1bad3d54..74d630830 100644
---- a/libpthread/linuxthreads/ptfork.c
-+++ b/libpthread/linuxthreads/ptfork.c
-@@ -150,16 +150,4 @@ static pid_t __fork(void)
- strong_alias(__fork,fork)
- strong_alias(__fork,vfork)
- 
--#else
--
--/* We can't support pthread_atfork without MMU, since we don't have
--   fork(), and we can't offer the correct semantics for vfork().
--   But instead of failing, just provide a dummy */
--int pthread_atfork(void (*prepare)(void),
--                  void (*parent)(void),
--                  void (*child)(void))
--{
--  return 0;
--}
--
- #endif
--- 
-2.47.3
-
diff --git a/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
deleted file mode 100644
index 74d14b5501..0000000000
--- a/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 6dc9f06a0330f11171f76f4b831724c02642f11f Mon Sep 17 00:00:00 2001
-From: ramin <lordrasmus@gmail.com>
-Date: Mon, 12 Oct 2026 16:30:56 +0200
-Subject: [PATCH] buildsys: install sys/auxv.h for static builds again
-
-getauxval() has not needed ld.so since 227b7c825 and 737a0edf4 ("Make
-getauxval work with static linking", "Support non-cached entries in
-getauxval", v1.0.52): _dl_auxvt and _dl_auxv_start are defined in
-libc/misc/elf/dl-support.c for the static libc, and __uClibc_main calls
-_dl_aux_init() on that path too.  The static libc.a carries getauxval,
-__getauxval, _dl_aux_init, _dl_auxvt and _dl_auxv_start.
-
-Its header is still withheld, though.  df81bd1e2 ("getauxval: remove
-header for static builds") put sys/auxv.h next to dlfcn.h in the
-HEADERS_RM line that applies when HAVE_SHARED is unset, as a way around
-the link error of the day -- a package that probed for getauxval would
-not find a declaration and would take its fallback path.  That error is
-gone and the workaround outlived it: a static sysroot installs 70 of the
-71 headers in include/sys, and the one missing is auxv.h.
-
-So a static configuration of, say, openssl fails with "sys/auxv.h: No
-such file or directory", which reads like a missing feature rather than
-a withheld declaration.
-
-Measured on riscv64 with a static configuration and gcc 10.5.0: with the
-header installed, a
-statically linked program answers AT_PAGESZ as 4096, matching
-sysconf(_SC_PAGESIZE), returns every entry of /proc/self/auxv unchanged,
-and reports ENOENT for a type that was not passed -- both for a type
-inside the cached range and for one above it, which takes the search
-over the whole vector.
-
-dlfcn.h and bits/dlfcn.h stay removed.
-
-Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/6dc9f06a0330f11171f76f4b831724c02642f11f
-Signed-off-by: Ramin Moussavi <lordrasmus@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 3b28fbf60..72865863d 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -257,7 +257,7 @@ HEADERS_RM- := \
- ifeq ($(UCLIBC_STRICT_HEADERS),y)
- HEADERS_RM- += sgtty.h
- endif
--HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h sys/auxv.h
-+HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h
- HEADERS_RM-$(PTHREADS_DEBUG_SUPPORT)         += thread_db.h
- HEADERS_RM-$(UCLIBC_HAS_ARGP)                += argp.h
- HEADERS_RM-$(UCLIBC_HAS_BSD_ERR)             += err.h
--- 
-2.47.3
-
diff --git a/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch b/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
deleted file mode 100644
index 9cdbbaf2e8..0000000000
--- a/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 936a08b682e761afba98ef3800265add951201fc Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Thu, 22 Oct 2026 13:55:32 +0200
-Subject: [PATCH] wchar.h: declare wcsdup() for POSIX.1-2008
-
-wcsdup() is part of POSIX.1-2008, and glibc declares it under
-__USE_XOPEN2K8, but uClibc-ng only declares it under __USE_GNU.
-
-As a consequence, code that doesn't define _GNU_SOURCE (for example
-hidapi's Linux hidraw backend) gets an implicit declaration of wcsdup().
-With GCC >= 14 this is an error:
-
-  hid.c:116:32: error: implicit declaration of function 'wcsdup'; did you mean 'wcscmp'? [-Wimplicit-function-declaration]
-
-and with older compilers the returned pointer is silently truncated to
-int on 64-bit targets.
-
-Move the declaration under __USE_XOPEN2K8, which is also enabled by
-default (_DEFAULT_SOURCE) and by _GNU_SOURCE.
-
-Assisted-by: Claude:claude-opus-5-5
-Upstream: https://github.com/wbx-github/uclibc-ng/commit/936a08b682e761afba98ef3800265add951201fc
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- include/wchar.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/wchar.h b/include/wchar.h
-index 2e6ff77c0..0056f93da 100644
---- a/include/wchar.h
-+++ b/include/wchar.h
-@@ -210,7 +210,9 @@ extern size_t wcsxfrm_l (wchar_t *__s1, const wchar_t *__s2,
- libc_hidden_proto(wcsxfrm_l)
- 
- #endif /* __UCLIBC_HAS_XLOCALE__ */
-+#endif
- 
-+#ifdef __USE_XOPEN2K8
- /* Duplicate S, returning an identical malloc'd string.  */
- extern wchar_t *wcsdup (const wchar_t *__s) __THROW __attribute_malloc__;
- #endif
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 4e5fd587e2..19c328471e 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.59/uClibc-ng-1.0.59.tar.xz.sha256
-sha256  86c6f15971bfb14156850f2e36906dac5a69df7b3e688216d1aea09d2db54174  uClibc-ng-1.0.59.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.60/uClibc-ng-1.0.60.tar.xz.sha256
+sha256  4ff2ca4de4fe47e85b8ce9a62f73e3f05c9bc675de8349fccd0d224574357c44  uClibc-ng-1.0.60.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index beaa32e67f..cf5cb6cc75 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.59
+UCLIBC_VERSION = 1.0.60
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
