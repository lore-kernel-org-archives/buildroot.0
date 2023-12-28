Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E59CC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 21:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B7274177C;
	Thu, 28 Dec 2023 21:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7274177C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ub3TM35y45n; Thu, 28 Dec 2023 21:04:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9369841773;
	Thu, 28 Dec 2023 21:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9369841773
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1FFC1BF336
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 21:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8A27402C3
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 21:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8A27402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FncstbBTheWo for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 21:04:33 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DB6B4014B
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 21:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DB6B4014B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5F269B0037C;
 Thu, 28 Dec 2023 22:04:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 28 Dec 2023 22:04:28 +0100
Date: Thu, 28 Dec 2023 22:04:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZY3i3EWN0aEKOVrS@landeda>
References: <20231227171343.2903354-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227171343.2903354-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703797470;
 bh=XGuBCX1BVcEsrIQgJSfVjphLXuTkDOHtLPfXoovax5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jkil69BOHVOcs9i7pVkNUjalN5jPJA0hqmseJcPTFO5rlX/AxGus3LwXeEh9Hb0RT
 Us4OjUOhNg1QYGt6/ZfcNFtdpIPAdfyGKCrs7+0NccWj3CIa3F88JcN+1A6TeQ/+aI
 CVUpJrf4TdgrJNTxkK9ivXEh9l8ts+bkkMBXakk3Qb3Sn2Ty/elQm59h/eCtWO626U
 BZOsUpFv9a5Due2Qm+wzUXlNdFjrBZQ2mAKdjgOCKrpfMT4fP4c19gxu0dgUlbRdsI
 YGKM+me9Z+20SrxEGyqYVZT1VG8IVj0X3HuzzOin89yvbCOJwPRX0Teuumpj5eTvGf
 +3fH4cQopjr1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jkil69BO
Subject: Re: [Buildroot] [PATCH 1/2] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_14
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

Thomas, All,

On 2023-12-27 18:13 +0100, Thomas Petazzoni via buildroot spake thusly:
> Since commit
> a0d2a5cfec0ade7cb577cbff25aac289e746e61b ("support/scripts/gen-bootlin-toolchains:
> generate BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard"), the
> gen-bootlin-toolchains script will generate references to
> BR2_ARCH_NEEDS_GCC_AT_LEAST_X including potentially against the "next"
> version of gcc.
> 
> Indeed, a toolchain using gcc 13.x should have a "depends on
> !BR2_ARCH_NEEDS_GCC_AT_LEAST_14" so that once some architectures that
> require gcc 14.x are added, such toolchains are not made visible.
> 
> In order for this to work, we must have the
> BR2_ARCH_NEEDS_GCC_AT_LEAST_x symbol ready for the N+1 version of gcc
> compared to the latest one we support.
> 
> As we're supporting up to gcc 13.x right now, let's introduce the
> symbol BR2_ARCH_NEEDS_GCC_AT_LEAST_14 so that gcc 13.x toolchains can
> be marked depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14.
> 
> The other alternative would be to make the gen-bootlin-toolchains a
> bit smarter, and not emit this depends on
> !BR2_ARCH_NEEDS_GCC_AT_LEAST_14 if BR2_ARCH_NEEDS_GCC_AT_LEAST_14 does
> not exist. But this would require re-running the script when
> BR2_ARCH_NEEDS_GCC_AT_LEAST_14 which we are unlikely to do. While
> today, when the script is invoked, the usual check-symbols complains
> and reminds us that BR2_ARCH_NEEDS_GCC_AT_LEAST_14 should be added, so
> we remember to do it right away.

I was originally of the opinion that we should make the script smarte
and not emit missing sumbols, buth the rationale you put forward has
convinced me.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index e37f4dab1d..9912f9fce6 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -313,6 +313,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_13
>  	bool
>  	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
>  
> +config BR2_ARCH_NEEDS_GCC_AT_LEAST_14
> +	bool
> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
> +
>  # The following string values are defined by the individual
>  # Config.in.$ARCH files
>  config BR2_ARCH
> -- 
> 2.43.0
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
