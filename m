Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF4BC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 11:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77152409E7;
	Wed,  8 Feb 2023 11:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77152409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvbqX5ZFJVnd; Wed,  8 Feb 2023 11:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A1EB410DE;
	Wed,  8 Feb 2023 11:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A1EB410DE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1641BF3A4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31B8A81F82
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 11:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B8A81F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjiKT03jyqAc for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 11:07:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D473A81F7F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D473A81F7F
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 11:07:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC07410000A;
 Wed,  8 Feb 2023 11:07:53 +0000 (UTC)
Date: Wed, 8 Feb 2023 12:07:52 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230208120752.7f49ad05@windsurf>
In-Reply-To: <20230207171721.2973997-2-angelo@amarulasolutions.com>
References: <20230207171721.2973997-1-angelo@amarulasolutions.com>
 <20230207171721.2973997-2-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675854474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aN6OZahZm5gpmq+HpnWTzB9JGLkenrcxzN5sUnGMhs0=;
 b=LfEiUFz2Vmy+uL6irPg4WlJY7nstEkJxw23Gaviz/EYDVJRUwuYqNV3NozlMXimczVALQW
 vhtItv9qjM+ZFWC+jkI52u8yIfR8JUci5QZw1y26AZPky0Ub7mZkRY4kYdTZkCnpseGwZm
 NbmDXdnmQpTV4g+bX3qlp4tJNrUp9OuEk4E4GvAbOHv0LIGNWORhWUbpPUO4tSQpsRXAWN
 nZe+BYcesJU0QqOwunlJ7IUAOe2J4wxsnYaseBGpC3hezflJCi3R2pM71tfC44lt8zI3Js
 FxUMF9Fe+AVLz1pRdI5EyXUk5WT5zbbwLZIUy+bVPZX9ngplr+U8A/FwxyWNuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LfEiUFz2
Subject: Re: [Buildroot] [PATCH v6 01/13] package/qt6/qt6base: add support
 for gui module
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

Hello,

On Tue,  7 Feb 2023 18:17:09 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:


> +ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON -DINPUT_opengl=no -DFEATURE_vulkan=OFF

Split with one option per line.

> +QT6BASE_DEPENDENCIES += freetype
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
> +QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
> +else
> +QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
> +QT6BASE_CONF_OPTS += \
> +	-DFEATURE_xcb=ON \
> +	-DFEATURE_xcb_xlib=ON \
> +	-DFEATURE_xkbcommon=ON \
> +	-DFEATURE_xkbcommon_x11=ON
> +QT6BASE_DEPENDENCIES += \
> +	libxcb \
> +	xcb-util-wm \
> +	xcb-util-image \
> +	xcb-util-keysyms \
> +	xcb-util-renderutil \
> +	xlib_libX11 \
> +	libxkbcommon
> +QT6BASE_DEPENDENCIES += xlib_libXext

This line was not correct: (1) this package is not needed and (2) it
was not selected in Config.in, causing a build failure because we don't
allow depending on a package that isn't selected in Config.in.

I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
