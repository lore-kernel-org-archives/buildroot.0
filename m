Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B041C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 18:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E95D3831BD;
	Sun,  3 Apr 2022 18:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lsh8vycY2mPe; Sun,  3 Apr 2022 18:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91D3831A7;
	Sun,  3 Apr 2022 18:58:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 799D31BF36E
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 18:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 674E3404CC
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 18:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5hbiBvtPXNi for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 18:58:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E71B400D6
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 18:58:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8A07113F7E7;
 Sun,  3 Apr 2022 20:58:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649012283;
 bh=KpTyWVLSqmCr6TH61+qs9lBldfOL03is/N8zpGHtYxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dgEz/lMHk7zyoopIDB5ufiP/+2KpnL3P1gsw0mzN53MJI3o+NFpmwONAkifEgABiG
 S/UVP2H77fz+GI7KEkax7bPbtvNJm6NF8Qe4pTkRjxi/uv2h3TjoBo4I7ZkxZFLCKk
 WUQXPGrHTxYX6di2xUYq742jtJojZ1tS7LmHIiw8Z/JJIy30YvBSwXCvXNZ6AUFiex
 CmOq1hxyPMEOy+Lt0qy/+GyUBHflBwidNaH89T5CaUMJsAx1Q0uEBJkTEBAKigICJ4
 7GXqaIyaRXg1vwIVzwSUw0MX5FICtlG9/N1D/HRiP5i23LXnSGgM8Yj0+zHZ68Go+m
 q3bSwZudUPgyA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 20:58:01 +0200
Date: Sun, 3 Apr 2022 20:58:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220403185801.GH1811301@scaer>
References: <20220403110455.2875846-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403110455.2875846-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/htop: fix sensors option
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

Fabrice, All,

On 2022-04-03 13:04 +0200, Fabrice Fontaine spake thusly:
> Commit 811846df48745d58d96f6c0fbab0dec5f17d614b wrongly used
> --{with,without}-sensors instead of --{dis,en}able-sensors
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of three patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/htop/htop.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index 7caa47ce13..210518da2f 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -28,10 +28,10 @@ HTOP_CONF_OPTS += --disable-capabilities
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
> -HTOP_CONF_OPTS += --with-sensors
> +HTOP_CONF_OPTS += --enable-sensors
>  HTOP_DEPENDENCIES += lm-sensors
>  else
> -HTOP_CONF_OPTS += --without-sensors
> +HTOP_CONF_OPTS += --disable-sensors
>  endif
>  
>  ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
> -- 
> 2.35.1
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
