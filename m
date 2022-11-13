Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644FAC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0967181831;
	Sun, 13 Nov 2022 14:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0967181831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDCGu2MSgtPM; Sun, 13 Nov 2022 14:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3203781886;
	Sun, 13 Nov 2022 14:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3203781886
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BD021BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8467E40597
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8467E40597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yXwUEGtUCxWb for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:12:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 678D640496
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 678D640496
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:12:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f76c:17ea:8df1:99cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A623613F87F;
 Sun, 13 Nov 2022 15:12:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Nov 2022 15:12:28 +0100
Date: Sun, 13 Nov 2022 15:12:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20221113141228.GG2123054@scaer>
References: <20221111224011.430289-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111224011.430289-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668348751;
 bh=dficVzrB2IjABPWfD3FQv5DuaD72FgBcD7Yr1CNPbwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SHDMm89BtAn3eH1HXhgChayW1TEbqfeoZM7diaPXo/7SCLwrWKFE2oJuubZoByRK/
 f/HVXSzIidkNNtqUvq8ct2IuR2kG4uJ/XKUyWBZFDPCoNeDohS1PWosEWftFz12rBZ
 JaFXgoHIh+l7+U3RdAlHPsfE/8eXw2FFIaZzuLx8GSNWGVhHJJd7+6J7190oi7v4u0
 IZi2EGPtztwOiipaVKaw2AERjeuCUZoPLO4+vnt3gJ+upNDM96caveb9OOQSM41C2x
 KlvkQqWbQpnzvUuBrpNbOOLUAFTxVEn5yyBKpvk6pJ2X4QNANU4wvkWja9TQhF5KAd
 pPEwc84P5xWXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SHDMm89B
Subject: Re: [Buildroot] [PATCH] package/imagemagick: utilities now need C++
 support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-11-11 23:40 +0100, Thomas Petazzoni via buildroot spake thusly:
> Since upstream commit
> https://github.com/ImageMagick/ImageMagick/commit/07f3b487f9860fd4eb9422f1a906d0fe83b6fd1c
> (which first appeared in version 7.1.0-47), ImageMagick forces the
> need of a C++ compiler to build its utilities. Despite the request of
> Bernd Kuhls to revert this change, upstream declined.
> 
> Since this change is causing build failures in our autobuilders, our
> only choice is to follow the choice of upstream, and disable building
> the utilities when C++ support is not available.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/4283235d697408cf2e70be5e3769dbe6ebb9ddae/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/imagemagick/imagemagick.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 6bdf24c1e8..8a2ec460d5 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -178,6 +178,12 @@ else
>  IMAGEMAGICK_CONF_OPTS += --without-bzlib
>  endif
>  
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +IMAGEMAGICK_CONF_OPTS += --with-utilities
> +else
> +IMAGEMAGICK_CONF_OPTS += --without-utilities
> +endif
> +
>  HOST_IMAGEMAGICK_CONF_OPTS = \
>  	--disable-opencl \
>  	--disable-openmp \
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
