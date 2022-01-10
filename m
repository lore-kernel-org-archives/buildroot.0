Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415BAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF0482C99;
	Mon, 10 Jan 2022 14:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zoU_r4fvPPG6; Mon, 10 Jan 2022 14:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D3F682BE7;
	Mon, 10 Jan 2022 14:14:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED31D1BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC62E40951
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WPrx1_7wkCv for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:14:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B3964093D
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:14:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8dcf:1110:8dc6:b258])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4621F19F5B2;
 Mon, 10 Jan 2022 15:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641824053;
 bh=BTWk39CRtR0F+LHGK/nL2/tX3zp+ovOMuHSDm4pyyio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HP3EusNZyxDObFsCM82U5rk9iCpGYThBS1pUbgIWmqwGFiVKizUpdkLFNBy6zFLjO
 b5wi3j6ccM/m43oC+VX9LLmqc9Tr9xG7MNwj+rxOSTpTofiWsLjbx/L668lFljgQVC
 BRaeDJfkKvbtKiNXcOprOr8cE0BZTjoGSkikYkAYx/nM9CQQY+GD+Qe1UURdLUZsLI
 HJs8Gg3ZYJ+ervd88ZYiS60pYr0V43WJAfUd6xZnlJ/1EicmIwcjYyESZiJd2Sy2GC
 hh4V1dFK3/68VCrn+LG3JbhwS8rZjSkiBvzizkyZv4IF2Ft/13sc2N/kLMKE5CAMEA
 rVo5W6GqZhp9w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 15:14:10 +0100
Date: Mon, 10 Jan 2022 15:14:09 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20220110141409.GQ1477939@scaer>
References: <20220110085850.11095-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110085850.11095-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] DEVELOPERS: add entry for avrdude to
 Yegor Yefremov
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2022-01-10 09:58 +0100, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index cd0b54b041..7a9f0f7370 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2968,6 +2968,7 @@ F:	configs/beaglebone_defconfig
>  F:	configs/beaglebone_qt5_defconfig
>  F:	package/acl/
>  F:	package/attr/
> +F:	package/avrdude/
>  F:	package/boost/
>  F:	package/bootstrap/
>  F:	package/cannelloni/
> -- 
> 2.17.0
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
