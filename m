Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B5EEE49A8
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 10:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF33817B0;
	Tue, 22 Aug 2023 10:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF33817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QI1zW0lFMHTP; Tue, 22 Aug 2023 10:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7109817AE;
	Tue, 22 Aug 2023 10:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7109817AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CAA31BF354
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 474F9408DE
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 10:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 474F9408DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XEUjmYMaGGpt for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 10:14:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5084408D0
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 10:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5084408D0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D4DFC0005;
 Tue, 22 Aug 2023 10:14:08 +0000 (UTC)
Date: Tue, 22 Aug 2023 12:14:07 +0200
To: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Message-ID: <20230822121407.414eb140@windsurf>
In-Reply-To: <20230622160212.2063472-1-dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692699249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVeF2YZDoR6T0QNrCuTUTKg2npxJFvRtFSs/al5yukw=;
 b=BPOT76gVYr9AT0fA1+hsI29w9i0xcnjn7+Dfonp791ZZG4g4w07GmbJeYa//IRIznKndlb
 h/f4UNGLc5dndSrHar5gqhb+T86mRNxOIVtyenjzRl6XuiCBpys2iOlTCiBmZ9pI1S0Xyq
 jl2hQsRtLJFQBnFFZjeu9U7KiRuXZFcqnYMcYZR98EVNuf7pL0bxKwf9lmCtWzZ13aQqGI
 TshDhvQYHzzkP4EuUzR9Nq9NCP3Ec2Hbm3JJ+sZf7+lAPrkIq2busIcXirgfa1DUt7oLUJ
 Azue0AdyB812bfjiBlL4biNMMQkyXlKCUAWdmQn0rSFTXexiKT9fCkrGbX6c3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BPOT76gV
Subject: Re: [Buildroot] [PATCH v9 00/11] add support for TI's AM64x and
 AM62x boards
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
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Thu, 22 Jun 2023 11:02:01 -0500
Andreas Dannenberg via buildroot <buildroot@buildroot.org> wrote:

> Andreas Dannenberg (8):
>   boot/ti-k3-r5-loader: allow for full build source customization
>   boot/uboot: add support for building the TI K3 DM into U-Boot
>   board/ti/am62x_sk|am64x_sk: switch to TI SDK v8.6 sources
>   package/ti-core-secdev-k3: new package
>   board/ti/am62x_sk|am64x_sk: switch to HS-FS device variants
>   package/ti-rogue-km: new package
>   package/ti-rogue-um: new package
>   configs/am62x_sk_defconfig: enable IMG Rogue graphics driver
> 
> Xuanhao Shi (3):
>   boot/ti-k3-image-gen: new package
>   board/ti/am64x_sk: add new board
>   board/ti/am62x_sk: add new board

So, I have just merged the first 5 patches of this series... but
actually in its v8 iteration because the v8 is the one that was still
pending in patchwork, and I realize only now that there was a v9. How
well, too late, I already pushed to our next branch, so any additional
change will have to be done on top of what's in the next branch.

I'll therefore reply to the v8 patches that I have merged and explain
the numerous changes I did.

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
