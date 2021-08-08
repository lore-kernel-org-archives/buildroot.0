Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD6DC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:35:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9205360F42
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9205360F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58553606D0;
	Sun,  8 Aug 2021 20:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id um8Oy09JPodI; Sun,  8 Aug 2021 20:35:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F366605A4;
	Sun,  8 Aug 2021 20:35:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 208E01BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1008B826DF
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4_8MCjNcRQ8 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:35:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 158FC826C2
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:35:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BFFBDE0004;
 Sun,  8 Aug 2021 20:35:25 +0000 (UTC)
Date: Sun, 8 Aug 2021 22:35:24 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20210808223524.615419a7@windsurf>
In-Reply-To: <20210807102106.714972-1-bernd.kuhls@t-online.de>
References: <20210807102106.714972-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: add comment that OpenGLES
 support also needs udev
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Bernd,

On Sat,  7 Aug 2021 12:21:06 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> For reference:
> https://git.buildroot.net/buildroot/tree/package/kodi/Config.in#n26
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 074a457d1b..bbdef8aefe 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -49,7 +49,7 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
>  	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
>  	select BR2_PACKAGE_XLIB_LIBXRANDR
>  
> -comment "kodi needs an OpenGL EGL backend with OpenGL or GLES support"
> +comment "kodi needs an OpenGL EGL backend with OpenGL or GLES/udev support"
>  	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS

I don't really understand the justification here.
BR2_PACKAGE_KODI_PLATFORM_SUPPORTS gets selected by
BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM or
BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND or
BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11. While
BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM requires udev, the other two not
necessarily.

But in fact the existing comment is already incorrect. Kodi requires
either:

 (OpenGL || OpenGLES) && gbm && udev => to use BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM

OR

 (OpenGL || OpenGLES) && wayland && libegl-wayland => to use BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND

OR

 (OpenGL || OpenGLES) && X.org => to use BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11

So I guess the reason for the existing comment is that the (OpenGL ||
OpenGLES) dependency is common to all 3 cases.

So unfortunately, just adding this "/udev" doesn't make much sense I
believe :-/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
