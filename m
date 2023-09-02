Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21309CA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C63E560E9D;
	Sat,  2 Sep 2023 10:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C63E560E9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRfWCDSB877c; Sat,  2 Sep 2023 10:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AAB560C16;
	Sat,  2 Sep 2023 10:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AAB560C16
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 062731BF419
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDD8541F0E
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDD8541F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhGZxmeSc3i4 for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 10:02:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 967A641EA4
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 10:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 967A641EA4
Received: by mail.gandi.net (Postfix) with ESMTPSA id 829E71BF209;
 Sat,  2 Sep 2023 10:02:45 +0000 (UTC)
Date: Sat, 2 Sep 2023 12:02:44 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230902120244.2167be65@windsurf>
In-Reply-To: <20230830195446.3958486-4-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
 <20230830195446.3958486-4-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693648968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NdDz6FA7rj7aF++ggJwOgMShzmtLDlgqG804kEsq24=;
 b=e/DLosW5znswlVD+ivoJGU+RsLlA/UGieK+XytQteuX6wfkGE3Ua5bSZC37vnjSAFXbMLh
 Xk/zkH4s6IzDKWpmJkWjQbnAEODOm8eIl1q6DKhvtsbc8YHRp8RAewEOsL5/3TR8VRYJDH
 eJbemUH4qUm105vzyTdRFt2aPc5fgp3Ky5DWMQTh0SE1G1yYNF6+0TKUAjqmPSEB58jo4x
 6k1jAPWBb1tuV5ei4McQWFrCiNL5XiRGFP+BYc25PVZrtTvABqqX2DZhFqelXcg+utB1Mc
 xaWOzMYfOZXyUzxt2oeYpfT68TTKtZTFGjDNg+xNrQyATQVjsOilUF0nWFK5KQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e/DLosW5
Subject: Re: [Buildroot] [PATCH/next 4/7] package/mesa3d: add vulkan
 broadcom driver support
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Aug 2023 13:54:43 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> +config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
> +	bool "Vulkan broadcom driver"
> +	depends on BR2_arm || BR2_aarch64
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # dri3/libxshmfence
> +	select BR2_PACKAGE_EXPAT

This was not needed, expat is globally selected by mesa3d.

> +	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_MESA3D_OPENGL_GLX

Changed to ... if BR2_PACKAGE_XORG7, like is done for all other drivers.

Applied to next with those changes.

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
