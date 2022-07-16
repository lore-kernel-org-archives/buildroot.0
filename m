Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DF1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 15:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ADCF42309;
	Sat, 16 Jul 2022 15:38:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ADCF42309
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1BE-Xd6UM4M; Sat, 16 Jul 2022 15:38:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2CC422C4;
	Sat, 16 Jul 2022 15:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC2CC422C4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 712D31BF4DA
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B045404C7
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 15:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B045404C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sw5-5nJExTxR for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 15:38:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45B37400FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45B37400FB
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 15:38:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44d:f503:4d93:3115])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CBB5DB00721;
 Sat, 16 Jul 2022 17:38:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Jul 2022 17:38:39 +0200
Date: Sat, 16 Jul 2022 17:38:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716153839.GH2543@scaer>
References: <20220615210724.120635-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615210724.120635-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657985922;
 bh=gxb9oTMG7rKLUN8YK4ikK4WAd4NnNese2MPMv7yt5TU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLimtHAuq4sIcRnBRRG/RfKgPXp191U2Xb6Gxp1pPxRfMs8jxJamo1bzwgt25UHhi
 8hNg33NoYj4iIbUwz4ieoCY3ra2xEG30rRvWBH7zDTAztmdYnejG+77SP91+pj5L5k
 v28ZyFwGf6/l2rnIxvKGfBQCmEGMOAoHYXOEPv/i9UT2JcchjGPL78vX6+muF7Bi5N
 gfROupoZGHO+Od9ubHQpp7G22al0fb2lWpJEY1gElh9UdDUIxEHsOMz2/tAJGweF+v
 2exgQScUu1feoeS8o8Huqm6Y/T7KjR8kxkRMANysYFrsInKqP5ES/wylGGgiZGSLNa
 /LreZ8jhCcM+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PLimtHAu
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bottle: security bump to
 version 0.12.21
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-06-15 23:07 +0200, Fabrice Fontaine spake thusly:
> - Fix CVE-2022-31799: Bottle before 0.12.20 mishandles errors during
>   early request binding.
> - Update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-bottle/python-bottle.hash | 6 +++---
>  package/python-bottle/python-bottle.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
> index 7dcaac8dc6..b1cc2aac20 100644
> --- a/package/python-bottle/python-bottle.hash
> +++ b/package/python-bottle/python-bottle.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/bottle/json
> -md5  50075544706b5e662a3fbd9a98e24b07  bottle-0.12.19.tar.gz
> -sha256	a9d73ffcbc6a1345ca2d7949638db46349f5b2b77dac65d6494d45c23628da2c  bottle-0.12.19.tar.gz
> +md5  4934ad7347eef30db669ccd05283a5e0  bottle-0.12.21.tar.gz
> +sha256  787c61b6cc02b9c229bf2663011fac53dd8fc197f7f8ad2eeede29d888d7887e  bottle-0.12.21.tar.gz
>  # Locally computed sha256 checksums
> -sha256	d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
> +sha256  d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
> diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
> index d19a439f8c..ffea59f38f 100644
> --- a/package/python-bottle/python-bottle.mk
> +++ b/package/python-bottle/python-bottle.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_BOTTLE_VERSION = 0.12.19
> +PYTHON_BOTTLE_VERSION = 0.12.21
>  PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
> -PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/ea/80/3d2dca1562ffa1929017c74635b4cb3645a352588de89e90d0bb53af3317
> +PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/95/e3/5749d7657b6fb38d65afb3c0b345514a783de7a9feb4fab594fa0bacc2a0
>  PYTHON_BOTTLE_LICENSE = MIT
>  PYTHON_BOTTLE_LICENSE_FILES = LICENSE
>  PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
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
