Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FAAC38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F40981E2E;
	Sat, 28 Jan 2023 22:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F40981E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnaOfmftKkDd; Sat, 28 Jan 2023 22:11:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6701881B10;
	Sat, 28 Jan 2023 22:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6701881B10
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B34101BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BB2A81B10
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB2A81B10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJuPQ-sYvbT5 for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:11:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3934881A4E
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3934881A4E
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:11:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 00BD6240004;
 Sat, 28 Jan 2023 22:11:27 +0000 (UTC)
Date: Sat, 28 Jan 2023 23:11:27 +0100
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20230128231127.5ea3c370@windsurf>
In-Reply-To: <20230117074742.5295-1-yegorslists@googlemail.com>
References: <20230117074742.5295-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674943888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHsMcfZYt154Hnc21ee2nLtfQ9JojL3+WRJooR6/Bbk=;
 b=GSo02FvQkUukqptFYy4Ki6jiFcSwnS8exHStUBem6a+fXgHUOEA8fA2s8kzUvbei1e0Ho9
 BfotReBTsQvfMHQflgAkvEGz4Rr+GDgGtaPETVpTGWDsJBXwl+R9Kn3LGfXQeu+XyB+YSt
 XEkWjiXioNXdFxIk2TonYy1zqFpCUkiyBTWFX8xTljcLZzuda78qndpJSahLzHhK/eNO/e
 P7jYfuuS8Wmb4w0k8jOg72Y7GGkJ0JSLI5HPk68CxwllpDTlgHArJYRnap3/TDcGnSIXqM
 KmBpUuT+aV9qSuKQmZB0i/29o2TviEZatlS5FcfuGxVUwsW41s2IBSBGioQ4/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GSo02FvQ
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: add an option to
 enable irqtop
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 17 Jan 2023 08:47:42 +0100
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> irqtop is an IRQ monitoring tool.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
> 	- add the missing NCURSES dependency

Applied to master, thanks.

Yann: I read your (very valid) concern about the fact that this patch
is changing the behavior of current configurations (irqtop used to be
built unconditionally if all its prerequisites are met, now it is only
built if BR2_PACKAGE_UTIL_LINUX_IRQTOP=y). However, I think the
breakage is very easy to fix, and we need to find the good balance
between backward compatibility and minimal configuration/footprint by
default. In this case, I believe the best trade-off was to make this
new option default to disabled. Note that I realize this is really an
opinion, and there's no perfect solution here.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
