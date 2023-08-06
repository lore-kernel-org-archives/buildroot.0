Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE52C0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 19:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB09460EF3;
	Sun,  6 Aug 2023 19:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB09460EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ML9ynKAZQYoT; Sun,  6 Aug 2023 19:25:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB3F60E76;
	Sun,  6 Aug 2023 19:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BB3F60E76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 484AB1BF32A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63EDC40347
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63EDC40347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IDOz4rGXsstN for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 19:25:26 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1580940330
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 19:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1580940330
Received: by mail.gandi.net (Postfix) with ESMTPSA id D04D960006;
 Sun,  6 Aug 2023 19:25:22 +0000 (UTC)
Date: Sun, 6 Aug 2023 21:25:21 +0200
To: stefan.nickl@gmail.com
Message-ID: <20230806212521.4b916c8e@windsurf>
In-Reply-To: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
References: <20230724191638.637054-1-Stefan.Nickl@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691349923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8TjcCY+e8D3S1B59y6D/sLroO8U8Gj2Tw9Uk1EJ+9c=;
 b=WE5z273gYgqngHxTGpEe34mu+KGeB9fJQuCoPpTTtswQ4PY9zOzGSSjwSB8vDWrCWbtt4s
 L6pXy2obGVJYUZ9K6TEMyiV3AdiKrv89Bn+RRfXP5jRY05wPoPZFUmpH3JlHvl2Qm18Mpz
 SOrcj6AC3QTfAD5WYc4h6Gs4ZPjI1pK9K+G6SW7pGD9AWo1W9Y4ITUP0SILyzLtD2KTDZh
 +7Ah0H5O//YIvEsUnL9Yrpr5NT00R+JOMKD6ISRL2Jmh4mekLAb+zUrrtesA19Aa2d/+p3
 8IQjMFC5YNsV9bty2dDA7PQAq1lZgpNUs2nzRHt7l9zjUTwKpWMZ7VyIOJv8lg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WE5z273g
Subject: Re: [Buildroot] [PATCH v2 0/5] Add FREESCALE_IMX_PLATFORM_IMX8DXL
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, buildroot@buildroot.org,
 Maeva Manuel <maeva.manuel@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Mon, 24 Jul 2023 21:16:33 +0200
stefan.nickl@gmail.com wrote:

> Stefan Nickl (5):
>   package/freescale-imx/firmware-imx: bump version to 8.20
>   package/freescale-imx/imx-seco: bump version to 5.9.0
>   package/freescale-imx/imx-sc-firmware: bump version to 1.15.0
>   configs/freescale_imx8dxlevk: new defconfig
>   Add BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL

Thanks, series applied, after some changes:

- Add explanations about license file hash changes in PATCH 1/5, 2/5
  and 3/5

- Invert patch 4/5 and 5/5, otherwise you add the defconfig that uses
  BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8DXL before the option exists

- Add entries in the DEVELOPERS file for the defconfig and readme.txt
  files. This way you will be notified if there are build failures
  affecting this defconfig.

Thanks for this contribution!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
