Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAC8C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C09A83C77;
	Sun,  7 May 2023 12:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C09A83C77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsBqm3-lFoeB; Sun,  7 May 2023 12:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23DB483BD2;
	Sun,  7 May 2023 12:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23DB483BD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C2DA1BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 138608227F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 138608227F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1NHNYKBllCl for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:05:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 803C382109
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 803C382109
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:05:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B73D419F743;
 Sun,  7 May 2023 14:04:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:04:57 +0200
Date: Sun, 7 May 2023 14:04:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507120457.GI252090@scaer>
References: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230506173917.1112500-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683461099;
 bh=y3tkKMFdUv8Xn3PlNepMAVV8qBaFOkJ2QzakzzbGYsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wq4gf+qn6iYjMffnw+m7F/NF6cpmC+gmWUnW3FaEpX8qfEh3A/jT5XNYFETjT0hcX
 x0v8l/sVFncoFai52mHUpIrKrZOOAirPvkU83GzV/e9+2ATQ/UvphUGdEvmggMsEyr
 ZL7gr2ftYGCeuf/koSKux8qf1Pm7EnlisP03J0M3WvVRGHg+otzZbN2xYrBl0I22Dg
 E5DVr0q0A5/wa8rPuSUBWFKClcURgq7yhrJiMeP4Qo2fpF0dzK/IESqLcSWDFV8prz
 XwpMjCvL8j548EPLMCCOJwlWwjhNfvHANSBWsQ4EtCq0QjZPpVdShCxblKughhXMN+
 vjitIGNf/XY6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wq4gf+qn
Subject: Re: [Buildroot] [PATCH 01/22]
 package/x11r7/xdriver_xf86-video-geode: bump version to 2.11.21
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

On 2023-05-06 19:38 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-May/003393.html
> 
> Fixes:
> http://autobuild.buildroot.net/results/d1d/d1dae8c7ba9dc82fbbcc5914ea3b378e48304617/
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Whole series applied to master, thanks.

I however had to do a few teeaks on some patches, I'll reply to them
individually.

Regards,
Yann E. MORIN.

> ---
>  .../xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash  | 4 +++-
>  .../xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk    | 6 +++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
> index 7a66c28b52..7dcb99fe2a 100644
> --- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
> +++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
> @@ -1,3 +1,5 @@
> +# From https://lists.x.org/archives/xorg-announce/2023-May/003393.html
> +sha256  8256ac3f14117324d00b7bfa8053645ca92562fe837c542489a502adbb5f9f1e  xf86-video-geode-2.11.21.tar.xz
> +sha512  e12f74268ab7d16b57644a9465b4be1ca28d250625a31b8810e19a1f94a17e47e0a258455155fd8f336fa59fd78160cdf3763aa94b85c6ccc2c42edf3b65bc61  xf86-video-geode-2.11.21.tar.xz
>  # Locally calculated
> -sha256  f497d0bfb09f36c72e3467e2d701f57f6b03ab8992c5d570e66582f714f84d64  xf86-video-geode-2.11.20.tar.bz2
>  sha256  3994ef7cee54f0935a4b57b1c34efd904da567931dd9e1a2d9390d22c8332ea2  COPYING
> diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
> index dbeae1aa65..8f84e4863f 100644
> --- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
> +++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.20
> -XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
> -XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
> +XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.21
> +XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.xz
> +XDRIVER_XF86_VIDEO_GEODE_SITE = https://xorg.freedesktop.org/archive/individual/driver
>  XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
>  XDRIVER_XF86_VIDEO_GEODE_LICENSE_FILES = COPYING
>  XDRIVER_XF86_VIDEO_GEODE_DEPENDENCIES = xserver_xorg-server xorgproto
> -- 
> 2.39.2
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
