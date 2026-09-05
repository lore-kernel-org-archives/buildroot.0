Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D22C79F85
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 15:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2DE810B5;
	Sat,  5 Sep 2026 15:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4vMPUYACc7H0; Sat,  5 Sep 2026 15:36:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D98EA8107D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788622619;
	b=UEH35tOpusvdo8iPuhzDk77FEOm1ROM220dZ+FAqrFmlps740DG9ykVfKSsqKRudRDEU
	 obBE2Q5gVOxSXGNBtqRvAotB8rVRoOYw/fMm56FRQpcJBE8aK+qRE6sk6t99bwVtp+vfD
	 vahEmeqVQYXf9t/C2POlkDXdeVhoSzRMmkNW5Q69cfijt7pUvDdI98ZudIw8jBn69DlCv
	 w6FMoGqMnDoUbxAJldSAFdhYcnOdOusW0BHqvOQue4q6fZSP9KfA7WVe7mGffks/XmEai
	 htfO10IDjR0TJFQFRsYieoI7Wly3zsAgJObE5vjWS1W3MasZlGVIYDlMHZpOfxcgCGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788622619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1a0uXWDWm9OsR81VFFDPejlCnIXzrZ/sxvT/LYY7xR8=;
	b=fQYbwRc9nWrEEA9MpeYCb2yv+8ReJZGowjCOKkio4RpynbIx1BP7uPriTTvAzepiCLgR
	 OQaP3wZRfrhVqO6IZromeLhmPnKtE9HVMv++trv1hFSyEsKGrM1eW5ZIRnVDazgdJ4Q7x
	 JB8fDSzZn6zfk6AS0biEc8RSaxMC64A1M4MDZTFSJxYojBzSCQpAEgypM5urP8mFqM318
	 gyYaXGZDDnVwcetFGXpS3Kv0wVdBvtPmeWv5ZovaTVrzSe+p8j6mSloSyxVKuKyUQMd87
	 kVEBLm34/niLE1X4wUMh9v1JPJUMaJdQIeAzvYiv8k1pSZddPPvc2o+iLNHXhBexLPg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788622618;
	bh=1a0uXWDWm9OsR81VFFDPejlCnIXzrZ/sxvT/LYY7xR8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lhtJlR/4Aond+0ApZLyoxHs/6Kwg52oIcaSg5ULyZPFnXo/v4pB5vHlqIVozx1UH5
	 8ao5Vpq3Jeg7uyNGErl87xw7O9yQly1k+ZYFtMiGIy/VnbFdxXid/tGtyahoAMFj3r
	 QFhJ5fhbNH9VpjhBZ7C7uDV0G75BgoiXCkVZ0aGYovWyp1jOuFsK80h/j/vQ4O514+
	 SJmWn0YwKNTbUbHQ8AGnZ8zbHV0XqHRW2rzwfqP0jv8jnP7kvRhjik+q4LAmh+7PKA
	 e8KXcwm2xrC+R2bwOm2NkHX1nwMZ0s40a8ez5RB8Iv/wbURY1egi/jpwg2FwnImduU
	 bTf+TvAl6pVeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D98EA8107D;
	Sat,  5 Sep 2026 15:36:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7019E279
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5710D40051
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QoF-lWsJ7B9h for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 15:36:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DCC8F4004C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788622613;
 b=Wzt74yk2rvv24xYVO1GZa0NtPt3JVfYHNmPOIzfQc+vav1ZTXPb5uystyn+A+GqtHnVl
 EqUXCi7C3OLtVR7TaOAwTywidqPW1LGEdg/ornEETzYyhbNNDX0+93GagGcCqJ+0+tgKT
 uq3J3oJLRIHfllY5KY+3Oaym2snu2u/YJQ+PS7eyRw40FOC6AUrXLgJqMdONn12NBeEZw
 /siYAAS/G2e58UC0JtwmVdMa3d4ZRvTn0Y0REfghHAkP8u8sNp2ZZ+k94aqIXUs/SJW7Z
 xULMUGC/38leQXzQqBELOfXxkuPh7RbHFc911CJENGFJ88vVuqxz5jlqDP2Y3epk07Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788622613;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/eCi3PdhOdG3TY1UhVpHp50fm6i5C05tNcSqqAjEVIQ=;
 b=PDjpZYGJ4R37L/FFXBKridEGOMEUgxLxOB6SkYm9jPiqZfwi9QXB3Ikehpa0nyHubAth
 ZCEhykCwGqWGalMwsNLEeY3bFNGp0yst6MxAi4upHcbKk//92YgCpc8FynlHglXjTVHCC
 xRR7nz/pJUvbPxGw8NJWg00l0KzTrQgq6pVqPC9HH9KEmECT9TkraGmHl0AOnhICWsM3m
 4xYQDVyQnMjz2w4IVwMbu417fxZ3F3l1ypa+Gvu81A4oDp/VsvxgO/9oG19aYqI5tHMkK
 FmqjCGM+7U4lpBJYkeiFZ9ocacg1QhAzcmb8/1zI+QCcTbvzH3tFyauiwPpz/PxLKUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCC8F4004C
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 15:36:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3AB694DB6; Sat,  5 Sep 2026 15:35:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 17:09:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e631348db15df28d5b576c17097a3ea8a38387c
X-Git-Newrev: 627c482434e12e8ada6fcb45d482ada09af61f73
X-Patchwork-Hint: ignore
Message-Id: <20260905153552.D3AB694DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: bump version to 1.12.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/627c482434e12e8ada6fcb45d482ada09af61f73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000508.html

Contains a number of bugfixes, some of which may have (low severity)
security impact.  As stated by Werner Koch:

 All in all we received 26 reports alone from ANSSI but as even the reporter
 mentioned, the real world attack severity is not critical.  Thus we don't
 consider 1.12.3 a security fix release.  There are some bugs which should
 be fixed to avoid crashes, and thus may lead to DoS.  However, 16384 bit
 RSA keys can also be used for a practical DoS; it all depends on your use
 case.

https://www.openwall.com/lists/oss-security/2026/08/31/11

Added upstream patch to fix a build error introduced by this bump that
was detected by the Gitlab pipelines:

sm4-intel-avx512-amd64.S: Assembler messages:
sm4-intel-avx512-amd64.S:138: Error: operand size mismatch for `vsm4rnds4'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add extra info in commit log from Peter original submission from
 https://lore.kernel.org/buildroot/20260901192724.1021544-1-peter@korsgaard.com/
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...arate-configure-check-for-AVX512-SM4-inst.patch | 108 +++++++++++++++++++++
 package/libgcrypt/libgcrypt.hash                   |   4 +-
 package/libgcrypt/libgcrypt.mk                     |   2 +-
 3 files changed, 111 insertions(+), 3 deletions(-)

diff --git a/package/libgcrypt/0002-sm4-add-separate-configure-check-for-AVX512-SM4-inst.patch b/package/libgcrypt/0002-sm4-add-separate-configure-check-for-AVX512-SM4-inst.patch
new file mode 100644
index 0000000000..67bcf667f5
--- /dev/null
+++ b/package/libgcrypt/0002-sm4-add-separate-configure-check-for-AVX512-SM4-inst.patch
@@ -0,0 +1,108 @@
+From f0bc379e0f3585908707095db5d3c505e664726f Mon Sep 17 00:00:00 2001
+From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+Date: Sun, 30 Aug 2026 11:16:11 +0300
+Subject: [PATCH] sm4: add separate configure check for AVX512 SM4 instructions
+
+* cipher/sm4-intel-avx512-amd64.S: Check for
+HAVE_GCC_INLINE_ASM_SM4_AVX512 instead of HAVE_GCC_INLINE_ASM_SM4.
+* cipher/sm4.c (USE_INTEL_SM4_AVX512): Require USE_INTEL_SM4_AVX2 and
+HAVE_GCC_INLINE_ASM_SM4_AVX512.
+* configure.ac (gcry_cv_gcc_inline_asm_sm4_avx512)
+(HAVE_GCC_INLINE_ASM_SM4_AVX512): New.
+--
+
+Toolchain may support VEX encoded SM4 instructions but not EVEX encoded
+ones. Commit adds separate check for EVEX coding and gates SM4-AVX512
+implementation behind the new check.
+
+Reported in FreeBSD bugtracker:
+ https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=297987
+
+Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+
+Upstream: https://github.com/gpg/libgcrypt/commit/f0bc379e0f3585908707095db5d3c505e664726f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cipher/sm4-intel-avx512-amd64.S |  4 ++--
+ cipher/sm4.c                    |  8 +++-----
+ configure.ac                    | 24 ++++++++++++++++++++++++
+ 3 files changed, 29 insertions(+), 7 deletions(-)
+
+diff --git a/cipher/sm4-intel-avx512-amd64.S b/cipher/sm4-intel-avx512-amd64.S
+index c5eaa723..ac8076ec 100644
+--- a/cipher/sm4-intel-avx512-amd64.S
++++ b/cipher/sm4-intel-avx512-amd64.S
+@@ -23,7 +23,7 @@
+ #ifdef __x86_64
+ #if (defined(HAVE_COMPATIBLE_GCC_AMD64_PLATFORM_AS) || \
+      defined(HAVE_COMPATIBLE_GCC_WIN64_PLATFORM_AS)) && \
+-    defined(ENABLE_AVX512_SUPPORT) && defined(HAVE_GCC_INLINE_ASM_SM4)
++    defined(ENABLE_AVX512_SUPPORT) && defined(HAVE_GCC_INLINE_ASM_SM4_AVX512)
+ 
+ #include "asm-common-amd64.h"
+ 
+@@ -164,5 +164,5 @@ ELF(.size __sm4_intel_crypt_blk32,.-__sm4_intel_crypt_blk32;)
+ #define SM4_CRYPT_BLK32 __sm4_intel_crypt_blk32
+ #include "sm4-avx512-amd64.h"
+ 
+-#endif /*defined(ENABLE_AVX512_SUPPORT) && defined(HAVE_GCC_INLINE_ASM_SM4)*/
++#endif /*ENABLE_AVX512_SUPPORT && HAVE_GCC_INLINE_ASM_SM4_AVX512*/
+ #endif /*__x86_64*/
+diff --git a/cipher/sm4.c b/cipher/sm4.c
+index 482a7983..58aaea10 100644
+--- a/cipher/sm4.c
++++ b/cipher/sm4.c
+@@ -87,11 +87,9 @@
+ /* USE_INTEL_SM4_AVX512 indicates whether to compile with Intel SM4
+  * instructions (VSM4RNDS4) based AVX512 code. */
+ #undef USE_INTEL_SM4_AVX512
+-#if defined(ENABLE_AVX512_SUPPORT) && defined(HAVE_GCC_INLINE_ASM_SM4)
+-# if defined(__x86_64__) && (defined(HAVE_COMPATIBLE_GCC_AMD64_PLATFORM_AS) || \
+-     defined(HAVE_COMPATIBLE_GCC_WIN64_PLATFORM_AS))
+-#  define USE_INTEL_SM4_AVX512 1
+-# endif
++#if defined(USE_INTEL_SM4_AVX2) && defined(ENABLE_AVX512_SUPPORT) && \
++    defined(HAVE_GCC_INLINE_ASM_SM4_AVX512)
++# define USE_INTEL_SM4_AVX512 1
+ #endif
+ 
+ /* Assembly implementations use SystemV ABI, ABI conversion and additional
+diff --git a/configure.ac b/configure.ac
+index a5e8d683..ea7ea7ae 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1659,6 +1659,30 @@ if test "$gcry_cv_gcc_inline_asm_sm4" = "yes" ; then
+ fi
+ 
+ 
++#
++# Check whether GCC inline assembler supports EVEX encoded Intel SM4
++# instructions.
++#
++AC_CACHE_CHECK([whether GCC inline assembler supports AVX512 Intel SM4 instructions],
++       [gcry_cv_gcc_inline_asm_sm4_avx512],
++       [if test "$mpi_cpu_arch" != "x86" ||
++           test "$try_asm_modules" != "yes" ; then
++          gcry_cv_gcc_inline_asm_sm4_avx512="n/a"
++        else
++          gcry_cv_gcc_inline_asm_sm4_avx512=no
++          AC_LINK_IFELSE([AC_LANG_PROGRAM(
++          [[void a(void) {
++              __asm__("vsm4key4 %%zmm2, %%zmm1, %%zmm3\n\t":::"cc");
++              __asm__("vsm4rnds4 %%zmm2, %%zmm1, %%zmm3\n\t":::"cc");
++            }]], [ a(); ] )],
++          [gcry_cv_gcc_inline_asm_sm4_avx512=yes])
++        fi])
++if test "$gcry_cv_gcc_inline_asm_sm4_avx512" = "yes" ; then
++   AC_DEFINE(HAVE_GCC_INLINE_ASM_SM4_AVX512,1,
++     [Defined if inline assembler supports AVX512 Intel SM4 instructions])
++fi
++
++
+ #
+ # Check whether GCC inline assembler supports SSE4.1 instructions.
+ #
+-- 
+2.47.3
+
diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 7be6554d56..e76496a7e4 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  7b8ff21966a0b6e7a735466b9b9b55d9dac9fa87  libgcrypt-1.12.2.tar.bz2
-sha256  7ce33c2492221a0436f96a8500215e9f3e3dcb5fd26a757cd415e7a843babd5e  libgcrypt-1.12.2.tar.bz2
+sha1  b4654d75f0e5d0850cc699f02c9b44a06367502f  libgcrypt-1.12.3.tar.bz2
+sha256  98d1b0b3202d2b03fa754a35aa3cbbfcf526a3260d8d2ee213748001b1043006  libgcrypt-1.12.3.tar.bz2
 # Locally calculated
 sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 0bc281da42..a49897fd4f 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.12.2
+LIBGCRYPT_VERSION = 1.12.3
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPL-2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
