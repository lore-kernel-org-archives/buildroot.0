Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59681C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 19:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0555060BFE;
	Wed, 28 Dec 2022 19:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0555060BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w366Uqp9GEYR; Wed, 28 Dec 2022 19:52:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5146C60A9F;
	Wed, 28 Dec 2022 19:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5146C60A9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06D921BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9B864027B
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 19:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B864027B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tIrvqhGRt87b for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 19:52:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADE47402EF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADE47402EF
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 19:52:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:58a9:4a7:c920:8cca])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D98012003F7;
 Wed, 28 Dec 2022 20:52:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Dec 2022 20:52:24 +0100
Date: Wed, 28 Dec 2022 20:52:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20221228195223.GF2498764@scaer>
References: <20221217153729.545952-1-romain.naour@gmail.com>
 <20221217153729.545952-2-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221217153729.545952-2-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672257151;
 bh=jm36AM7eotPVjgf2OuLZVoyMV9VhIR36qtJ2Oh9fAOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UXUANLN5RV6QfPRnCIhgGgbk1hZLaUmZssqm5+wQG4Kh8GdNqpA5qC3yXEM8YZiCg
 L24jrpQM/f46f+Q4qotcEX4k+kv1cfdn0I/zqBem0sxQF0L/O98skHAqD5AAmoSAVa
 SNA1oHBcjS5eLWpYd/mP0te0tLtxSM2QoZFJY+VPCTgbrw9D6QG1iFQceDXSTQTLx8
 GFLvRkDmDrliYzajS2/Qsdm4Ey0ZwZzmnM5B2/5S6eFucW/7PJMimqibdcd7SRJbd9
 W9Fmwg3pfPnLx6dD92VvUpx0yocUDfrsfHq5IAHC2x65stq+MaAoODTobJmp1fkrrm
 gd8rNgTouSN3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UXUANLN5
Subject: Re: [Buildroot] [PATCH 2/4] package/qemu: split long lines
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

Romain, All,

On 2022-12-17 16:37 +0100, Romain Naour spake thusly:
> Split the list of dependencies to ease further addition.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/qemu/qemu.mk | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index a991d49993..e800f31e7e 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -20,7 +20,12 @@ QEMU_CPE_ID_VENDOR = qemu
>  # However, building is still done with configure and make as in previous versions of QEMU.
>  
>  # Target-qemu
> -QEMU_DEPENDENCIES = host-meson host-pkgconf libglib2 zlib pixman host-python3
> +QEMU_DEPENDENCIES = host-meson \

I like that the first item is also on its own line, and this is what we
do elsewhere most of the time too, so I also changed that.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +	host-pkgconf \
> +	libglib2 \
> +	zlib \
> +	pixman \
> +	host-python3
>  
>  # Need the LIBS variable because librt and libm are
>  # not automatically pulled. :-(
> @@ -246,7 +251,12 @@ $(eval $(generic-package))
>  #-------------------------------------------------------------
>  # Host-qemu
>  
> -HOST_QEMU_DEPENDENCIES = host-meson host-pkgconf host-zlib host-libglib2 host-pixman host-python3
> +HOST_QEMU_DEPENDENCIES = host-meson \
> +	host-pkgconf \
> +	host-zlib \
> +	host-libglib2 \
> +	host-pixman \
> +	host-python3
>  
>  #       BR ARCH         qemu
>  #       -------         ----
> -- 
> 2.38.1
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
