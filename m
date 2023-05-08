Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C817C77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 20:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 197F842AA2;
	Mon,  8 May 2023 20:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 197F842AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7AnU49Qf4wD; Mon,  8 May 2023 20:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 331BF42A97;
	Mon,  8 May 2023 20:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331BF42A97
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62ECD1BF34E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A96B40231
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 20:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A96B40231
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26NIwORYHCbX for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 20:10:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F077B4020B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F077B4020B
 for <buildroot@buildroot.org>; Mon,  8 May 2023 20:10:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3D69E2003BE;
 Mon,  8 May 2023 22:10:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 22:10:24 +0200
Date: Mon, 8 May 2023 22:10:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20230508201024.GM252090@scaer>
References: <20230426080824.2094413-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426080824.2094413-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683576628;
 bh=e6cUffe+OeDkRzQEIMWMtF0sXaI2MswGvZOqWBBbK6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oa78GTEvLLQqlFj92hyY0xV6BGEFKr3oSyGdSBgIqvDb5WzxkrcvEs7KX4wdArAZQ
 QC8uev7dR8NSj/ANkTV403kIzgOj90LM+8Kx85w33QRtM4OjyPWfvcsT4WO4wDfztj
 MY3XTWREnPK0PnMRjIq83hGSvBtg1muK9laMxxmL09Vq/qCu2skKPKPdIvzafoIA1g
 Yth02YDvn/yjv4jqlRH8EmWtS35lHJAPtpJOnhC/b45XnlMzPnc0tw69nTLPRwsHj/
 dDoiUoNwJlgUnv5jZGB4qC85bztYDdTR8EWQgf26jJ+Obw66O7fjhR2lxORyEKb/El
 Q9Ix0y30S3cmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Oa78GTEv
Subject: Re: [Buildroot] [PATCH] package/mdio-tools: fix Config.in
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
Cc: Robert Marko <robimarko@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2023-04-26 10:08 +0200, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add project's site and add a full stop at the end of the description.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mdio-tools/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
> index 237f4454cc..790c9c534a 100644
> --- a/package/mdio-tools/Config.in
> +++ b/package/mdio-tools/Config.in
> @@ -14,4 +14,6 @@ config BR2_PACKAGE_MDIO_TOOLS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
>  	select BR2_PACKAGE_LIBMNL
>  	help
> -	  Low-level debug tools for MDIO devices
> +	  Low-level debug tools for MDIO devices.
> +
> +	  https://github.com/wkz/mdio-tools
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
