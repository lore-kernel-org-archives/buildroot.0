Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7082CC433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 12:40:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE9C60FC2
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 12:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AE9C60FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AE686100E;
	Fri,  8 Oct 2021 12:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTlbZjy7q7K2; Fri,  8 Oct 2021 12:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE8FF61001;
	Fri,  8 Oct 2021 12:40:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3CE71BF359
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 12:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9315E4069F
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 12:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ED01mrBsoeLz for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 12:40:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16BAD407FD
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 12:40:33 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 80C2D100009;
 Fri,  8 Oct 2021 12:40:30 +0000 (UTC)
Date: Fri, 8 Oct 2021 14:40:29 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Message-ID: <20211008144029.51d226d7@windsurf>
In-Reply-To: <YV6/ZvZq3BlO0yYe@kb-xps>
References: <20210928223754.3398867-1-kamel.bouhara@bootlin.com>
 <20211001161354.0bc8c1f1@windsurf> <YV6/ZvZq3BlO0yYe@kb-xps>
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kamel,

On Thu, 7 Oct 2021 11:35:34 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> > Question: do we have in the tree some libgbm implementation that
> > support neither
> > BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT nor
> > BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF ?  
> 
> So far, the dma buf feature (mesa gbm v10) is provided by every
> implementation I compared (gcnano, ti, sunxi, imx-gpu).

So what made you think we need to identify this feature separately from
others?

The whole point of this "feature" mechanism is to be able to
distinguish the different GBM implementations in the features they
provide.

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
