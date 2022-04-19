Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F846C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 19:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 836BA41873;
	Tue, 19 Apr 2022 19:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1tzrFb8yJek; Tue, 19 Apr 2022 19:42:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 296C141851;
	Tue, 19 Apr 2022 19:42:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E96E1BF867
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C59A60BDC
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 19:42:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uZz2_Q0Cnf2 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 19:42:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E35866080B
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 19:42:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 579AA200002;
 Tue, 19 Apr 2022 19:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650397363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRRna7nHwLcGb3t6y/gmV+xu6lGtKbriMyVW7e95bXM=;
 b=cIPZvEPkxeYT7SR+YE+DgOW8IqmBV2gnCcj4agPGnmYNs7NcAPBo5V0aY9EKEqdFZDi/y2
 8MOHrvyPhPmD/pSDWcJQjvvxMmMP7zWVno0wepaf7bmrTnmkEzg39tN/35f8siSfUNYkq7
 cwC7rQw7CCXGGq/z7a7duC2euJjIajyrGxz2/v60ewTx1/Pu3tc0aLTp3VRY8YPBhqTLJl
 fmJ53XFR27frh0axCY8uuZ1SVtVXjH2aX9UeQVVmqYCQKOROU4UPOJCXMwd66nHG1IRxWa
 WJ2lM44dJ68fB73c/ojQNTzKMHjqjO8yRawEHFWseFn5oUHzxhstRvz7tWFihQ==
Date: Tue, 19 Apr 2022 21:42:42 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220419214242.44ee10dd@windsurf>
In-Reply-To: <CADvTj4rHaz8pVx=mz2Cs4K72D_9ZoF3j6CBp4j=v0xbA5t_H8w@mail.gmail.com>
References: <20220409020719.3126086-1-james.hilliard1@gmail.com>
 <20220413225147.48bd5442@windsurf>
 <CADvTj4rHaz8pVx=mz2Cs4K72D_9ZoF3j6CBp4j=v0xbA5t_H8w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: disable 2.32 on
 unuspported FLAT platforms
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 17 Apr 2022 00:50:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > I'm not sure that how we want to handle this. Indeed, even with newer
> > binutils versions, I really doubt supporting aarch64 with the FLAT
> > binary format makes a lot of sense.  
> 
> Well our newer binutils versions do already have FLAT disabled
> entirely by setting:
> depends on !BR2_BINFMT_FLAT

Right, but as I state below, this is incorrect: they are disabled
because they introduce a regression on ARM noMMU. Other noMMU
architectures are (as far as we know), not affected.

> > As far as I'm aware, there's currently no practical use-case for Linux
> > noMMU on aarch64 and SH4, so I would simply disallow that. So on ARM, I
> > would only allow the MMU to be disabled on ARMv7-M, and on SuperH, for
> > SH2A. I.e something like the below patch.
> >
> > Of course, that leaves the case of BR2_sh2a. But if binutils
> > 2.35/2.36/2.37 are broken for the FLAT format (which is why they are
> > disabled), and 2.32 is disabled for SH2A/FLAT, then there's nothing
> > left available for SH2A/FLAT  
> 
> Hmm, my assumption was that even though FLAT may not be supported
> by the buildroot toolchain it may be possible some external toolchains
> could have support for them, so I figured best just disable known invalid
> options here for buildroot toolchain binutils.

Practically speaking, nobody is using/testing FLAT on aarch64, SH4 or
other MMU-capable architectures. We should support reasonable use-cases
only IMO.

> > Except that
> > package/binutils/Config.in.host is wrong in disabling 2.35/2.36/2.37
> > for all FLAT configs: the bug is only related to ARM.  
> 
> Hmm, so maybe this set of depends plus an arm exclusion is needed
> for newer binutils?

I'm not following you here.

> > However, I feel strange that sh2a/FLAT was not supported back in
> > binutils 2.32. sh2a/FLAT has been around for a very long time. In fact
> > what happens is that we have a patch to allow sh2a as an architecture
> > name: package/binutils/2.32/0001-sh-conf.patch. But that patch is
> > probably no longer sufficient, and some adjustements are also needed in
> > bfd/config.bfd.  
> 
> So, that patch doesn't seem to add uclinux as a supported target,

No, it makes it support sh2a as an architecture name.

> which seems to be required for BR2_BINFMT_FLAT builds based on:
> https://github.com/buildroot/buildroot/blob/2022.02.1/package/Makefile.in#L44-L45
> https://github.com/buildroot/buildroot/blob/2022.02.1/package/Makefile.in#L40
> https://github.com/buildroot/buildroot/blob/2022.02.1/package/binutils/binutils.mk#L83
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/config.bfd;h=0e1ddb659c3ab7160aab0a7c173b85052f870e65;hb=a9d9a104dde6a749f40ce5c4576a0042a7d52d1f#l1243
> 
> The failures from what I can tell here are due to the lack of a uclinux
> target for sh2a in bfd/config.bfd.

I need to have a closer look it seems.

> > Bottom line: there is more work than just this proposal, which simply
> > papers over the problem without really fixing it.  
> 
> Yeah, that's probably a bit outside my area of expertise, I was just
> adding these dependencies by tracing the configure failure conditions.
> 
> I'm not really familiar with no-mmu builds in general so wouldn't really
> know what's correct for the architecture mmu settings.

Yeah, that's also why I'm advocating for a broader solution. I'll try
to cook some patches. I don't think I'll fix all problems in one go,
but we can progressively get there.

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
