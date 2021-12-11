Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD201C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903F76111B;
	Sat, 11 Dec 2021 21:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1I-h0hXh0U8P; Sat, 11 Dec 2021 21:14:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D646112B;
	Sat, 11 Dec 2021 21:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82D801BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F318580E
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDOJ2VZX5hsm for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:14:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 185C88580B
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:14:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d990:31ba:fb8b:998b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3588DB0053E;
 Sat, 11 Dec 2021 22:14:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639257264;
 bh=JLit5A13NGau3xd5cvw0mKVla2SXDZx4Jhg59Y3sHFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mbdEmgiblR/twnVojL4joPeMdGXUdBj5P2CR1N/FV5+GrwZhXutDDaDfiUDTiGM1Y
 olso5Tzlr1xHLPq0ECy1GS7nd/1xOfKxms2azlTdR3S1zybvaZaxDXuKUesVkM6wdq
 n2UKCUg/tg4HNV8VK2w+9yQm1s2+6llVLlPoYfABM41iV8/w2v+69NPCQG/ZrBQRZ+
 9Saqsu90dkCwSvi2nYy5G670kcHkRWLygs5JVAzMT2CrCsok29bOdweF/UWcTaJTz+
 UmN2cxxls6Lyvh0libyMZzI+7nMOXc71Rfa7VQbkT5nDgHp4LnQ1g1/zFEFwjjnd0J
 IkNMrLFphT+Kw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Dec 2021 22:14:21 +0100
Date: Sat, 11 Dec 2021 22:14:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211211211421.GP2603@scaer>
References: <20211211185521.2621478-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211211185521.2621478-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/kodi-inputstream-adaptive: bump
 version to 19.0.1-Matrix
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

On 2021-12-11 19:55 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://github.com/xbmc/inputstream.adaptive/releases/tag/19.0.1-Matrix
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Series of 3 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
>  package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> index 14ce7a6fd0..d193a0c4f8 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  10d0e79a301094cdaa35b3e92c4da6b693fc0b5661ea3b459329245fcdfa2f65  kodi-inputstream-adaptive-19.0.0-Matrix.tar.gz
> +sha256  d389af940011887378d1e6ad0ad91b81cfc138b862cf4a43593388c33308cb55  kodi-inputstream-adaptive-19.0.1-Matrix.tar.gz
>  sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.GPL
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> index 6c6a2eaa80..6044ed07fb 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.0-Matrix
> +KODI_INPUTSTREAM_ADAPTIVE_VERSION = 19.0.1-Matrix
>  KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.GPL
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
