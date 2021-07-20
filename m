Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD08C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:33:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911AA60FD7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911AA60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E504013B;
	Tue, 20 Jul 2021 21:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01xWD4aXkOHZ; Tue, 20 Jul 2021 21:33:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E4B84014B;
	Tue, 20 Jul 2021 21:33:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC9961BF313
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB8D8828F8
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5ZFMpPsqu0c for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:33:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81B9A828B3
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:33:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 09A7D240002;
 Tue, 20 Jul 2021 21:33:35 +0000 (UTC)
Date: Tue, 20 Jul 2021 23:33:34 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210720233334.2143daf9@windsurf>
In-Reply-To: <900065c9-8832-df20-35ac-ea69cbfe72e4@benettiengineering.com>
References: <20210612173513.2253959-1-giulio.benetti@benettiengineering.com>
 <20210720224443.24edcd0f@windsurf>
 <900065c9-8832-df20-35ac-ea69cbfe72e4@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.67
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720213334.VA9kjOCm4yrj2ZAAC5s5EKi6ZjrkhFG3LCSEIjxvlJQ@z>

On Tue, 20 Jul 2021 23:09:05 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Sure I can. Here there is a "problem" if we can call it that way. It's 
> from some month that they release very very fast. Now they are at NSS 
> 3.68 and NSPR 4.32 [1], but very soon there will be version 3.69. Even 
> if I send version bumps, they will release another version before you 
> apply for sure. Let's see if it gets slower.
> They also stopped emitting the Release Notes that doesn't help[2].
> 
> What can I do? Do I send the latest I see in the moment I bump and 
> that's it, right?

Correct. Whenever you see a new version, send a new patch series which
is based on the latest master, and mark your previous patches in
patchwork as "Superseded".

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
