Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE120C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2BC80C31;
	Mon,  3 Jul 2023 20:03:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E2BC80C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LBeuK8s4Sv_v; Mon,  3 Jul 2023 20:03:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA70381776;
	Mon,  3 Jul 2023 20:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA70381776
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 940591BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A8F381424
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A8F381424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KaAAOPblMBW4 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:03:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8838D80C31
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8838D80C31
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:03:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 99894200586;
 Mon,  3 Jul 2023 22:03:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 22:03:27 +0200
Date: Mon, 3 Jul 2023 22:03:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703200327.GJ2510@scaer>
References: <20230702144829.3356214-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702144829.3356214-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688414609;
 bh=fV1NReQ9N/WsGdh/ZVuli5tlqpaaI5usKJrrbXQOJYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ocsG4wtTS3WrM75gZjmojLodIo5+y1TyDkpEkUE++xNqsJ4VJ7VI2s4mMElVYifeG
 UAaaTS0fFmGIVEO8IIT52zJKThG81iyTkPRBBaXdcSjVEPiwIEA0qL1m85jSYnbIN3
 U+adG5uISb7mGg2IfQ7tixhrqbV2Bkby0EKxgDHRMm0tv+TB7UFdjxDs1gjwWlo8ty
 KSDwUp7ri5YU9JRXt2AVV94BWkYQQqGjQW7IQO88AZerxvpmrQGRtlnp93Y3KfjIu+
 4I6ZDtCKEh1X5kBZshzioIcoA8RCGCPYur44/aABC21V8p9RJzP1wgxkT/z8cadA4Y
 8kc3k+JS9HJIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ocsG4wtT
Subject: Re: [Buildroot] [PATCH 1/1] libgcrypt: disable assembly for i386
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

Bernd, All,

On 2023-07-02 16:48 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/3df/3df96fe36802d8c6ac5487bf3d7d7b6c97591d5e/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libgcrypt/libgcrypt.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
> index 4fffe5360e..bd7b1aa091 100644
> --- a/package/libgcrypt/libgcrypt.mk
> +++ b/package/libgcrypt/libgcrypt.mk
> @@ -21,8 +21,8 @@ LIBGCRYPT_CONF_OPTS = \
>  	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
>  	--with-gpg-error-prefix=$(STAGING_DIR)/usr
>  
> -# Libgcrypt doesn't support assembly for coldfire
> -ifeq ($(BR2_m68k_cf),y)
> +# Libgcrypt doesn't support assembly for coldfire & i386

This is relatively weird, especially, since they do have upstream commit
that try to make it work on "old CPUs":

    a5d126c61cc0  configure: fix avx512 check for i386
    f01d4b7a601f  mpi/longlong.h: i386: use tzcnt instruction for trailing zeros

So maybe this is a bug that should be reported and fixed upstream?

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_i386)$(BR2_m68k_cf),y)
>  LIBGCRYPT_CONF_OPTS += --disable-asm
>  endif
>  
> -- 
> 2.39.2
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
