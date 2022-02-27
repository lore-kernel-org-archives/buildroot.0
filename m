Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4406AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 09:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B896400FD;
	Sun, 27 Feb 2022 09:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 65eFlPnzSU7c; Sun, 27 Feb 2022 09:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5271B40467;
	Sun, 27 Feb 2022 09:15:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2171BF329
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 09:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37FDA40467
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 09:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DyisBN_ryeup for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 09:15:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC1EB400FD
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 09:15:53 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so6255938wmj.1
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 01:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I4SFaxfenV2l31lN5MkQl5gT+BJg+afyApymSehZTwY=;
 b=eeQL+XdvNiO7XjKLio37k6fm0PpDubTGcnYsR2cPpstbHRDeY20u/xII3H3V3hTy8a
 gvskHUF3junkq32hTjmZJvSb60gIz8Cd+QY7bynUxDCxaFqg0Gi7CTS7dYonKS/vL1Je
 fLnC9puOXuIIpWmgaR0RH2gBPUhgFn0rBnHASbOAlykXF2NGJ/lfR2kO4ib9s3AaLFYc
 WoB6V/k1uB90BZADmvxrO45lGYlxSLgl5EpfORwdIVDPyYMR/2jg/4G3wnH4JClfk5Qa
 Vy8r//h0wwwulrEvQTRpxDW7ze7yFTNQXPb8549RtwP1dgQKHQdSdLTuS3jnsl97wnTQ
 HJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I4SFaxfenV2l31lN5MkQl5gT+BJg+afyApymSehZTwY=;
 b=duU27lD81X47UkNtkGCKdb5g+tcipzn1Umrl8GSJBu42KwfIpfk9zdqT7KyVB7GGb3
 NNtOlgLPGGP6fYM+V8uObEtft8Xx5H1f3OM2uyJYAo2t0KH90TjEJSjVt7qfanYsbQCR
 XFJDRhNdpJnH/ltgXqyDlufrBosFsHjqJJIzdt88Hmt99wlwfFKMgn5T3xBeJ6pTpqcj
 VN1eZhVbHSrCQlklzdhG1t2K804vz+CuYa0qF/EEfF7MuKMY0br0U2Z4l0JOSg1GoH7d
 vePOww7CtYI5SJYEgN9WvRNHsaXmBD+5ZUTdudzydUcFfN6nDlqfesPngu+VwX0H6JFk
 Vplw==
X-Gm-Message-State: AOAM5303JxaLFcHP62uYPlFnMsgmYGZC3V5Dln72Y8mBVSTjVz167CQl
 NRQVibmFWX0QZOSzW0wjaPDQu1IkyaM=
X-Google-Smtp-Source: ABdhPJzCThBK2oeEPpJFDFu1PHpAwAzY62EQPG2ivgvDeY0b9D4CdZC8ag9LWSC8p9HeBqfv3yMOXg==
X-Received: by 2002:a1c:a916:0:b0:380:eb26:a580 with SMTP id
 s22-20020a1ca916000000b00380eb26a580mr9665876wme.91.1645953351522; 
 Sun, 27 Feb 2022 01:15:51 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j7-20020adff547000000b001e3241df64bsm6995286wrp.112.2022.02.27.01.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 01:15:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 10:15:33 +0100
Message-Id: <20220227091533.3645027-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/botan: bump to version 2.19.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (not needed since
  https://github.com/randombit/botan/commit/97483f93bdcfcb2cc86bcb103802be55c24ad633)
- Update hash of license file (update in year:
  https://github.com/randombit/botan/commit/ff62a51ac2ed2e265edaf51b532d32eed5864d4b)

https://github.com/randombit/botan/blob/2.19.1/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-a-miscompilation-issue-in-clang-12.patch | 144 ------------------
 package/botan/botan.hash                      |   4 +-
 package/botan/botan.mk                        |   2 +-
 3 files changed, 3 insertions(+), 147 deletions(-)
 delete mode 100644 package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch

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
index ebff1343b1..f9ebcf8d0a 100644
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
