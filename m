Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388A3C5AD44
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 15:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0644B80EBE;
	Sat,  8 Aug 2026 15:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZEeO0XgkPKKC; Sat,  8 Aug 2026 15:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC66180EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786204519;
	bh=av9N415JtraIsd/sNqWf0goxrnkfuJdtEfHrbG9jYjE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q4TeJovdMDhgnuHgdnwpMDAq4HhSKUOtSJXkHYsQQdOim+ir9eCQKKYlkegtHRcb7
	 LcNlpVls0HgivpCzFisZgjvwu5mYZT7KA6dVLrJK0I1xeQK6Kmyy+pYYGPhBXl57wR
	 1aq34Y5uR6LJLgj23s2/MsLiR0f+rVWtCEKLQcsos2oZb48fXLMujFfVRmflWkxRXq
	 r7sM2RKYolET74vyIzeyGTh3wW7UrSl2RB8K8TVNkSh54UO4oWA/DKm8n381IGwPtE
	 gn9wUrBuq412Jj5v2boBk6YJ8ksMAXMYfj/0EZdkZcndc/9QsKH+JkQjvB1H1zAUj/
	 ub3sY/HrQH2Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC66180EA2;
	Sat,  8 Aug 2026 15:55:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 658D23C1
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B59B605EE
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnvdAT3vq1B6 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 15:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B5B6068F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51B5B6068F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 15:55:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 313468C5CF; Sat,  8 Aug 2026 15:54:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 17:26:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ff577bb35d7f15a924298ae56cb46f694a22ef1
X-Git-Newrev: 402c94c2d70d617783a2cd9bb2c90556008b79ba
X-Patchwork-Hint: ignore
Message-Id: <20260808155429.313468C5CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: security bump to version
 3.11.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/402c94c2d70d617783a2cd9bb2c90556008b79ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- Update BOTAN_VERSION to 3.11.1
- Remove 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
  as it is already integrated upstream in this version.

Fixed in 3.11.1:
- CVE-2026-34580: Resolve certificate verification bypass bug introduced
  in 3.11.0 (GH #5500)
- CVE-2026-34582: Resolve TLS 1.3 client authentication bypass (GH #5599)

Fixed in 3.11.0:
- CVE-2026-32877: Fix a heap over-read during SM2 decryption (GH #5450)
- CVE-2026-32883: Fix an OCSP response forgery vulnerability (GH #5449)
- CVE-2026-32884: Fix a name constraints bypass for DNS names (GH #5448)

- Remove the --disable-altivec configuration option as it has been removed
  from the Botan build system in version 3.x
- Optimize the --disable-neon logic using the yx pattern.
  In Botan 3.x, the --disable-neon flag is specifically targeted at the
  arm32 architecture. Furthermore, Buildroot's BR2_ARM_CPU_HAS_NEON
  variable is only defined for 32-bit ARM, which previously caused a
  false-positive --disable-neon flag to be passed on AArch64 builds
- Update license.txt hash in botan.hash due to the copyright year update
  to 2026

https://botan.randombit.net/news.html#version-3-11-1-2026-03-31

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: fix CVE numbers in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...s-to-avoid-compiler-induced-side-channels.patch | 65 ----------------------
 package/botan/botan.hash                           |  4 +-
 package/botan/botan.mk                             | 11 +---
 3 files changed, 4 insertions(+), 76 deletions(-)

diff --git a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch b/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
deleted file mode 100644
index 22f64be1b9..0000000000
--- a/package/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 53b0cfde580e86b03d0d27a488b6c134f662e957 Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Sat, 19 Oct 2024 07:43:18 -0400
-Subject: [PATCH] Add more value barriers to avoid compiler induced side
- channels
-
-The paper https://arxiv.org/pdf/2410.13489 claims that on specific
-architectures Clang and GCC may introduce jumps here. The donna128
-issues only affect 32-bit processors, which explains why we would not
-see it in the x86-64 valgrind runs.
-
-The GHASH leak would seem to be generic but the authors only observed
-it on RISC-V.
-
-CVE: CVE-2024-50382
-CVE: CVE-2024-50383
-Upstream: https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/lib/utils/donna128.h      | 5 +++--
- src/lib/utils/ghash/ghash.cpp | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/lib/utils/donna128.h b/src/lib/utils/donna128.h
-index 8212bd349e0..7adf54546df 100644
---- a/src/lib/utils/donna128.h
-+++ b/src/lib/utils/donna128.h
-@@ -8,6 +8,7 @@
- #ifndef BOTAN_CURVE25519_DONNA128_H_
- #define BOTAN_CURVE25519_DONNA128_H_
- 
-+#include <botan/internal/ct_utils.h>
- #include <botan/internal/mul128.h>
- #include <type_traits>
- 
-@@ -73,14 +74,14 @@ class donna128 final {
-          l += x.l;
-          h += x.h;
- 
--         const uint64_t carry = (l < x.l);
-+         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x.l).if_set_return(1);
-          h += carry;
-          return *this;
-       }
- 
-       constexpr donna128& operator+=(uint64_t x) {
-          l += x;
--         const uint64_t carry = (l < x);
-+         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x).if_set_return(1);
-          h += carry;
-          return *this;
-       }
-diff --git a/src/lib/utils/ghash/ghash.cpp b/src/lib/utils/ghash/ghash.cpp
-index 8c3b1ed6c2a..61b28590002 100644
---- a/src/lib/utils/ghash/ghash.cpp
-+++ b/src/lib/utils/ghash/ghash.cpp
-@@ -131,7 +131,7 @@ void GHASH::key_schedule(std::span<const uint8_t> key) {
-          m_HM[4 * j + 2 * i + 1] = H1;
- 
-          // GCM's bit ops are reversed so we carry out of the bottom
--         const uint64_t carry = R * (H1 & 1);
-+         const uint64_t carry = CT::Mask<uint64_t>::expand(H1 & 1).if_set_return(R);
-          H1 = (H1 >> 1) | (H0 << 63);
-          H0 = (H0 >> 1) ^ carry;
-       }
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index d948271900..6b391c06a3 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f  Botan-3.5.0.tar.xz
+sha256  c1cd7152519f4188591fa4f6ddeb116bc1004491f5f3c58aa99b00582eb8a137  Botan-3.11.1.tar.xz
 # Locally computed
-sha256  db9168bdccaaea26557094436652577cc9bf43164e8be078d88aef1342fe4fb6  license.txt
+sha256  758ea6b4a65d5611bf79c24920f92473ef44bdde0b3b97fa578470a0ffc34f14  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 115cce6765..fcaf3aa28e 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 3.5.0
+BOTAN_VERSION = 3.11.1
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VALID = YES
 
-# 0001-Add-more-value-barriers-to-avoid-compiler-induced-side-channels.patch
-BOTAN_IGNORE_CVES += CVE-2024-50382 CVE-2024-50383
-
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_DEPENDENCIES = host-python3
@@ -91,11 +88,7 @@ BOTAN_DEPENDENCIES += zlib
 BOTAN_CONF_OPTS += --with-zlib
 endif
 
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
-BOTAN_CONF_OPTS += --disable-altivec
-endif
-
-ifeq ($(BR2_ARM_CPU_HAS_NEON),)
+ifeq ($(BR2_arm)x$(BR2_ARM_CPU_HAS_NEON),yx)
 BOTAN_CONF_OPTS += --disable-neon
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
