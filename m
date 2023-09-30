Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81435E7737C
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 387F4415BB;
	Sat, 30 Sep 2023 17:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 387F4415BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z2j6VM0P6-_c; Sat, 30 Sep 2023 17:20:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 539EC415B5;
	Sat, 30 Sep 2023 17:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 539EC415B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D2B11BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6828681380
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6828681380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIqb2lyY3g5e for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:20:19 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7078E81312
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7078E81312
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6AC38B0051B;
 Sat, 30 Sep 2023 19:20:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 19:20:14 +0200
Date: Sat, 30 Sep 2023 19:20:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230930172014.GG2579@scaer>
References: <20230930102328.537070-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930102328.537070-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696094417;
 bh=wCeF5LEGstVgRAb9ZowlylwRUX9GhN5p9DGmNDHNYX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rsRVkK+keRAwgAUkODXSP/IcWkWzic4UPzwZSltwwyl4l1iJUZ1VTooVq7AH3vLho
 C3DvCNsZbNbZasWkQA/F2CiTkC+Fsok1px5FPW7OudfvC0nsVJRrnTBRSuRN3TSKfC
 CC7xc79ffQoG0htpKSXfHHg9B1oZZCb+MEAYvFqdiiOG1R6TZOePpd9pcMKVfQOi0n
 iZ4Nr2iPAbr/qwIHH2F6ZWZEz4lthfG98b5l8nDy1vWFZOM9Qxw6Hu/Hn9ibwYtksA
 2Dal5N22p2RaF8lrUsiuDSA5/qsQklzYYhVKrViFTzwhGV5E9C9vly2N/lmNutOA2n
 k0Uw7l9wgRxgw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rsRVkK+k
Subject: Re: [Buildroot] [PATCH] package/gnu-efi: disable on mips64el
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-09-30 12:23 +0200, Thomas Petazzoni via buildroot spake thusly:
> The gnu-efi package was enabled on mips64el by commit
> 11b347c03ab0b38389ec11b48f63236a3b4d6547 ("package/gnu-efi: add
> mips64el support"). However, it has been failing to build for a long
> time, and nobody bothered fixing it:
> 
> gnu-efi-3.0.15//gnuefi/crt0-efi-mips64el.S:71: Error: cannot represent BFD_RELOC_16 relocation in this object file format
> 
> Even reverting back to gnu-efi 3.0.10, which was the version used at
> the time of 11b347c03ab0b38389ec11b48f63236a3b4d6547, does not fix the
> issue. We tested updating to the latest gnu-efi version, 3.0.17, and
> the problem still exists.
> 
> Since EFI on MIPS is extremely niche, we don't really want to invest
> the time to fix this issue, so let's disable it again. If someone
> cares enough, it can be fixed and re-enabled.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/d5938edcf50ebb7fdcec148d73f402845079779d/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gnu-efi/Config.in  | 1 -
>  package/gnu-efi/gnu-efi.mk | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
> index 8e35fddbcb..d456a23837 100644
> --- a/package/gnu-efi/Config.in
> +++ b/package/gnu-efi/Config.in
> @@ -4,7 +4,6 @@ config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
>  	default y if BR2_aarch64
>  	default y if BR2_aarch64_be
>  	default y if BR2_i386
> -	default y if BR2_mips64el
>  	default y if BR2_x86_64
>  
>  config BR2_PACKAGE_GNU_EFI
> diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
> index 93b5888370..686a14be01 100644
> --- a/package/gnu-efi/gnu-efi.mk
> +++ b/package/gnu-efi/gnu-efi.mk
> @@ -24,8 +24,6 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
>  GNU_EFI_PLATFORM = arm
>  else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
>  GNU_EFI_PLATFORM = aarch64
> -else ifeq ($(BR2_mips64el),y)
> -GNU_EFI_PLATFORM = mips64el
>  endif
>  
>  GNU_EFI_MAKE_OPTS = \
> -- 
> 2.41.0
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
