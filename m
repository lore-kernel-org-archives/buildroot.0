Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B47C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D82384DC9;
	Thu, 27 Jan 2022 18:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hwLQX1hVK3J8; Thu, 27 Jan 2022 18:47:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EF1784DC4;
	Thu, 27 Jan 2022 18:47:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C53A1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AADD60ACE
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79IPqfAoA8kp for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:47:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10ADD60A75
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:47:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cc8e:5bc6:13d0:52a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8E9F4200381;
 Thu, 27 Jan 2022 19:47:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643309226;
 bh=mJXYJ1GJlycWr9m8lopLB3wD5ALyXmjVs1YfetEzjNw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XXaJta6Svhm9f+Zf9cErmwJ7QAzNnNtDjKlhex+e8f+LBFOV4Ha3iX5qiQPEeqjlk
 CsMHGi0y7Jr5pWg1oGhcDqeCywz51kMZ4Ms8rQRlOD8fOhjqefdHD+5ifM+FaoNec4
 dBJw9LQdb9BW/lD/OryupI1uzIl9mzTk4ruz4GrpxxpS0mMdR/jsYD+ycHZKMjaTXH
 WTS5Tos3CuNoNDzfh/3GiBVl2n7l0J8GDcSfGMw2sPNXF5MgVmuN8eZB1sd4suZlcO
 RGk9oxUBt83WPhwLUvh/3qiRbmQP43EFuFXs6jVpDymOTaLreZNay8qfdu7aHixi3k
 i40CboUJxN9Vg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 19:47:02 +0100
Date: Thu, 27 Jan 2022 19:47:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220127184702.GM457876@scaer>
References: <20220127164509.22867-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127164509.22867-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/mesa3d/mesa3d.mk: fix typo in
 comment
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-01-27 17:45 +0100, Peter Korsgaard spake thusly:
> Commit 6a51177af14a2ddaa (package/mesa3d: always enable glx-direct if glx is
> enabled) introduced a typo in the comment, fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mesa3d/mesa3d.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index f49d96025a..6907d8c94f 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -73,7 +73,7 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
>  #  dri          : dri based GLX requires at least one DRI driver || dri based GLX requires shared-glapi
>  #  xlib         : xlib conflicts with any dri driver
>  #  gallium-xlib : Gallium-xlib based GLX requires at least one gallium driver || Gallium-xlib based GLX requires softpipe or llvmpipe || gallium-xlib conflicts with any dri driver.
> -# Always enable glx-direct; without it, amy GLX applications don't work.
> +# Always enable glx-direct; without it, many GLX applications don't work.
>  MESA3D_CONF_OPTS += \
>  	-Dglx=dri \
>  	-Dglx-direct=true
> -- 
> 2.20.1
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
