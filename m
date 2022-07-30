Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC862C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 15:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3513C61182;
	Sat, 30 Jul 2022 15:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3513C61182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQzjJT7xODn5; Sat, 30 Jul 2022 15:40:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B3E6117A;
	Sat, 30 Jul 2022 15:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B3E6117A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05BD81BF470
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C91106117A
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 15:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C91106117A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQncW22DFL0P for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 15:40:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DA7C60E18
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DA7C60E18
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 15:40:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 651B61BF203;
 Sat, 30 Jul 2022 15:40:37 +0000 (UTC)
Date: Sat, 30 Jul 2022 17:40:36 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220730174036.48ca64aa@windsurf>
In-Reply-To: <20220730105534.645046-1-bernd.kuhls@t-online.de>
References: <20220730105534.645046-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659195637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhUHy0f5crI4o8di6WIkI3XqA2LnkMehqDNRRgA9ClY=;
 b=mI04pUaf0n8U0uCW3u0x59Pl6CGPjSj2v2NKqC7D8GtOUnOQrGBa/woZH/CrRf2thRODMd
 eoCU6a2FY2p+RKiOzJxyZiujzEULqDDVoE+dhPdwiW+4DrR0Y7R5Hl1T8nZHgsLh9tJSj0
 Jt5nUmCSRU20qP8Y7pmocok1kBnO1RRzZxReuRI1i9X4foEUIXeMzai8VtImetnKG4EjnG
 U+rcfFaIZ6sB2fJcVXNE54rA4VjRS1X+APqcHnGyQNb0/mEWacrSA+pVCM5/dTwQziHb1E
 W+fJCwtIFlCGC4Xu2mK3YykGKRWo3xA13pHQYbZsPDXw/umZgyKQCyE5ykxZxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mI04pUaf
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: fix build error with
 c++ disabled
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sat, 30 Jul 2022 12:55:34 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> The vp8 encoder depends on c++ support since commit
> 06a1a05b55aa64720d4ede9b07c385cc8f06625d
> 
> src/transcoding/codec/codecs/libs/libvpx.c:23:10: fatal error: vpx/vp8cx.h: No such file or directory
>    23 | #include <vpx/vp8cx.h>
> 
> Fixes:
> http://autobuild.buildroot.net/results/152/152dec2f7148a23fa1a434d2c6ad31de6d1b2466/
> http://autobuild.buildroot.net/results/009/0090b100eca4f94d2f0081ce0db7ff9b4ae0ca79/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tvheadend/Config.in    | 3 ++-
>  package/tvheadend/tvheadend.mk | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
> index c033b29819..99a24ec011 100644
> --- a/package/tvheadend/Config.in
> +++ b/package/tvheadend/Config.in
> @@ -66,7 +66,8 @@ config BR2_PACKAGE_TVHEADEND_TRANSCODING
>  	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
>  	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
>  	select BR2_PACKAGE_FFMPEG_SWSCALE
> -	select BR2_PACKAGE_LIBVPX
> +	# vp8 encoder needs c++
> +	select BR2_PACKAGE_LIBVPX if BR2_INSTALL_LIBSTDCPP
>  	select BR2_PACKAGE_X264
>  	help
>  	  Enable transcoding support.
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 1d1a714505..8ceb7493c8 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -47,6 +47,12 @@ TVHEADEND_DEPENDENCIES += rpi-userland
>  else
>  TVHEADEND_CONF_OPTS += --disable-omx
>  endif
> +ifeq ($(BR2_PACKAGE_LIBVPX)$(BR2_INSTALL_LIBSTDCPP),yy)
> +TVHEADEND_CONF_OPTS += --enable-libvpx
> +TVHEADEND_DEPENDENCIES += libvpx
> +else
> +TVHEADEND_CONF_OPTS += --disable-libvpx
> +endif

It is apparently an optional dependency, so why do we select it in
Config.in?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
