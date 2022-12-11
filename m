Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EC3C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C38A4052B;
	Sun, 11 Dec 2022 16:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C38A4052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yq6Ryl4gGGjq; Sun, 11 Dec 2022 16:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA7CF4047B;
	Sun, 11 Dec 2022 16:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA7CF4047B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B54FE1BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90CAF4047B
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90CAF4047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4lfGG51LKSI for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:38:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD5840241
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CD5840241
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:38:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c8de:37ee:6661:285c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D7DD513F86E;
 Sun, 11 Dec 2022 17:37:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 17:37:58 +0100
Date: Sun, 11 Dec 2022 17:37:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20221211163758.GU1044805@scaer>
References: <20221208110247.7002c3ca@c3po>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208110247.7002c3ca@c3po>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670776681;
 bh=fibB4Kgw/k24YZ80pZ820sY1sF7R9C0hWq19rLOa+fM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N+h9aIL1FbS/6GgjV80Cy590zi8zH6F682EGuwizAbkRJjmDX0gedsgLARQexdGgl
 6DenbD8Tz7DKyH3P5RdVs6q0Iy4UQWYXTXERh8REI8L4FSl4+Bs96wsgeJERiorSdJ
 WNwEELbwg4bIaxtG9aU1oXMJWPDYVhyq0kgU/GCqmK3KPO0sgTY0fTXRZupVUI3wxt
 4/m1qEasFlVhq9P0Bq6U1yW/ikxvxpBvVHtz4NSjCicAsJX6vmnBd2YBAGd2wLVt7N
 xgTsgpL7fw/x9f5MZyfQQYAnv1stydW7P4gwk9iNn2ESU0bpmZh/JxWra0wCabV9+W
 4Tzy13JIzNrIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N+h9aIL1
Subject: Re: [Buildroot] [PATCH 1/1] package/tealdeer: exclude unsupported
 targets
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

Danilo, All,

On 2022-12-08 11:02 +0100, Danilo Bargen spake thusly:
> Not all target architectures are supported by the "ring" dependency.
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
> ---
>  package/tealdeer/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/tealdeer/Config.in b/package/tealdeer/Config.in
> index 96ed81614b..a61a59f3ee 100644
> --- a/package/tealdeer/Config.in
> +++ b/package/tealdeer/Config.in
> @@ -1,6 +1,14 @@
>  config BR2_PACKAGE_TEALDEER
>  	bool "tealdeer"
>  	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +    # Crypto dependency (ring) not available for mips:
> https://github.com/briansmith/ring/issues/562
> +    depends on !(BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el)
> +    # Crypto dependency (ring) not available for PowerPC:
> https://github.com/briansmith/ring/issues/389
> +    depends on !(BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le)
> +    # Crypto dependency (ring) not available for Sparc:
> https://github.com/briansmith/ring/issues/1512
> +    depends on !(BR2_sparc || BR2_sparc64)
> +    # Crypto dependency (ring) not available for s390x:
> https://github.com/briansmith/ring/commit/4d2e1a8fb80398f7c3c0137ea8fdd512f82d37a0
> +    depends on !BR2_s390x

As Thomas already noted, this patch is badly broken.

I've massaged into back into something that looks nicer, and applied to
master, after simplifying the comment and moving the references to the
commit log.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_HOST_RUSTC
>  	help
>  	  A fast and full-featured tldr client. tldr pages are
> --
> 2.38.1
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
