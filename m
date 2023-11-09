Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A11C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ECC942095;
	Thu,  9 Nov 2023 21:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ECC942095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pUoBxpqLbXCY; Thu,  9 Nov 2023 21:29:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEEC0420A8;
	Thu,  9 Nov 2023 21:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEEC0420A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4C721BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9C2A4036E
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9C2A4036E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YWgBi4u2JHUi for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:28:58 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9621740018
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9621740018
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:bf98:93a4:26f0:a873])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4B04E13F861;
 Thu,  9 Nov 2023 22:28:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 22:28:51 +0100
Date: Thu, 9 Nov 2023 22:28:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231109212851.GC996011@scaer>
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
 <20231105202555.359391-22-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105202555.359391-22-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699565335;
 bh=8WYecv9WmMnQ/VmJAyTKZoZvJQO7T7YVgYKHeqaVd54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzjD559wL+sR8/ewFFtM15kF7cB4rWv9qjc3EUof7Gf4gbc1xDQcho8XbdGabByVC
 uPZnlcGM8Q6X3H1ZPJXY7AAoXUAqz7H5bDViHtckxspqoh4q7yDnDSAmc8uB6l2yG6
 p+USaiR6IsU+NJlSnLtSLaG/SjZcJHpdRFyQGN0LD5u7vR2z1oNQ6BYmOVXjjnnTau
 Y+/V2BLC3CIBHtBl1vcyEuu2cDhX+gWcY5k01o6aXWYt+6VnUYe/LUUFQqbu7PGyf9
 BQwNs08C+2KfMOhRW1G67x6Nxmb1QkaymKsYkMMdGCNignSG0ru7ZGREVNstcXFXKj
 jarEblF40BBMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KzjD559w
Subject: Re: [Buildroot] [PATCH v2 22/24] package/kmod: drop python support
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-11-05 13:25 -0700, Adam Duskett spake thusly:
> The python bindings provided by kmod were last updated 9 years ago.
>   - They are not compatible with Python 3.12.
>   - No major distribution uses this option.
> 
> Remove the option.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v1 -> v2: Add this patch to the series
> 
>  package/kmod/kmod.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index dae84611fe..d83fb85a3e 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -62,11 +62,6 @@ else
>  KMOD_CONF_OPTS += --without-openssl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -KMOD_DEPENDENCIES += python3
> -KMOD_CONF_OPTS += --enable-python
> -endif
> -
>  ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
>  
>  # add license info for kmod tools
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
