Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838A0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:12:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 288D560FDA
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 12:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 288D560FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E25514037E;
	Mon, 25 Oct 2021 12:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HIZO6o_2h87; Mon, 25 Oct 2021 12:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15D194037A;
	Mon, 25 Oct 2021 12:12:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A49961BF375
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F2D4403DF
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 12:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FUHy9oXQnLRh for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 12:12:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54DA3403D9
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:12:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 5EA6320007;
 Mon, 25 Oct 2021 12:12:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1meypy-000193-PD; Mon, 25 Oct 2021 14:12:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Arnout Vandecappelle \(Essensium\/Mind\)" <arnout@mind.be>
References: <20211018195822.2263226-1-arnout@mind.be>
 <20211018195822.2263226-2-arnout@mind.be>
Date: Mon, 25 Oct 2021 14:12:22 +0200
In-Reply-To: <20211018195822.2263226-2-arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 18 Oct 2021 21:58:22 +0200")
Message-ID: <87fsspwbfd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] treewide: fix flake8 error E741
 ambiguous variable name
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > A recent update of flake8 in CI introduced a new check E741. It
 > basically checks that variables are at least 3 characters long. Up to
 > now, however, we have used shorter names in some places - all of them
 > turn out to be "l" for a line of text.

 > Replace all those "l" variables with "line".

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1687009829

NIT: This is not about requiring >= 3 char variables, it is specifically
about the variables I, O and l as they may look very similar to the
numbers 0/1, depending on the font:

https://www.flake8rules.com/rules/E741.html

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
