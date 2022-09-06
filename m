Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCBCECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 09:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0170540B7F;
	Tue,  6 Sep 2022 09:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0170540B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8j4GiQ-jfQ02; Tue,  6 Sep 2022 09:38:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 072DD400E7;
	Tue,  6 Sep 2022 09:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 072DD400E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C7E21BF2FF
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 09:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31F0440299
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 09:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31F0440299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bgc3RB5a2sXr for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 09:38:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C105D40242
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C105D40242
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 09:38:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B2064B0051E;
 Tue,  6 Sep 2022 11:38:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 11:38:38 +0200
Date: Tue, 6 Sep 2022 11:38:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergio Prado <sergio.prado@e-labworks.com>
Message-ID: <20220906093838.GT1490660@scaer>
References: <20220904171217.2528472-1-sergio.prado@e-labworks.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904171217.2528472-1-sergio.prado@e-labworks.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662457120;
 bh=RgIMVJKnCeGqROJYqWRkJpcsR/Zg3F3N05fdzgf94nY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MpWaIGxRk8dW1G+hquhRgnoHq2kOFq7wrfVIxCwyKUoMaioGs6QCd7hmBYCnz+07C
 EayHbm9KnhyFivdmzvqkEQazp4AW82sgQHLjM3m6PpCN2nXo4YcMEQuTP4kbQC9KMx
 O+gRLge1l+xPEB33z5X+V3PpXLZWzkIbS+0YcBTLssVy+ZejWOjhZoScQjm++h/80T
 qBEQG6EDx6poumTuaCUW1j3NS8GtTl2LbbwELZUCNB1/l8yID60F4N1SgJH1JCE4lR
 RTCekkFNJwpq0pyUB3GjDEXqovPwswnU4PZUYuS/ER9qwfOCdy2gJtrpwIpI+5icys
 x2j4cTfXTMrdw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MpWaIGxR
Subject: Re: [Buildroot] [PATCH] package/tio: bump to version 1.47
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

Sergio, All,

On 2022-09-04 14:12 -0300, Sergio Prado via buildroot spake thusly:
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tio/tio.hash | 4 ++--
>  package/tio/tio.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tio/tio.hash b/package/tio/tio.hash
> index 5058ccca8e71..cb0311a752ed 100644
> --- a/package/tio/tio.hash
> +++ b/package/tio/tio.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/tio/tio/releases/download/v1.40/tio-1.40.tar.xz.sha256sum:
> -sha256  beafc4763552ff7cf3a368e8af36258018ef85fac32133c4635051d7615ab527  tio-1.40.tar.xz
> +# From https://github.com/tio/tio/releases/download/v1.47/tio-1.47.tar.xz.sha256sum:
> +sha256  6f39ac582de747feb9a64c14e6b378c61cb0c3bfa6639e62050022c1b7f5c544  tio-1.47.tar.xz
>  
>  # Hash for license files:
>  sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
> diff --git a/package/tio/tio.mk b/package/tio/tio.mk
> index 5c469667f642..0035ce445ee2 100644
> --- a/package/tio/tio.mk
> +++ b/package/tio/tio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TIO_VERSION = 1.40
> +TIO_VERSION = 1.47
>  TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
>  TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
>  TIO_LICENSE = GPL-2.0+
> -- 
> 2.25.1
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
