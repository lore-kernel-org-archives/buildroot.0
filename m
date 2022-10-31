Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDAEFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 17:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C672241559;
	Mon, 31 Oct 2022 17:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C672241559
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRTT32OdBrgz; Mon, 31 Oct 2022 17:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A58D40232;
	Mon, 31 Oct 2022 17:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A58D40232
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA2FC1BF95C
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50BEC404D0
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50BEC404D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jKkUPSwZQw0d for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 17:30:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD87640516
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD87640516
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:30:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0E30E240004;
 Mon, 31 Oct 2022 17:30:23 +0000 (UTC)
Date: Mon, 31 Oct 2022 18:30:22 +0100
To: Bassem Fahmy <t_fahmy_bassem@hotmail.com>
Message-ID: <20221031183022.5c51b20b@windsurf>
In-Reply-To: <SY4P282MB30149AA46B4BC3EF0C01C47FCB2F9@SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM>
References: <SY4P282MB30149AA46B4BC3EF0C01C47FCB2F9@SY4P282MB3014.AUSP282.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667237424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36k3A7VrSIa33l4xQiRhU9Lg604d/d3CqNYPc8Od5+8=;
 b=IlWbiV9UDqPYfSeSwoAzcd5fstJ0ZAyiTCB52Wd0tLaSFSoyTI8Cire2ccD8FmkiTO0zFm
 p4X6GNPrYqgV+Ydxj8bELECEzJNtjRF4O/GoM+UZ2HCvqk40DXJD2B3zTU0zNypKge9phU
 nisrgJxTALosDvv6cWf+ca9NTdOIu465cdxue//zb+csv0FTcPIVeplfn3VqA+DnwIF2oO
 ABhfH9cK86oErpK1DLX4iyg2POuzPnv+vge2C2o9hqV+kKOSP27W6sQBgIerr4WZV9K3Sl
 74U6HR2ezWqLcNdUa7mWv/SGumz4JTx6mTxaEHz3JEsE6VPuKq/IkBYrei445g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IlWbiV9U
Subject: Re: [Buildroot] defconfig fragments
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bassem,

On Sun, 23 Oct 2022 08:04:01 +0000
Bassem Fahmy <t_fahmy_bassem@hotmail.com> wrote:

> I understand that buildroot supports config fragments for packages (that support defconfig).
> 
> But to patch the buildroot defconfig itself, the only way I could do it, is by calling 
> > support/kconfig/merge_config.h xxxx_defconfig xxxx.config  
> 
> Is this the correct way? Is there a more standard way to patch a buildroot defconfig?

You're correct, that's the proper way of generating a Buildroot .config
from multiple fragments.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
