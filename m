Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5777FC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA187410C3;
	Sat, 13 May 2023 20:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA187410C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3HHSu-vt0Ob; Sat, 13 May 2023 20:30:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD89140570;
	Sat, 13 May 2023 20:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD89140570
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8706C1BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6060B83F22
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6060B83F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjYXQ80ICODD for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:30:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33CD483F11
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33CD483F11
 for <buildroot@uclibc.org>; Sat, 13 May 2023 20:30:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 427DBB0053E;
 Sat, 13 May 2023 22:29:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 22:29:59 +0200
Date: Sat, 13 May 2023 22:29:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Luke D. Jones" <luke@ljones.dev>
Message-ID: <20230513202959.GL2582048@scaer>
References: <20230315084624.1665061-1-luke@ljones.dev>
 <20230315084624.1665061-3-luke@ljones.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315084624.1665061-3-luke@ljones.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684009801;
 bh=66/WoZ5sMMxcLDh70cEa8WsrzRkbNIbmqZ1/kuq8LT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PDYypP6aIyhKMapUAgqpVAu0K/8qnr6Cd8pbM9nS2T6t8xdhXnyMjQBfEMv006P2m
 Fq0ROCQ+8pm0i2LTOUDyH6HbitF5DjgKqoXFpQQ414/PahgSpDscZl61qGffSMrj3F
 BVSYyTZrjZOIh/TCcb3rXQ/bjjUO0Jc9wlHcxGefJFav11/NXiDACvFoKsWqNDpMk8
 MqaiIKgp3Pno25F8X/A7VHNvAVFN2vbD//EkJd3uzKk3PkBrIUnRH3bvFQY1Az0OLe
 tqcRIJKqc5vh5lVrJ8yfmYcQovHulF4Cioeect+agTUwzid23Od1O1vs/rtFQRkpbW
 6FiPdLhpJBpuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PDYypP6a
Subject: Re: [Buildroot] [PATCH 3/5] package/sdl2_image: bump version to
 2.6.3
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luke, All,

On 2023-03-15 09:46 +0100, Luke D. Jones spake thusly:
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
[--SNIP--]
> diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
> index 953742de28ab..aaf379788cc4 100644
> --- a/package/sdl2_image/sdl2_image.mk
> +++ b/package/sdl2_image/sdl2_image.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL2_IMAGE_VERSION = 2.6.2
> +SDL2_IMAGE_VERSION = 2.6.3

This bump was also applied with a later patch (and sadly, we tend to
look at more reent patch, sorry ...)

Regards,
Yann E. MORIN.

>  SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
>  SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
>  SDL2_IMAGE_INSTALL_STAGING = YES
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
