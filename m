Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE75FECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 07:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 278C760F54;
	Mon,  5 Sep 2022 07:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 278C760F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlRJOpewpV-x; Mon,  5 Sep 2022 07:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DC1160E89;
	Mon,  5 Sep 2022 07:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC1160E89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFF711BF2A4
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 07:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA4A3813AE
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 07:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA4A3813AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id goD7hiuW1VNr for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 07:16:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 331A281357
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 331A281357
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 07:16:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EAEEB200005;
 Mon,  5 Sep 2022 07:16:44 +0000 (UTC)
Date: Mon, 5 Sep 2022 09:16:44 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20220905091644.06602cbd@windsurf>
In-Reply-To: <CA+h8R2q6uRfYh4JX2e-Z-UJEAcf6zfLEuvOWJ_bSuYS+jkgxWQ@mail.gmail.com>
References: <20220904190218.198854-1-christian@paral.in>
 <20220905090550.23a2a3ff@windsurf>
 <CA+h8R2q6uRfYh4JX2e-Z-UJEAcf6zfLEuvOWJ_bSuYS+jkgxWQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1662362205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+n/Hpxg57NXeG3rjoJr7hSZWAGwzPK9+y0gyx/2S6c=;
 b=O5dJ/OW5qZnUfEJGD1sW0faffD+mzFEuX1DraxhtAWroUDzAsNrL4Ddk3Ja4SA/rwLHl1k
 j+cIoY0rCw39MCcLgRiSmTR8m8a76uhCZVPPqa4yJoGyoTzoqYMVsvtiQx9Y3IYPefAUde
 ezEz2gwNirU+vJxkSl/yTSfT71IQ5QOuPOt5+vVPKMkpLmJcjxn7oQ6SE9NFZF7xss8Qx8
 7OYVrc14oxpEwRDvEt+ggqfbbxNdEAUp0j9JS5TpxoBVWer+O6oVvPZRhH8il7hCqLAy8q
 JM3Y32JJmjtT1yvnBj5z1YJkcEk65fB4/4Ya/IrmF9QdpPv/KXisvX+hGAnSfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O5dJ/OW5
Subject: Re: [Buildroot] [PATCH v1 1/2] package/libyaml: add host package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 5 Sep 2022 00:07:48 -0700
Christian Stewart <christian@paral.in> wrote:

> The Jetson AGX Orin flash.sh requires libyaml and enabling it as a
> host package in the Buildroot config is the way to add it to the host
> dir during the build.

It requires libyaml, or a tool provided by libyaml?

This should be explained in your commit log :-)

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
