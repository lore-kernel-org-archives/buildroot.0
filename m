Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E0DC25B5C
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 18:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68B734034B;
	Mon,  6 May 2024 18:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRwMz1yh30Xc; Mon,  6 May 2024 18:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5335840600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5335840600;
	Mon,  6 May 2024 18:52:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 773421BF308
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63DF96085D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 18:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnroeE1462Ce for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 18:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B93F3607E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B93F3607E3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B93F3607E3
 for <buildroot@buildroot.org>; Mon,  6 May 2024 18:52:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D35661BF204;
 Mon,  6 May 2024 18:52:22 +0000 (UTC)
Date: Mon, 6 May 2024 20:52:21 +0200
To: "Maier, Brandon L                            Collins"
 <Brandon.Maier@collins.com>
Message-ID: <20240506205221.3768e4f0@windsurf>
In-Reply-To: <BN0P110MB16737572D6105F0CEE0102F7EB1CA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
References: <20240412211222.26585-1-brandon.maier@collins.com>
 <20240505153959.14f8ef6b@windsurf>
 <BN0P110MB16737572D6105F0CEE0102F7EB1CA@BN0P110MB1673.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715021543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRpPBr6tylX7/PXeaFIDVJTcX4tYFSCHrYOgNFEhqRQ=;
 b=fLFIzfAAkWA1DiTTD7Z9+ztmwaYejYfb3lluB7yxxW7YtK/HMHurtU7JZrAicfLYJcWvb5
 371bzlHiOwngSoBLNUFV+GZcWPq/VHkMFMWbC3sibcsnDnDI47soIfg1DH7V9nZ3aSj7qv
 xdqKNZKHd9bj34d4ppMOYQWrnMNyjDOOJNjYCUbXOhUGD1lelyt42BLmMqISRqCxnaWcBP
 ObffURIbbwAniRmm8Wuug+Sl5ijAvRtZCuUyzv1z0Cgl4O3v4G0F2mu489Y8BQ9JIUFU1D
 Y0op/vOQQw3cPPCpQxXbgnuIO60A/xWfI46SCpAtJnGvHcxyfHDEXUmtoXMbFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fLFIzfAA
Subject: Re: [Buildroot] [External] Re: [PATCH 1/1]
 boot/arm-trusted-firmware: enable verbose output
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Brandon Maier via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 6 May 2024 18:15:55 +0000
"Maier, Brandon L                            Collins" <Brandon.Maier@collins.com> wrote:

> > I am confused as to why this patch is needed: for both Linux and
> > U-Boot, we don't need to do anything special, just doing "make V=1" at
> > the top-level, the V=1 gets passed down to Linux/U-Boot, and they
> > exhibit a verbose build. However, that doesn't work with
> > arm-trusted-firmware indeed, so I have applied your patch which makes
> > the build verbose also for arm-trusted-firmware. Still a bit unclear as
> > to why it doesn't work "by default".  
> 
> The Arm Trusted Firmware sets "V := 0". So, it only sees verbosity when passed as an argument.
> https://github.com/ARM-software/arm-trusted-firmware/blob/master/make_helpers/defaults.mk#L291-L292

Aaah, that explains it! I'm not sure how I missed this when looking at
the TF-A Makefile (but I looked quickly). Thanks for following up on
this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
