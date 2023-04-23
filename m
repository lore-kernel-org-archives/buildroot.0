Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33892C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C63BA417D5;
	Sun, 23 Apr 2023 09:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C63BA417D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8A6w66U7R_V; Sun, 23 Apr 2023 09:42:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD70417EA;
	Sun, 23 Apr 2023 09:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADD70417EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1077A1BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA8E140443
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA8E140443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZgwIiAW-WQz for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:42:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56F1400D9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B56F1400D9
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:42:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 93729B0056A;
 Sun, 23 Apr 2023 11:41:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 11:41:59 +0200
Date: Sun, 23 Apr 2023 11:41:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230423094159.GB2696@scaer>
References: <20230422133607.607954-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422133607.607954-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682242921;
 bh=Yog11eqFQUZWmugiZd63IaaQl61JwV8+i05ubYRXaYw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qzjNcu7Xjlz5eRQtFi7RyDE9RX8rvMi74KCJhbZbYuRYlBoJCk4womL3XofuK+cEJ
 19fHmsOmuEaYqnFOyqBwX9sD0UkWf3kSlM1yJp08RTdnSg+vX78wKnibIOIshOZ5dx
 GOMfH88L2sXlF2jw1AnW4J4rrs7bRoRk/KUeuWfzqKhsBV/WV+SKmv6Zj4y1E2QVnT
 umSFEOFB9xpGMtFoRqPEoPwpGR9pxDq8fISAZuLKmV/e/IwzAVSohStEpJKXrDqalj
 N0BafWISXo7jxMollLrFua2lExdJJhtfvorzdgMv1ECyQmgMoUYBE6JjeYItjPbWM4
 +H9/HF9PavFWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qzjNcu7X
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: add the eCos exception
 to the GPL-2.0+ license
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

Dario, All,

On 2023-04-22 15:36 +0200, Dario Binacchi spake thusly:
> As noted by Yann E. MORIN in [1] only the src/flash/nand/ecc.c file
> refers to the eCos license.
> 
> The SPDX identifier for that file is:
> SPDX-License-Identifier: GPL-2.0-or-later WITH eCos-exception-2.0
> 
> The file is part of the openocd executable via libopenocd.la, which being
> a static library it is not installed.
> 
> Based on this, becomes more natural to associate the eCos exception with
> the GPL 2.0+ license, rather than considering it separately as a license.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20230411203930.2455301-1-dario.binacchi@amarulasolutions.com/
> Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openocd/openocd.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 9973498cf568..78c6e10c58e4 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -8,14 +8,13 @@ OPENOCD_VERSION = 0.12.0
>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
>  OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
>  OPENOCD_LICENSE = \
> -	eCos-exception-2.0, \
>  	BSD-1-clause, \
>  	BSD-2-clause, \
>  	BSD-2-Clause-Views, \
>  	BSD-3-clause, \
>  	BSD-Source-Code, \
>  	GFDL-1.2-no-invariants-or-later (docs), \
> -	GPL-2.0+ (code), \
> +	GPL-2.0+ with eCos-exception-2.0 (code), \
>  	GPL-3.0+ (stand-alone code), \
>  	MIT
>  
> -- 
> 2.32.0
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
