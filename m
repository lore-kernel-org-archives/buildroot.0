Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BC2C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD00E410A7;
	Tue,  1 Nov 2022 20:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD00E410A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VK2rmUvqU1D0; Tue,  1 Nov 2022 20:27:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D081D4109F;
	Tue,  1 Nov 2022 20:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D081D4109F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E083F1BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBCEC60D70
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:27:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCEC60D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mPhItm00WPE for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:27:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50A0460AF6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50A0460AF6
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:27:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D1821C0003;
 Tue,  1 Nov 2022 20:27:31 +0000 (UTC)
Date: Tue, 1 Nov 2022 21:27:30 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221101212730.4a3d573e@windsurf>
In-Reply-To: <20221101072155.364312-1-bernd.kuhls@t-online.de>
References: <20221101072155.364312-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667334452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zsxlKBIs9r5Ar6J1EDoixykcuGpPe3jksjW3wOZYYX0=;
 b=JU7yNoEXbxiwOfJINbnEfpy828f0w2BhQ+oZMzfijc9gsOkEEpTJ1ZTdUeIl7fVUyRQ3cg
 OtGrpGKxXAkj6xTutMrQ6mdpABhhUw72TwIpRhxU/4kRkqhlZ+0pSAJmexo0o+JhRrMDB/
 txmftKQHsNSQB0V/Apk8EEIveNMrxcxfM/VaNI8sqaBusGRxOGnIpFc9HEhhdHBqOm49/Y
 L7kkuJdQlpq+FxAxLZD7l4NzhCZnEpTOLY7aLQ68j8rlWsnCO1Wmr6IPBG+VB8zdy3wAkW
 251TtjnuGCTAnsAMC8NTK6nmL6r07Y8W/vPe/g28kkjj+7fnNrravrsRuiX0Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JU7yNoEX
Subject: Re: [Buildroot] [PATCH 1/1] package/imagemagick: utilities need c++
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

On Tue,  1 Nov 2022 08:21:55 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> See upstream commit:
> https://github.com/ImageMagick/ImageMagick/commit/07f3b487f9860fd4eb9422f1a906d0fe83b6fd1c

What a weird commit. Everything is in C, but they force using a C++
compiler for ... no reason?

> +ifeq ($(BR2_INSTALL_LIBSTDCPP),)
> +IMAGEMAGICK_CONF_OPTS += --with-utilities=no

Could you test if --without-utilities works? If it does, it's
preferable as that's the standard practice in Buildroot.

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
