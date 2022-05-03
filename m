Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C746C433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E882416FC;
	Tue,  3 May 2022 19:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atPjfuIh9ZvS; Tue,  3 May 2022 19:31:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8227408CD;
	Tue,  3 May 2022 19:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27D7A1BF33A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 178FF81324
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4N-ul10Qux6O for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:31:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A41E81313
 for <buildroot@busybox.net>; Tue,  3 May 2022 19:31:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e1bf:f1f7:9c5a:c735])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4F0CD19F5B5;
 Tue,  3 May 2022 21:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651606283;
 bh=xVzP4CHDLWaBTPXdwcn1nOIux3bhDbEFMxTZ3g174wA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FWKNnt1SBjv8RnMu0Kwhcs5g/CosjEJdWySj4flO00P+NfoZUUUkK1xMzfbCEIupg
 4vXB8kYR7ya1HEgpeX+Y73u8VvbXLgqE3ncmI8miRtEWE040MJjRK5e//xr7AM/gkc
 G1ne59pDPIGAyKzzCvko0cxQQUWPGHyAXP8wrrN8pAMdKMv5owO7o6GUyoMD2+MxQc
 ppmpUtKELERpm5TyE7AsRBpJ+8g4rZ/Foss9bCmd02JvoRW7n0hjnmGJKGx3EMms81
 kVGIgZkcQM9pKXhmBqqqJ8D2whyTHzwF9t8rNeu6A8JyC8IAXNX2vStFa0H5fC2z0K
 Ixxi/uAtN9Lrw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 May 2022 21:31:21 +0200
Date: Tue, 3 May 2022 21:31:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220503193121.GE2575@scaer>
References: <20220503072834.15681-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503072834.15681-1-mf@go-sys.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2: bump version to 2.0.22
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-05-03 09:28 +0200, Michael Fischer spake thusly:
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdl2/sdl2.hash | 4 ++--
>  package/sdl2/sdl2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
> index 26b7ce4102..a5dad638bb 100644
> --- a/package/sdl2/sdl2.hash
> +++ b/package/sdl2/sdl2.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.20.tar.gz.sig
> -sha256  c56aba1d7b5b0e7e999e4a7698c70b63a3394ff9704b5f6e1c57e0c16f04dd06  SDL2-2.0.20.tar.gz
> +# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.0.22.tar.gz.sig
> +sha256  fe7cbf3127882e3fc7259a75a0cb585620272c51745d3852ab9dd87960697f2e  SDL2-2.0.22.tar.gz
>  # Locally calculated
>  sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index e0a817e249..94533fa9b4 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL2_VERSION = 2.0.20
> +SDL2_VERSION = 2.0.22
>  SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>  SDL2_SITE = http://www.libsdl.org/release
>  SDL2_LICENSE = Zlib
> -- 
> 2.20.1
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
