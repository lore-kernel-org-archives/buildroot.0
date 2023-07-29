Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5333EC00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE8A40547;
	Sat, 29 Jul 2023 21:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE8A40547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KG9aAI2q3vp6; Sat, 29 Jul 2023 21:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 257BF40868;
	Sat, 29 Jul 2023 21:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 257BF40868
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C19DD1BF3C1
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B93C60D72
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B93C60D72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mphRnQc2HVV7 for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:34:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EB9B60BEA
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB9B60BEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BB2083B2B; Sat, 29 Jul 2023 21:34:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 23:33:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 618eb375a046cc4ff007758510c883788e6ff690
X-Git-Newrev: d2a2fb01c4a3e757173c87511c7a3ed2fefcd26c
X-Patchwork-Hint: ignore
Message-Id: <20230729213437.6BB2083B2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: bump version to 1.18
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1350482815831029640=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1350482815831029640==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d2a2fb01c4a3e757173c87511c7a3ed2fefcd26c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches included in upstream release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 -
 ...rypto-target-when-required-due-to-gcc-bug.patch | 90 ----------------------
 ...d-error-due-to-PMULL-enabled-without-NEON.patch | 35 ---------
 package/libdeflate/libdeflate.hash                 |  2 +-
 package/libdeflate/libdeflate.mk                   |  2 +-
 5 files changed, 2 insertions(+), 129 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 7930f3fdcd..b17d5aad7a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -682,8 +682,6 @@ package/libconfuse/0001-Fix-163-unterminated-username-used-with-getpwnam.patch U
 package/libcorrect/0002-CMakeLists.txt-conditionally-use-fsanitize-address.patch Upstream
 package/libcuefile/0001-fix-static-link.patch Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch Upstream
-package/libdeflate/0001-lib-arm-crc32-use-crypto-target-when-required-due-to-gcc-bug.patch Upstream
-package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch Upstream
 package/libdnet/0001-python-makefile.patch Upstream
 package/libdnet/0002-Correct-path-to-string-h-from-bsd.patch Upstream
 package/libdrm/0001-tests-meson.build-disable-nouveau-tests-for-static-b.patch Upstream
diff --git a/package/libdeflate/0001-lib-arm-crc32-use-crypto-target-when-required-due-to-gcc-bug.patch b/package/libdeflate/0001-lib-arm-crc32-use-crypto-target-when-required-due-to-gcc-bug.patch
deleted file mode 100644
index 8823ec4b39..0000000000
--- a/package/libdeflate/0001-lib-arm-crc32-use-crypto-target-when-required-due-to-gcc-bug.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From f8f022e5bc574088ae80327ea5f88a8fe09b48c8 Mon Sep 17 00:00:00 2001
-From: Eric Biggers <ebiggers3@gmail.com>
-Date: Sun, 25 Dec 2022 15:05:52 -0800
-Subject: [PATCH] lib/arm/crc32: use crypto target when required due to gcc bug
-
-Fixes https://github.com/ebiggers/libdeflate/issues/280
-Fixes: 6db64ab7afd2 ("lib/crc32: CRC-32 optimizations and other improvements")
-[Retrieved from:
-https://github.com/ebiggers/libdeflate/commit/f8f022e5bc574088ae80327ea5f88a8fe09b48c8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/arm/cpu_features.h | 23 +++++++++++++++++++++++
- lib/arm/crc32_impl.h   |  9 +++++----
- 2 files changed, 28 insertions(+), 4 deletions(-)
-
-diff --git a/lib/arm/cpu_features.h b/lib/arm/cpu_features.h
-index 204c0cd5..4092eba8 100644
---- a/lib/arm/cpu_features.h
-+++ b/lib/arm/cpu_features.h
-@@ -116,6 +116,29 @@ static inline u32 get_arm_cpu_features(void) { return 0; }
- #else
- #  define HAVE_PMULL_INTRIN	0
- #endif
-+/*
-+ * Set USE_PMULL_TARGET_EVEN_IF_NATIVE if a workaround for a gcc bug that was
-+ * fixed by commit 11a113d501ff ("aarch64: Simplify feature definitions") in gcc
-+ * 13 is needed.  A minimal program that fails to build due to this bug when
-+ * compiled with -mcpu=emag, at least with gcc 10 through 12, is:
-+ *
-+ *    static inline __attribute__((always_inline,target("+crypto"))) void f() {}
-+ *    void g() { f(); }
-+ *
-+ * The error is:
-+ *
-+ *    error: inlining failed in call to ‘always_inline’ ‘f’: target specific option mismatch
-+ *
-+ * The workaround is to explicitly add the crypto target to the non-inline
-+ * function g(), even though this should not be required due to -mcpu=emag
-+ * enabling 'crypto' natively and causing __ARM_FEATURE_CRYPTO to be defined.
-+ */
-+#if HAVE_PMULL_NATIVE && defined(ARCH_ARM64) && \
-+		GCC_PREREQ(6, 1) && !GCC_PREREQ(13, 1)
-+#  define USE_PMULL_TARGET_EVEN_IF_NATIVE	1
-+#else
-+#  define USE_PMULL_TARGET_EVEN_IF_NATIVE	0
-+#endif
- 
- /* CRC32 */
- #ifdef __ARM_FEATURE_CRC32
-diff --git a/lib/arm/crc32_impl.h b/lib/arm/crc32_impl.h
-index e426a63d..b9300e4b 100644
---- a/lib/arm/crc32_impl.h
-+++ b/lib/arm/crc32_impl.h
-@@ -236,7 +236,7 @@ crc32_arm_crc(u32 crc, const u8 *p, size_t len)
-  * for implementations that use pmull for folding the data itself.
-  */
- #if HAVE_CRC32_INTRIN && HAVE_PMULL_INTRIN
--#  if HAVE_CRC32_NATIVE && HAVE_PMULL_NATIVE
-+#  if HAVE_CRC32_NATIVE && HAVE_PMULL_NATIVE && !USE_PMULL_TARGET_EVEN_IF_NATIVE
- #    define ATTRIBUTES
- #  else
- #    ifdef ARCH_ARM32
-@@ -438,7 +438,7 @@ crc32_arm_crc_pmullcombine(u32 crc, const u8 *p, size_t len)
- #if HAVE_PMULL_INTRIN
- #  define crc32_arm_pmullx4	crc32_arm_pmullx4
- #  define SUFFIX			 _pmullx4
--#  if HAVE_PMULL_NATIVE
-+#  if HAVE_PMULL_NATIVE && !USE_PMULL_TARGET_EVEN_IF_NATIVE
- #    define ATTRIBUTES
- #  else
- #    ifdef ARCH_ARM32
-@@ -558,7 +558,7 @@ crc32_arm_pmullx4(u32 crc, const u8 *p, size_t len)
- #if defined(ARCH_ARM64) && HAVE_PMULL_INTRIN && HAVE_CRC32_INTRIN
- #  define crc32_arm_pmullx12_crc	crc32_arm_pmullx12_crc
- #  define SUFFIX				 _pmullx12_crc
--#  if HAVE_PMULL_NATIVE && HAVE_CRC32_NATIVE
-+#  if HAVE_PMULL_NATIVE && HAVE_CRC32_NATIVE && !USE_PMULL_TARGET_EVEN_IF_NATIVE
- #    define ATTRIBUTES
- #  else
- #    ifdef __clang__
-@@ -584,7 +584,8 @@ crc32_arm_pmullx4(u32 crc, const u8 *p, size_t len)
- 	(HAVE_SHA3_TARGET || HAVE_SHA3_NATIVE)
- #  define crc32_arm_pmullx12_crc_eor3	crc32_arm_pmullx12_crc_eor3
- #  define SUFFIX				 _pmullx12_crc_eor3
--#  if HAVE_PMULL_NATIVE && HAVE_CRC32_NATIVE && HAVE_SHA3_NATIVE
-+#  if HAVE_PMULL_NATIVE && HAVE_CRC32_NATIVE && HAVE_SHA3_NATIVE && \
-+	!USE_PMULL_TARGET_EVEN_IF_NATIVE
- #    define ATTRIBUTES
- #  else
- #    ifdef __clang__
diff --git a/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch b/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch
deleted file mode 100644
index b13cbc48af..0000000000
--- a/package/libdeflate/0002-lib-arm-cpu_features-fix-build-error-due-to-PMULL-enabled-without-NEON.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 079a6dd171583c1953017b703ec63c5367a284b4 Mon Sep 17 00:00:00 2001
-From: Eric Biggers <ebiggers3@gmail.com>
-Date: Mon, 26 Dec 2022 11:32:47 -0800
-Subject: [PATCH] lib/arm/cpu_features: fix build error due to PMULL enabled
- without NEON
-
-When building for soft float arm32, HAVE_PMULL_INTRIN is being set when
-it shouldn't be, causing a build error:
-
-    #error "NEON intrinsics not available with the soft-float ABI..."
-
-Fix this by making HAVE_PMULL_INTRIN depend on HAVE_NEON_INTRIN, as used
-to be the case, in order to get the 'defined(__ARM_FP)' dependency,
-
-Fixes https://github.com/ebiggers/libdeflate/issues/282
-Fixes: 84c76f6f2cf5 ("lib/arm: make crc32 code work with MSVC")
-[Retrieved from:
-https://github.com/ebiggers/libdeflate/commit/079a6dd171583c1953017b703ec63c5367a284b4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/arm/cpu_features.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/arm/cpu_features.h b/lib/arm/cpu_features.h
-index 4092eba8..edcf7359 100644
---- a/lib/arm/cpu_features.h
-+++ b/lib/arm/cpu_features.h
-@@ -97,6 +97,7 @@ static inline u32 get_arm_cpu_features(void) { return 0; }
- #endif
- #if HAVE_PMULL_NATIVE || \
- 	(HAVE_DYNAMIC_ARM_CPU_FEATURES && \
-+	 HAVE_NEON_INTRIN /* needed to exclude soft float arm32 case */ && \
- 	 (GCC_PREREQ(6, 1) || __has_builtin(__builtin_neon_vmull_p64) || \
- 	  defined(_MSC_VER)) && \
- 	  /*
diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 79de3439d7..c6a50efbfc 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  58b95040df7383dc0413defb700d9893c194732474283cc4c8f144b00a68154b  libdeflate-1.15.tar.gz
+sha256  225d982bcaf553221c76726358d2ea139bb34913180b20823c782cede060affd  libdeflate-1.18.tar.gz
 sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index c09a033325..00de2e82a9 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.15
+LIBDEFLATE_VERSION = 1.18
 LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING

--===============1350482815831029640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1350482815831029640==--
