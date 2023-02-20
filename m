Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE76C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CA40702C9;
	Tue, 21 Feb 2023 02:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CA40702C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1FXTrcGMi66T; Tue, 21 Feb 2023 02:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31288702C7;
	Tue, 21 Feb 2023 02:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31288702C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 688591BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C0C94015F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C0C94015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DOlMeXg-sShX for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 21:17:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9BCF4010E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9BCF4010E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 21:17:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C545E60005;
 Mon, 20 Feb 2023 21:17:22 +0000 (UTC)
Date: Mon, 20 Feb 2023 22:17:21 +0100
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20230220221721.3ebb047b@windsurf>
In-Reply-To: <20230220071846.2334907-1-marcus.folkesson@gmail.com>
References: <20230220071846.2334907-1-marcus.folkesson@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676927843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yjRKPaTb3prAKHuFUnWpP1BIWjz3F3OPuPbHLlSsmU=;
 b=DUIQhr4FIf9gSZTHbjstnuztByPHWnKHz6bTrmC1mJPN4G+FD+pUSgpwcgpyVxSvXAl0ko
 4pN9tmH1hYZ5CFkTS8PyOO09SrrKB3LysdrFh1U6Q4bCzWRCxZGF5yvuAVQt4x8c6NS6yW
 fb6xHm4zNu6Rno3L/fi5nGArM+V/VVs7mh2AsI1tTPR9ulwUOxiG5weXLeF5ruZH8e+L4/
 Pq3T4e5wJ24rU6swxM0LTDn8bPLgQxx0L7Sk1FSUblKv4ct2OO+tLUnI5oELM/uTQ6JefC
 j9PI05Oou6I05ZZN0L83OAUPzjHbBUAYH6/TkTstf8JoSbHL3gKwuwR5PllgaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DUIQhr4F
Subject: Re: [Buildroot] [PATCH v2] package/libcamera-apps: enable LIBAV
 only if libdrm is present
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

Hello Marcus,

On Mon, 20 Feb 2023 08:18:46 +0100
Marcus Folkesson <marcus.folkesson@gmail.com> wrote:

> Since commit 35266e84043f880d7591e52b71a8c5b8d0e4717d, libcamera-apps
> does enable LIBAV by default which depends on libdrm.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/548f2a3b353ce4693fb60d7fb1e06e02af22991c/
> 
> /home/buildroot/autobuild/run/instance-1/output-1/build/libcamera-apps-1.1.1/encoder/libav_encoder.cpp:13:10: fatal error: libdrm/drm_fourcc.h: No such file or directory
>    13 | #include <libdrm/drm_fourcc.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

I need to do some test builds, but I believe this patch is not correct.
What the error message seems to say is that when you build libav
support in libcamera-apps, then libdrm support is needed.

But what you're patch is doing is that it's forcing to have libva as
soon as libdrm is available, which I'm not sure is needed.

> diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
> index 711fd6de05..d0cc6a4210 100644
> --- a/package/libcamera-apps/Config.in
> +++ b/package/libcamera-apps/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
>  	select BR2_PACKAGE_TIFF
>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
>  	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
> +	select BR2_PACKAGE_FFMPEG if BR2_PACKAGE_LIBDRM
>  	select BR2_PACKAGE_LIBEPOXY if BR2_PACKAGE_XORG7 && (BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL)
>  	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
>  	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
> diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
> index 290ee9a026..1464875298 100644
> --- a/package/libcamera-apps/libcamera-apps.mk
> +++ b/package/libcamera-apps/libcamera-apps.mk
> @@ -23,10 +23,12 @@ LIBCAMERA_APPS_CONF_OPTS = \
>  	-DENABLE_TFLITE=0
>  
>  ifeq ($(BR2_PACKAGE_LIBDRM),y)
> -LIBCAMERA_APPS_DEPENDENCIES += libdrm
> +LIBCAMERA_APPS_DEPENDENCIES += ffmpeg libdrm
>  LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=1
> +LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
>  else
>  LIBCAMERA_APPS_CONF_OPTS += -DENABLE_DRM=0
> +LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
>  endif

Could you instead try something like this:

ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_LIBDRM),yy)
LIBCAMERA_APPS_DEPENDENCIES += ffmpeg libdrm
LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=1
else
LIBCAMERA_APPS_CONF_OPTS += -DENABLE_LIBAV=0
endif

To test this, you need to test 4 different cases:

 - libcamera-apps enabled, ffmpeg disabled, libdrm disabled
 - libcamera-apps enabled, ffmpeg enabled, libdrm disabled
 - libcamera-apps enabled, ffmpeg disabled, libdrm enabled
 - libcamera-apps enabled, ffmpeg enabled, libdrm enabled

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
