Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1533C77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 17:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4695E42EAE;
	Sat, 13 May 2023 17:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4695E42EAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OUeY_agN8I1O; Sat, 13 May 2023 17:56:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12ED342EA6;
	Sat, 13 May 2023 17:56:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12ED342EA6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D369B1BF5DA
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 17:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8D1D42E99
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 17:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D1D42E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBH6YyXy2mQ0 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 17:56:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A50A42EA5
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A50A42EA5
 for <buildroot@buildroot.org>; Sat, 13 May 2023 17:56:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5CC4B19F73E;
 Sat, 13 May 2023 19:56:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 19:56:49 +0200
Date: Sat, 13 May 2023 19:56:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20230513175649.GV2582048@scaer>
References: <20230421113627.20594-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421113627.20594-1-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684000611;
 bh=vIo5ucHm77BjjjXBXSlPkI5ukNfUOoZ6tVM6j6Wibk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmalHwfMkyVGQEADVE8xtpzLYfXCXmeM0c0lN0ci0q5Wq7MEDVcWeDS5lp7sGy5Tg
 wHTM28uASYp2ll/FWzEG3ozRusUcOXFT8Sx3AZdVPiks9mhUtxJ9y+AIK7249xmdNb
 1Od9NxHakGmFYuPgw8V4V2D97y7AmNseE6xsPAqXi33PSJeTSHjJM+QioE3BFwuUhw
 s/KCWCRQitIUuDfbmB/Zj8VymC4cn0q/q/jpAwr1j23RAff1GtvmbLEVKDxYmXDHqz
 P61SWmOMoasJT8K+RBX9pJ07lSl/n7qtUkYTSrJ97AR4TaRkJPXoz0QIslIKthSlra
 X9UZ3KZ7F7tyw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PmalHwfM
Subject: Re: [Buildroot] [PATCH] package/pahole: bump to version 1.25
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

Francis, All,

On 2023-04-21 12:36 +0100, Francis Laniel spake thusly:
> https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=v1.25
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pahole/pahole.hash | 2 +-
>  package/pahole/pahole.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
> index 5610b252a3..9dc676d9f4 100644
> --- a/package/pahole/pahole.hash
> +++ b/package/pahole/pahole.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  eeb88a62c3aaa1f4c389117b7e7cc08a49acc8a0e7f165f76dd9c5ab9af2c266  pahole-1.24.tar.gz
> +sha256  db31d13c3dad8d9f4e38296bd35c4586e98b9c950e07dabba212985e6d051631  pahole-1.25.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
> index 82bba2f777..1a3e156ebb 100644
> --- a/package/pahole/pahole.mk
> +++ b/package/pahole/pahole.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PAHOLE_VERSION = 1.24
> +PAHOLE_VERSION = 1.25
>  PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
>  HOST_PAHOLE_DEPENDENCIES = \
>  	host-elfutils \
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
