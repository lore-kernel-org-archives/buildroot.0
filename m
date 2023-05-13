Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509E0C7EE24
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65E24186C;
	Sat, 13 May 2023 20:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65E24186C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id td_KEgA-Zu5N; Sat, 13 May 2023 20:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24EA41516;
	Sat, 13 May 2023 20:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B24EA41516
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED3C51BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C639360B95
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C639360B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZmT5rV3nI4Sl for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:28:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC9B260B83
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC9B260B83
 for <buildroot@uclibc.org>; Sat, 13 May 2023 20:28:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0D6B2B004FF;
 Sat, 13 May 2023 22:28:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 22:28:07 +0200
Date: Sat, 13 May 2023 22:28:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Luke D. Jones" <luke@ljones.dev>
Message-ID: <20230513202807.GK2582048@scaer>
References: <20230315084624.1665061-1-luke@ljones.dev>
 <20230315084624.1665061-2-luke@ljones.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315084624.1665061-2-luke@ljones.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684009690;
 bh=DKFQEYmmGsPqqLGFvVCtfOws5NjSUrwHqOzW6aC8tqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ds1zrtO1Zl5julHv3JGmwkq1P18n+MnAxLcfPncS399im753f5AfWjIEo1rCXPu6L
 7RHfya5Ka03D6vItpWPhaQK89If85CYMzs9wsMMmKKIoj5c1GvQ2c9DRBibB6VThT4
 D3J7dKL7oWB7gYcVx2dNR/Zego95eusFDCRLBAQlZvGQLDkHNkTLOtVNAl7xWBpU9b
 3pI/SrrURM8vX0Z0aR3HCWJTCEOenRrd8FbHVeiAATQLzoy3mieetzqlekhxNQPVCf
 vB/3ySujeN0QnAl9LvHUYvFAgzuoHmqqZI/7EIaGJna/aO13IPInTswnkByad7Kh67
 NiiiCSgDXrLmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ds1zrtO1
Subject: Re: [Buildroot] [PATCH 2/5] package/sdl2_mixer: bump version to
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

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdl2_mixer/sdl2_mixer.hash | 2 +-
>  package/sdl2_mixer/sdl2_mixer.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sdl2_mixer/sdl2_mixer.hash b/package/sdl2_mixer/sdl2_mixer.hash
> index f3bab151f22c..98c5fda6af50 100644
> --- a/package/sdl2_mixer/sdl2_mixer.hash
> +++ b/package/sdl2_mixer/sdl2_mixer.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419  SDL2_mixer-2.0.4.tar.gz
> +sha256  7a6ba86a478648ce617e3a5e9277181bc67f7ce9876605eea6affd4a0d6eea8f  SDL2_mixer-2.6.3.tar.gz
>  sha256  113727180e7956cb9718b03b41da85b63ea54743a33047071a623bf672895a10  COPYING.txt
> diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
> index f349b8ca80cf..425380bf5dd5 100644
> --- a/package/sdl2_mixer/sdl2_mixer.mk
> +++ b/package/sdl2_mixer/sdl2_mixer.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL2_MIXER_VERSION = 2.0.4
> +SDL2_MIXER_VERSION = 2.6.3
>  SDL2_MIXER_SOURCE = SDL2_mixer-$(SDL2_MIXER_VERSION).tar.gz
>  SDL2_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
>  SDL2_MIXER_LICENSE = Zlib
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
