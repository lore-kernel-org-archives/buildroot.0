Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE276C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 08:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DEDB40273;
	Mon, 24 Jan 2022 08:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvYRrh06Yl1s; Mon, 24 Jan 2022 08:44:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 401644015C;
	Mon, 24 Jan 2022 08:44:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 879161BF2AA
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84325817F2
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 08:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZnGv3-_9Qfw for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 08:44:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E43B9817ED
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 08:44:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 905E460BA2;
 Mon, 24 Jan 2022 08:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC2CC340E1;
 Mon, 24 Jan 2022 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643013846;
 bh=6SzDmxGUP9buL2rJcd1l+dEr6zhNHujOXM9Taer58sk=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=uZpbE1MXUlW3CYD2a+app+7pwUEJlN3X3L1Cofb7IU7/wCmnbIRuFilbohwvnS+Yv
 gu2/fiF9jXY5mvrnVgtg7JN1+sYESgDGOgrWPozHuK+kBxmE+tkcR8ZoXvW2ms/gag
 59sM667x218s9S6VDimor56D6xIrN3fhN/MPPdjepJG8SPFi9xZx/U1JXaYN1MnCyd
 S3oEhJLrAF4Xyz2CPZoVvFZJHW/vcb2ZC7RBeGWgdSemwXowUDFKWGSJwfpeGYUj40
 8KvRo9AJkhaPORWwX0SuJiMagyJn2be9524dwGR0e2KnrpmtXFzA7JDHuzdTGmbSEA
 EWueCW/3AbmaA==
MIME-Version: 1.0
In-Reply-To: <2d19c071-3859-25db-0966-2fd8ca3d845f@benettiengineering.com>
References: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
 <20220119222332.66485-1-giulio.benetti@benettiengineering.com>
 <20220119233944.7ba2d09f@windsurf> <20220120084804.429f1d54@bootlin.com>
 <164267096542.4497.13116457792635384701@kwain>
 <2d19c071-3859-25db-0966-2fd8ca3d845f@benettiengineering.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <164301384246.4708.15294151281235312059@kwain>
Date: Mon, 24 Jan 2022 09:44:02 +0100
Subject: Re: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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

Quoting Giulio Benetti (2022-01-23 23:21:50)
> 
> Re-reading this after some day it looks to me like the simple
> BR2_PACKAGE_REFPOLICY_ENABLEAUDIT is correct. Because it "Removes all 
> dontaudit rules from policy.conf", so it's true that it enables audit 
> logs in the end. It's a very specific options and the one who will use 
> it will know what he will enable and most of all we can specify in the 
> help section that:
> "Removes all dontaudit rules from policy.conf"

> Does it work for you?

As long as the help text is clear enough for the user, either config
option name should be acceptable. Using the above is good to have an 1:1
mapping with the target name, at the expense of having the help text not
matching it and an unclear option name from the user perspective (it's a
bit weird not to enable it, at first). For _WITH_DONTAUDIT_, the
opposite is true. I'd say there is no perfect solution, we can either
stay close to the refpolicy internals or have the Buildroot specifics
more consistent; not sure which is better.

Thanks,
Antoine
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
