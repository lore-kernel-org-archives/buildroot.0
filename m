Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E25C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:45:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4209460EE4
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 12:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4209460EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CA0D40105;
	Sun, 14 Nov 2021 12:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvwUgUSSVKWz; Sun, 14 Nov 2021 12:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E76D24017D;
	Sun, 14 Nov 2021 12:45:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2717E1BF34C
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15DEB60687
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 12:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KHP9hY1MEB2W for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 12:45:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFC3560667
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 12:45:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:588e:4f72:56a8:ef3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4257A780313;
 Sun, 14 Nov 2021 13:45:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636893911;
 bh=i9EgLrXbfyUwJKaeT6D2NFjXU6Ggy7EL4inBjTEkpIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M1lsNdYwz5vIZIwpuG+SoUewSXmI4YChfTgh1hOxEMXUrR7V/CQ+69fXq1bsrZ1RT
 MmEVsaKmjjcoCG4nYMTrOyyYbiNFyNTN09TzwWIfIu8rPQ8koD2URsMlsA4w0rHgWx
 YcfL+4wXlhEeGnf7CRxcFkLeR6NvBupiBKi40DjVfuprp18lE9aXU+522o1mbCsnx4
 8XkeClEoZxQ1cFNOnanuBCUTdCC+QuJBNvR3rlgtICz3kNcHupGHIC7VMD+GNPwtQO
 2WPxb4dunNjmu4CtChoAxthMCCY/x5DZSO7IZehEV6lpkrHtaWe7CKbvWxLBtf/rNC
 GBaLgeW30iL0w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Nov 2021 13:45:04 +0100
Date: Sun, 14 Nov 2021 13:45:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211114124504.GW247986@scaer>
References: <20211114114342.1316711-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211114114342.1316711-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/sg3_utils: fix musl build
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-14 12:43 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised on musl since bump to version
> 1.47 in commit 710b0eaebeb25d7718bfb10e87f0d67adfaf8c2f and
> https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675:
> 
> sg_dd.c: In function 'main':
> sg_dd.c:2402:17: error: unknown type name 'uint'; did you mean 'int'?
>  2402 |                 uint off;
>       |                 ^~~~
>       |                 int
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9ead59ffefefe2a4e3b94a153b3d23231736d882
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-src-sg_dd.c-fix-musl-build.patch     | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
> 
> diff --git a/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch b/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
> new file mode 100644
> index 0000000000..50a81a78a4
> --- /dev/null
> +++ b/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
> @@ -0,0 +1,39 @@
> +From c93ad13ecd8ddfbb8bb3e4d5d5ad7f3f2c633db6 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 14 Nov 2021 12:37:16 +0100
> +Subject: [PATCH] src/sg_dd.c: fix musl build
> +
> +Fix the following build failure on musl raised since version 1.47 and
> +https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675:
> +
> +sg_dd.c: In function 'main':
> +sg_dd.c:2402:17: error: unknown type name 'uint'; did you mean 'int'?
> + 2402 |                 uint off;
> +      |                 ^~~~
> +      |                 int
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/9ead59ffefefe2a4e3b94a153b3d23231736d882
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/7]
> +---
> + src/sg_dd.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/sg_dd.c b/src/sg_dd.c
> +index 9d05c93..35e2423 100644
> +--- a/src/sg_dd.c
> ++++ b/src/sg_dd.c
> +@@ -2399,7 +2399,7 @@ main(int argc, char * argv[])
> +             res = blocks * blk_sz;
> +             if (iflag.zero && iflag.ff && (blk_sz >= 4)) {
> +                 uint32_t pos = (uint32_t)skip;
> +-                uint off;
> ++                uint32_t off;
> + 
> +                 for (k = 0, off = 0; k < blocks; ++k, off += blk_sz, ++pos) {
> +                     for (j = 0; j < (blk_sz - 3); j += 4)
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
