Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F0C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFCF060E0A;
	Mon,  3 Jul 2023 20:30:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFCF060E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bC9JJ6WhtPDy; Mon,  3 Jul 2023 20:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2463E60AFC;
	Mon,  3 Jul 2023 20:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2463E60AFC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3E141BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCCCF81836
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCCCF81836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v3BNCM7YKMR7 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:30:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1FEB8176E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1FEB8176E
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:30:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d686:7886:a85d:fb8a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3A0512003EE;
 Mon,  3 Jul 2023 22:30:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jul 2023 22:30:26 +0200
Date: Mon, 3 Jul 2023 22:30:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703203026.GL2510@scaer>
References: <20230703202011.1995452-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703202011.1995452-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1688416229;
 bh=g8opLE0SMeNVAz8g2nokdE4RvcYazFIjSmeCr8qSH/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S5BF3GltCVlgYw5K1UlX8r4TsF2jlxPucTufBGz7VJejGBCQLaD+ByNiWWAtmceqv
 mXPW+sfOnFVK1AWJuz3RpZ9r3h2Yq9FqcClE6/d7zooDmASnXjpJGM6bvNqFIP+NVl
 I/6y7sblhvLzTE5y9UXFCGOD3Np1v8XrkKGjqompJUy0+mBv9sHPvYCSkSnHVo7fXc
 lE6Zv/QYEC86ujw4g49W9oCarf+xgzkEa+jp/YYvtv+vLLMRamBykdW2dcdJGnH+Ns
 kRgCMMxjt+MKkD29bbmTlfNg0LBmXnh5AGn80uPMC8g0PuSHS/+2AtqEcK7ksZ9JL3
 +verIy0rFF8tA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S5BF3Glt
Subject: Re: [Buildroot] [PATCH 1/1] package/libnatpmp: fix header install
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

On 2023-07-03 22:20 +0200, Bernd Kuhls spake thusly:
> Upstream renamed declspec.h to natpmp_declspec.h
> https://github.com/miniupnp/libnatpmp/commit/1d113363980a98a5868ff2c2b05d7c94e3a18a70
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks. But see a question, below...

> ---
>  package/libnatpmp/libnatpmp.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libnatpmp/libnatpmp.mk b/package/libnatpmp/libnatpmp.mk
> index 3a625ea0fe..99d46d814a 100644
> --- a/package/libnatpmp/libnatpmp.mk
> +++ b/package/libnatpmp/libnatpmp.mk
> @@ -18,7 +18,7 @@ endef
>  define LIBNATPMP_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>  		PREFIX=$(STAGING_DIR) \
> -		HEADERS='declspec.h natpmp.h' \
> +		HEADERS='natpmp_declspec.h natpmp.h' \

So it means 0e258b6190a5 (package/libnatpmp: bump version to 20230423)
was not build-tested before being submitted? At least transmission
unonditionally uses it, so a runtime test of transmission would catch
it.

Regards,
Yann E. MORIN.

>  		$(TARGET_CONFIGURE_OPTS) install
>  endef
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
