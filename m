Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EABC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 09:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B047408A5;
	Wed,  5 Jan 2022 09:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q07GPK8Gi4Gh; Wed,  5 Jan 2022 09:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9108F405B2;
	Wed,  5 Jan 2022 09:21:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82C0F1BF390
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7145B410B6
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 09:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZuPwi2fY9Vs for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 09:21:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DAEE409DE
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 09:21:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd8f:11a1:7592:f85e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3CD2C200371;
 Wed,  5 Jan 2022 10:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641374497;
 bh=Rav7s2Clj1AF2LjvWkPHS9P+ot/UjJoFrAMVoigBwgg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=il4NYb2dgpFnC3owyj2VD+hTe4Z1b6kOHBku1RXJW1i+5wI9yQgIhHi5bHeFe5Wcz
 kf4W081PcFTZ60ZV2hjU5pznoVG6+QEntMIH4K3Zwak1p2b+v869I/3D7x7W/oA/mB
 jaEWZpKA45LBG8pK5Vq+ubfYkBxo1j+8COvXG0FLIsaomybGZYtIfv0Ry8UirX8L1a
 WVhaF+tvPq21gW70LShFl0xy127te6YhsmxZMpdJbl1um7mLaovBTeYReoL/Xc++uN
 /ZbxRaFx/3gF+hvPAVr5JWmQdYf3dLpnR7EMJBUTUPDuA0x10N2/OpFbHh0yXWibPH
 6jx0Aal4iEiGw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 10:21:30 +0100
Date: Wed, 5 Jan 2022 10:21:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20220105092130.GE614810@scaer>
References: <20220104230522.1433670-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104230522.1433670-1-florian.fainelli@broadcom.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/elfutils: bump to version 0.186
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
Cc: mmayer@broadcom.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2022-01-04 15:05 -0800, Florian Fainelli spake thusly:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> https://sourceware.org/pipermail/elfutils-devel/2021q4/004346.html
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to master, thanks.

> ---
>  package/elfutils/elfutils.hash | 4 ++--
>  package/elfutils/elfutils.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/elfutils/elfutils.hash b/package/elfutils/elfutils.hash
> index 9148758e29f4..3274b3265081 100644
> --- a/package/elfutils/elfutils.hash
> +++ b/package/elfutils/elfutils.hash
> @@ -1,5 +1,5 @@
> -# From https://sourceware.org/elfutils/ftp/0.184/sha512.sum
> -sha512  5920c354edd6b28bb7e713d674bf6f2221e8ee91b90d582de39b1f45446aea1e7e3d4b6671024c391675b5e7530fe952c1320d730bb625c02d4c647ceb938bc8  elfutils-0.184.tar.bz2
> +# From https://sourceware.org/elfutils/ftp/0.186/sha512.sum
> +sha512  c9180b27ec62935f18b9431268d176f6023d1bb938731d2af6e7626ae460af6608a70ba68483aa1ec7e6cb0fa0528b661ca8b68bc4f58ea8e18af527c5950c78  elfutils-0.186.tar.bz2
>  # Locally calculated
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING-GPLV2
> diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
> index c64224a90f87..8116ae597241 100644
> --- a/package/elfutils/elfutils.mk
> +++ b/package/elfutils/elfutils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ELFUTILS_VERSION = 0.184
> +ELFUTILS_VERSION = 0.186
>  ELFUTILS_SOURCE = elfutils-$(ELFUTILS_VERSION).tar.bz2
>  ELFUTILS_SITE = https://sourceware.org/elfutils/ftp/$(ELFUTILS_VERSION)
>  ELFUTILS_INSTALL_STAGING = YES
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
