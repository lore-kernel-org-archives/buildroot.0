Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C64C433FE
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 19:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9805F40131;
	Sun,  1 May 2022 19:50:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SGfOfd38URp2; Sun,  1 May 2022 19:50:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A14114015F;
	Sun,  1 May 2022 19:50:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5341BF3FB
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E3F183EBD
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PIa5f8gVWWtV for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 19:50:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D7D483E74
 for <buildroot@buildroot.org>; Sun,  1 May 2022 19:50:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9448:1aca:a169:bea6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 865A378034D;
 Sun,  1 May 2022 21:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651434646;
 bh=tMfU0GgBYLQw60TnZDwQR3h7ah8BgSh0HyWHbX0HADA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KomJhFjr+Y4sGPGSQbGdt4KDDnoUY/WvCnvxl4eQICbFUNyCtaz26LI9KGIh/vgPw
 Za/We6pns8g1yi0dmo+PwYTILpymhs/XAzhbr9SPRZsftFvN7vT4FCqF0mXHM/MFOt
 W7LFhTdoNKWi8KNTWXAv0eiCCsCyEaYrNoLKiEGFpteUvfvfbUoNXskKYNaKwnNyJc
 hHG92N+gqndaKPwOnYAgf9p568zAIl4dZ3RynSId0nFf8FjRlAo+LGmUU6NFzk7Lt4
 /sxPQxhv6Thpct1gRgdB5GynJVLyXINgYt2f2N26aCEeU78c1/J2lngTj/lq+i4jqi
 1hzvmFgurvHZw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 May 2022 21:50:44 +0200
Date: Sun, 1 May 2022 21:50:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220501195044.GQ3624965@scaer>
References: <20220501144944.27564-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501144944.27564-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-peripheral-joystick: bump
 version to 19.0.2-Matrix
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

On 2022-05-01 16:49 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
>  package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
> index c43d5d8628..176f4be24d 100644
> --- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
> +++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  65efcfb8b0ed6595082d8d7298ec25b5c31d0189bb8e09ae1bc10989b9655204  kodi-peripheral-joystick-19.0.1-Matrix.tar.gz
> +sha256  3188d2007449fb1bf52be923fcb4f7da3bd8e60a8644a7ae5635a0ea53a21368  kodi-peripheral-joystick-19.0.2-Matrix.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
> index b823550751..f56041c544 100644
> --- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
> +++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PERIPHERAL_JOYSTICK_VERSION = 19.0.1-Matrix
> +KODI_PERIPHERAL_JOYSTICK_VERSION = 19.0.2-Matrix
>  KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
>  KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
>  KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
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
