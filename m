Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997E9C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A30A40099;
	Wed,  8 Feb 2023 11:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A30A40099
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fRNLUU9hi1Re; Wed,  8 Feb 2023 11:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20230402BC;
	Wed,  8 Feb 2023 11:11:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20230402BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AC9D1BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 328A140BDE
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 328A140BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BGEmr3x2F2G for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:11:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB7C40BD2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DB7C40BD2
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:11:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4926F20003;
 Wed,  8 Feb 2023 11:11:37 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:11:36 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208121136.74cfe8e6@windsurf>
In-Reply-To: <20230207171721.2973997-7-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-7-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWRdGZkWupeRvhjaut5G/N5GwPqD3ZUQz0QtqfUk7xU=;
 b=ViG0i2ha+TpuQtTIL4B2s5dpjeCkmE+jxbh01lo89sO0LenUlBe6Rtxn+68ngC7Mhv/1pl
 sUQeXhf9J4rnrzHt0l6UAQ7EE0MjaxquInnSNkuIVCKrRxlQk+x+WjkylGs1yuH6Yz746P
 oIqllMam2ccB8OqHbX3lkqOn9M4UuJyur6VkmJnIUqkY9XaBFzaEIpIsxzLp3B9rH7R5Wr
 x1C6lxvkeutP8Jzj96FdRpXE6uJzVAQun8/u4lHz4zAFgthOhRVk1HT/zn/HBpr+W24xkh
 6cCP0MwpTWvfU9WsGJ6N5Hg+BVQ93E7ix39Hb/bhptA4awbIHejaJShwr+8+DA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ViG0i2ha
Subject: Re: [Buildroot] [PATCH v6 06/13] package/qt6/qt6base: add opengl
 support
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
Cc: jesseevg@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  7 Feb 2023 18:17:14 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> +if BR2_PACKAGE_QT6BASE_OPENGL
> +
> +choice
> +	prompt "OpenGL API"
> +	help
> +	  Select OpenGL API.
> +
> +config BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP
> +	bool "Desktop OpenGL"
> +	depends on BR2_PACKAGE_HAS_LIBGL
> +	help
> +	  Use desktop OpenGL.
> +
> +config BR2_PACKAGE_QT6BASE_OPENGL_ES2
> +	bool "OpenGL ES 2.0+"
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	help
> +	  Use OpenGL ES 2.0 and later versions.
> +
> +endchoice
> +
> +config BR2_PACKAGE_QT6BASE_OPENGL_LIB
> +	bool "opengl module"
> +	select BR2_PACKAGE_QT6BASE_WIDGETS
> +	help
> +	  This option enables the Qt6OpenGL library. This library
> +	  includes OpenGL support classes provided to ease porting
> +	  from Qt 4.x.

This option didn't do anything: there is nothing in the .mk file that
did something about this option, so I dropped it.

> +
> +config BR2_PACKAGE_QT6BASE_EGLFS
> +	bool "eglfs support"
> +	default y

I dropped the "default y", there is no need for that.

> +	depends on BR2_PACKAGE_HAS_LIBGBM

It also needs EGL.

> +	select BR2_PACKAGE_QT6BASE_OPENGL

I also moved this option closer to the other graphics backends
(linuxfb, xcb).

>  config BR2_PACKAGE_QT6BASE_FONTCONFIG
>  	bool "fontconfig support"
>  	select BR2_PACKAGE_FONTCONFIG
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> index f936d19c68..e9a3396fb6 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -228,6 +228,23 @@ else
>  QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_egl=ON -DFEATURE_eglfs=ON
> +QT6BASE_DEPENDENCIES += libegl

libgbm added here, since according to Config.in we need it.

Applied with those fixes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
