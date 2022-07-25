Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B222C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 08:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E68CB408AF;
	Mon, 25 Jul 2022 08:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E68CB408AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qsXBlyJSK3uw; Mon, 25 Jul 2022 08:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCCB0405A6;
	Mon, 25 Jul 2022 08:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCCB0405A6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0D201BF2F6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9620E61016
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:58:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9620E61016
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTWdHlxQWLaQ for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 08:58:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 501DB60BD1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 501DB60BD1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:58:49 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BB1F61C0007;
 Mon, 25 Jul 2022 08:58:45 +0000 (UTC)
Date: Mon, 25 Jul 2022 10:58:44 +0200
To: Matt Weber <matthew.weber@rockwellcollins.com>
Message-ID: <20220725105844.08c153eb@windsurf>
In-Reply-To: <20210412164733.17098-1-matthew.weber@rockwellcollins.com>
References: <20210412164733.17098-1-matthew.weber@rockwellcollins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658739526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VuBmsbADEAqCDmghRPDhHgzZKr8j1aghyAJl1QomfA=;
 b=kwofkWm2I6ko53vp3udrdg/swQAE7kXEff7yZCE19A+Iq95A6/GLld+dbGSKTDwE6S9836
 u81E9fnmRsOZ/1+DdS8Y5yOKPYcweskdT/U7vO0fTjKa2BsKBQkfomQZnn6mFQQblyWeMO
 UGTjQfhL40Ri2yZu8Pq1h87oBGsa4QMzEdPaIw+nGTaxFdUsFJOKGkDm+QQ8B0S6r5EQkd
 CDqZeCsFQGA2jT+zF0iP3u4rr6qRNBGAkOALINDdyt1mCbMXxqmey+NiJlGh1lYT0FHyfi
 ITGEDcwPRS03NLVeBf/dFgeT6jQmHPvKOtzoYHqkoY3zdk9dcBth4rqPWxmKiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kwofkWm2
Subject: Re: [Buildroot] [PATCH v2] package/haveged: set
 write_wakeup_threshold to 2048
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
Cc: "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Matt,

On Mon, 12 Apr 2021 11:47:33 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Adjust the low water mark to wake-up the haveged daemon at the
> same time that rngd would wake-up when a hardware RNG is present.
> 
> This supports the theory that rngd then can't dominate the entropy
> pool. Instead haveged and rngd would complete to fill the pool.
> https://tails.boum.org/contribute/design/random/#index5h2

If I read this link correctly, it doesn't really say anything about
"aligning" the low water mark between haveged and rngd.

While not being random number experts, Arnout and I took advantage of
being in the same room today to have some (random?) discussion about
this patch. Our reasoning is that it is actually desirable to have a
lower low water mark for haveged than rngd.

If you have rngd and a hardware random number generator, using in
priority the hardware random number generator over haveged seems like a
good idea: it provides better random numbers, at less CPU cost. So it's
only if the hardware RNG is too slow that you may want haveged to be
involved and contribute to refilling the entropy pool. But if the
hardware RNG is fast enough compared to the "consumption" of random
numbers by the system, we don't really see why haveged should be
involved. It produces random numbers that are less "good", at at higher
CPU cost.

So overall the default of a low water mark of 2048 for rngd and 1024
for haveged seems to implement exactly what is desirable.

So for now I've marked the patch as Rejected. However should you have
other arguments to back your theory, we would be interested to hear
them and we can always revisit that decision.

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
