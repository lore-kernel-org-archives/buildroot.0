Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6811C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 20:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5449140579;
	Sat,  6 Aug 2022 20:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5449140579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2mJbUZRW3Wh; Sat,  6 Aug 2022 20:00:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E80D340578;
	Sat,  6 Aug 2022 19:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E80D340578
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 790D11BF267
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 19:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 545D560F39
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 19:59:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 545D560F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8eEwoLA-bHl for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 19:59:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCD8860BB9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCD8860BB9
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 19:59:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A2F271BF203;
 Sat,  6 Aug 2022 19:59:51 +0000 (UTC)
Date: Sat, 6 Aug 2022 21:59:49 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220806215949.69ba40cf@windsurf>
In-Reply-To: <20220730121103.GR3168@scaer>
References: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
 <20220727184850.2857314-3-thomas.petazzoni@bootlin.com>
 <20220730121103.GR3168@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659815993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=egJxVAQvVVuJ9hY3r2Qup/O/O8HQYGHeYn3aJbF1TJw=;
 b=P+GpfMzCVH7WTXWaHwZ/bYmalMqVAmBs1B6bYzQPfghaF+gO8EdP1n2aX0tbd2y561XwNZ
 MwvUnS5ep17/eV+KkQN33Enj0eSgT3lWYAvHdcwTKM9bwW21xW+rsvcljyZiSrclRChUoC
 RnGR3R0f2icinZdeMCpjL09z+CZRc0krAcV9kiNUzgsYS/ZB4N1NS4pSk3WDcSNlT0WEiF
 Ivkd4B4v7OEq7Oib55lim0rMKUaQzHEOQYKXX9dLv9YY6P7Ru/qLdWR0ELsOwvAyg/wEDL
 9bz2SIEf8E5aOW6cgH2Mr8ZllIKTk2aQUEYqZIP7+PSy62MO6p0kbBn+UIeSFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P+GpfMzC
Subject: Re: [Buildroot] [PATCH 3/3] toolchain/toolchain-wrapper: don't
 hardcode CCACHE_BASEDIR
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Howdy,

On Sat, 30 Jul 2022 14:11:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> And once this is fixed, you'll notice that the old and the new
> CCACHE_BASEDIR will be different:
> 
>     (before)$ BR2_DEBUG_WRAPPER=2 ./host/bin/arm-linux-gcc --help
>     ...
>     Toolchain wrapper executing:
>         CCACHE_BASEDIR='/home/ymorin/dev/buildroot/O/master'
>         '/home/ymorin/dev/buildroot/O/master/host/opt/ext-toolchain/bin/arm-linux-gcc.br_real'
>         ...
> 
>     (after)$ BR2_DEBUG_WRAPPER=2 ./host/bin/arm-linux-gcc --help
>     ...
>     Toolchain wrapper executing:
>         CCACHE_BASEDIR='/home/ymorin/dev/buildroot/O/master/host'
>         '/home/ymorin/dev/buildroot/O/master/host/opt/ext-toolchain/bin/arm-linux-gcc.br_real'
>         ...
> 
> So as you can see, before, CCACHE_BASEDIR was pointing to BASE_DIR, but
> now it points to HOST_DIR. This is one-level too deep, as it will not
> match the path where packages are actually built, which is
> BASE_DIR/build, and hapenned to be CCACHE_BASEDIR/build.
> 
> Even though I had the debug code path fixed, the second issue was not
> trivial enough for me to fix when applying, so I amrked the patch as
> changes requested.

You're totally right. And in fact, it makes the change useless. Indeed,
CCACHE_BASEDIR only makes sense when ccache is used during the
Buildroot build, because it points to $(BASE_DIR)... which once we are
outside of Buildroot, in the SDK, would no longer point to anything
sensible.

So instead, I've sent a different patch that sets the
CCACHE_COMPILERCHECK and CCACHE_BASEDIR environment variables, only if
ccache support is used (BR2_USE_CCACHE=1). Let me know what you think.

Thanks again for the good review!

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
