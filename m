Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C3AC77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 934B942A99;
	Mon,  8 May 2023 19:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 934B942A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCC5kh30SHz1; Mon,  8 May 2023 19:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91CE142A95;
	Mon,  8 May 2023 19:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91CE142A95
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DD8C1BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 249C140BD3
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 249C140BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YT7vG1r6AKq for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:19:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5285242A90
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5285242A90
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:19:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9B9952003D3;
 Mon,  8 May 2023 21:19:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 21:19:03 +0200
Date: Mon, 8 May 2023 21:19:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230508191903.GC252090@scaer>
References: <20230508170342.1347176-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508170342.1347176-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683573545;
 bh=lIZtOrp7tjpThyfKgyPQGpJwtvo+9CH/Hi28aTi9IwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tgc9in12p0pIr8mkBwDkDRTB1NRQYtRXRHHtklrqhrv71IR77TkfJPwcsI7udghna
 X6Gu+jueJGmZeN4JvkzG9v425ellNDIMSJiQH2BHQG1BUWpkmlcy5Z0xtrabJTwy9G
 I1sr6INS7rl/Yrh72FPxisWYcwBkdV6SM5yFWs3gshTWtsX4Iuneg47Oo4CgOyYinH
 uCsZroaYXa8SjnLPHLQHptrKGtB3GgU+UvMpVzjluusLF9MnNdalmpJTgOnVR/8gDA
 AunRFDgVFqcUVKivumRXop+ruTAd2T7FLG5ygZGeKOUe7YZ7ngyjqTemoqF/846+dW
 yJFhuuIkYGBkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tgc9in12
Subject: Re: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.17.1
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

On 2023-05-08 19:03 +0200, Bernd Kuhls spake thusly:
> Release notes: https://github.com/libass/libass/releases/tag/0.17.1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libass/libass.hash | 2 +-
>  package/libass/libass.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libass/libass.hash b/package/libass/libass.hash
> index beb7639b1f..bf9b8251d7 100644
> --- a/package/libass/libass.hash
> +++ b/package/libass/libass.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  971e2e1db59d440f88516dcd1187108419a370e64863f70687da599fdf66cc1a  libass-0.17.0.tar.xz
> +sha256  f0da0bbfba476c16ae3e1cfd862256d30915911f7abaa1b16ce62ee653192784  libass-0.17.1.tar.xz
>  sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
> diff --git a/package/libass/libass.mk b/package/libass/libass.mk
> index 1cc8310312..8b14c899c4 100644
> --- a/package/libass/libass.mk
> +++ b/package/libass/libass.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBASS_VERSION = 0.17.0
> +LIBASS_VERSION = 0.17.1
>  LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
>  # Do not use the github helper here, the generated tarball is *NOT*
>  # the same as the one uploaded by upstream for the release.
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
