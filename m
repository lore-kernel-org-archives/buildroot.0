Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AD3C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9668082A56;
	Sun, 25 Sep 2022 08:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9668082A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XcTJ50jBvNqB; Sun, 25 Sep 2022 08:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCDB8146B;
	Sun, 25 Sep 2022 08:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFCDB8146B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 834ED1BF4DD
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F4F3400BB
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F4F3400BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8Om98yd9iWa for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:30:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D094400A8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D094400A8
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:30:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EF5D2FF80D;
 Sun, 25 Sep 2022 08:30:19 +0000 (UTC)
Date: Sun, 25 Sep 2022 10:30:19 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220925103019.1febbac3@windsurf>
In-Reply-To: <20220925072502.GU1419013@scaer>
References: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
 <20220925072502.GU1419013@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664094621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nf1knjcc+UNSKkNmhbmoON4JSMSkg+1StivmAbBdYQ0=;
 b=CW4czHYuPMjLYqMxOCDeodaCgkVd382ezgkytzJWSg+CNxiUmIX7gCV5/p0n1TMOY6nbZ7
 7f5kchNRSG4D0GTfO5V2vDYqZqymPw3iYLbWHO2k9e/zFNSx4eFz0zeGJ3yUwD7hLz1CJ0
 x48kcKz4yPf8kddYeCcPtOv5ULBgVzhv8zgqoh2lqQoey3wIyORQR+pzx+jdiQk3M/no9l
 6XvPbC9oT69S2DZfMYm6tsd3oZh99OW5eLD3XAclZvo6cXIO3kjEZyzm+IdbajHh8rCAi8
 PtFYFYk8HiiYE6fTrGM9rWJJ+zJxJGTvpFXrA3jmx9HjdTqux3jgKCzQ50uHeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CW4czHYu
Subject: Re: [Buildroot] [PATCH 1/4] arch/Config.in.xtensa: adjust
 endianness logic to avoid bogus configurations
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 25 Sep 2022 09:25:02 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> >  (1) Showing the overlay file option only when building an internal
> >      toolchain. For external toolchain configurations, it does not
> >      make sense to show it as it will have no effect.  
> 
> This should be a separate patch.

ACK.

> >  (2) Showing the endianness choice either for internal toolchain
> >      configurations with non-empty BR2_XTENSA_OVERLAY_FILE, or for
> >      external toolchain configurations.  
> 
> As an empty BR2_XTENSA_OVERLAY_FILE is not accepted anymore (see below),

See my patch 2/4. Not accepting an empty BR2_XTENSA_OVERLAY_FILE is
totally wrong, as it breaks the build with external toolchains.
External toolchains can target a custom Xtensa core, but specifying a
overlay file with an external toolchain does not make any sense.

My patch 2/4 therefore reverts 4cbf7336914f, which is wrong.

> this can be simplified to "sharing the endianness chice for internal and
> external toolchains".
> 
> >  (2) Defaulting to BE when BR2_XTENSA_OVERLAY_FILE is empty.  
> 
> An empty BR2_XTENSA_OVERLAY_FILE is now no longer accepted, after commit
> 4cbf7336914f (arch/xtensa: custom configuration requires an overlay).

Right, but this commit is incorrect, and needs to be reverted.

> > Fixes:
> >   http://autobuild.buildroot.net/results/702e2886156f291466375dfcf412c20f1aa5857d/  
> 
> This commit if from August the 15th; I could not find any such failure
> since 4cbf7336914f was applied; the last occured 2022-09-08, on commit
> d2141f65e449, which is the parent of 4cbf7336914f (there are build
> failures on older branches, of course, but not on master).

See above: 4cbf7336914f is incorrect. It breaks for example the test
case for the Bootlin Xtensa LX60 external toolchain. An empty overlay
file is perfectly valid for a custom Xtensa core, when using an
external toolchain.

And I am precisely doing the revert *after* this patch 1/4 so that the
series is bisectable. I.e introduce the correct fix, and then remove
the incorrect fix.

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
