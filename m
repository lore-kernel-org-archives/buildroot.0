Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994CCC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 20:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2212641553;
	Tue, 31 Oct 2023 20:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2212641553
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1OUoCo9RDDlo; Tue, 31 Oct 2023 20:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EA2441517;
	Tue, 31 Oct 2023 20:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EA2441517
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08EBA1BF2E3
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 20:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D26356F7C0
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 20:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D26356F7C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0Xzp2FrAW6l for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 20:49:14 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D47AE6F7BC
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 20:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D47AE6F7BC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:67d2:c63c:7c2a:c31])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BB50C19F5AF;
 Tue, 31 Oct 2023 21:49:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 21:49:08 +0100
Date: Tue, 31 Oct 2023 21:49:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alisa Volk <aolvolk@salutedevices.com>
Message-ID: <20231031204908.GB2568@scaer>
References: <20231031172415.18496-1-aolvolk@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231031172415.18496-1-aolvolk@salutedevices.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698785351;
 bh=jR5lezLOAuHlH47aiUyjYQ21WAnPkptXrW4wURxXY7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MvAdlRSixoba9vpSn3NhYk+y2fu4kjm3BXrw4a8D3k7yXGEHTOuDQBgoP9h+dWa1h
 hM6l167zUA6CpyS8mjTyTRIBo9E5xzBvdNNhHveGE+27Ndqf55j8aaiMyeuZ6GX4XK
 uq6rpY5UyhK8VuXFj9HWrmOn5wGCvYFy4rfCiiBuv4IP3b7Refw9VmD6/Vx+hB98wq
 lgE2XQHw+62y81peNjhjogengNGP2FOiN8JYAwsAvGcMIqqnvWxkqEaCnU+tO0B9iB
 lGbL3Jrh9N6Y6hXzAgAkl/+TWriGIdMUEUBJ70upnNNdRFonfpJhUs6yLZ5VeBciJW
 8VQKem8IOpE2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MvAdlRSi
Subject: Re: [Buildroot] [PATCH] package/libcurl: introduce option to enable
 WebSockets support
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
Cc: ovlevin@salutedevices.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alisa, All,

On 2023-10-31 20:24 +0300, Alisa Volk via buildroot spake thusly:
> Signed-off-by: Alisa Volk <aolvolk@salutedevices.com>
> ---
>  package/libcurl/Config.in  | 6 ++++++
>  package/libcurl/libcurl.mk | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index 218309ed56..154215e17e 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -31,6 +31,12 @@ config BR2_PACKAGE_LIBCURL_COOKIES_SUPPORT
>  	help
>  	  Enable support for cookies.
>  
> +config BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT
> +	bool "websockets support"
> +	default n

The default is already 'n', so there is no need to state so.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +	help
> +	  Enable support for websockets.
> +
>  config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
>  	bool "enable extra protocols and features"
>  	default y
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index f2c679f162..be85ffa35a 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -152,6 +152,12 @@ else
>  LIBCURL_CONF_OPTS += --disable-proxy
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBCURL_WEBSOCKETS_SUPPORT),y)
> +LIBCURL_CONF_OPTS += --enable-websockets
> +else
> +LIBCURL_CONF_OPTS += --disable-websockets
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES),y)
>  LIBCURL_CONF_OPTS += \
>  	--enable-dict \
> -- 
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
