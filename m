Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0226AC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 07:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9424860E35;
	Thu,  9 Jun 2022 07:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wlqtMo79E2al; Thu,  9 Jun 2022 07:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B350960E1A;
	Thu,  9 Jun 2022 07:35:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E85B1BF2B7
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CB2641B70
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9SEWgUe_JOC for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 07:35:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1975D41B60
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 07:35:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B26A7C0013;
 Thu,  9 Jun 2022 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654760132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbRf5q0FikEROqW4R1waKAF0gIk9hOo7rm3S/r3D6Qo=;
 b=GbcdM3+bT0oED0Bzlf/aUhSSvX7CWDh8deDCfM6Pfh4SdFEhNs5Z2nKZgUQz7V76gbvd4X
 SkhohYc2w0K7NyNn0pLr+pRyO0A93pU9eGD8bZOlrYIFPb9/pG4TDDVkESxte/K0oB6vIG
 p3pOVMblHQocHSK9dH3P/NlYLVbZtMho+eu+USKmQYUjt+/8bFiM+iBO8hG2tpxYfc6GXD
 6O7I/I25nUQZqaIaP/e3cbz554Qw1LHNJiTw73D0Gh3luHueULEl3exhASaTjCPR2X2M2H
 33hW7fuiOAiZ+P/vsvVs+nsGwJuihdCWkFyNPlcVyVvlp0ickameJd9F5V7AZQ==
Date: Thu, 9 Jun 2022 09:35:29 +0200
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <20220609093529.5686eec5@windsurf>
In-Reply-To: <e58d937e-3550-d063-c7d1-2cdde0ecd898@opensource.wdc.com>
References: <20220531054926.373713-1-damien.lemoal@opensource.wdc.com>
 <e58d937e-3550-d063-c7d1-2cdde0ecd898@opensource.wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 0/7] Fix RV64 NOMMU and add Canaan K210
 SoC support
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Damien,

On Tue, 7 Jun 2022 11:31:33 +0900
Damien Le Moal <damien.lemoal@opensource.wdc.com> wrote:

> > For each board, a readme.txt file is added to document how to build and
> > install images for these boards.  
> 
> Thomas,
> 
> Ping ? Large backlog ?

Yes, I've handled other Buildroot patches/topics. Your patches are
lined up in patchwork, and not forgotten. For the record, we have ~300
patches in our backlog. We'll get to your patches!

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
