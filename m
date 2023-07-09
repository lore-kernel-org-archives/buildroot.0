Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9ABEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48975606FF;
	Sun,  9 Jul 2023 16:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48975606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgK3pFQURlyw; Sun,  9 Jul 2023 16:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8300260757;
	Sun,  9 Jul 2023 16:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8300260757
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3AEB1BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C01C6073F
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C01C6073F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnlCXa4YIrCq for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:32:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D13E606A9
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D13E606A9
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:32:05 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81E5C1C000D;
 Sun,  9 Jul 2023 16:32:03 +0000 (UTC)
Date: Sun, 9 Jul 2023 18:32:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230709183202.0fe56bdd@windsurf>
In-Reply-To: <20230709151919.1694148-1-bernd@kuhls.net>
References: <20230709151919.1694148-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688920323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHCjJ/sORV1oLISnMrWE/+6e4liUNpp000whvXLBX/8=;
 b=RUpa4VCfqr4vXgGE7RA31sLSEjGbcga8D2j2GsQDXPmdIPlou3b5uKPpoezqzcHaNRjM7H
 RzFN9q6SNS4UNFpG6NcurC4TdC0Xp9rckw9UmFrh6wryOcXJZdBOvJQNDK7+Au+eLsnnvI
 pL5XrFtPbpBSSj/LsDnqx0wU+2wPxjs76UbOCqOFlZNbMZYITN553wddZ5Tv9HVm0sWqdc
 YtMvtUtX4Avy74GfArKeYB36E3Z/FQSqU9D+YZrlUMECODsgf6ezGvoqNTC8kY5U6Ijpb3
 e1v3sJT4AOc1Fo4UfM4xn3Hb+qM0W+kH7aQGd62OdhTcVegJBWtBRInxM06i+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RUpa4VCf
Subject: Re: [Buildroot] [PATCH 1/1] package/dahdi-linux: Fix build on Linux
 6.4
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  9 Jul 2023 17:19:19 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/8b1/8b140b7f4d2f2b3080cab90906c3cebea0e510c5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0006-Fix-build-on-Linux-6.4.patch         | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 package/dahdi-linux/0006-Fix-build-on-Linux-6.4.patch

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
