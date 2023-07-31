Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4F0C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42B4561101;
	Mon, 31 Jul 2023 21:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42B4561101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DylY3Q4i7zbN; Mon, 31 Jul 2023 21:17:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23111610FC;
	Mon, 31 Jul 2023 21:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23111610FC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B2DA1BF97D
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7D7960FF0
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7D7960FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjfQeJsA1Cbi for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:17:40 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 599BC60EF3
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 599BC60EF3
Received: by mail.gandi.net (Postfix) with ESMTPSA id 270B61BF207;
 Mon, 31 Jul 2023 21:17:35 +0000 (UTC)
Date: Mon, 31 Jul 2023 23:17:34 +0200
To: James Knight <james.d.knight@live.com>
Message-ID: <20230731231734.5d0c439b@windsurf>
In-Reply-To: <SN4P221MB06821CB27E755AE089BB76D9A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
References: <SN4P221MB06821CB27E755AE089BB76D9A0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690838256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eklVy5h3hPNgwA/cwRvrQHDsd3s3c6LnIHWBDQj9olo=;
 b=EeV0iKanbi/JRqF4BRlpDK0r5NAEiu5XZ7F97gjK5PlZDyM7pFrpGqrcbr7wKF9vz4XZlB
 bv/u4j1bP8deYFa7czWPLq8flH3X2OmFT9h7SnKd2h3Pj82VFDXpo88LLkT52l2AHOf93R
 xFBE1YuzGMp4HOexr/dN6ipDVS8xEEV1HoIy2Zh84753L54t8DIjYy5jPxirTkhheVHgCd
 2Qjn5aom46aCAcTE8RbD4j7Rlo2zi0+9bqPHjpKTkI1L9HyBg+38EkZpWWSjBcO9mfwmIV
 GINa5k3RizOrJMpVqBhUqW/d81VfSJ5CiLidrvAgHeSNYkjGIyg9cSuwmG8Umw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EeV0iKan
Subject: Re: [Buildroot] [PATCH v2] package/swaybg: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Thu, 20 Apr 2023 21:42:34 -0400
James Knight <james.d.knight@live.com> wrote:

> Provides the `swaybg` utility, which is commonly used with `sway` to
> manage background images/color configuration for the compositor.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Thanks, I've applied, with minor tweaks.

> ---
>  package/Config.in          |  1 +
>  package/swaybg/Config.in   | 13 +++++++++++++
>  package/swaybg/swaybg.hash |  3 +++
>  package/swaybg/swaybg.mk   | 35 +++++++++++++++++++++++++++++++++++
>  4 files changed, 52 insertions(+)

You forgot an entry in the DEVELOPERS file.

> diff --git a/package/swaybg/Config.in b/package/swaybg/Config.in
> new file mode 100644
> index 0000000000000000000000000000000000000000..63aa8cdb6a7f72c09644d47238d8705da19329d1
> --- /dev/null
> +++ b/package/swaybg/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_SWAYBG
> +	bool "swaybg"
> +	default y if BR2_PACKAGE_SWAY

We normally don't do this, but I kind of agree here it makes sense, so
I kept it. Let's see if other maintainers disagree :-)

> +	depends on !BR2_STATIC_LIBS # wayland -> dlfcn.h
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
> +	select BR2_PACKAGE_CAIRO
> +	select BR2_PACKAGE_CAIRO_PNG
> +	select BR2_PACKAGE_WAYLAND
> +	select BR2_PACKAGE_WAYLAND_PROTOCOLS
> +	help
> +	  Wallpaper tool for Wayland compositors.
> +
> +	  https://github.com/swaywm/swaybg
> index 0000000000000000000000000000000000000000..4cb738286fb9ec6651754c0a591f5c1cc60b705d
> --- /dev/null
> +++ b/package/swaybg/swaybg.mk
> @@ -0,0 +1,35 @@
> +################################################################################
> +#
> +# swaybg
> +#
> +################################################################################
> +
> +SWAYBG_VERSION = 1.2.0
> +SWAYBG_SITE = https://github.com/swaywm/swaybg/releases/download/v$(SWAYBG_VERSION)
> +SWAYBG_LICENSE = MIT
> +SWAYBG_LICENSE_FILES = LICENSE
> +
> +SWAYBG_DEPENDENCIES = \
> +	cairo \
> +	wayland \
> +	wayland-protocols
> +
> +SWAYBG_CONF_OPTS = \
> +	-Dman-pages=disabled
> +
> +ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
> +# swaybg does not build against uClibc, swaybg uses POSIX defines to indicate
> +# support for `strdup`, which is not enough for uClibc to provide a declaration
> +# of `strdup`. The implicit use of the function causes a build failure. To
> +# avoid this, turn off the "warnings are errors" flag.
> +SWAYBG_CONF_OPTS += -Dwerror=false

I was not able to reproduce the uClibc build issues, and in general we
don't try to make Werror disabling conditional on the exact situation
where they happen, and we simply disable Werror unconditionally for the
package, which is what I did here.

Applied with those tweaks. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
