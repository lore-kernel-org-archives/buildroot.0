Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54717C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 22:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D3D41BEA;
	Thu, 28 Apr 2022 22:00:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaEVj2cti4k8; Thu, 28 Apr 2022 22:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9086C41B98;
	Thu, 28 Apr 2022 22:00:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B19DA1BF36D
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE55F41B98
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 22:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvTmMOcTb8W9 for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 22:00:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ECEF41B6B
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 22:00:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B5F740003;
 Thu, 28 Apr 2022 22:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651183240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jyq48hpZ+mRM+m20RPhx/sTllXbX7oUIgjvzHJMQ6KI=;
 b=jfb1hs3UT3i2qPuMW2IEpvohkr4yQYwglBmGOhKQ5nkCAcrjsYEMjnXA6llPc3iNZh1Oeh
 hlq5sIW2aufIKg5K4UnnR2m9EcgAUDfiVjNJtte+ViqaQz/zQaq7MltR9AUFnN8RcYeokG
 fe0O2r0YUPMmc6/N2bWFyQE9IghuHspUzvsXE7f0t8p2+ycjA3gE68qplSmmf6/tPL7kit
 ayFG3Ng63eCtIvvFq5rvMGLLnZXCg9xnYK31hLs7DdtIvcfdzauUoDna2TNL1MfjM7aGjy
 kGZ3vn+Ao3w2tl72qwUzzHDaRqpVotPqeF7Sve/nS6nYWa1t/4HiFl7wGpzhzg==
Date: Fri, 29 Apr 2022 00:00:39 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220429000039.23e1a1fe@windsurf>
In-Reply-To: <20220428215220.GI3624965@scaer>
References: <20220428205548.524402-1-thomas.petazzoni@bootlin.com>
 <20220428205548.524402-4-thomas.petazzoni@bootlin.com>
 <20220428215220.GI3624965@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 4/4] package/binutils: drop version 2.32
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 28 Apr 2022 23:52:20 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I was considering on not applying that one, so we could have a fallback
> in case there were runtime issues reported with newer binutils (I could
> only build-test your series, I lack a noMMU target).
> 
> But if that happens to be the case, we can revert this patch quite
> easily.
> 
> so, applied to master, thanks.

Really if people still need to use binutils 2.32 and none of the newer
binutils version work for FLAT, I would call FLAT an unmaintained
use-case, which should lead us to drop support for it rather than
keeping an old binutils version around.

I don't know if there's an easy way to test an ARM noMMU build in Qemu.
https://xpack.github.io/qemu-arm/ which is a fork of Qemu, seems to
emulate STM32F429I-Discovery, which we have support for in Buildroot.
Not clear if the source is available, but since Qemu is GPLv2, I guess
the source code for this fork should be available somewhere.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
