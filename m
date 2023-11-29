Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CA6C07CB1
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 21:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFDD615C8;
	Wed, 29 Nov 2023 21:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BFDD615C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anDvoYTGa_8J; Wed, 29 Nov 2023 21:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFDCD615C5;
	Wed, 29 Nov 2023 21:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFDCD615C5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0301BF377
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7C654095B
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 21:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7C654095B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRShPZyYr8CY for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 21:38:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BF2A4055E
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 21:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BF2A4055E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 866B020002;
 Wed, 29 Nov 2023 21:38:09 +0000 (UTC)
Date: Wed, 29 Nov 2023 22:38:08 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20231129223808.19195702@windsurf>
In-Reply-To: <1c744e50-01e2-4e78-94b1-62b6ebfd992d@benettiengineering.com>
References: <20231123173957.2385041-1-giulio.benetti@benettiengineering.com>
 <20231124225923.59d08949@windsurf>
 <1c744e50-01e2-4e78-94b1-62b6ebfd992d@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1701293889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDaIznhde8WnjDrm/KrD4zOWc+cMeyNN0d15kuFeOxg=;
 b=HxcCi0e/+W9aUJdJbfAc8+HuxM3AY1Zip4H6vlnAet6e12oFYu+qtR/UjX7Dwef0deO5El
 8hz4C1IVMlrV63zvHUmtXSSsJlWkLFOZMUsVUIuKg3xK4tseR41Ut90XNaW6go679nNSEl
 X6kYvSNlkS4+VfYJoQ/tAXIOMbUIluo80LMw0AD8HA4RsMHF1kdsr0Cr9J3+b+8+BQQQGp
 36O68cK+WTHm2ia0UeWu4fKLlX45Rce8OPet0unascpp1mokJmQcJG6OX/Wz/RhiRSFmfz
 nuIYvz3FHNjxJ5u1LWCsMfnYRnzwhoAyirSTijjZafIyNkAYdieI4IN8CmwAcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HxcCi0e/
Subject: Re: [Buildroot] [PATCH] package/swupdate: workaround runtime update
 failure
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Jim Reinhart <jimr@tekvox.com>,
 Matthew Maron <matthewm@tekvox.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Sat, 25 Nov 2023 01:24:45 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Is there a compiler bug? Or a bug in
> > the swupdate code base, such as some undefined behavior that causes an
> > incorrect behavior when built -Os, but not -O3 ?  
> 
> An undefined behavior showing up when built with -Os, but I'm currently
> trying to work it out and also to give a test case to SWUpdate
> Maintainer using qemu-arm.
> 
> So I think it's better I get to the root cause, I fix it and later
> provide a local patch to fix the problem.

Sounds good, thanks for the effort.

> I've already set the patch as Rejected on Patchwork, sorry for the
> noise.

No worries at all!

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
