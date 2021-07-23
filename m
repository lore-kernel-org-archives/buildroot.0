Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53413C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:35:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D514F60ED7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 22:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D514F60ED7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5A6A60665;
	Fri, 23 Jul 2021 22:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wnxgPAnjgtir; Fri, 23 Jul 2021 22:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F90606BF;
	Fri, 23 Jul 2021 22:35:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1EB61BF3EE
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0FBB401CB
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 22:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ftW5GSLSWot0 for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 22:35:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4815400B9
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 22:35:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D29E6240004;
 Fri, 23 Jul 2021 22:35:15 +0000 (UTC)
Date: Sat, 24 Jul 2021 00:35:14 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210724003514.4da0f292@windsurf>
In-Reply-To: <6a1b7aba-9fe8-d0ab-ffda-b24167b0cfce@mind.be>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-5-damien.lemoal@wdc.com>
 <6a1b7aba-9fe8-d0ab-ffda-b24167b0cfce@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 4/9] board: Add Sipeed MAIX-bit support
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Alistair Francis <alistair@alistair23.me>, Mark Corbin <mark@dibsco.co.uk>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Sat, 24 Jul 2021 00:25:27 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > +++ b/board/canaan/k210-common/busybox-tiny-initramfs.config  
> 
>  Wouldn't it be better to start from busybox-minimal.config and just add a
> fragment that removes the unnecessary options?

Also, we already have a package/busybox/busybox-minimal.config. I'm not
sure we want to add zillions of "minimal" Busybox configurations.

> > +++ b/configs/sipeed_maix_bit_defconfig
> > @@ -0,0 +1,23 @@
> > +BR2_riscv=y
> > +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set

This should remain the default.

> > +BR2_KERNEL_HEADERS_5_13=y
> > +# BR2_UCLIBC_INSTALL_UTILS is not set

This should remain the default as well.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
