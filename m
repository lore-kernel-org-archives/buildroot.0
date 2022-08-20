Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2421C32772
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 08:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59F7D41A61;
	Sat, 20 Aug 2022 08:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59F7D41A61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AP1tQ-jxa0wY; Sat, 20 Aug 2022 08:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077D6419AA;
	Sat, 20 Aug 2022 08:10:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 077D6419AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9C941BF36A
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4AB560AC9
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4AB560AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzyGx7YDSExT for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 08:10:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B480607E1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B480607E1
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 08:10:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8DCBE60141;
 Sat, 20 Aug 2022 10:10:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 10:10:29 +0200
Date: Sat, 20 Aug 2022 10:10:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220820081029.GB2167049@scaer>
References: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660983032;
 bh=6wkr0UNyZAzz33pkslNkgstROvC4osA91CdpZ2XHeVE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXYIDaUuhr8m/yzFjNjB8oU2nYj9rCpt2Ql8as35DJR9V0Tv8s8pGnk8Hg/S1hh27
 8w5TnSh5cYLoHwSp5QseQ+qmFc4nuujbBNCw9mjNNJGyNv+eIfUErmoecK/jl46fFM
 995vVBdlmhEkjgSr7/TngJ7O9pRvYo4U5qwVls5oC/QltN0/YEl6Ft89M7medX8uhQ
 mb9TpiEGv6c94QbZSmiTeZ4WDyHhmWWRE2a4Ao6mMBhBXrlzMZ11T8ZkRSJVoyBk6Q
 am8CaL16D5Gy0ipk4fBrc5cNL0ctbY2+hihatfpZY21qVd+LdJF2p+rSHbut0JiO6e
 pEA+Gw1P2jiwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TXYIDaUu
Subject: Re: [Buildroot] [PATCH 1/3] package/sdl2: be more explicit in
 disabling optional features
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-05 00:15 +0200, Thomas Petazzoni via buildroot spake thusly:
> Add many more explicit --disable-<foo>, as we have for example seen
> video-vivante being autodetected when not needed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdl2/sdl2.mk | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 94533fa9b4..d255112ce9 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -20,7 +20,24 @@ SDL2_CONF_OPTS += \
>  	--disable-esd \
>  	--disable-dbus \
>  	--disable-pulseaudio \
> -	--disable-video-wayland
> +	--disable-video-vivante \
> +	--disable-video-cocoa \
> +	--disable-video-metal \
> +	--disable-video-wayland \
> +	--disable-video-dummy \
> +	--disable-video-offscreen \
> +	--disable-video-vulkan \
> +	--disable-ime \
> +	--disable-ibus \
> +	--disable-fcitx \
> +	--disable-joystick-mfi \
> +	--disable-directx \
> +	--disable-xinput \
> +	--disable-wasapi \
> +	--disable-hidapi-joystick \
> +	--disable-hidapi-libusb \
> +	--disable-joystick-virtual \
> +	--disable-render-d3d
>  
>  # We are using autotools build system for sdl2, so the sdl2-config.cmake
>  # include path are not resolved like for sdl2-config script.
> -- 
> 2.37.1
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
