Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C1ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 21:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C76402BA;
	Mon, 31 Oct 2022 21:05:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C76402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LYrXGfhaJ-6J; Mon, 31 Oct 2022 21:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73A6D40278;
	Mon, 31 Oct 2022 21:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73A6D40278
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1183D1BF2EA
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 21:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE1F860B65
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 21:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE1F860B65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oZvVnBVmNgw3 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 21:05:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 762A260A98
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 762A260A98
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 21:05:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 28D79E0008;
 Mon, 31 Oct 2022 21:05:13 +0000 (UTC)
Date: Mon, 31 Oct 2022 22:05:11 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221031220511.76f39b7f@windsurf>
In-Reply-To: <20220925121302.6e9aa48d@windsurf>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
 <20220925090920.1585682-3-thomas.petazzoni@bootlin.com>
 <20220925100355.GG1127102@scaer> <20220925121302.6e9aa48d@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667250313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLd6pfh0DFEKBj8YTGCBpDIIOHrXc/Toz30UYpJ11PA=;
 b=LyIKFCJIIwmJpwfrF6SPmDYvI2WE4VYgzVrXXigPz9vhXyEMmt9Vw1/s9KwbrkJY2gpAXQ
 sv66WD7Z2J05plMbTxHc1VQdXJPeeq1j3V/5wSFKKKRmAM+Z5aYQNJhk8ruRbmD4Mabacd
 UfyMn4t8A2cXY5JYV2H2NwdbjY38eZVy8txJk+bhtNePM/cThx5b81Rn/BaZlzEESzlqRV
 BOGQs6rsKcQp4PJ4rbSrrPjlLyhWwpILQmC1Zms/Abe+WSHrvbVgvLYgC1z+V/Iu5U4Ig1
 AlBJMv/sNVEa5rQ+9/AGXbmbD3oI77AtsBnwEHY6PUQlqmk6MJ/0RguMVT+QsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LyIKFCJI
Subject: Re: [Buildroot] [PATCH v2 2/5] Revert "arch/xtensa: custom
 configuration requires an overlay"
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Sep 2022 12:13:02 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> > As 4cbf7336914f explained, an empty overlay is equivalent to using the
> > fsf variant, so in that case, there would be no point in asking for a
> > custom core to begin with, and Max Filipov seemed to agree:
> >     https://lore.kernel.org/buildroot/CAMo8BfKHKuVC86uOwP0z8CzE425q7u0B_q6jdeU0Rw9upaiY=Q@mail.gmail.com/
> > 
> > So, I think we are maybe taking the issue from the wrong side here. We
> > should forbid an empty overlay only when using our internal toolchain
> > for a custom xtensa core. I.e.:
> > 
> >     diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
> >     index 7b6c59cecd..1799528a93 100644
> >     --- a/arch/arch.mk.xtensa
> >     +++ b/arch/arch.mk.xtensa
> >     @@ -1,8 +1,10 @@
> >      BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
> >      
> >     -ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
> >     +ifeq ($(BR_BUILDING)$(BR2_TOOLCHAIN_BUILDROOT),yy)
> >     +ifeq ($(BR_ARCH_XTENSA_OVERLAY_FILE),)
> >      $(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
> >      endif
> >     +endif  
> 
> You're right, this seems to be a better approach. In the case of an
> internal toolchain with custom core, it means the user still sees the
> little/big endian choice, but if he hasn't specified an overlay, the
> build will be aborted early on.

Now that I re-read this, I'm no longer sure to understand. If you have
a configuration BR2_TOOLCHAIN_BUILDROOT=y, BR2_xtensa_fsf=y, then
BR2_XTENSA_OVERLAY_FILE will be empty, but it's perfectly normal. But
with your proposed change, such a configuration would no longer build,
as we would now always require an overlay to be specified.

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
