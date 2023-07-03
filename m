Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFC1C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0D560BC1;
	Mon,  3 Jul 2023 20:38:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0D560BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4gMZB8DLc3l; Mon,  3 Jul 2023 20:38:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 187476059C;
	Mon,  3 Jul 2023 20:38:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 187476059C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 517F21BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C9A46059C
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C9A46059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpfLyUlSuAGo for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:38:26 +0000 (UTC)
X-Greylist: delayed 01:21:19 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DEB460595
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DEB460595
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:38:25 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1CDB240005;
 Mon,  3 Jul 2023 20:38:20 +0000 (UTC)
Date: Mon, 3 Jul 2023 22:38:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703223820.5c156c60@windsurf>
In-Reply-To: <20230702110447.1877621-1-bernd@kuhls.net>
References: <20230702110447.1877621-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688416702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWN4CCnFoFzhoNDJON9tmoDZS6OEGlPcacoSQurGLMw=;
 b=n+gZCnBPg/39rI6reYffj2UCcsBmHZoTW4v8pI5qMWEntqVT+D1o6oJ2Qkg4i4cd1hEYyB
 Xr4J91O3Yo0ennVZsQhMbp+Kx38JpP0A52bdOTlKr2MIxmJxhCJFiJrmc7fRCHypzHMhvR
 W7K36v2A4ywdsFC3LE9mRTGXJAnFVnaw43qFpP8lY687gjAL3APIzpIVeVAA2dH0AoUfhQ
 tf2xfTHZEUJk+Hn5xTK6S8FAcTH7X/LAVfeW7+E1PZX7ENssOII77K/d/MZ8Rp41zkpBWb
 xxtfmNo/+ORGSjZJLp5vxnTlYaKywLEGF7d67f/kiMabX9h+VzruVNGytuUVzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n+gZCnBP
Subject: Re: [Buildroot] [PATCH v2 1/1] package/putty: bump version to 0.78
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun,  2 Jul 2023 13:04:47 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> +PUTTY_DEPENDENCIES += host-pkgconf

= sign was sufficient here.

> -ifeq ($(BR2_PACKAGE_LIBGTK2),y)
> -PUTTY_CONF_OPTS += --with-gtk=2
> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> +PUTTY_DEPENDENCIES += libgtk3
> +else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
>  PUTTY_DEPENDENCIES += libgtk2
> -else
> -PUTTY_CONF_OPTS += --without-gtk
>  endif

The Config.in file needed some change, as it talked about GTK2, but now
it should mention GTK2 or GTK3.

I fixed both details and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
