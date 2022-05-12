Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930BFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FBD560B3C;
	Thu, 12 May 2022 20:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KgLxIzfrDl9r; Thu, 12 May 2022 20:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 544E160B31;
	Thu, 12 May 2022 20:18:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 384B01BF398
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3533560B31
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9tY-qjP00g5 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:18:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C4B760B22
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:18:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccab:5af8:e14c:c986])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 95DCF19F5A7;
 Thu, 12 May 2022 22:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652386709;
 bh=MhXH+NGfwfyMWu/vh7HrwkKW9gG9AkkE5YijgeAUB2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lSY/TgNVen1InJbRkpDn3XJdGcSviP8l6LTt4mO3Yp7chvWgFLPVzWZlF668Aw6nE
 GFGRYAOgT57HRb3R1Sb3p4UEv4Bs7xKSiY93eojVaDVi+9t/TL8aCbDkD1+otOQx31
 +4mqZH6FYAGrsjsGI0knHo2uxJa6aColuQ/w5A0Jfm6SqY8swFf1WAj4Wr+FROVqKZ
 XcGbAhMYiUfdkDJzaUjO0i0lds4bVc4BaxlqWJWLbNOd0VfdGUwaQmO4wKlcWJfNFu
 eXxPbK819XvouKhB8D0QFzBeQM2W3ZIgQKvJuRGcL32KDVnkussj3a642S7raMr3yu
 2pn8Grrbcpu5Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 12 May 2022 22:18:27 +0200
Date: Thu, 12 May 2022 22:18:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220512201827.GH1597494@scaer>
References: <20220512121217.176652-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512121217.176652-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/nodejs: clean up DEPENDENCIES
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

Arnout, All,

On 2022-05-12 14:12 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> One per line, and alphabetical (was already the case for host).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/nodejs/nodejs.mk | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 6dcaf34aa4..909347eb2e 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -7,10 +7,21 @@
>  NODEJS_VERSION = 16.15.0
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
> -NODEJS_DEPENDENCIES = host-qemu host-pkgconf host-python3 host-nodejs c-ares \
> -	libuv zlib nghttp2 \
> +NODEJS_DEPENDENCIES = \
> +	c-ares \
> +	host-nodejs \
> +	host-pkgconf \
> +	host-python3 \
> +	host-qemu \

I prefer when all host dependencies go first, then all target
dependencies, so I've also lightly re-oredered.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +	libuv \
> +	nghttp2 \
> +	zlib \
>  	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
> -HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-pkgconf host-python3 \
> +HOST_NODEJS_DEPENDENCIES = \
> +	host-icu \
> +	host-libopenssl \
> +	host-pkgconf \
> +	host-python3 \
>  	host-zlib
>  NODEJS_INSTALL_STAGING = YES
>  NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
> -- 
> 2.35.1
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
