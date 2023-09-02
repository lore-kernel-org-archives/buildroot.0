Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663A9C83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0900060E9D;
	Sat,  2 Sep 2023 17:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0900060E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxtblBVNrrDB; Sat,  2 Sep 2023 17:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EEA260E51;
	Sat,  2 Sep 2023 17:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EEA260E51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 526221BF407
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A677400D1
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A677400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DKzQTu0kf1I for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:17:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18BE04002B
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18BE04002B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CA0FFF804;
 Sat,  2 Sep 2023 17:17:34 +0000 (UTC)
Date: Sat, 2 Sep 2023 19:17:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230902191733.3e09f99f@windsurf>
In-Reply-To: <20230716145003.339645-1-bernd@kuhls.net>
References: <20230716145003.339645-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693675055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POc9SmYgCTeXRfclEaWTWpVWUqHTP5eXOEpnNAtupNs=;
 b=a4A2CQ3wHk9vq6mMMfJ+GmqIUffLt/kzbnXMcFW79W573BlsWh0xgdnB9j1nQOOAZsJxg8
 VZqr0YQqCyK7Ypp/mF+Dp47sm6GWrgbdd25gag1a7VyL3ZIV6eJhBQZ05V7UnqqMpO9EyU
 uVKkUnnWjJITP2yT7oAY0YNP8EKF9RSE0x5wTDw/MTQ8j5PgMQTuSUSQFZTubLTHtmOQLZ
 TgQFT+LATcEehdcaBc3lsY8WmzXVwPt6FL14UNoWuMYIFV27o04V2L8BrsSO13lFv9ekmy
 at5NplVqQsB5nlCRHHSOrftdeLkV7N5h1KzwnqFY+duLKFcE41MfItmfJh29zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a4A2CQ3w
Subject: Re: [Buildroot] [PATCH 1/2] package/libdecor: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Sebastian WEYER <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 16 Jul 2023 16:50:02 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Needed for wayland support in mesa3d-demos.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've applied after doing some changes/fixes, see below.

> ---
>  package/Config.in              |  1 +
>  package/libdecor/Config.in     | 25 +++++++++++++++++++++++++
>  package/libdecor/libdecor.hash |  3 +++
>  package/libdecor/libdecor.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 51 insertions(+)
>  create mode 100644 package/libdecor/Config.in
>  create mode 100644 package/libdecor/libdecor.hash
>  create mode 100644 package/libdecor/libdecor.mk

Entry in DEVELOPERS file was missing.

> +LIBDECOR_VERSION = 0.1.1
> +LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/$(LIBDECOR_VERSION)
> +LIBDECOR_LICENSE = MIT
> +LIBDECOR_LICENSE_FILES = LICENSE
> +LIBDECOR_INSTALL_STAGING = YES
> +LIBDECOR_DEPENDENCIES = cairo dbus pango wayland wayland-protocols

You're adding dbus as a mandatory dependency here, but it's not
selected in Config.in and it's actually an optional dependency.

> +LIBDECOR_CONF_OPTS = -Ddemo=false
> +
> +ifeq ($(BR2_PACKAGE_DBUS),yx)

This condition would never be true due to the typo "yx" instead of just "y".

I fixed both issues and applied to master, as this package is needed to
fix issues in master.

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
