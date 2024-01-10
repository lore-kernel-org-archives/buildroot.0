Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F12C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F739839D8;
	Wed, 10 Jan 2024 22:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F739839D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jjF_k26Er-g1; Wed, 10 Jan 2024 22:45:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEA4C83906;
	Wed, 10 Jan 2024 22:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEA4C83906
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 300231BF304
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15C9061400
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15C9061400
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53bM-8TRyb14 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:45:30 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB39C613CE
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB39C613CE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DD9E1B00535;
 Wed, 10 Jan 2024 23:45:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 23:45:24 +0100
Date: Wed, 10 Jan 2024 23:45:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZZ8eBFjvgsMYuvH7@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704926727;
 bh=/wprdpRaT7N3WottXz0Yntb6AOpBN2BX2ivJzK8G+po=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7dQTTAjn6XtMXTMUlyhgFfbr4TOrT8wGXq7V7axER31e0t7OM0G7HCtA3Zw2IKHF
 vby4wQZiZVcQJ1u3+BD1KRcp4BWKMv6hvduhtJ85ODyO1Ak3oyxMIxbW44sHmLsVT7
 frtHaXmLLDPgvU1amznmn7QpAncSOtm9fxBn45O3Wza3RSyzIsaLlghcD0OH5U/FDB
 pwBDgOeJ7IVKyJiPEBIcHPaECV2Pa/fTelm6GvnVXmppsynxBEKA0a2fkOwFmNZNMH
 s69THK3mIiGG+wVoyFGi0jReud4S1WrEi0XmpYr/ICJORtk6sa2Ifczq0e9Nm7eZzU
 hk908iiHcdGUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l7dQTTAj
Subject: Re: [Buildroot] [PATCH v3 01/11] package/Config.in: move flutter-pi
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

Adam, All,

On 2024-01-02 16:59 -0700, Adam Duskett spake thusly:
> package/flutter-pi was place erroneous under the "Graphic libraries"
                         ^^^^^^^^^^^^^^^
I fixed the grammar, adn took the opportunity to reflow the commit log.

Applied to master, thanks.

> section of the menu "Graphic libraries and applications (graphic/text)"
> menu. However, as flutter-pi is an application that runs graphic applicaitons
> it is better suited to be placed under the "Graphic applications" section.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index d5d89c50aa..9ec185f16c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -314,6 +314,7 @@ comment "Graphic applications"
>  	source "package/cage/Config.in"
>  	source "package/cog/Config.in"
>  	source "package/dmenu-wayland/Config.in"
> +	source "package/flutter-pi/Config.in"
>  	source "package/foot/Config.in"
>  	source "package/fswebcam/Config.in"
>  	source "package/ghostscript/Config.in"
> @@ -348,7 +349,6 @@ comment "Graphic libraries"
>  	source "package/fbterm/Config.in"
>  	source "package/fbv/Config.in"
>  	source "package/flutter-gallery/Config.in"
> -	source "package/flutter-pi/Config.in"
>  	source "package/freerdp/Config.in"
>  	source "package/graphicsmagick/Config.in"
>  	source "package/imagemagick/Config.in"
> -- 
> 2.43.0
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
