Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02550C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79739813B5;
	Sat, 28 Jan 2023 21:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79739813B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zRlaprExxyGD; Sat, 28 Jan 2023 21:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C505A81399;
	Sat, 28 Jan 2023 21:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C505A81399
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFB401BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 806E881392
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 806E881392
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCC1Q-KQL9KW for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:21:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52BC28137E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52BC28137E
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:21:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 59CFFE0005;
 Sat, 28 Jan 2023 21:21:03 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:21:02 +0100
To: Ra C <rcrichlow9000@gmail.com>
Message-ID: <20230128222102.2de52447@windsurf>
In-Reply-To: <CACHw65JhmQX27SkN0jSMAD-P=UuwOizZc+sG+WatprbH_PFFyQ@mail.gmail.com>
References: <CACHw65JhmQX27SkN0jSMAD-P=UuwOizZc+sG+WatprbH_PFFyQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674940863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1l2NRvixOgxIPDtwgYWqWG1U33rMYtaCHrDqOGso+uE=;
 b=AH4J2xnUFrPFIbs+7VkF+F7reG3UdJg8x5JliZtT0xnjIQZqLVaeUcK3/0nwh+J/f0hbEY
 Xhbi1W+r5xK0HEyMS6I5XmyOvqQ48SRLq0gy1vu0ZxXfxzI6FaiErJTNddAr5Db6YE/zKc
 Ou0k7qp5hhbDYx2tDpZrlftpMdvO4Fet//JVgSQGltSFMslOycgX7uq+Djn2eVbGiVwTwp
 bmKj2RNJGc7f6cyWHF/+55q/3D7mrYFhj0/ssr8tE6dy5ZyaAL3dFBoGQ09T1fvivOCGgq
 2g5L4blsEux1WsTFKq3wLcpsWwYx6BhNO+kJ7zHkadXAAUH8fABDKtR3I9Y5oA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AH4J2xnU
Subject: Re: [Buildroot] stm32mp1 kernel won't boot on custom board
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 28 Jan 2023 14:52:12 -0600
Ra C <rcrichlow9000@gmail.com> wrote:

> I have a custom stm32mp157a board which runs OK with a modified 5.4 kernel.
> I want to migrate to the latest stm supported kernel.
> I built a stm32mp157a_dk1 target using the BR2_EXTERNAL feature described
> here: https://github.com/bootlin/buildroot-external-st which builds a 5.15
> kernel.
> 
> Using the same dtb , the 5.15 kernel fails to mount the root device (a

What do you mean by "using the same DTB" ?

Make sure to use the DTB that matches the kernel version you're using.
Even though DTBs are in theory kernel-version independent, there are
quite frequently some subtle changes that causes a DTB written for
kernel version X to not work with kernel version Y.

Also, make sure to pass "rootwait" in your kernel command line, to tell
the kernel to wait for the root device to appear. As SD/MMC devices are
detected asynchronously, sometimes they are detected too late compared
to the point where the kernel attempts to mount the rootfs.

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
