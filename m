Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893AFECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 09:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 229B660E19;
	Tue, 20 Sep 2022 09:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 229B660E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bc_FusymDECL; Tue, 20 Sep 2022 09:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D0C86072A;
	Tue, 20 Sep 2022 09:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D0C86072A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6206B1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 09:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3546F4057A
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 09:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3546F4057A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auz31GmviMSq for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 09:55:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC2134013F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC2134013F
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 09:55:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B532240003;
 Tue, 20 Sep 2022 09:55:00 +0000 (UTC)
Date: Tue, 20 Sep 2022 11:54:59 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: <yann.morin@orange.com>
Message-ID: <20220920115459.2aca37f7@windsurf>
In-Reply-To: <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
 <20330_1663659985_63296FD1_20330_21_1_20220920074624.GC3551@tl-lnx-nyma7486>
 <20220920103524.41ad225a@windsurf>
 <30931_1663665105_632983D1_30931_112_8_20220920091143.GD3551@tl-lnx-nyma7486>
 <20220920111919.784ffa7e@windsurf>
 <29653_1663666853_63298AA5_29653_380_1_20220920094051.GE3551@tl-lnx-nyma7486>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663667700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ui0EO9akNGWqZXH2HlTOt9VAj+GHxdwYztCXBTvo1Y=;
 b=Kp827nKK/qwZnrS8GCDI08Ycuy+8ITIJu8fpajsWUJ47cjBu7PbE5p9HULWq2ZTLKfAwz0
 KmM2/5EaaVfuIVip14OwwBo+OwgepXbomjnVkT6YC9Su2qZBH1y3asjfx4CycN0ikH8Z84
 Q3WPN/W1YkVNKanipWiU7+fNGEja8XZcTgpDRpAnUEEdnjugTc0zsZBqBrnE9/MO9Gcay3
 3yHg8AL2XU6AUomcnjxDC3ENoMbd16ngQDliyiFcBzorKwTpnNfMoV7logZVdi7DzgpmG5
 QXsH6mfKo4drbdutmP0tZuv9BG85DgIl4RHbmPVvLd76/LKL2hmUpRYO/UVaMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Kp827nKK
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 20 Sep 2022 11:40:51 +0200
<yann.morin@orange.com> wrote:

> That's because in your script, 'file' reads in DB for every file, while
> the above only loads the DB for each set of a lot of files at once.

Ah, yes, indeed.

Another possibility is to not use "file" and just look at the first 4
bytes of the files to identify ELF files, because that's really what
matters.

> What is the policy on requiring a pyhon interpreter on the host for
> mandatory Buildroot infra? In my experience, doing things in python
> rather than in shell, does indeed speed up things quite substantially.

We have indeed dropped python on the host as a requirement for the
build some time ago. Probably doesn't make sense to reintroduce this
requirement "just" for this. Even though practically speaking, a lot of
the tooling around Buildroot (pkg-stats, graphs, etc.) already relies
on Python, and most people are very likely to have Python installed
anyway.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
