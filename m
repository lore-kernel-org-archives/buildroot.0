Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E9FC77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 20:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A76B242A18;
	Wed, 24 May 2023 20:04:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A76B242A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iMkz8wz4sSW; Wed, 24 May 2023 20:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD3FF42A16;
	Wed, 24 May 2023 20:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD3FF42A16
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9811BF2F8
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 361E86111E
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 20:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 361E86111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ldvSDgLBOIi6 for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 20:04:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34D8E60E24
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34D8E60E24
 for <buildroot@buildroot.org>; Wed, 24 May 2023 20:04:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f59a:3e7b:43a8:ebfe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4480BB005A1;
 Wed, 24 May 2023 22:04:37 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 May 2023 22:04:37 +0200
Date: Wed, 24 May 2023 22:04:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Pesce <luca.pesce@vimar.com>
Message-ID: <20230524200437.GE2623@scaer>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
 <1684917117-10063-1-git-send-email-luca.pesce@vimar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1684917117-10063-1-git-send-email-luca.pesce@vimar.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684958680;
 bh=4U4L3zEgeEBykpakFI9cO1sE6x12D4bo4v/sLogGkT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mpHFZNlzDMWwOWHY5dx4N74mw4hRszQDj54YBvNO4WDZIThsrbtyPZZaYhgHlr7Dq
 M09QgfxTAXxfLO+UlJOjrpQ/o0sw7LQPc8FeLrK7kjyGgwHqIRhPdOteMwr5rikBOW
 IU5FN2F1iMeFKgzwQntEis+GqEVzyPEzhD2aHPnVfKSMWBoamkmzzHg77WopeA+6z8
 9Bi7t1MtwjpcuLQNjLfNr/L+2R8AhK//h+uIZEUvlTrkpLNl2c8Ceaqis/vi/RHug7
 hU7wpObkulO5jPmub+HwD3sY2MhxTMNPpmNtfM2RvOZ+HrL4timvezezjicHHheKU4
 AIhRCnBbKLEbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mpHFZNlz
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libwebsockets: added option
 to (re-)enable external poll loop support
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

Luca, All,

On 2023-05-24 10:31 +0200, Luca Pesce spake thusly:
> Since version 3.2.0, libwebsockets does not compile its external loop support
> code anymore. That code was put under LWS_WITH_EXTERNAL_POLL compile option,
> which defaults to OFF.
> Applications relying on that support need to turn that option on, so let's
> add it to the package.
> 
> For example, when libwebsockets is enabled, mosquitto broker is built with
> websocket support, but its code requires LWS_WITH_EXTERNAL_POLL to be on -
> otherwise, it gives compile-time warning hinting to unusable websocket support:
> https://github.com/eclipse/mosquitto/commit/1b24f625ea4ee77f3c4796ec2233d059f8c7977e
> 
> Signed-off-by: Luca Pesce <luca.pesce@vimar.com>

I pondered whether this should go into master or next, and decided it
was not critical enough to go to master.

Indeed, extenal loop support has been disabled since we bumped to 3.2.0,
in commit dda92e2f58d4 (package/libwebsockets: bump version to 3.2.0),
back in October 2019.

So clearly, this was not that critical, as you're the first to notice in
such a long time.

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libwebsockets/Config.in        | 12 ++++++++++++
>  package/libwebsockets/libwebsockets.mk |  4 ++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
> index d7b529c..05c1326 100644
> --- a/package/libwebsockets/Config.in
> +++ b/package/libwebsockets/Config.in
> @@ -9,5 +9,17 @@ config BR2_PACKAGE_LIBWEBSOCKETS
>  
>  	  https://libwebsockets.org/
>  
> +if BR2_PACKAGE_LIBWEBSOCKETS
> +
> +config BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
> +	bool "enable external poll loop support"
> +	default y  # legacy, was previously always enabled
> +	help
> +	  Enable external poll loop support code. This was
> +	  unconditionally compiled in for library versions
> +	  prior to 3.2.0.
> +
> +endif
> +
>  comment "libwebsockets needs a toolchain w/ dynamic library"
>  	depends on BR2_STATIC_LIBS
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index fb0ee66..86756ca 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -94,4 +94,8 @@ ifeq ($(BR2_SHARED_LIBS),y)
>  LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_STATIC=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL),y)
> +LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_EXTERNAL_POLL=ON
> +endif
> +
>  $(eval $(cmake-package))
> -- 
> 2.7.4
> 

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
