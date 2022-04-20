Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E9BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 21:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7238083FA3;
	Wed, 20 Apr 2022 21:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mcKqRsvZh3Bh; Wed, 20 Apr 2022 21:30:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 835B983F52;
	Wed, 20 Apr 2022 21:30:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 73D231BF20F
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62059606C0
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 21:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JDVj1pOBGT1M for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 21:30:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BB7B605A5
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 21:30:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7d82:8745:111f:47d9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 440255FF7A;
 Wed, 20 Apr 2022 23:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650490248;
 bh=TImNQ1i9zwZ5P26BsD2V+YynxXHRcA7wXGJ/nzYJRIs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G3Rql0bd0et+xIuSjLYuX0yQnF+W9OJWq+ZEklRWjQyHbz3F/g9ejm83RosoRSUCm
 qisLLVgz7u370tdyq93W3B7W1TGyY6B7x5oZyrQk/d///Sq/JRB9VLTSG+96MPsKTm
 OlMpfeLj0ZYy6u+9pxRiTl++uG8Fnn0/8/aP65mnXKiBaW9Br7Zb/naeu8PrIl2Cae
 +hjvylgHZV58AcrQtq521t4ini2CUjkB7kMENcgau+1fAJUFEhFedv9SlWOaPcUM15
 UOb7QMfQLxj2Q81n3Op57Q1q5EEPE32mSWYiTiueRrujiC4FIPA/yQyGvqKyhTpzaU
 m+c8g9fdtTsOA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Apr 2022 23:30:45 +0200
Date: Wed, 20 Apr 2022 23:30:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220420213045.GL2730@scaer>
References: <20220420193434.881088-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420193434.881088-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.50
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

James, All,

On 2022-04-20 13:34 -0600, James Hilliard spake thusly:
> Disable legacy-rtkit which we don't support.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pipewire/pipewire.hash | 2 +-
>  package/pipewire/pipewire.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
> index e6fad56698..6f65a6b143 100644
> --- a/package/pipewire/pipewire.hash
> +++ b/package/pipewire/pipewire.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  68bbf83b4c12bbcaef5d4bfb0dda86177583cf0abe0026efcfedd837b2e4926e  pipewire-0.3.48.tar.bz2
> +sha256  68592ab5852c46ee3d743f429f9d6b6c82171fa37b4b3854eb0da62b08b49d14  pipewire-0.3.50.tar.bz2
>  sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
>  sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index 80246cc8d0..9d4dc45f02 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PIPEWIRE_VERSION = 0.3.48
> +PIPEWIRE_VERSION = 0.3.50
>  PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
>  PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
>  PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
> @@ -29,6 +29,7 @@ PIPEWIRE_CONF_OPTS += \
>  	-Dvideotestsrc=enabled \
>  	-Dvolume=enabled \
>  	-Dsession-managers=[] \
> +	-Dlegacy-rtkit=false \
>  	-Dlibcanberra=disabled \
>  	-Dlv2=disabled
>  
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
