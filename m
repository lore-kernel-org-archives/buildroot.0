Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAE0C4167D
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6330A421FF;
	Mon,  6 Nov 2023 22:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6330A421FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t5zn1JofaqMP; Mon,  6 Nov 2023 22:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93616421BC;
	Mon,  6 Nov 2023 22:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93616421BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 11FAB1BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39DAC4012C
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DAC4012C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZT7XtH4gIq5 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EEF442133
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EEF442133
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67B2C60006;
 Mon,  6 Nov 2023 22:25:58 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:24:22 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232422.561657b9@windsurf>
In-Reply-To: <20231105061044.2852603-1-james.hilliard1@gmail.com>
References: <20231105061044.2852603-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PYWsnCCPNvAy4wj/XzqHVTrjHj7Qq3zvhW20myav2d0=;
 b=YeDsYqkV8U6I3KCVFlPpJ5o7VUQYlQ9iCvuNkAFYuoY7tozwgZBgiNAuaASUFbGSq9jsBx
 BglCKTKYeGY3oC09wuv/PVd1J8Dq9kh6DyaEU05JY5Ecn+n+J05302XeBXUYrfXZl9+RQZ
 3D0Zqqb8OLT5tsgZYpBi/1B+DIrvCp/+MXnYkaCNYcBotITHnoEHJJ7TW1Znust96IRObf
 kEgXePVeQxNOoUMziA0DsgX8NmU98P9YO8xuche+hDTfTHBXQn3+FOObiOdoPVNX+YTo3f
 64IArMRDg60XvTD4UXYr/qbu2d1rIL+eYReBVdThevdlAshsR7XFM4QQzhMyZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YeDsYqkV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flask-cors: bump to
 version 4.0.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 00:10:44 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required python-six runtime dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-flask-cors/Config.in              | 1 -
>  package/python-flask-cors/python-flask-cors.hash | 4 ++--
>  package/python-flask-cors/python-flask-cors.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)

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
