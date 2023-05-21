Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBB3C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 17:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BACF60FBE;
	Sun, 21 May 2023 17:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BACF60FBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ErBt0ZwZXRH; Sun, 21 May 2023 17:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97DAE60A64;
	Sun, 21 May 2023 17:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97DAE60A64
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEAD71BF3CA
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 838C081E3A
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 17:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 838C081E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ygnf6Mi_RPvq for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 17:08:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C54A81E1B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C54A81E1B
 for <buildroot@buildroot.org>; Sun, 21 May 2023 17:08:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 91D77B00593;
 Sun, 21 May 2023 19:08:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 19:08:34 +0200
Date: Sun, 21 May 2023 19:08:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Luca Pesce <luca.pesce@vimar.com>
Message-ID: <20230521170834.GA621937@scaer>
References: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1684507558-5929-1-git-send-email-luca.pesce@vimar.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684688916;
 bh=jKkcJjg6WhM05mRiIPEzVWIj8VKLAj7JyZt2Y4eOHvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uHDSzpVxgzb6mI0zoA/y+J8xYBBwnq0F2xfWiDj7P1XUouc4hzefmc8LNvqVYSVXN
 e/NKMUqNamINVgdmN1cwAoSEbG/Ij/zHZHZiYmPOr9DTckTPQwMbwvhRqQEl/DHwpO
 rgB27GhwsOJDzupUhlIRiZZ/XtkqVGnkkaFDhJAcWfa2TBd8oXHgqFjVrlDtikBr5c
 EYSgBbP3xtjIRSt1xazbMISA9mEIJXqX3DapanHaRx8aBX/jyRYfzrze8dEm7YdyKB
 GADDMUK+V/IVrHNXlcUw1F0VO000WlYehM0bJ50Ft72tn+mi37uyJ1YLOI17asmI8n
 QURqpwsXTPVEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uHDSzpVx
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: added option to
 (re-)enable external poll loop support
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

On 2023-05-19 16:45 +0200, Luca Pesce via buildroot spake thusly:
> Since version 3.2.0, libwebsockets does not compile its external loop support
> code anymore. That code was put under LWS_WITH_EXTERNAL_POLL compile option,
> which defaults to OFF.
> Applications relying on that support need to turn that option on, so let's
> add it to the package.

So, as I understand it, before 3.2.0, this was unconditionally compiled
in, right?

If so, for backward compatibility, should we default this new option to
'y' ?

> For example, when libwebsockets in enabled, mosquitto broker is built with
> websocket support, but its code requires LWS_WITH_EXTERNAL_POLL to be on -
> otherwise, it gives compile-time warning hinting to unusable websocket support:
> https://github.com/eclipse/mosquitto/commit/1b24f625ea4ee77f3c4796ec2233d059f8c7977e

Then, should mosquitto also select this new option?

> Signed-off-by: Luca Pesce <luca.pesce@vimar.com>
> ---
>  package/libwebsockets/Config.in        | 10 ++++++++++
>  package/libwebsockets/libwebsockets.mk |  4 ++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
> index d7b529c..1371717 100644
> --- a/package/libwebsockets/Config.in
> +++ b/package/libwebsockets/Config.in
> @@ -9,5 +9,15 @@ config BR2_PACKAGE_LIBWEBSOCKETS
>  
>  	  https://libwebsockets.org/
>  
> +if BR2_PACKAGE_LIBWEBSOCKETS
> +
> +config BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
> +	bool "enable external poll loop support"
> +	default n

'n' is the default, so no need to specify it.

> +	help
> +	  Enable external poll loop support code.

I am not sure I understood this "external poll loop support". Does it
mean that the loop must be handle by the application itself, rather than
bey libwebsocket?

Regards,
Yann E. MORIN.

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
