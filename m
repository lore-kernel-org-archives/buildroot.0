Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F1FC4332F
	for <buildroot@archiver.kernel.org>; Fri, 16 Dec 2022 14:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C7541B8E;
	Fri, 16 Dec 2022 14:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C7541B8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pucVsWa2nWrU; Fri, 16 Dec 2022 14:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50AE941BC5;
	Fri, 16 Dec 2022 14:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50AE941BC5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5279B1BF976
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D86A60A68
 for <buildroot@lists.busybox.net>; Fri, 16 Dec 2022 14:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D86A60A68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qwh6zpQAuChW for <buildroot@lists.busybox.net>;
 Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C852460A46
 for <buildroot@buildroot.org>; Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C852460A46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3E3086773; Fri, 16 Dec 2022 14:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Dec 2022 15:16:37 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7b32bbb7ec6643edaa18bb943c6d834cd532499c
X-Git-Newrev: 30e9d1c7f6630f5c24ca17d00dfd6bf0669532d3
X-Patchwork-Hint: ignore
Message-Id: <20221216142239.B3E3086773@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/botan: bump to
 version 2.19.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=30e9d1c7f6630f5c24ca17d00dfd6bf0669532d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Drop patch (not needed since
  https://github.com/randombit/botan/commit/97483f93bdcfcb2cc86bcb103802be55c24ad633)
- Update hash of license file (update in year:
  https://github.com/randombit/botan/commit/ff62a51ac2ed2e265edaf51b532d32eed5864d4b)

https://github.com/randombit/botan/blob/2.19.1/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e28156074d296f02b02b7f01767fda314365b890)
---
 ...around-a-miscompilation-issue-in-clang-12.patch | 144 ---------------------
 package/botan/botan.hash                           |   4 +-
 package/botan/botan.mk                             |   2 +-
 3 files changed, 3 insertions(+), 147 deletions(-)

diff --git a/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch b/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
deleted file mode 100644
index b43aeafe13..0000000000
--- a/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 372bdf0348fb86d671e73baab19daa34bd0cf73d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 9 Nov 2021 19:01:20 +0100
-Subject: [PATCH] Revert "workaround a miscompilation issue in clang 12
- (XCode 13)"
-
-This reverts commit 219329f8e777af54d785ae7259f8be32a714b751.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/randombit/botan/issues/2845]
----
- src/lib/hash/sha3/sha3.cpp                | 46 ++++++-----------------
- src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp | 46 ++++++-----------------
- 2 files changed, 22 insertions(+), 70 deletions(-)
-
-diff --git a/src/lib/hash/sha3/sha3.cpp b/src/lib/hash/sha3/sha3.cpp
-index 289e451ff..690c2b264 100644
---- a/src/lib/hash/sha3/sha3.cpp
-+++ b/src/lib/hash/sha3/sha3.cpp
-@@ -11,47 +11,23 @@
- #include <botan/exceptn.h>
- #include <botan/cpuid.h>
- 
--#include <tuple>
--
- namespace Botan {
- 
- namespace {
- 
--// This is a workaround for a suspected bug in clang 12 (and XCode 13)
--// that caused a miscompile of the SHA3 implementation for optimization
--// level -O2 and higher.
--//
--// For details, see: https://github.com/randombit/botan/issues/2802
--#if    defined(__clang__) && \
--    (( defined(__apple_build_version__) && __clang_major__ == 13) || \
--     (!defined(__apple_build_version__) && __clang_major__ == 12))
--#define BOTAN_WORKAROUND_MAYBE_INLINE __attribute__((noinline))
--#else
--#define BOTAN_WORKAROUND_MAYBE_INLINE inline
--#endif
--
--BOTAN_WORKAROUND_MAYBE_INLINE std::tuple<uint64_t, uint64_t, uint64_t, uint64_t, uint64_t>
--   xor_CNs(const uint64_t A[25])
--   {
--   return {
--      A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20],
--      A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21],
--      A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22],
--      A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23],
--      A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
--   }
--
--#undef BOTAN_WORKAROUND_MAYBE_INLINE
--
- inline void SHA3_round(uint64_t T[25], const uint64_t A[25], uint64_t RC)
-    {
--   const auto Cs = xor_CNs(A);
--
--   const uint64_t D0 = rotl<1>(std::get<0>(Cs)) ^ std::get<3>(Cs);
--   const uint64_t D1 = rotl<1>(std::get<1>(Cs)) ^ std::get<4>(Cs);
--   const uint64_t D2 = rotl<1>(std::get<2>(Cs)) ^ std::get<0>(Cs);
--   const uint64_t D3 = rotl<1>(std::get<3>(Cs)) ^ std::get<1>(Cs);
--   const uint64_t D4 = rotl<1>(std::get<4>(Cs)) ^ std::get<2>(Cs);
-+   const uint64_t C0 = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
-+   const uint64_t C1 = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
-+   const uint64_t C2 = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
-+   const uint64_t C3 = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
-+   const uint64_t C4 = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
-+
-+   const uint64_t D0 = rotl<1>(C0) ^ C3;
-+   const uint64_t D1 = rotl<1>(C1) ^ C4;
-+   const uint64_t D2 = rotl<1>(C2) ^ C0;
-+   const uint64_t D3 = rotl<1>(C3) ^ C1;
-+   const uint64_t D4 = rotl<1>(C4) ^ C2;
- 
-    const uint64_t B00 =          A[ 0] ^ D1;
-    const uint64_t B01 = rotl<44>(A[ 6] ^ D2);
-diff --git a/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp b/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
-index c7f1914a3..a9650ad9d 100644
---- a/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
-+++ b/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
-@@ -8,47 +8,23 @@
- #include <botan/sha3.h>
- #include <botan/rotate.h>
- 
--#include <tuple>
--
- namespace Botan {
- 
- namespace {
- 
--// This is a workaround for a suspected bug in clang 12 (and XCode 13)
--// that caused a miscompile of the SHA3 implementation for optimization
--// level -O2 and higher.
--//
--// For details, see: https://github.com/randombit/botan/issues/2802
--#if    defined(__clang__) && \
--    (( defined(__apple_build_version__) && __clang_major__ == 13) || \
--     (!defined(__apple_build_version__) && __clang_major__ == 12))
--#define BOTAN_WORKAROUND_MAYBE_INLINE __attribute__((noinline))
--#else
--#define BOTAN_WORKAROUND_MAYBE_INLINE inline
--#endif
--
--BOTAN_WORKAROUND_MAYBE_INLINE std::tuple<uint64_t, uint64_t, uint64_t, uint64_t, uint64_t>
--   xor_CNs(const uint64_t A[25])
--   {
--   return {
--      A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20],
--      A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21],
--      A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22],
--      A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23],
--      A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
--   }
--
--#undef BOTAN_WORKAROUND_MAYBE_INLINE
--
- inline void SHA3_BMI2_round(uint64_t T[25], const uint64_t A[25], uint64_t RC)
-    {
--   const auto Cs = xor_CNs(A);
--
--   const uint64_t D0 = rotl<1>(std::get<0>(Cs)) ^ std::get<3>(Cs);
--   const uint64_t D1 = rotl<1>(std::get<1>(Cs)) ^ std::get<4>(Cs);
--   const uint64_t D2 = rotl<1>(std::get<2>(Cs)) ^ std::get<0>(Cs);
--   const uint64_t D3 = rotl<1>(std::get<3>(Cs)) ^ std::get<1>(Cs);
--   const uint64_t D4 = rotl<1>(std::get<4>(Cs)) ^ std::get<2>(Cs);
-+   const uint64_t C0 = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
-+   const uint64_t C1 = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
-+   const uint64_t C2 = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
-+   const uint64_t C3 = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
-+   const uint64_t C4 = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
-+
-+   const uint64_t D0 = rotl<1>(C0) ^ C3;
-+   const uint64_t D1 = rotl<1>(C1) ^ C4;
-+   const uint64_t D2 = rotl<1>(C2) ^ C0;
-+   const uint64_t D3 = rotl<1>(C3) ^ C1;
-+   const uint64_t D4 = rotl<1>(C4) ^ C2;
- 
-    const uint64_t B00 =          A[ 0] ^ D1;
-    const uint64_t B01 = rotl<44>(A[ 6] ^ D2);
--- 
-2.33.0
-
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index 91e1bf741a..2729cb493f 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  541a3b13f1b9d30f977c6c1ae4c7bfdfda763cda6e44de807369dce79f42307e  Botan-2.18.2.tar.xz
+sha256  e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560  Botan-2.19.1.tar.xz
 # Locally computed
-sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
+sha256  472faf6d2231130382779f96de506be19296473750356449fc426ddc9cb03b50  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 71bac19c8c..c95e97dcc3 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.18.2
+BOTAN_VERSION = 2.19.1
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
