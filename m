Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B48DC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD6860A85;
	Fri,  7 Jan 2022 21:36:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBHigafq9jsE; Fri,  7 Jan 2022 21:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FD6960A99;
	Fri,  7 Jan 2022 21:36:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32E691BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20C7C80AB9
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wwwUPnadls_V for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:36:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0119E80A99
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:36:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id CAFE4240005;
 Fri,  7 Jan 2022 21:36:25 +0000 (UTC)
Date: Fri, 7 Jan 2022 22:36:24 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20220107223624.3ba7d348@windsurf>
In-Reply-To: <20210107135307.1762186-2-maxime.chevallier@bootlin.com>
References: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
 <20210107135307.1762186-2-maxime.chevallier@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/refpolicy: Add patches pending
 the next release
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
Cc: Antoine Tenart <atenart@kernel.org>, Adam Duskett <aduskett@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Maxime,

On Thu,  7 Jan 2021 14:53:05 +0100
Maxime Chevallier <maxime.chevallier@bootlin.com> wrote:

> In order to be able to run a basic system in enforcing mode, we need to
> apply a few patches on top of RELEASE_2_20200818.
> 
> This allows us to fix a few pending issues, most notably with systemd v246.
> 
> Patch 0001 is a squash of a few patches written by Antoine Tenart that
> are already in the refpolicy master branch.
> 
> Patches 2, 3 and 4 are also in the master branch, and are needed by
> subsequen patches so that systemd-tmpfiles and agetty can make use of
> nsswitch.
> 
> Patches 5 and 6 are part of a pull-request that haven't been merged yet,
> that addresses the issues with agetty and systemd-tmpfiles :
> https://github.com/SELinuxProject/refpolicy/pull/330
> 
> Patch 7 fixes the current issue with systemd v246 that is related to
> sytemd-udevd now being a symlink to udevadm.
> 
> The fix for that has been submitted on the refpolicy mailing-list, with
> the review process ongoing :
> https://lore.kernel.org/selinux-refpolicy/2b5b0f1e-2576-23f4-4ab4-26f8fcfb2c30@ieee.org/T/#t
> 
> Finally, Patch 8 addresses issues for which there's no clear strategy
> yet for upstreaming in the refpolicy.

So now, all of the patches except patch 8 are in upstream refpolicy,
which is good.

However, this patch 8 is really not good, it doesn't document anything
about why those fixes are needed. I think it would be acceptable to
have out of tree refpolicy patches, but they should be just a mixed bag
of fixes all in a single patch that just says "Buildroot fixes".

We need that patch 8 to be split up into multiple patches, each with a
proper explanation of what it is fixing. Perhaps this would also help
with the upstreaming.

So I'm afraid we can't merge this patch series as it is, just because
patch 8 isn't properly explained/detailed.

Maxime: do you have that patch 8 broken down into smaller pieces with
reasonable explanation about each piece?

I really would like to see this being finalized.

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
