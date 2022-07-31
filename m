Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63953C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 07:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE48F4056E;
	Sun, 31 Jul 2022 07:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE48F4056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cb9A76HkBa59; Sun, 31 Jul 2022 07:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8C2E403EA;
	Sun, 31 Jul 2022 07:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8C2E403EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C9CF1BF599
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 07:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D28E403EA
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 07:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D28E403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3bHlWdDTMDKI for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 07:28:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55035400C8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55035400C8
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 07:28:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 835581C0004;
 Sun, 31 Jul 2022 07:28:40 +0000 (UTC)
Date: Sun, 31 Jul 2022 09:28:38 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220731092838.534104d3@windsurf>
In-Reply-To: <3a838cf0-9121-4069-60d4-2601b16a801c@benettiengineering.com>
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-2-x-shi@ti.com>
 <3a838cf0-9121-4069-60d4-2601b16a801c@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659252521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtLjCtTTPHYTdXFhEak67eMfREAqRiyJTSCYUFVbpoc=;
 b=dnx1xr1auMFkLiEPo0iTUfgSnA0zpa82w+BQmSVrI1MCqVakfbHt4hfzZUkhr15Zis2Rn2
 al7gaJNEZGnj+DArIICgUK+6MTw1JfXtZmh122MJJ9snBU+QFH8rrZJ+O4fiodsGwZyRyu
 c3XtRdTrUB4tGggCb7xCg3jvylekwLlQZVCJDpRjOjLlrEiM55RC9yTkRAjuYzi45rKwzX
 6RkRDI7BdjlmUR7ioqR+RLwPKLFFCoum2GMtzmwTJ3xIBQZSB+qXIM7i694Daikso8743C
 iKpX6SY2YHWw2rgcPN8XmUXUMzzvSDBgHPbJwSfJXbCyXNGxWwNZs7isXtVQZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dnx1xr1a
Subject: Re: [Buildroot] [PATCH v2 1/4] package/arm-gnu-toolchain: revert to
 version 10
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
Cc: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <x-shi@ti.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 31 Jul 2022 02:28:49 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> have you tried any possible work-around for this ^^^ bug?
> At the moment I don't see any other build failure using
> gcc-arm-11.2-2022.02-x86_64-arm-none-eabi, probably because every
> package that is built with it doesn't have float type in the code(I
> presume).

The arm-gnu-toolchain package is not widely used. It's only a few
specific ARM Trusted Firmware configurations that use it for the
moment, therefore this package is never exercised in the autobuilders,
and only by a few defconfigs.

> Does the gcc bug show up while building ti-k3-image-gen or ti-k3-r5-loader?
> 
> I'd prefer to find a work-around if possible rather than downgrading
> host-arm-gnu-toolchain, also because this would impact another package
> that depends on it:
> arm-trusted-firmware
> 
> Please let me know, maybe I can help finding a work-around for that
> float ICE.

It's not an ICE. What happens is that this gcc toolchain has been
compiled for a too recent x86-64 CPU core (the host binary of gcc).
Therefore if you use this toolchain on a slightly too old x86-64
machine, it will break.

Reverting to 10.x is fine here: Linaro (who produces the toolchain) has
acknowledged the problem, and will generate an updated 11.x toolchain
at some point in the future.

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
