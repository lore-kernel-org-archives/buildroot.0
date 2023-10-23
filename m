Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC19C25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA35E4222B;
	Mon, 23 Oct 2023 17:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA35E4222B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RxngiP4E-OIY; Mon, 23 Oct 2023 17:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E37884227C;
	Mon, 23 Oct 2023 17:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E37884227C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 327AE1BF371
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 186E2612B4
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 186E2612B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yacCBU--40nL for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:21:13 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A666612B3
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A666612B3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:8ed0:8cf1:4440:5c7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CB96C200587;
 Mon, 23 Oct 2023 19:21:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Oct 2023 19:21:08 +0200
Date: Mon, 23 Oct 2023 19:21:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231023172108.GY2607@scaer>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
 <20231023092501.481436-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023092501.481436-2-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698081671;
 bh=2kN7SFXAFi46xFLSn0VMtCsWrF7S3OVoMtklRKVy4Cc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AKokErOoITsdtXnfrQZHcD+z/hUjii3K/MztAwuFvyx4xwQixOba2N3YUKgBoWTwl
 +RRFv10bd/Gkef3s6T1Z2vdsoCmbcxxx97d6/y6S8UeeAD3u8zxHFSE4Zh2IM98pG/
 Efb3In2QMyYyl320byYkoRxiIqHCR3c3RcaHmq074zyeoVrgFm0GZ67L2C6FA8wtTo
 oIkuwqcY55SiCP/UAla3MyKJES213FGGvlTkX4Lpn/4uz9uR1pdleQ8eIwxy1LXW96
 umGGIllTZZxv33RN17ZpRDvWMoBc80NmetTmBbHjUKmGTrMxmA+nxcg1x2Hy7O/5O8
 ZX0p+GTNi4ahQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AKokErOo
Subject: Re: [Buildroot] [PATCH 2/8] package/opkg-utils: bump version to
 0.6.2
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Aam, All,

On 2023-10-23 11:24 +0200, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opkg-utils/opkg-utils.hash | 2 +-
>  package/opkg-utils/opkg-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
> index 29671f9609..7aabe4d1a1 100644
> --- a/package/opkg-utils/opkg-utils.hash
> +++ b/package/opkg-utils/opkg-utils.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  e0fcaab51bff2149bd6560fb4238319d502dd99b581f66763d702e75c224736d  opkg-utils-0.4.5-br1.tar.gz
> +sha256  ad4fb6d01f2f18e986c556cca1ade584b109c277794af15977c354d2ecef9b52  opkg-utils-0.6.2-br1.tar.gz
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
> index 384a7323ee..b077e0dcce 100644
> --- a/package/opkg-utils/opkg-utils.mk
> +++ b/package/opkg-utils/opkg-utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPKG_UTILS_VERSION = 0.4.5
> +OPKG_UTILS_VERSION = 0.6.2
>  OPKG_UTILS_SITE = https://git.yoctoproject.org/git/opkg-utils
>  OPKG_UTILS_SITE_METHOD = git
>  OPKG_UTILS_LICENSE = GPL-2.0+
> -- 
> 2.41.0
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
