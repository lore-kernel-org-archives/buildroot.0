Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F8FCCA481
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91EE160F45;
	Sun, 17 Jul 2022 13:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91EE160F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMtWlz92-t9l; Sun, 17 Jul 2022 13:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7935660F34;
	Sun, 17 Jul 2022 13:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7935660F34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB4FB1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2B5B60C1D
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2B5B60C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bEM5iBk7w8ND for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:21:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1D5D60AFD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1D5D60AFD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:21:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B6629780502;
 Sun, 17 Jul 2022 15:21:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:21:02 +0200
Date: Sun, 17 Jul 2022 15:21:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <20220717132102.GD2249625@scaer>
References: <20220713084648.1941220-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713084648.1941220-1-damien.lemoal@opensource.wdc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064067;
 bh=dx7tVD11+fmZF6vjg1O9E+6lTYAsvgfieUljUnz8nqU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XlMKoIAJoXEZkn8/1c+W/skjxNVxfi7q+yTv/ufiVZxtwdAAL0ES0YuCuHcSiSux0
 hSxDPPGhWvmJlbyK8L4XLztjlWut3afY+nN34AnxP5Y9Oq4XpYbvwFSBMAccvw8/TL
 ZizoP0uVvlFztKUv3eW6d8aAqof9Gs/oxFrgSNGbsgl9r07MJGdzo6+yP2YB1uBeGp
 46owZmwsaGE1ngpwaI1iIURz/vxH6D3G9p80k6iLsSQvvJtile/NoGM7l0HSR0rJyb
 s0iRHtfXGoR37cIqDCa4LCh9hFIwEsThcuzg/GL45Zx6PXH/kyu7vI5FssdX1oP50G
 LhQkicn60P6Iw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XlMKoIAJ
Subject: Re: [Buildroot] [PATCH] package/python-kflash: Update to version
 1.1.6
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Damien, All,

On 2022-07-13 17:46 +0900, Damien Le Moal via buildroot spake thusly:
> Update the python-kflash package to the new verseion 1.1.6 (from 1.1.5).
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-kflash/python-kflash.hash | 4 ++--
>  package/python-kflash/python-kflash.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-kflash/python-kflash.hash b/package/python-kflash/python-kflash.hash
> index 722c4e879b..a4e5238635 100644
> --- a/package/python-kflash/python-kflash.hash
> +++ b/package/python-kflash/python-kflash.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/kflash/json
> -md5  85549bcc1faa0f2cd5ebe3b04759e7fa  kflash-1.1.5.tar.gz
> -sha256  40a0976b52942c7a3bdfa2d9e2bdc8d7526cf6deb0759c8384281240c8fb404e  kflash-1.1.5.tar.gz
> +md5  5b4376ea60f20368852d0c4743e6ed08  kflash-1.1.6.tar.gz
> +sha256  ec5fbb35ea81a91c89f458d375e24a6dab3d3865c69a7e6250511b2e93f4b695  kflash-1.1.6.tar.gz
>  # Locally computed sha256 checksums
>  sha256  c48133d7a08d743c2c01c6190fc1860f7d73777afa2199ed8d0a035b754d8bf9  LICENSE
> diff --git a/package/python-kflash/python-kflash.mk b/package/python-kflash/python-kflash.mk
> index adbf6b30b0..efc0f52eba 100644
> --- a/package/python-kflash/python-kflash.mk
> +++ b/package/python-kflash/python-kflash.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_KFLASH_VERSION = 1.1.5
> +PYTHON_KFLASH_VERSION = 1.1.6
>  PYTHON_KFLASH_SOURCE = kflash-$(PYTHON_KFLASH_VERSION).tar.gz
> -PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/c4/b3/1c25a92922bfd3dbc05d972352c071167cad035c615f6f068f75c2f0fd01
> +PYTHON_KFLASH_SITE = https://files.pythonhosted.org/packages/4f/80/d2eaa114bf4434b18fcf8960a907ffce12c9400b08c05902b36007d545b7
>  PYTHON_KFLASH_SETUP_TYPE = setuptools
>  PYTHON_KFLASH_LICENSE = MIT
>  PYTHON_KFLASH_LICENSE_FILES = LICENSE
> -- 
> 2.36.1
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
