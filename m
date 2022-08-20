Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15303C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 08:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF0A83E93;
	Sat, 20 Aug 2022 08:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF0A83E93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMzIvFqn2UcO; Sat, 20 Aug 2022 08:11:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC3783E8B;
	Sat, 20 Aug 2022 08:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBC3783E8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B820C1BF36A
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 936BA60AC9
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:10:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 936BA60AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hjp8-3_1l7Tb for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 08:10:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EC42607E1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EC42607E1
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 08:10:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B813260128;
 Sat, 20 Aug 2022 10:10:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 10:10:41 +0200
Date: Sat, 20 Aug 2022 10:10:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220820081041.GC2167049@scaer>
References: <20220804221559.46394-1-thomas.petazzoni@bootlin.com>
 <20220804221559.46394-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804221559.46394-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660983044;
 bh=CM/tZxCg0dqfd8GPT+8k3Kp43ia9e9yHJE26f2K4vT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KtN5C+k996R2oK7TaRtsYLOiPrzvmUxf6FLuJjgqdnCSMHQzvwgsvIgz9Fl5ZXywZ
 bMSr3V8Wbn5dJ3lXOr7egSM8VnYc1g9F+m6EVaPAYGGbqEta7mDttqzzP5OGCp/Bwh
 ry5KVx9yhkLrQ6hiSny5ySYo0gONhcK3TIBhYX569vYpkYfPaggk2Q7HH4lEgzNqmf
 g0yIQPdY4daWESjRcRsYwP5zZnOMHtEYKedaFYf4OMjYxJPd3T3IYI9u28wvl4NnTR
 lZBZqVEg0+BkA2SHofQ6VkWfondtIkaVYja0RWJPX709iOBlVyuoeP4xtIZuLNVYcq
 5i8ojizS1wZeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KtN5C+k9
Subject: Re: [Buildroot] [PATCH 2/3] package/sdl2: be explicit about OpenGL
 ES options
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
> In addition to --enable-video-opengles, SDL2 configure script also
> looks at --enable-video-opengles1 and --enable-video-opengles2. Since
> all OpenGL ES providers in Buildroot provide at least up to OpenGL ES
> 2, enable both options when BR2_PACKAGE_SDL2_OPENGLES=y.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdl2/sdl2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index d255112ce9..c5e7968cec 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -155,10 +155,10 @@ SDL2_CONF_OPTS += --disable-video-opengl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SDL2_OPENGLES),y)
> -SDL2_CONF_OPTS += --enable-video-opengles
> +SDL2_CONF_OPTS += --enable-video-opengles --enable-video-opengles1 --enable-video-opengles2
>  SDL2_DEPENDENCIES += libgles
>  else
> -SDL2_CONF_OPTS += --disable-video-opengles
> +SDL2_CONF_OPTS += --disable-video-opengles --disable-video-opengles1 --disable-video-opengles2
>  endif
>  
>  ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
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
