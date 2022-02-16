Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94990C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 07:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19F9560BBA;
	Wed, 16 Feb 2022 07:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSatnTFmhEMQ; Wed, 16 Feb 2022 07:54:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EAB260B64;
	Wed, 16 Feb 2022 07:54:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F255E1BF578
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 07:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0BA882572
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 07:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZ-cpgvqhBKm for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 07:54:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC61F81CC3
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 07:54:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 966B224000D;
 Wed, 16 Feb 2022 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644998060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJ15velVrlVmsD1es3U1wWbmr4unmM/NOixfrMHy3K0=;
 b=mhTKCjv8fKUKjHahkYLTolq4ks6mOuxtf1aQ6VACvtzWGubhcbymz0yEExQOH5QTlAKE1b
 SWz+8pyrrz8R2HJePqBUREQjXcCqMBG6DyvXAtBIxleewnwJj/1OccE4780lC81kDPWmfP
 1FnfcHCuRszh1WSONFo8ZhlAes/zu6DsmopqHMyJ4myhx+iDjaXwJuQy3uPmm+r6X/JjCX
 m3Hj2WFPeWG9GdSdHyyn9Dg1IqtteCHCZDTdWSrZIzlvvCF2+UjSNuVW+iFFyFjhBlhTaT
 n3tStyI73T3UwiT378E672WEnxhUjA2DbZYVrsC3zs/EbdzgAsFcF1jpAobqtA==
Date: Wed, 16 Feb 2022 08:54:18 +0100
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20220216085418.03a39653@windsurf>
In-Reply-To: <0a4ee945d9de8406fc1887ac2ae23037851f56f1.camel@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
 <20211026071728.954356-6-damien.lemoal@wdc.com>
 <20211230212742.030be8c5@windsurf>
 <ba60fa7b8380ce6c817bb5bb2ada0283752efdfe.camel@wdc.com>
 <20220103162520.07b40bf0@windsurf>
 <0a4ee945d9de8406fc1887ac2ae23037851f56f1.camel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 05/10] board: Add Sipeed MAIX-bit support
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
Cc: "alistair@alistair23.me" <alistair@alistair23.me>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 15 Feb 2022 23:37:27 +0000
Damien Le Moal <Damien.LeMoal@wdc.com> wrote:

> > No worries about the delay. I took advantage of the Christmas/New Year
> > quiet period to help catch up with our patch backlog, and stumbled
> > across your patch series, which is why I asked.
> > 
> > I also saw the on-going discussion with Peter who had issues with
> > non-working binaries produced by elf2flt.  
> 
> Update: I think the elf2flt stability problem was sorted. It seems to have been
> related to gcc arch isa options that were not set correctly. With that done, we
> stumbled upon some bugs in u-boot that prevented clean boots. We have finally
> found fixes for all the problems now. We will be sending patches to uboot &
> kernel and update the buildroot series once that is done.

Excellent, thanks for the news! Looking forward to the next iteration
of the series.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
