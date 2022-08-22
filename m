Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB45CC32792
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 19:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A33B41684;
	Mon, 22 Aug 2022 19:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A33B41684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_R-vSqOq3ac; Mon, 22 Aug 2022 19:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A254E4167E;
	Mon, 22 Aug 2022 19:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A254E4167E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D708D1BF420
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B05194167E
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 19:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B05194167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZjuJX3LKO2o for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 19:56:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 014844167A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 014844167A
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 19:56:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C2D7960138;
 Mon, 22 Aug 2022 21:56:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 21:56:31 +0200
Date: Mon, 22 Aug 2022 21:56:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <20220822195631.GE2167049@scaer>
References: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420083923.3875405-1-thomas.perrot@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661198194;
 bh=N/p3MqjJf0BQOCB400yDgBFCBcO8Lz5bhNXgWwfqUnM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sd4sFOUjJTTFbyuunx9SbcMeOpUcweBFMEwMzRvzbRoDtjL4ou0utWg/tXotjNE13
 X2xl6ODP8mpy59QOCOPx8fEpPPGp3C8BBd4l13jXD0pnTHMCBUtAvkJ65GqNbgGGT6
 zZM3RuplSCtRCBRFugEsLatZZ13xKHuhNhSiaoy7ORiTBsi68+rXWs/SwmpNOil6mO
 Yop1b5/grh/XNC0y573tLI67Pkm10JDY5jpR/WsJwIwTGjYR94uzYaruRb53voNWBb
 AdcOTr5j3yPnm3u1MEMz6WIJm4C7OgdlHa1PvX2gnkdYpJPYzH+lUPNCtCqoCmSjvS
 CdP0/DJ9oFIyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sd4sFOUj
Subject: Re: [Buildroot] [PATCH v2 1/2] package/byacc: new package
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-04-20 10:39 +0200, Thomas Perrot via buildroot spake thusly:
> This package provides a Berkeley LALR Yacc parser generator that has been use
> by i.MX Code Signing tool.

Since this package is a host-only package, and it has no Kconfig entry,
and as there were concerns with the imx-cst package, byacc is
effectively dead code for now.

So, I've marked this patch as postponed.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
> 
> Changes v2:
> - Remove Config.in.host
> - Add a trailing slash
> - Add a comment about HOST_BYACC_CONF_OPTS
> 
>  DEVELOPERS               |  3 +++
>  package/byacc/byacc.hash |  3 +++
>  package/byacc/byacc.mk   | 16 ++++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/byacc/byacc.hash
>  create mode 100644 package/byacc/byacc.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ca9decb58fec..6e49334dcc42 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2765,6 +2765,9 @@ F:	package/frotz/
>  F:	package/kvm-unit-tests/
>  F:	package/xorcurses/
> 
> +N:	Thomas Perrot <thomas.perrot@bootlin.com>
> +F:	package/byacc/
> +
>  N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  F:	arch/Config.in.arm
>  F:	board/beaglev/
> diff --git a/package/byacc/byacc.hash b/package/byacc/byacc.hash
> new file mode 100644
> index 000000000000..d2ad441df39f
> --- /dev/null
> +++ b/package/byacc/byacc.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  42c1805cc529314e6a76326fe1b33e80c70862a44b01474da362e2f7db2d749c  byacc-20220128.tgz
> +sha256  654a231fe9cd4d36e580214962fa777a1df0771d6889cfc74d19a3d414f14711  LICENSE
> diff --git a/package/byacc/byacc.mk b/package/byacc/byacc.mk
> new file mode 100644
> index 000000000000..648dc9a040ca
> --- /dev/null
> +++ b/package/byacc/byacc.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# byacc
> +#
> +################################################################################
> +
> +BYACC_SITE = https://invisible-mirror.net/archives/byacc
> +BYACC_VERSION = 20220128
> +BYACC_SOURCE = byacc-$(BYACC_VERSION).tgz
> +BYACC_LICENSE = Public Domain
> +BYACC_LICENSE_FILES = LICENSE
> +
> +# To name byacc instead of yacc the binary built.
> +HOST_BYACC_CONF_OPTS = --program-transform-name='s,^,b,'
> +
> +$(eval $(host-autotools-package))
> --
> 2.35.1
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
