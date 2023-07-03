Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8B8C30658
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BFD460E87;
	Mon,  3 Jul 2023 18:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BFD460E87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6WI38CHDl86; Mon,  3 Jul 2023 18:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC43560EED;
	Mon,  3 Jul 2023 18:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC43560EED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72DAF1BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF17405DF
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF17405DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sAtXHPeLu8VT for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:47:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D32C440420
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D32C440420
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:47:23 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE62BC0007;
 Mon,  3 Jul 2023 18:47:20 +0000 (UTC)
Date: Mon, 3 Jul 2023 20:47:19 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230703204719.4552d237@windsurf>
In-Reply-To: <20230703143931.1825624-1-dario.binacchi@amarulasolutions.com>
References: <20230703143931.1825624-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688410041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45GlO1YnS9pLGinT/h/PqC7tCydTF+sQGzeqh8aArJA=;
 b=POSIMQpnM/6igIRCu4/pEevna6/wlBr7vGzasTPc4ADsGykp7XspV2dTuLC1gO9cO9pbNT
 trCfZcFlyIoTPGYKxh/JnHtNg4PhvFkFEH9SSblTQbVxxM4NfiHZ16NyQiSZ6JMgtM9oU5
 UxOixdEynPLnMMoMVeLbtwyWuXNjYHjVCLDquiMuUPFYOrAtjuqpZy7JjBVTOb6t39q5cp
 VQ6IPKi5MznD66UaW3Ne+MxJHHWGIRxdIEjPew383z/rxw1N3oy59LoxeLUEUGmPEyf1rA
 bwCCZ0x/YSbhNea8HBxaxU2EEE9nLQv+eOW1G1drd6JWhC0OXsHsSX2JKo2JLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=POSIMQpn
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.109
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

On Mon,  3 Jul 2023 16:39:31 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.109
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 2 +-
>  package/uuu/uuu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
