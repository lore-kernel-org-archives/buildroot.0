Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969C3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F0C3813E3;
	Sat, 12 Mar 2022 20:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-hkr6NwnGjG; Sat, 12 Mar 2022 20:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BECF8137B;
	Sat, 12 Mar 2022 20:34:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 568C51BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45BA6813E3
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 68k5Hxq5uFb8 for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:34:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52DA8812FE
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:34:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3A3177802C2;
 Sat, 12 Mar 2022 21:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647117246;
 bh=btVV6rtp7Uz2ilSVVZoRE1uY8zcV6c+LA5uPav74Y7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S2llnhu39YRds+wiaioK5yR0ilzst9TgsT85mxPqeJo/4SsbNEcC9yyz/4HVAu2sF
 YBQGe6ge1ja9yqLRCgflCsdveFs03PJ7BkS9yAzpvGpbyiHeP4X9ThpMARMtwYzlVV
 lhUpyT78oEL2eoXGXjoauQL6lMv9SGQx5HdTzMoXGAt0K3cBg2E1TdK5u7C+JLiDfz
 yNn7Dvq5/ZgFKS5c2Jjao9Rp2Y4NlkoPvT12Xfn3rX/cPfe4L2yqAdIexX/PCtMW82
 O97tm7sCrjBgdtfpz/81/5qLIZuXkNLLdqpGmjA8U9p7VA6+WSz9Y5pjZ999pRXZ3R
 gKBbnr/8pxGeg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 12 Mar 2022 21:34:03 +0100
Date: Sat, 12 Mar 2022 21:34:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220312203403.GL283544@scaer>
References: <20220311233050.4686-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311233050.4686-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.48
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

On 2022-03-11 16:30 -0700, James Hilliard spake thusly:
> Set new x11-xfixes meson config option.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pipewire/pipewire.hash | 2 +-
>  package/pipewire/pipewire.mk   | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
> index a9d59663ae..e6fad56698 100644
> --- a/package/pipewire/pipewire.hash
> +++ b/package/pipewire/pipewire.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  76291373f7ab271664df5b6a22b678ad57e485e25c73ee9c78e049a67b7886d2  pipewire-0.3.45.tar.bz2
> +sha256  68bbf83b4c12bbcaef5d4bfb0dda86177583cf0abe0026efcfedd837b2e4926e  pipewire-0.3.48.tar.bz2
>  sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
>  sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
> diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
> index fc521c86ac..80246cc8d0 100644
> --- a/package/pipewire/pipewire.mk
> +++ b/package/pipewire/pipewire.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PIPEWIRE_VERSION = 0.3.45
> +PIPEWIRE_VERSION = 0.3.48
>  PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
>  PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
>  PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
> @@ -136,6 +136,13 @@ else
>  PIPEWIRE_CONF_OPTS += -Dx11=disabled
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
> +PIPEWIRE_CONF_OPTS += -Dx11-xfixes=enabled
> +PIPEWIRE_DEPENDENCIES += xlib_libXfixes
> +else
> +PIPEWIRE_CONF_OPTS += -Dx11-xfixes=disabled
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBUSB),y)
>  PIPEWIRE_CONF_OPTS += -Dlibusb=enabled
>  PIPEWIRE_DEPENDENCIES += libusb
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
