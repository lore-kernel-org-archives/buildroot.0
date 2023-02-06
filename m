Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FFAC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 14:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F9F740459;
	Mon,  6 Feb 2023 14:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F9F740459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YHj-UpT2Hmq2; Mon,  6 Feb 2023 14:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 716CA4036F;
	Mon,  6 Feb 2023 14:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 716CA4036F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA5B91BF343
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 14:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADC53414E4
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 14:56:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADC53414E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cweOvr4aLF6h for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 14:56:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54DC0414E0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54DC0414E0
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 14:56:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D7CC8240002;
 Mon,  6 Feb 2023 14:56:51 +0000 (UTC)
Date: Mon, 6 Feb 2023 15:56:50 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230206155650.79bafe2c@windsurf>
In-Reply-To: <87sffi97wo.fsf@dell.be.48ers.dk>
References: <VI1P190MB0493F15E5CA3D6BC8CCD52029FFF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20230114230028.46833cae@windsurf>
 <87sffi97wo.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675695414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f+tJomFLXpREfEBIP2uMpVhj8Fbyf7yMKphtMVqTYmw=;
 b=BPnQqIDxskKPcTBM9g5AykRa5/0AI7xRR7Qz6oaCGvFWsOmQfDsiAnEbP8QokvhvN9eBnZ
 0t1z+tI9CwD+3onN0dNTFUpNOckrbRhLe5YRKKRh4YUfka+kEGPTia9DajJL0Btdc9TPbx
 9u8S0/S1+tnpwx0mWcAigXM/FmZZxls6bgXf4lQcwCy7F887luaSNfiBqnf5w6H/ZdkSuB
 Hw3GBSf61ZRjCHo7QRX9gXoGgSMnL8kZcJmiVTWMNAWRQW3h/gGQCgM64az9i9AFeW0cTs
 /44hYvBdeZ7NOxrpOa0Y20NE5Ma17duLTWj+vNawTnALks1fSICgX96wQ9Sn1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BPnQqIDx
Subject: Re: [Buildroot] [PATCH 1/3] package/freescale-imx/imx-gpu-viv: drop
 X11 output
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
Cc: Lang Daniel <d.lang@abatec.at>, Gary Bisson <bisson.gary@gmail.com>,
 "tuzakli.refik@gmail.com" <tuzakli.refik@gmail.com>,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 06 Feb 2023 15:37:43 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> I see we still have xf86-video-imx-viv which depends on the now removed
> BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 symbol, so I guess we should remove
> that package as well.

Gah, I did not notice that: indeed it should be removed as well.

Daniel, will you cook some patch doing that?

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
