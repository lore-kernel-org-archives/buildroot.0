Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84A3C43334
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 12:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39BC341655;
	Mon, 18 Jul 2022 12:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39BC341655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSqdkG3MP1-A; Mon, 18 Jul 2022 12:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7E71415C5;
	Mon, 18 Jul 2022 12:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7E71415C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61CFB1BF317
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1167260FF2
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 12:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1167260FF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L1alV5HBkjLI for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 12:08:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95FF960FBE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95FF960FBE
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 12:08:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 38B3D20009;
 Mon, 18 Jul 2022 12:08:53 +0000 (UTC)
Date: Mon, 18 Jul 2022 14:08:52 +0200
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20220718140852.24007cad@windsurf>
In-Reply-To: <VI1P190MB0493B1992DDAF7607E82B2D99F829@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493B1992DDAF7607E82B2D99F829@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658146133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRFKQWbmgnmctY5aEe7FZ4uypj97Xgq7qv74VjB9kNA=;
 b=RzBIjw7R/nPWXR1PkaEPZJeM7b3BqqSOL7KSVz6UkvKOfE2iBJov30L2/c1hNkK0h9MEkH
 vusp1kW6iTc4GNoD9t8xywDgz/gvC7xo49MmJl2S40YGP3ODqnK/P6RxG3403Ky5ciHI59
 nbmwmAfJmOD2O2pOpqXnePY1yrgCpZLqjW6VaPiWFPJpHMim+alPpisG5jnFUEsux93H6U
 05qTBIamZ6Zrucj57CJzFPFYXNAcovmKzk0AQMSla96Do71pgwco0POvyRHWF+ILWUA8rB
 0LMxGjj/dJZi9nB2YbkARWjQSMO2qAZ961F7WodJ9zWYU3zdW/eU3wXvK0AMEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RzBIjw7R
Subject: Re: [Buildroot] [PATCH 1/1] package/sam-ba: bump version to 3.7
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 8 Jul 2022 08:51:46 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
>  package/sam-ba/sam-ba.hash | 2 +-
>  package/sam-ba/sam-ba.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
