Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA79AEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE07418A4;
	Mon, 10 Jul 2023 21:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE07418A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQalmY8Xa3hd; Mon, 10 Jul 2023 21:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4246E417F6;
	Mon, 10 Jul 2023 21:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4246E417F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E60C51BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCC8360F4D
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCC8360F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u-g-CMdmeDjm for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:45:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1F5860F46
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1F5860F46
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:45:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6136:4573:86f4:937d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B2C8220039E;
 Mon, 10 Jul 2023 23:45:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jul 2023 23:45:00 +0200
Date: Mon, 10 Jul 2023 23:45:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230710214500.GC188780@scaer>
References: <20230710212653.3153894-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710212653.3153894-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689025503;
 bh=AE8xMkan2LGFqBYkjEZ9+qy/xGuroshkbS6ZTV/ATzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I2VhIglj/h630A3SofWmULwkPmKELdfP1yEyb3r5/ndw6elNe8NGbtjicDCd/zRsQ
 0tJVb4R8I1EhBQzzqpgFV5MfQUbk2PQ6d8+RGyuBiFSHyYg/PwBQ6SnzjZo46Ap9Jf
 YSgBFAnlon/dEHkgSd0NhlcohZVwC9SxIJ2rSi2EO2nheQcWbOLvOTBd/fLHPtIX3W
 ObOL2xNfrA3JqnmsuJq6T5pa9lSLrC33oAXUP4H+F/en/A96dmvKSpPwpYG+GHPfSF
 6xRq1gSQmCNMoHii/iKcxLfivDXjNrB4Kkn6WIZGQhEW5zbGCtTi8ci1ItOugWq+XX
 yVzWubFAS0d1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I2VhIglj
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: Remove Michael Rommel
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
Cc: rommel@layer-7.net, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, :icheal, All,

On 2023-07-10 15:26 -0600, James Hilliard spake thusly:
> Removal requested via email:
> 
> could you somehow please remove me as maintainer from this package.
> I am since many years not using builtroot anymore and have no longer
> systems with which I could do patch requests.
> I am going into retirement.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3237c90c39..95f5305d6c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2079,11 +2079,6 @@ F:	package/protobuf/
>  F:	package/re2/
>  F:	package/spdlog/
>  
> -N:	Michael Rommel <rommel@layer-7.net>
> -F:	package/knock/
> -F:	package/python-crc16/
> -F:	package/python-pyzmq/
> -
>  N:	Michael Trimarchi <michael@amarulasolutions.com>
>  F:	board/bsh/
>  F:	configs/imx8mn_bsh_smm_s2_defconfig
> -- 
> 2.34.1
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
