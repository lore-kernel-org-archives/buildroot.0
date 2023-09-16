Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335E6CD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFF1D83B48;
	Sat, 16 Sep 2023 13:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFF1D83B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6lcIkfr-SOEX; Sat, 16 Sep 2023 13:11:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2325881AF5;
	Sat, 16 Sep 2023 13:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2325881AF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89DFB1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 703DF81AF5
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 703DF81AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOQRwvgraUPo for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:11:50 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8E9381470
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E9381470
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 32AC6200589;
 Sat, 16 Sep 2023 15:11:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 15:11:45 +0200
Date: Sat, 16 Sep 2023 15:11:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230916131145.GD415981@scaer>
References: <20230916043757.138677-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916043757.138677-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694869908;
 bh=XXMvpkqBBJGwi/cGnPhAjQZRH30Cor/msdR1xPsgTlQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fWbXv9iPXASBLUEf54UhPnQ9a00nJnrCurJ/U7a6BxASniWZSqxZIpH6zxr3MhCdE
 i77W1KZlO3KHm8lyDUzECU+9QWrxa1cPw0ihcs6C9kNMELT4XXLov3f2w7hiRrpb6a
 jNjPdT5YV+Ac3rx21PeOkzEXGPlzvd/C/Vd1hWqaW0LeAHmMHsetj3XNZaB/2A4PY/
 zUhDy+uck21+kk293jcwKcOw7Uzu/25Medz8du7t3gw5iNarIyDOoXzhKEN7k7mwV0
 aGnpfNNDFM+8kx78ZsqwQRLdmeuU6JOUMLjlCayXuXUKmgW6+xJuQTWhE5JZKOhAPq
 Nech9VTjPqz+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fWbXv9iP
Subject: Re: [Buildroot] [PATCH] package/dt-utils: bump to version 2023.08.0
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

Marcin, All,

On 2023-09-16 06:37 +0200, Marcin Niestroj spake thusly:
> COPYING is now a symlink pointing to LICENSES/GPL-2.0-only.txt. More
> license files were added and all source code files were updated with
> proper license being used. See [1-4].
> 
> List all licenses used in runtime by produced binary (and omit
> GPL-3.0-or-later for check-news.sh script).

Thansk for the explanations.

[--SNIP--]
> diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
> index d264e2cdc9..05c2c530e7 100644
> --- a/package/dt-utils/dt-utils.mk
> +++ b/package/dt-utils/dt-utils.mk
> @@ -4,11 +4,12 @@
>  #
>  ################################################################################
>  
> -DT_UTILS_VERSION = 2021.03.0
> +DT_UTILS_VERSION = 2023.08.0
>  DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
>  DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
> -DT_UTILS_LICENSE = GPL-2.0
> -DT_UTILS_LICENSE_FILES = COPYING
> +DT_UTILS_LICENSE = CC0-1.0 GPL-2.0 GPL-2.0+ Zlib

_LICENSE is a comma-sapce separated list.

> +DT_UTILS_LICENSE_FILES = LICENSES/CC0-1.0.txt LICENSES/GPL-2.0-only.txt \
> +	LICENSES/GPL-2.0-or-later.txt LICENSES/Zlib.txt

I've made that a full multi-line assignment.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  DT_UTILS_DEPENDENCIES = udev
>  DT_UTILS_AUTORECONF = YES
>  
> -- 
> 2.42.0
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
