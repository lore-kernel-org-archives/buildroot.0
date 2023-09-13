Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE744EE020B
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 20:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 311C482BC3;
	Wed, 13 Sep 2023 20:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 311C482BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Hb9xDEGb-E5; Wed, 13 Sep 2023 20:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EE4981F4C;
	Wed, 13 Sep 2023 20:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EE4981F4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44E891BF5F5
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E2D740C96
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 20:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E2D740C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WsPxAINN7yf for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 20:26:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A01D0405E1
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 20:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A01D0405E1
Received: by mail.gandi.net (Postfix) with ESMTPSA id 674E4E0003;
 Wed, 13 Sep 2023 20:26:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgWRl-007kdr-GX; Wed, 13 Sep 2023 22:26:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230828224312.2430429-1-thomas.petazzoni@bootlin.com>
Date: Wed, 13 Sep 2023 22:26:49 +0200
In-Reply-To: <20230828224312.2430429-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Tue, 29 Aug 2023 00:43:11
 +0200")
Message-ID: <87jzstzunq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] boot/grub2: backport fixes for numerous CVEs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Grub 2.06 is affected by a number of CVEs, which have been fixed in
 > the master branch of Grub, but are not yet part of any release (there
 > is a 2.12-rc1 release, but nothing else between 2.06 and 2.12-rc1).

 > So this patch backports the relevant fixes for CVE-2022-28736,
 > CVE-2022-28735, CVE-2021-3695, CVE-2021-3696, CVE-2021-3697,
 > CVE-2022-28733, CVE-2022-28734, CVE-2022-2601 and CVE-2022-3775.

 > It should be noted that CVE-2021-3695, CVE-2021-3696, CVE-2021-3697
 > are not reported as affecting Grub by our CVE matching logic because
 > the NVD database uses an incorrect CPE ID in those CVEs: it uses
 > "grub" as the product instead of "grub2" like all other CVEs for
 > grub. This issue has been reported to the NVD maintainers.

 > This requires backporting a lot of patches, but jumping from 2.06 to
 > 2.12-rc1 implies getting 592 commits, which is quite a lot.

 > All Grub test cases are working fine:

 >   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/984500585
 >   https://gitlab.com/tpetazzoni/buildroot/-/pipelines/984500679

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
