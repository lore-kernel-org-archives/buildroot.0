Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC7AC77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 16:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 123F341C84;
	Sat, 13 May 2023 16:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 123F341C84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qpBeyjkiQ-VY; Sat, 13 May 2023 16:09:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48D9441C77;
	Sat, 13 May 2023 16:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48D9441C77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A41701BF35C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 16:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D52283C68
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 16:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D52283C68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNZdvGTymrYH for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 16:09:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 316E183B9F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 316E183B9F
 for <buildroot@buildroot.org>; Sat, 13 May 2023 16:09:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A894719F73B;
 Sat, 13 May 2023 18:09:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 18:09:34 +0200
Date: Sat, 13 May 2023 18:09:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230513160934.GU2582048@scaer>
References: <20230503023926.587412-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503023926.587412-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683994178;
 bh=0v3H+ZYw0KZ/COVpC+n9YuJ64LqyESjeAa65VhpFPOY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uponcxmKUo1Bzc0Rm6euvRoO2ZM3VupL+Jaz4EC9RaUO8+accDgfdr11EgNL7g+rS
 8ds7DtWAf6fMJUX5RFUDBuPXdwYarAqFxkj9Tfs6w6ILOaTGpZ2C3OmsMqAAW3EjcU
 VV107wCxaegj2cQNlUN5Fqg0FlV9yhtaIOi0C3fXAb5/nvnjgVYFxr8RIh9Xo3MMJb
 PLM2s5RiJA8/CCEy0SDJOWdMIp6DW0AJ0ur1OCeryFeX3GwFNFV/22PVZgz4XlRPuY
 LMCf0xssNN2z4nWisZ1JBdZtltSOoytDiJ+IWHysurE4l8ZJ3uqxCDcuhzC+FY5VLU
 6HpfJaKrmTaAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uponcxmK
Subject: Re: [Buildroot] [PATCH] package/cmocka: Ensure we always build
 static libs
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
Cc: Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alistair, All,

On 2023-05-03 12:39 +1000, Alistair Francis spake thusly:
> Some packages that use cmocka as a dependency will link against the
> static libs, so let's build them by default.

What packages? Are they in Buildroot? Why can't they link to the shared
library?

Regards,
Yann E. MORIN.

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  package/cmocka/cmocka.mk | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
> index eafb4898e1..e21296921d 100644
> --- a/package/cmocka/cmocka.mk
> +++ b/package/cmocka/cmocka.mk
> @@ -15,10 +15,6 @@ CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF
>  # cmocka only supports out of source builds
>  CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
>  
> -# cmocka always builds a shared library, but you can optionally build a static
> -# library as well
> -ifeq ($(BR2_SHARED_STATIC_LIBS),y)
>  CMOCKA_CONF_OPTS += -DWITH_STATIC_LIB=ON
> -endif
>  
>  $(eval $(cmake-package))
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
