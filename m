Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEB3C4167B
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF43880F97;
	Mon, 26 Dec 2022 21:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF43880F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Q-g1qM55Ump; Mon, 26 Dec 2022 21:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D2681272;
	Mon, 26 Dec 2022 21:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2D2681272
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A70801BF3B9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8167C40190
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 21:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8167C40190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSv6N9SfTbUj for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4618F4016D
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 21:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4618F4016D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3260086DD9; Mon, 26 Dec 2022 21:09:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 22:09:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54a8cb19331c8e75f6a48cb529c18619379414d7
X-Git-Newrev: 5dc7e1fc363b217683f009f6470519b751675083
X-Patchwork-Hint: ignore
Message-Id: <20221226210954.3260086DD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: fix aarch64 build
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
Content-Type: multipart/mixed; boundary="===============5990476361582416770=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5990476361582416770==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5dc7e1fc363b217683f009f6470519b751675083
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following aarch64 build failure raised since the addition of the
package in commit 4231e7b10b87de71e33bb9906eede3751bed5dfe:

In file included from /home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:256,
                 from /home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/crc32.c:227:
/home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h: In function 'clmul_u32':
/home/autobuild/autobuild/instance-22/output-1/host/lib/gcc/aarch64-buildroot-linux-gnu/10.4.0/include/arm_neon.h:26723:1: error: inlining failed in call to 'always_inline' 'vmull_p64': target specific option mismatch
26723 | vmull_p64 (poly64_t __a, poly64_t __b)
      | ^~~~~~~~~
In file included from /home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/crc32.c:227:
/home/autobuild/autobuild/instance-22/output-1/build/libdeflate-1.15/lib/arm/crc32_impl.h:262:19: note: called from here
  262 |  uint64x2_t res = vreinterpretq_u64_p128(
      |                   ^~~~~~~~~~~~~~~~~~~~~~~
  263 |     compat_vmull_p64((poly64_t)a, (poly64_t)b));
      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9aee8dafea614db77209818b913a571534466506
 - http://autobuild.buildroot.org/results/951d5a1a2959a0cc65ca7e52967ec07bc1cc00f1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...rypto-target-when-required-due-to-gcc-bug.patch | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/package/libdeflate/0001-lib-arm-crc32-use-crypto-target-when-required-due-to-gcc-bug.patch b/package/libdeflate/0001-lib-arm-crc32-use-crypto-target-when-required-due-to-gcc-bug.patch
new file mode 100644
index 0000000000..8823ec4b39
--- /dev/null
+++ b/package/libdeflate/0001-lib-arm-crc32-use-crypto-target-when-required-due-to-gcc-bug.patch
@@ -0,0 +1,90 @@
+From f8f022e5bc574088ae80327ea5f88a8fe09b48c8 Mon Sep 17 00:00:00 2001
+From: Eric Biggers <ebiggers3@gmail.com>
+Date: Sun, 25 Dec 2022 15:05:52 -0800
+Subject: [PATCH] lib/arm/crc32: use crypto target when required due to gcc bug
+
+Fixes https://github.com/ebiggers/libdeflate/issues/280
+Fixes: 6db64ab7afd2 ("lib/crc32: CRC-32 optimizations and other improvements")
+[Retrieved from:
+https://github.com/ebiggers/libdeflate/commit/f8f022e5bc574088ae80327ea5f88a8fe09b48c8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/arm/cpu_features.h | 23 +++++++++++++++++++++++
+ lib/arm/crc32_impl.h   |  9 +++++----
+ 2 files changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/lib/arm/cpu_features.h b/lib/arm/cpu_features.h
+index 204c0cd5..4092eba8 100644
+--- a/lib/arm/cpu_features.h
++++ b/lib/arm/cpu_features.h
+@@ -116,6 +116,29 @@ static inline u32 get_arm_cpu_features(void) { return 0; }
+ #else
+ #  define HAVE_PMULL_INTRIN	0
+ #endif
++/*
++ * Set USE_PMULL_TARGET_EVEN_IF_NATIVE if a workaround for a gcc bug that was
++ * fixed by commit 11a113d501ff ("aarch64: Simplify feature definitions") in gcc
++ * 13 is needed.  A minimal program that fails to build due to this bug when
++ * compiled with -mcpu=emag, at least with gcc 10 through 12, is:
++ *
++ *    static inline __attribute__((always_inline,target("+crypto"))) void f() {}
++ *    void g() { f(); }
++ *
++ * The error is:
++ *
++ *    error: inlining failed in call to ‘always_inline’ ‘f’: target specific option mismatch
++ *
++ * The workaround is to explicitly add the crypto target to the non-inline
++ * function g(), even though this should not be required due to -mcpu=emag
++ * enabling 'crypto' natively and causing __ARM_FEATURE_CRYPTO to be defined.
++ */
++#if HAVE_PMULL_NATIVE && defined(ARCH_ARM64) && \
++		GCC_PREREQ(6, 1) && !GCC_PREREQ(13, 1)
++#  define USE_PMULL_TARGET_EVEN_IF_NATIVE	1
++#else
++#  define USE_PMULL_TARGET_EVEN_IF_NATIVE	0
++#endif
+ 
+ /* CRC32 */
+ #ifdef __ARM_FEATURE_CRC32
+diff --git a/lib/arm/crc32_impl.h b/lib/arm/crc32_impl.h
+index e426a63d..b9300e4b 100644
+--- a/lib/arm/crc32_impl.h
++++ b/lib/arm/crc32_impl.h
+@@ -236,7 +236,7 @@ crc32_arm_crc(u32 crc, const u8 *p, size_t len)
+  * for implementations that use pmull for folding the data itself.
+  */
+ #if HAVE_CRC32_INTRIN && HAVE_PMULL_INTRIN
+-#  if HAVE_CRC32_NATIVE && HAVE_PMULL_NATIVE
++#  if HAVE_CRC32_NATIVE && HAVE_PMULL_NATIVE && !USE_PMULL_TARGET_EVEN_IF_NATIVE
+ #    define ATTRIBUTES
+ #  else
+ #    ifdef ARCH_ARM32
+@@ -438,7 +438,7 @@ crc32_arm_crc_pmullcombine(u32 crc, const u8 *p, size_t len)
+ #if HAVE_PMULL_INTRIN
+ #  define crc32_arm_pmullx4	crc32_arm_pmullx4
+ #  define SUFFIX			 _pmullx4
+-#  if HAVE_PMULL_NATIVE
++#  if HAVE_PMULL_NATIVE && !USE_PMULL_TARGET_EVEN_IF_NATIVE
+ #    define ATTRIBUTES
+ #  else
+ #    ifdef ARCH_ARM32
+@@ -558,7 +558,7 @@ crc32_arm_pmullx4(u32 crc, const u8 *p, size_t len)
+ #if defined(ARCH_ARM64) && HAVE_PMULL_INTRIN && HAVE_CRC32_INTRIN
+ #  define crc32_arm_pmullx12_crc	crc32_arm_pmullx12_crc
+ #  define SUFFIX				 _pmullx12_crc
+-#  if HAVE_PMULL_NATIVE && HAVE_CRC32_NATIVE
++#  if HAVE_PMULL_NATIVE && HAVE_CRC32_NATIVE && !USE_PMULL_TARGET_EVEN_IF_NATIVE
+ #    define ATTRIBUTES
+ #  else
+ #    ifdef __clang__
+@@ -584,7 +584,8 @@ crc32_arm_pmullx4(u32 crc, const u8 *p, size_t len)
+ 	(HAVE_SHA3_TARGET || HAVE_SHA3_NATIVE)
+ #  define crc32_arm_pmullx12_crc_eor3	crc32_arm_pmullx12_crc_eor3
+ #  define SUFFIX				 _pmullx12_crc_eor3
+-#  if HAVE_PMULL_NATIVE && HAVE_CRC32_NATIVE && HAVE_SHA3_NATIVE
++#  if HAVE_PMULL_NATIVE && HAVE_CRC32_NATIVE && HAVE_SHA3_NATIVE && \
++	!USE_PMULL_TARGET_EVEN_IF_NATIVE
+ #    define ATTRIBUTES
+ #  else
+ #    ifdef __clang__

--===============5990476361582416770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5990476361582416770==--
