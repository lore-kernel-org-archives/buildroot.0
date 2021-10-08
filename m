Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BCDC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 13:10:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8622A6103C
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 13:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8622A6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CFEF40964;
	Fri,  8 Oct 2021 13:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSrEziweXAZ2; Fri,  8 Oct 2021 13:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71B8940941;
	Fri,  8 Oct 2021 13:10:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33BA11BF591
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 13:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23C3E83E1C
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 13:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otJosT8-32sZ for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 13:10:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A0D483D2A
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 13:10:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E4C8E60009;
 Fri,  8 Oct 2021 13:10:10 +0000 (UTC)
Date: Fri, 8 Oct 2021 15:10:10 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Message-ID: <20211008151010.41e58d0b@windsurf>
In-Reply-To: <YWA98UOCDjOFh51v@aptenodytes>
References: <20210928223754.3398867-1-kamel.bouhara@bootlin.com>
 <20211001161354.0bc8c1f1@windsurf> <YV6/ZvZq3BlO0yYe@kb-xps>
 <20211008144029.51d226d7@windsurf> <YWA98UOCDjOFh51v@aptenodytes>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/7] package/opengl/libgbm: new virtual
 package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 8 Oct 2021 14:47:45 +0200
Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:

> > So what made you think we need to identify this feature separately from
> > others?  
> 
> I seem to recall that earlier versions of the sunxi blobs didn't have
> dma-buf support, and they eventually released some that did.
> 
> So my two cents would be that dma-buf is not part of the "base" set of
> features from the GBM API and it makes sense to recognize it as an
> additional feature.

Thanks, useful feedback (should I say "as usual" ?). Should perhaps be
captured "somewhere" (commit log ? comment above the feature option ?).

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
