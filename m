Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E37CC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:01:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B20960E97
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 14:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B20960E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5091C40339;
	Thu,  5 Aug 2021 14:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E7PMSH1_XlbR; Thu,  5 Aug 2021 14:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71A45402AE;
	Thu,  5 Aug 2021 14:01:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 754881BF41A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62F2B402F0
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 14:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id putprpiMr29s for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 14:01:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE5A64013C
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 14:01:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3226DE0003;
 Thu,  5 Aug 2021 14:01:43 +0000 (UTC)
Date: Thu, 5 Aug 2021 16:01:40 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Pascal de Bruijn <p.debruijn@unilogic.nl>
Message-ID: <20210805160140.4fcc15ce@windsurf>
In-Reply-To: <AM0PR07MB39874E7C25C042D0F51C8BC09DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
 <20210805085353.3457-3-p.debruijn@unilogic.nl>
 <20210805153149.3b72eb3f@windsurf>
 <AM0PR07MB39874E7C25C042D0F51C8BC09DF29@AM0PR07MB3987.eurprd07.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/php: enable opcache jit
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
Cc: "aduskett@gmail.com" <aduskett@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Pascal,

On Thu, 5 Aug 2021 13:53:21 +0000
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> No not really... I've not found a case where JIT does not work (when
> properly enabled in php.ini), maybe @aduskett could elaborate...

Yes, it would be good to have some details from Adam.

> Opcache (with or without JIT) was completely broken both in buildroot
> for both 7.4.x and 8.0.x due to the shm_unlink issue with librt. The
> main issue is that this fails at runtime, so you can have opcache
> compile just fine, but non-functional when enabled in php.ini...

I'm confused about the librt thing, because librt never existed in
musl, and it was dropped a long time ago in uClibc/glibc. Buildroot no
longer supports glibc versions where librt was a separate library from
libc.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
