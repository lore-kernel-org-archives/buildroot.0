Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E430C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 17:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E7EB60F36;
	Mon, 21 Nov 2022 17:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E7EB60F36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMwEEqJnxMwW; Mon, 21 Nov 2022 17:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB61260F2E;
	Mon, 21 Nov 2022 17:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB61260F2E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 220E31BF354
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 17:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F16FD40AE1
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 17:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F16FD40AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1vCV73We5qp for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 17:49:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1668640A92
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1668640A92
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 17:49:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1201213F8AF;
 Mon, 21 Nov 2022 18:49:05 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 18:49:05 +0100
Date: Mon, 21 Nov 2022 18:49:05 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <20221121174905.GI2516@scaer>
References: <20221116084340.1068161-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116084340.1068161-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669052948;
 bh=h2pcodX/FRxM75HbOL/0NRGVW68c6jn9LRpnOF534oY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hqgi+6hIhjl9qFIi0Pkca3zQLe3EJ52snuQB+m2qs6fq7z1E59FOLSbdld/WibzuA
 PBoWy7mDfOtL2Nio4YwHCaQ3HplSGGSayczhMD/kAGx4x/+6Zh0B6pWZ66gQ/K/yhh
 72wpbLoDXIrSwqIhqCT07lVQug+XGIeAK+oM/o/R0K+D+561xHTpAp5sPBtMxXxyNm
 9pJwn9gp30K/crlmSeYvOIxDNsWBpmMLcpJhLMBUZbx36LyoUrA0LRObYp8dwHFfRu
 K2MoNK1pzUhYCW/ejk15oAEP/ljxqvINgL0/j2HVP/+CNtd4iA9w3z6lemMieyMkJY
 Cv++ITQDe6ayg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hqgi+6hI
Subject: Re: [Buildroot] [PATCH] README: fix reference to submitting-patches
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

Miquel, All,

On 2022-11-16 09:43 +0100, Miquel Raynal via buildroot spake thusly:
> While looking for refreshing my mind about Buildroot contribution
> guidelines, I actually stumbled upon a 404 error. It seems like the
> manual URL has slightly evolved since 2016, so fix it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/README b/README
> index 008e996f5f..2d33c8ce37 100644
> --- a/README
> +++ b/README
> @@ -23,4 +23,4 @@ buildroot mailing list: buildroot@buildroot.org
>  You can also find us on #buildroot on OFTC IRC.
>  
>  If you would like to contribute patches, please read
> -https://buildroot.org/manual.html#submitting-patches

For me, this does not return a 404, but does properly redirect to the
following URL... Maybe a temporary fluke?

Can you please double-check now?

Regards,
Yann E. MORIN.

> +https://buildroot.org/downloads/manual/manual.html#submitting-patches
> \ No newline at end of file
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
