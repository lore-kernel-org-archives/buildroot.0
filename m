Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE0DC4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 14:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B57960F38
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 14:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B57960F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC292402B5;
	Tue, 10 Aug 2021 14:41:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yW-uKY8seAde; Tue, 10 Aug 2021 14:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A97240359;
	Tue, 10 Aug 2021 14:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB0941BF5A0
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 14:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAD29831D5
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 14:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrqfrS1A6jEF for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 14:41:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F45D82C33
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 14:41:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B094340004;
 Tue, 10 Aug 2021 14:40:56 +0000 (UTC)
Date: Tue, 10 Aug 2021 16:40:55 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <20210810164055.2d30eda8@windsurf>
In-Reply-To: <3cd3552d-3114-d2dd-9145-aca4319e0754@opensource.wdc.com>
References: <20210724075335.804074-1-damien.lemoal@opensource.wdc.com>
 <3cd3552d-3114-d2dd-9145-aca4319e0754@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 0/9] Add RV64 NOMMU and Canaan K210 SoC
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Mark Corbin <mark@dibsco.co.uk>, Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Damien,

On Tue, 10 Aug 2021 16:45:29 +0900
Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:

> > Finally, patch 9 documents how to build and install images for these
> > boards.  
> 
> Re-ping... Any comment on these patches ?

Not yet, we have a significant backlog of patches. We've worked hard in
recent weeks and have been able to reduce the backlog from ~600 to ~300
patches, which is already much better.

Also, 2021.08-rc1 has been released, which means that the focus now is
more on fixes/stabilization for 2021.08 rather than merging new
features.

Don't worry: we use patchwork, so patches are never lost.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
