Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFB5C25B45
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9015542274;
	Mon, 23 Oct 2023 17:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9015542274
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nllNJun6xvd9; Mon, 23 Oct 2023 17:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC954226E;
	Mon, 23 Oct 2023 17:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDC954226E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 979851BF371
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F20A4226E
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F20A4226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3TO0GNspbxo for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:26:58 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7722842254
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7722842254
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:8ed0:8cf1:4440:5c7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9607E2003F3;
 Mon, 23 Oct 2023 19:26:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Oct 2023 19:26:53 +0200
Date: Mon, 23 Oct 2023 19:26:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231023172653.GA2607@scaer>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
 <20231023092501.481436-8-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023092501.481436-8-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698082016;
 bh=r3HIFhGfO/i+iXl5lRFit3y5T4nVAi98VngaU94d7Jc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XRS8PybGTtHIjzzum8d5lbZ3RSFsmIxeOlHwiX7iHk21drfq82dUyYf/3vwBgBr6s
 tl4agpp5guU1D019StnvynEY3Cx+bRfeyIunCf8mYmpHbVTMoHdZMEAX5KN2kzRzhI
 GWq/NWgevx6j3TZL+X7ZAMdL/7LUx7oNve3/R0EkalFwKuydocc9esztkpdR7UrQXT
 argdH3pTS3xsAUcQmMU6BMdLQK+c1dV8p4sKTRuO9du9zxZ/IW5He9c7usB8ZKGxAX
 I7SNi77qtT1qo1ogub6LUIHtalIEpYyw19c0WS/sFKTJvbbkMA5fcUogZ9AqKKIUO5
 maMl3nzavvfsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XRS8PybG
Subject: Re: [Buildroot] [PATCH 8/8] package/opkg: add sha256sum support
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-23 11:25 +0200, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/opkg/Config.in | 5 +++++
>  package/opkg/opkg.mk   | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/opkg/Config.in b/package/opkg/Config.in
> index adf39ca145..0104f48623 100644
> --- a/package/opkg/Config.in
> +++ b/package/opkg/Config.in
> @@ -36,6 +36,11 @@ config BR2_PACKAGE_OPKG_GPG_SIGN
>  	  Enable opkg package signature checking support using
>  	  gnupg/libgpgme.
>  
> +config BR2_PACKAGE_OPKG_SHA256
> +	bool "sha256sum check support"
> +	help
> +	  Enable sha256sum check

There is no reason to make that conditional: the code size increase is
minor, sha1 adn md5 are broken so sha256 is the smallest hash still not
broken, and it has no depenency; so I made it unconditional.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  comment "compression support"
>  
>  config BR2_PACKAGE_OPKG_BZIP2
> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
> index 730aa4cfe7..ce0b74f549 100644
> --- a/package/opkg/opkg.mk
> +++ b/package/opkg/opkg.mk
> @@ -38,6 +38,12 @@ else
>  OPKG_CONF_OPTS += --disable-gpg
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPKG_SHA256),y)
> +OPKG_CONF_OPTS += --enable-sha256
> +else
> +OPKG_CONF_OPTS += --disable-sha256
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPKG_BZIP2),y)
>  OPKG_DEPENDENCIES += bzip2
>  OPKG_CONF_OPTS += --enable-bzip2
> -- 
> 2.41.0
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
