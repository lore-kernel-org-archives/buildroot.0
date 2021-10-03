Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3883EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:18:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F6A61267
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2F6A61267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C688540593;
	Sun,  3 Oct 2021 17:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9acNEko4-DpA; Sun,  3 Oct 2021 17:18:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7E92405F1;
	Sun,  3 Oct 2021 17:18:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB99A1BF31E
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB8C740478
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sYDMC93OB-Ab for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 17:18:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73B6040471
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 17:18:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 705E713F88F;
 Sun,  3 Oct 2021 19:18:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633281501;
 bh=/dnMm1BRpR0CCCxktPpvC/GDDcfawnEPhWrAmZ+7R0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xod0bHVzCjGXx4E+XojbkV0Spss6x7kYsQ/IlizskY2/d0D3r+s7rxohcUKvVt0M1
 3ocI1Jmavq2SpZkCcDNyvInCp8RLCqhhx+7JpI0FjL3oU2nLKaujl8TXQIZ+wp9UcK
 LJbLhhP4xzacqpLK0wEhn87ryzkKstp9SNGhzQykgf9Un9CIYUVjyC/5x+UWRZzJym
 d3EefJGP4j1vwRJfXdAswTCL5kRAZMRolgtCFe9mAWmJ0HEYCaslfPqNkvo+hU2EZa
 Kkho3AMVgaGwqYCX1irYLdw2849uWpG8NvhlcnoF0ylthQMFNm3cucx6jpRsdJlcjX
 gOG93qWl3o1Fw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 19:18:17 +0200
Date: Sun, 3 Oct 2021 19:18:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211003171817.GL1504958@scaer>
References: <20211003082247.7120-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211003082247.7120-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version
 to 19.0.0-Matrix
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

Bernd, All,

On 2021-10-03 10:22 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> index 9184932ec1..f336c39f2f 100644
> --- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> +++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  8adfda3b257debf231b313b8d825afae5ae98c67afd4655d69d2ea40acd9861b  kodi-pvr-mythtv-7.3.4-Matrix.tar.gz
> +sha256  14d76fda4b9c8e7ac068071e322432fe585357154a2b2bae23d051def766f06d  kodi-pvr-mythtv-19.0.0-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> index df2e4ff890..fe89082913 100644
> --- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> +++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_MYTHTV_VERSION = 7.3.4-Matrix
> +KODI_PVR_MYTHTV_VERSION = 19.0.0-Matrix
>  KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
>  KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
>  KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
> -- 
> 2.30.2
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
