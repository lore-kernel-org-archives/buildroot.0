Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716B1CDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 21:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0A74065A;
	Tue, 22 Oct 2024 21:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0gZEYZe6-T1; Tue, 22 Oct 2024 21:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DEA40670
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9DEA40670;
	Tue, 22 Oct 2024 21:12:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 760EB2072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37A5581089
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z82ALdYG7QCn for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 21:12:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1E3A481096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E3A481096
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E3A481096
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 21:12:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8774EFF803;
 Tue, 22 Oct 2024 21:12:45 +0000 (UTC)
Date: Tue, 22 Oct 2024 23:12:43 +0200
To: Bryce Johnson <bryce@redpinelabs.com>
Cc: buildroot@buildroot.org, Suniel Mahesh <sunil@amarulasolutions.com>
Message-ID: <20241022231243.7ab36afc@windsurf>
In-Reply-To: <CADXxVS+0bHz+Hqe4437vb5K3=Qmt3DLfNSFMEmsWJTFXGkiFTg@mail.gmail.com>
References: <20241022180542.224972-1-bryce@redpinelabs.com>
 <20241022212800.570cbcfc@windsurf>
 <CADXxVS+0bHz+Hqe4437vb5K3=Qmt3DLfNSFMEmsWJTFXGkiFTg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729631566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19USwlhvr9086qSWXziRg685BlCttgR6SMftLPvcXEU=;
 b=Q8q6vnWjicjYTTjVzWi/mmG32r8vXwwVyP0RT5HyYmeKmUkKhg6OR7XVsnzpMRJM4vTZWh
 iInSUTQ74pNKSlRQx10lQBom8hpkP0sVjCpUEVO3kGcHpYN1SBetK/afH9BhglaXNlhLxm
 AD4lwq2ETRYcV6+89TCOCXemkzy1kuPw835IoAO54sYf7BgvFpFAMwuBXzr7BPKfJP8lit
 dHWi6Py0+L0csqbyCu7zCtKAXrKqfrGZgLMIUj3ZJJvIpNQq0/GLliwDfq1CXj49chJHdI
 SiaJxkA5Fq2oG0M1faz/AKJHVuycm16Nig04fNyxFS28F/zEFdsoqt6E4O9VDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q8q6vnWj
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: Add $(HOSTARCH)
 so it can be built with aarch64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bryce,

On Tue, 22 Oct 2024 14:36:44 -0600
Bryce Johnson <bryce@redpinelabs.com> wrote:

> Yes I'll do that. Finally got the git send email with my gmail account
> working and thought the Signed-off-by got added.  I'll clean up that
> and the line length as well.

Thanks, I have seen your v2, which I have applied. However, did you see
the remainder of my review? See below.

> > > -ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> > > +ARM_GNU_TOOLCHAIN_SOURCE = arm-gnu-toolchain-$(ARM_GNU_TOOLCHAIN_VERSION)-$(HOSTARCH)-arm-none-eabi.tar.xz  
> >
> > The change looks correct as-is of course, as it doesn't make anything
> > worse. However, I believe to make things cleaner, we should perhaps
> > introduce a package/arm-gnu-toolchain/Config.in.host file, with a blind
> > option BR2_HOST_PACKAGE_ARM_GNU_TOOLCHAIN, that has a "depends on" the
> > host architectures that are supported. And the packages that use
> > host-arm-gnu-toolchain would have to be careful to propagate those
> > depends on, so that we do not allow using host-arm-gnu-toolchain on
> > configurations that do not allow using the host-arm-gnu-toolchain
> > package. However this can be done as a separate patch, as again your
> > change is not making things any worse than they already are :)
> >
> > Could you send a v2 of your patch with the proposed changes?

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
