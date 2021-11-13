Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60A3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:52:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A79560EE0
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 09:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A79560EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4567482538;
	Sat, 13 Nov 2021 09:52:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wlty1QteleaV; Sat, 13 Nov 2021 09:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D42C824CE;
	Sat, 13 Nov 2021 09:52:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23FEF1BF35E
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 209A56077C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 09:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Van7fzwA-wzR for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 09:52:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DD3B60685
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:52:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5B17919F4EA;
 Sat, 13 Nov 2021 10:52:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636797143;
 bh=PsAC0X5ExaOF8TRakia/YEjE82PDeNelnBgcbl6WXTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nNoQRjbn2ad6t+SytoDJcsXibegfv8OBFzXZnd6UHNMZdXe6Ci5g5Vgm/UIahjMpN
 Y2O0bCooqVzMVJH+xPa/u0g+XQlo4xyr/VJRxMBu2rX/WWZXhg+bajG3kaS5A2kCOE
 M/e3UUV5MU5wfYcpWtcytw8TYvLH5Pkb0QpxuO3PUi4cArFocsPgThjWsWKRb8YT2S
 Uuq6mg6TSmczrlkONMZOmImyrP/hmxnk2Pz7uwH8ouei/ZbOBNYDfdVLn8+2JwDu/a
 JqqoalGzNs1piSACJaBPDiOiUJ41CfQ4o4iVaY3/RW3BPcOtM6aPzqeGJhav1bi+yK
 mXSD0iGTb/XcQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Nov 2021 10:52:19 +0100
Date: Sat, 13 Nov 2021 10:52:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211113095219.GO247986@scaer>
References: <20211113093009.6915-1-bernd.kuhls@t-online.de>
 <20211113093009.6915-3-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113093009.6915-3-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] package/glmark2: fix selection of
 dependencies
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

On 2021-11-13 10:30 +0100, Bernd Kuhls spake thusly:
> Commit 9c068b4be8 (package/glmark2: fix wayland build) extended the set
> of required libraries for various "flavor" options by selecting those
> libraries from the blind options.
> 
> However, that option is true as soon as the requirements are met (the
> depends on), even when glmark2 itself is not enabled.
> 
> This means that extra libraries are pulled in to the build, even when
> not required.
> 
> We fix that by moving the actual selects to the main symbol, along with
> the proper conditions. This means that we have two lines that select
> wayland-protocols, under two different conditions; we could make that a
> single select, but the codition would need to be on two lines anyway,
> so meh...
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Aha! I see you re-used my previous commit as-is. You even kept all my
typoes! ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Requested by Yann:
> http://lists.busybox.net/pipermail/buildroot/2021-November/628389.html
> 
>  package/glmark2/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
> index 6761397d3f..5897ccb3ff 100644
> --- a/package/glmark2/Config.in
> +++ b/package/glmark2/Config.in
> @@ -27,7 +27,6 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	depends on BR2_PACKAGE_WAYLAND
>  	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
> -	select BR2_PACKAGE_WAYLAND_PROTOCOLS
>  
>  config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
>  	bool
> @@ -36,7 +35,6 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
>  	depends on BR2_PACKAGE_HAS_LIBGL
>  	depends on BR2_PACKAGE_WAYLAND
>  	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
> -	select BR2_PACKAGE_WAYLAND_PROTOCOLS
>  
>  config BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2
>  	bool
> @@ -68,6 +66,8 @@ config BR2_PACKAGE_GLMARK2
>  	select BR2_PACKAGE_JPEG
>  	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_GLMARK2_FLAVOR_DRM_GLESV2
>  	select BR2_PACKAGE_LIBPNG
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
>  	help
>  	  glmark2 is an OpenGL 2.0 and ES 2.0 benchmark.
>  
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
