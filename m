Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA593C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 21:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ED7282D62;
	Mon, 13 Jan 2025 21:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ta3ABhAt6MQ2; Mon, 13 Jan 2025 21:23:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B0282D75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B0282D75;
	Mon, 13 Jan 2025 21:23:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35F0F940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1642B60BEE
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qepa3zs0qlJv for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 21:23:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0205060B76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0205060B76
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0205060B76
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 21:23:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C453840002;
 Mon, 13 Jan 2025 21:23:19 +0000 (UTC)
Date: Mon, 13 Jan 2025 22:23:19 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20250113222319.4f0194fc@windsurf>
In-Reply-To: <932425e2-f575-44e2-965c-5131e1afc9b8@gmx.de>
References: <20250113200454.3108562-1-fiona.klute@gmx.de>
 <20250113200454.3108562-5-fiona.klute@gmx.de>
 <20250113213115.6e74bfb4@windsurf>
 <932425e2-f575-44e2-965c-5131e1afc9b8@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736803400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xutKMSciY02c9CDWqkIQjKA20u6T40t1p6Te8yvww/k=;
 b=cGAMXAVe6UNkNCg2KyG8lp3OhgZGmZ01WpqEFXMzxexTsxTNNdCbMHwWG6ALPiQ4zGurrF
 9Z91+uUcQ/IR6qGOlz82IxYOhtqBt3Vhj1D2Ok0XkZfdZ3hamDby+nvrGoMXI4VtyploLk
 k7sGpKPr1tpZNZibAeDa8wYSYQoK1Mqp4UjbtOjaoNYqTPRVxAAOB8DmZA9bjqoBLmTvsW
 RrCs/vtNIvZWC7GmXe+SxohmQclqruCT7eWZhVJF8/n7dSIg4CZg+ZJ9at5tNg/UgR5hT7
 3UzciQHXELwfg+W0O4jkm2a400qFSmnmGEXL30oKtuL0GEKlEYfZD4NU02Q/iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cGAMXAVe
Subject: Re: [Buildroot] [PATCH v7 4/5] package/network-manager: optional
 gobject-introspection
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 Jan 2025 22:02:59 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> > 	package/network-manager: add optional dependency on gobject-introspection  
> That would be incorrect: What the patch does is enable GOI support in NM
> *if* the GOI package is enabled, when before it was disabled
> unconditionally.

That's exactly what we call an optional dependency: a dependency that
gets used if available, otherwise not.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
