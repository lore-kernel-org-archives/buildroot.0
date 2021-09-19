Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A239C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:11:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C942A61244
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C942A61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A37BF84068;
	Sun, 19 Sep 2021 13:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Drio2ibx-jdD; Sun, 19 Sep 2021 13:11:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EE0D84084;
	Sun, 19 Sep 2021 13:11:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E80471BF5AC
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E12A640474
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Se53sCHZY8zE for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:09:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE44A40134
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:09:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id DB95A200007;
 Sun, 19 Sep 2021 13:09:06 +0000 (UTC)
Date: Sun, 19 Sep 2021 15:09:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210919150904.04051568@windsurf>
In-Reply-To: <ecec6557-9d20-134b-497c-e6c7e55deee6@mind.be>
References: <20210908081630.3404221-1-kory.maincent@bootlin.com>
 <ecec6557-9d20-134b-497c-e6c7e55deee6@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to
 version 10.3-2021.07
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello,

On Sun, 19 Sep 2021 14:35:56 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > -ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
> > -ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/$(ARM_GNU_A_TOOLCHAIN_VERSION)/binrel
> > -ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> > +ARM_GNU_A_TOOLCHAIN_VERSION = 10.3-2021.07
> > +ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(ARM_GNU_A_TOOLCHAIN_VERSION)
> > +ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-linux.tar.bz2  
> 
>   Err, this can't be right... 'gnu-rm' stands for "GNU-based toolchain for 
> Cortex-R and Cortex-M", and "arm-none-eabi" means it's a toolchain without libc...
> 
>   So either someone made a huge mistake at ARM, or you haven't actually tested 
> this patch :-)

It was tested to build code for a Cortex-M4.

This package was originally introduced to build ARM 32-bit code in the
context of TF-A (boot/arm-trusted-firmware/). At the very beginning,
was submitted by a Marvell person, who also had to build code for a
Cortex-M3 co-processor IIRC, but then was taken over by a person from
Amarula, who needed it to build ARM 32-bit code running on a Cortex-A.

If it's truly a bare-metal toolchain with no libraries, it should not
matter, right? You just pass to gcc -march=XYZ, and it will produce the
right code. However, my understanding is that those bare-metal
toolchains do have some libraries built for the target, which can
potentially get linked with the code produced.

So, long story short: do we need arm-gnu-a-toolchaind and
arm-gnu-rm-toolchain packages ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
