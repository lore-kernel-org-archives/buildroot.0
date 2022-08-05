Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405E5C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD0DF60AF2;
	Fri,  5 Aug 2022 16:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD0DF60AF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTzHPjlzGnJN; Fri,  5 Aug 2022 16:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00BCF60A6F;
	Fri,  5 Aug 2022 16:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00BCF60A6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DABBA1BF9CB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0F78832DB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0F78832DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-7dKZFx_0np for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:35:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C494B832D1
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C494B832D1
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:35:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5864:4f9d:d5e2:80b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D159119F76C;
 Fri,  5 Aug 2022 18:35:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 18:35:34 +0200
Date: Fri, 5 Aug 2022 18:35:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220805163534.GF3621445@scaer>
References: <20220804204157.30731-1-thomas.petazzoni@bootlin.com>
 <20220804204157.30731-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804204157.30731-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659717339;
 bh=bK6HhOSjMtDvP5IFzVUNEf8W0ru9l0c1bfjsj65524U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Px9TlKSc7Oqm/ts9rwSsGFvWrLE0AiLabV1C6SZyMInbwOvjvs9tQ3igAoqXa+vvL
 5AzGkVnXg+sAFHbvhTanL3t1blYFCto28IRL1gOucE9cbeDyiSECkXA77G9cmFVvHx
 teBgHMIdjFGWETDcksXQibFRsAJ0gjvcGOYFED+e1dVJy7S3qrOljCohjUoEoA8p/H
 Qlm80Kw6IdK6qj9AxHz72VtHzCHechFJTxcEotpUnoWFnm+rrTpW25VOaJ0wi2Wb+F
 WBD/qqZRSn61H9zrIEPZoIDZttM71MU3yHwZumLvqrVZgdzJYKW8brkf+1PbfC8sbY
 2ZqG/Y5MeY2+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Px9TlKSc
Subject: Re: [Buildroot] [PATCH 2/2] package/gcnano-binaries: set Version:
 field in .pc files
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
Cc: kory.maincent@bootlin.com, Jens Kleintje <scooby22@web.de>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-08-04 22:41 +0200, Thomas Petazzoni via buildroot spake thusly:
> All .pc files have a Version field set to #VERSION#, which needs to be
> replaced, otherwise packages checking the version of OpenGL ES, EGL,
> GBM, etc. will fail. For example:
> 
> Dependency gbm found: NO unknown version, but need: ['>=17.1.0']
> 
> Such problems have been seen with both libepoxy and SDL2.
> 
> The version 21.1.1 is chosen because it matches what the Yocto recipe
> is doing for this package:
> 
>   https://github.com/STMicroelectronics/meta-st-stm32mp/blob/kirkstone/recipes-graphics/gcnano-userland/gcnano-userland.inc#L42

... which they did not provide any explanation for...

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gcnano-binaries/gcnano-binaries.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
> index ce9b24cc3a..d9c47bf64e 100644
> --- a/package/gcnano-binaries/gcnano-binaries.mk
> +++ b/package/gcnano-binaries/gcnano-binaries.mk
> @@ -60,7 +60,7 @@ define GCNANO_BINARIES_INSTALL
>  	ln -sf gbm/gbm.h $(1)/usr/include/gbm.h
>  	cd $(@D)/$(GCNANO_BINARIES_USERLAND_SUBDIR)/pkgconfig/ ; \
>  	for file in *.pc ; do \
> -		sed -e "s|#PREFIX#|/usr|" $$file > $$file.temp ; \
> +		sed -e "s|#PREFIX#|/usr|" -e "s|#VERSION#|21.1.1|" $$file > $$file.temp ; \
>  		$(INSTALL) -D -m 0644 $$file.temp $(1)/usr/lib/pkgconfig/$$file ; \
>  	done
>  endef
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
