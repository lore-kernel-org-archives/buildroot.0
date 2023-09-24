Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44312CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 10:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E67E141811;
	Sun, 24 Sep 2023 10:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67E141811
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_SVjp1iwjV3; Sun, 24 Sep 2023 10:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7953B41900;
	Sun, 24 Sep 2023 10:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7953B41900
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14D6E1BF365
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF49E60ED0
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 10:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF49E60ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6VoGahb_h-w for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 10:36:55 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D827F60B98
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 10:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D827F60B98
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0FBBD780316;
 Sun, 24 Sep 2023 12:36:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 12:36:49 +0200
Date: Sun, 24 Sep 2023 12:36:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230924103649.GO1469982@scaer>
References: <20230923111735.421028-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923111735.421028-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695551813;
 bh=t6kVfBSxOd5R1rtDvXoxSERCQZiSkI/8pmOLieY09uA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oBlOAF7t5iPbm4jemdYNu/ycSIecgCJWVXZ2set38INob1dXNpvLpFeR6QNizWdci
 jvqu0dXdsUke9aAnrniV2C6Vt0EkMbR29MGiE50qtv3zhRBhCmvDu9vteHpwCpBofh
 MmfXMGbkXU3cCSUEbKm5jBVkjhWrOU2wsC+Sh19UuVsRvBj1VrZEjLgkpmDdtHUjjO
 dddFBlFf6nHatakrHkq8/o5DUf/g5DciTGrvlV8vaZhK9rwPz6lx9nZ0JMlHRxojJo
 bGo4Q9MpyfeUOTJcl8McNbUJvv2fWETTttzckvDZELlJwMvFYm1YisHhzHerAVY0p0
 zUgNxrA7iHgZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oBlOAF7t
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.8
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-09-23 13:17 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2023-September/000729.html
> https://lists.freedesktop.org/archives/mesa-announce/2023-September/000730.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 6 +++---
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 5dbf984735..e70d3fe137 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>  
>  # Not possible to directly refer to mesa3d variables, because of
>  # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 23.1.6
> +MESA3D_HEADERS_VERSION = 23.1.8
>  MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>  MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>  MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index 95133d3de9..a88ec5909f 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2023-August/000727.html
> -sha256  f4c7fd8e7b472a88da7d83e9a48f6f3bd17d4ea2cc4386f7231b796f3964157a  mesa-23.1.6.tar.xz
> -sha512  24f1c626fa05a82bcdfb24b67b8e5f96f94d5748309631b83e8d7a62142853cd3be90b92c56bac3bc4d223bf40b424d6d6a9977537b899107295b7d45d7e2575  mesa-23.1.6.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2023-September/000730.html
> +sha256  45434ff91a709844130a3174d9c0ef39c6b50725b2bb0c13e736f36134db14ad  mesa-23.1.8.tar.xz
> +sha512  02dc6f8b10dd3827a2b62fba3035726b1b60ec0c3188817deea2ad14f80f332a37272e9f15c5f653f20cecb14f8ff91697d73c89afc83674c19b686a674b677d  mesa-23.1.8.tar.xz
>  # License
>  sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 6551105aae..a24a299a55 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 23.1.6
> +MESA3D_VERSION = 23.1.8
>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://archive.mesa3d.org
>  MESA3D_LICENSE = MIT, SGI, Khronos
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
