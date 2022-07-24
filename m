Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44AEC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C96D847B8;
	Sun, 24 Jul 2022 10:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C96D847B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFxgnXGW3GnM; Sun, 24 Jul 2022 10:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C3EF8400D;
	Sun, 24 Jul 2022 10:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C3EF8400D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDA601BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB15140BBB
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB15140BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lE7g0fJ7Yj4v for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:58:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1F0640025
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1F0640025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:58:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9A3F913FA3F;
 Sun, 24 Jul 2022 12:58:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 12:58:00 +0200
Date: Sun, 24 Jul 2022 12:58:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220724105800.GU2641@scaer>
References: <20220724094014.93552-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724094014.93552-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658660282;
 bh=dW+hLx0wslOj3ide/6MF0hmUUvG8CUOjBYuKrgYFe9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QKAFkaW8WzvzSjCkNOKnKyPmq5orfu0EmwfgxWynymU/tbvtaeYD/isIMOG/4p9ex
 ge+NUQuNXq/6Lg9Ig4sGx5+xj0uMw/oOV+ELOYPWqGKGdAE2HLA2tXJ+4aKaDXeZMI
 dP/gPmej9IZl0vBdzesOQ6DT7S2fvNjnsBgSMmXODAGPEsCWjsCsVr2Xy2xtKLo9oU
 URN+AbrAZvIs6310woRey7EHxm/qLedQM+jQE46MAQL5fIyEj04/N6PMW7tyMq0yxc
 t/qtxurxmCEqFTo+/Po8+HIu8tyDc1Nsx/p4eTb+19kNJgrjEo/CsfDI33u5gZKTg9
 fv/P7vftsBVrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QKAFkaW8
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: drop
 minnowboard_max-graphical_defconfig
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

Fabrice, All,

On 2022-07-24 11:40 +0200, Fabrice Fontaine spake thusly:
> Drop minnowboard_max-graphical_defconfig from DEVELOPERS as it has been
> removed by commit b9bc22ee8a1b98e3d2ab2a4c135e969423eb9d62
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index bb840e420a..6f529d0c46 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2265,7 +2265,6 @@ F:	boot/sun20i-d1-spl/
>  F:	configs/avenger96_defconfig
>  F:	configs/beagleboneai_defconfig
>  F:	configs/lafrite_defconfig
> -F:	configs/minnowboard_max-graphical_defconfig
>  F:	configs/minnowboard_max_defconfig
>  F:	configs/nexbox_a95x_defconfig
>  F:	configs/nezha_defconfig
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
