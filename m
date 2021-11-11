Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0214BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:16:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEA861037
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 21:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FEA861037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AB4881CA0;
	Thu, 11 Nov 2021 21:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tK6GnEL_xB8V; Thu, 11 Nov 2021 21:16:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F5AF81CE3;
	Thu, 11 Nov 2021 21:16:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3ACF71BF388
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AC8540527
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 21:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t02wBaz2geDn for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 21:16:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 093CE403B9
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 21:16:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2dfd:466c:d080:8051])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2913519F553;
 Thu, 11 Nov 2021 22:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636665385;
 bh=UddI5tRWUj8tBcvC4mfHwG2UOpbiDSj+66dSVEM8TPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pyF5OHRlIFweJpBwACV4iAphBltCdgZaC5GmX2s9b57cQTwqHwi3Nf2pQZyM2fu86
 j5lsXREnibIFUoFo7TkMRKWdNVk48VvFTLogZXMS+7ddKNP84258H2BAfGJacIqACZ
 VseS9g4Vuyq3a5B6hibERKOYG7H3d6UCQr5Q4Ss0BsMOVM5IkfaXFy7G5A4R7HO7/V
 tG9GTq3/rmJrVXWotcYqh6O3loojB3rUUcUsnr/nspwj86tWbjZIYzqkzeGekyuuYY
 TCo7411q0acHDKidnEtxqIRK7hsUS9AWDkVvl1QNiGZu449roQ5udRNrV03oAhx977
 DZdNPTM0Ew1KA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 22:16:20 +0100
Date: Thu, 11 Nov 2021 22:16:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211111211620.GF2609@scaer>
References: <20211109220106.1645006-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109220106.1645006-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/botan: fix build on mips
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-09 23:01 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure on one mips toolchain with gcc 5.3
> raised since bump to version 2.18.2 in commit
> 47fa16dffa6c6a72b2f76984f6d492f4f352a52b:
> 
> src/lib/hash/sha3/sha3.cpp: In function 'std::tuple<long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int> Botan::{anonymous}::xor_CNs(const uint64_t*)':
> src/lib/hash/sha3/sha3.cpp:41:42: error: converting to 'std::tuple<long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int>' from initializer list would use explicit constructor 'constexpr std::tuple< <template-parameter-1-1> >::tuple(_UElements&& ...) [with _UElements = {long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int}; <template-parameter-2-2> = void; _Elements = {long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int, long long unsigned int}]'
>        A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
>                                           ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4e86c3008aa70284a3002f426066fcc21d018e95
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've added a small note that the revert is innocuous for us, and is
suggested by upstream, and then applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...d-a-miscompilation-issue-in-clang-12.patch | 144 ++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
> 
> diff --git a/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch b/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
> new file mode 100644
> index 0000000000..b43aeafe13
> --- /dev/null
> +++ b/package/botan/0001-Revert-workaround-a-miscompilation-issue-in-clang-12.patch
> @@ -0,0 +1,144 @@
> +From 372bdf0348fb86d671e73baab19daa34bd0cf73d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 9 Nov 2021 19:01:20 +0100
> +Subject: [PATCH] Revert "workaround a miscompilation issue in clang 12
> + (XCode 13)"
> +
> +This reverts commit 219329f8e777af54d785ae7259f8be32a714b751.
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/randombit/botan/issues/2845]
> +---
> + src/lib/hash/sha3/sha3.cpp                | 46 ++++++-----------------
> + src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp | 46 ++++++-----------------
> + 2 files changed, 22 insertions(+), 70 deletions(-)
> +
> +diff --git a/src/lib/hash/sha3/sha3.cpp b/src/lib/hash/sha3/sha3.cpp
> +index 289e451ff..690c2b264 100644
> +--- a/src/lib/hash/sha3/sha3.cpp
> ++++ b/src/lib/hash/sha3/sha3.cpp
> +@@ -11,47 +11,23 @@
> + #include <botan/exceptn.h>
> + #include <botan/cpuid.h>
> + 
> +-#include <tuple>
> +-
> + namespace Botan {
> + 
> + namespace {
> + 
> +-// This is a workaround for a suspected bug in clang 12 (and XCode 13)
> +-// that caused a miscompile of the SHA3 implementation for optimization
> +-// level -O2 and higher.
> +-//
> +-// For details, see: https://github.com/randombit/botan/issues/2802
> +-#if    defined(__clang__) && \
> +-    (( defined(__apple_build_version__) && __clang_major__ == 13) || \
> +-     (!defined(__apple_build_version__) && __clang_major__ == 12))
> +-#define BOTAN_WORKAROUND_MAYBE_INLINE __attribute__((noinline))
> +-#else
> +-#define BOTAN_WORKAROUND_MAYBE_INLINE inline
> +-#endif
> +-
> +-BOTAN_WORKAROUND_MAYBE_INLINE std::tuple<uint64_t, uint64_t, uint64_t, uint64_t, uint64_t>
> +-   xor_CNs(const uint64_t A[25])
> +-   {
> +-   return {
> +-      A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20],
> +-      A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21],
> +-      A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22],
> +-      A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23],
> +-      A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
> +-   }
> +-
> +-#undef BOTAN_WORKAROUND_MAYBE_INLINE
> +-
> + inline void SHA3_round(uint64_t T[25], const uint64_t A[25], uint64_t RC)
> +    {
> +-   const auto Cs = xor_CNs(A);
> +-
> +-   const uint64_t D0 = rotl<1>(std::get<0>(Cs)) ^ std::get<3>(Cs);
> +-   const uint64_t D1 = rotl<1>(std::get<1>(Cs)) ^ std::get<4>(Cs);
> +-   const uint64_t D2 = rotl<1>(std::get<2>(Cs)) ^ std::get<0>(Cs);
> +-   const uint64_t D3 = rotl<1>(std::get<3>(Cs)) ^ std::get<1>(Cs);
> +-   const uint64_t D4 = rotl<1>(std::get<4>(Cs)) ^ std::get<2>(Cs);
> ++   const uint64_t C0 = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
> ++   const uint64_t C1 = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
> ++   const uint64_t C2 = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
> ++   const uint64_t C3 = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
> ++   const uint64_t C4 = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
> ++
> ++   const uint64_t D0 = rotl<1>(C0) ^ C3;
> ++   const uint64_t D1 = rotl<1>(C1) ^ C4;
> ++   const uint64_t D2 = rotl<1>(C2) ^ C0;
> ++   const uint64_t D3 = rotl<1>(C3) ^ C1;
> ++   const uint64_t D4 = rotl<1>(C4) ^ C2;
> + 
> +    const uint64_t B00 =          A[ 0] ^ D1;
> +    const uint64_t B01 = rotl<44>(A[ 6] ^ D2);
> +diff --git a/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp b/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
> +index c7f1914a3..a9650ad9d 100644
> +--- a/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
> ++++ b/src/lib/hash/sha3/sha3_bmi2/sha3_bmi2.cpp
> +@@ -8,47 +8,23 @@
> + #include <botan/sha3.h>
> + #include <botan/rotate.h>
> + 
> +-#include <tuple>
> +-
> + namespace Botan {
> + 
> + namespace {
> + 
> +-// This is a workaround for a suspected bug in clang 12 (and XCode 13)
> +-// that caused a miscompile of the SHA3 implementation for optimization
> +-// level -O2 and higher.
> +-//
> +-// For details, see: https://github.com/randombit/botan/issues/2802
> +-#if    defined(__clang__) && \
> +-    (( defined(__apple_build_version__) && __clang_major__ == 13) || \
> +-     (!defined(__apple_build_version__) && __clang_major__ == 12))
> +-#define BOTAN_WORKAROUND_MAYBE_INLINE __attribute__((noinline))
> +-#else
> +-#define BOTAN_WORKAROUND_MAYBE_INLINE inline
> +-#endif
> +-
> +-BOTAN_WORKAROUND_MAYBE_INLINE std::tuple<uint64_t, uint64_t, uint64_t, uint64_t, uint64_t>
> +-   xor_CNs(const uint64_t A[25])
> +-   {
> +-   return {
> +-      A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20],
> +-      A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21],
> +-      A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22],
> +-      A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23],
> +-      A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24]};
> +-   }
> +-
> +-#undef BOTAN_WORKAROUND_MAYBE_INLINE
> +-
> + inline void SHA3_BMI2_round(uint64_t T[25], const uint64_t A[25], uint64_t RC)
> +    {
> +-   const auto Cs = xor_CNs(A);
> +-
> +-   const uint64_t D0 = rotl<1>(std::get<0>(Cs)) ^ std::get<3>(Cs);
> +-   const uint64_t D1 = rotl<1>(std::get<1>(Cs)) ^ std::get<4>(Cs);
> +-   const uint64_t D2 = rotl<1>(std::get<2>(Cs)) ^ std::get<0>(Cs);
> +-   const uint64_t D3 = rotl<1>(std::get<3>(Cs)) ^ std::get<1>(Cs);
> +-   const uint64_t D4 = rotl<1>(std::get<4>(Cs)) ^ std::get<2>(Cs);
> ++   const uint64_t C0 = A[0] ^ A[5] ^ A[10] ^ A[15] ^ A[20];
> ++   const uint64_t C1 = A[1] ^ A[6] ^ A[11] ^ A[16] ^ A[21];
> ++   const uint64_t C2 = A[2] ^ A[7] ^ A[12] ^ A[17] ^ A[22];
> ++   const uint64_t C3 = A[3] ^ A[8] ^ A[13] ^ A[18] ^ A[23];
> ++   const uint64_t C4 = A[4] ^ A[9] ^ A[14] ^ A[19] ^ A[24];
> ++
> ++   const uint64_t D0 = rotl<1>(C0) ^ C3;
> ++   const uint64_t D1 = rotl<1>(C1) ^ C4;
> ++   const uint64_t D2 = rotl<1>(C2) ^ C0;
> ++   const uint64_t D3 = rotl<1>(C3) ^ C1;
> ++   const uint64_t D4 = rotl<1>(C4) ^ C2;
> + 
> +    const uint64_t B00 =          A[ 0] ^ D1;
> +    const uint64_t B01 = rotl<44>(A[ 6] ^ D2);
> +-- 
> +2.33.0
> +
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
