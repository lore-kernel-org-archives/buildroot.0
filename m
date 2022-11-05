Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D79C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 18:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E0EF408D2;
	Sat,  5 Nov 2022 18:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E0EF408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbCmhBGlt1DU; Sat,  5 Nov 2022 18:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E45B408BE;
	Sat,  5 Nov 2022 18:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E45B408BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3DA1BF46D
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72D3C81307
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D3C81307
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iL9ydtRPtM0 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 18:02:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F0E8812F8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F0E8812F8
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 18:02:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B530C5FF7A;
 Sat,  5 Nov 2022 19:01:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 05 Nov 2022 19:01:56 +0100
Date: Sat, 5 Nov 2022 19:01:56 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20221105180156.GJ3918838@scaer>
References: <20221105165524.747494-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221105165524.747494-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667671319;
 bh=S6zwQ4Cmz1QjN1Zmvt0KYtHJa36ldbmgMO+O7K/T5EU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nSx9ocbyYKyR8LzGbWvHQTs/mqyeajTnCR/U/H9ed7SsJslSXxIs+VicicxOn1ntl
 nVYNszYq/kB0uS1e+XYIaCAlDvlH5KYlSLmVzNz/T1uwi3GfFI2i098Ou0uVxLMJto
 i/cTEIVZRM7m741sxDg9qA87q//iVRY2/Rs/ZDp/jqi7q5nggay8uRv6u+1bBS65/M
 cAeQr1gpFGQnPZMEVnbgM72/nHDyEdCiMk1B+UFmQ6J6VzsLJ7r0S5Xu1dvBts845I
 x8exzaYSAdyhFvkYY8Sans82ajrDlcloEjGJ9vWfPTQG1y7bHB8rPiD306i+VutdaX
 SjirLonfbBNPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nSx9ocby
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenssl: drop useles option
 for rc5
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
Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>, "Weber,
 Matthew L Collins" <Matthew.Weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2022-11-05 17:55 +0100, Yann E. MORIN spake thusly:
> Commit a83d41867c8d (package/libopenssl: add option to enable some
> features) added an option to enabled rc5. However, since commit
> 1fff94121936 (Fixup non-x86 openssl build), dated 2002-12-30, rc5
> has always been forcibly disabled in Buildrrot.
> 
> Given that it was unconditionally disabled all those times

It seems I did not finish my sentence... So, the full sentence should
read something like:

    Given that it was unconditionally disabled all those times, and no
    one complained, itmeans there is virtually noone using rc5, so we
    can just ropt the option.

Regards,
Yann E. MORIN.

> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
> Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
> ---
>  Config.in.legacy                 | 7 +++++++
>  package/libopenssl/Config.in     | 4 ----
>  package/libopenssl/libopenssl.mk | 1 -
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 0e63d59a98..8efc7ea976 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2022.11"
>  
> +config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
> +	bool "libopenssl rc5 was never enabled"
> +	select BR2_LEGACY
> +	help
> +	  The libopenssl option for rc5 never actually enabled rc5,
> +	  which had always been disabled in Buildroot.
> +
>  config BR2_KERNEL_HEADERS_5_17
>  	bool "kernel headers version 5.17.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
> index fcead4c11a..00339238fb 100644
> --- a/package/libopenssl/Config.in
> +++ b/package/libopenssl/Config.in
> @@ -44,10 +44,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
>  	bool "enable CHACHA"
>  	default y
>  
> -config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
> -	bool "enable RC5"
> -	default y
> -
>  config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2
>  	bool "enable RC2"
>  	default y
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 50d41a6533..3542b89727 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -85,7 +85,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
>  			no-fuzz-afl \
>  			no-afalgeng \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
> -			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5),,no-rc5) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
>  			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2),,no-md2) \
> -- 
> 2.25.1
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
