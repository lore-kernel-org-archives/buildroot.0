Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B246AC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 17:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65FFD404E2;
	Mon, 27 Nov 2023 17:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65FFD404E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxZqiXCrNCoa; Mon, 27 Nov 2023 17:17:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49B540891;
	Mon, 27 Nov 2023 17:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49B540891
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 979221BF860
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 17:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F206405E1
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 17:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F206405E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZ0ZqpSDSkE0 for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 17:17:07 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23747404FF
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 17:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23747404FF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 12C6AB004FF;
 Mon, 27 Nov 2023 18:17:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 18:17:01 +0100
Date: Mon, 27 Nov 2023 18:17:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231127171701.GV3177259@scaer>
References: <20231126225717.326858-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231126225717.326858-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701105425;
 bh=3aAnXqBYdjfLKBA6htB4DWRAasM4Y6LDg/BQ/0r4XPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=djpxNmeQ0n1mnfCxE9p/Pn7+ulvuTTw7X63t34TIJT5/ck++JKDMT1LSIOrGxvVQB
 n3bZCQnQYuahn58zShaNlvqxH4a2QmZqMGmCOGcY3LcE81wUHpf1Ns2TIG8qrnqG6B
 pCRmbu7hk3Ed+nwXD8ZGTq7zoyDeBVJSLH3SY7ONZEnt4K6sHPCrBSpMHTJLYKyCte
 xoGMnvydJqkVq/eK/7Mbj2ibSuJ/Gms1ddReecoO57aqe/Bgozz1BjshVQiiOPGX0Z
 jt8/Mp5bv7iZNaeQaxdMN3x4iQFTw/w9IHjUsLZzaBXfUzSYbKV7/UbGJysR2Ke4If
 hJK7Wv+1X9nRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=djpxNmeQ
Subject: Re: [Buildroot] [PATCH 1/1] package/exfatprogs: add
 EXFATPROGS_CPE_ID_VENDOR
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-11-26 23:57 +0100, Fabrice Fontaine spake thusly:
> cpe:2.3:a:namjaejeon:exfatprogs is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/detail/F174A846-F275-4AD8-A0E3-6D0CEFDFF308
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/exfatprogs/exfatprogs.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
> index d755c7a214..fcc9ff0788 100644
> --- a/package/exfatprogs/exfatprogs.mk
> +++ b/package/exfatprogs/exfatprogs.mk
> @@ -9,6 +9,7 @@ EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
>  EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
>  EXFATPROGS_LICENSE = GPL-2.0+
>  EXFATPROGS_LICENSE_FILES = COPYING
> +EXFATPROGS_CPE_ID_VENDOR = namjaejeon
>  
>  $(eval $(autotools-package))
>  $(eval $(host-autotools-package))
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
