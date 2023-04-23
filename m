Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD89C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 400B640AB1;
	Sun, 23 Apr 2023 10:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 400B640AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwV-LYVySTVU; Sun, 23 Apr 2023 10:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72AB24059F;
	Sun, 23 Apr 2023 10:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72AB24059F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D475F1C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A827B4059F
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A827B4059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qB2BF1zDNdZa for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:40:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B14400A4
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94B14400A4
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:40:36 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 998B9240005;
 Sun, 23 Apr 2023 10:40:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pqX8y-002bBP-MX; Sun, 23 Apr 2023 12:40:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Florian Fainelli <f.fainelli@gmail.com>
References: <20220927221133.594071-1-f.fainelli@gmail.com>
Date: Sun, 23 Apr 2023 12:40:32 +0200
In-Reply-To: <20220927221133.594071-1-f.fainelli@gmail.com> (Florian
 Fainelli's message of "Tue, 27 Sep 2022 15:11:33 -0700")
Message-ID: <878rei6fvj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Exclude checking PE
 binaries from perf test
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

>>>>> "Florian" == Florian Fainelli <f.fainelli@gmail.com> writes:

 > Since upstream Linux commit ed21d6d7c48e6e96c2d617e304a7ebfbd17b1807
 > ("perf tests: Add test for PE binary format support") present in >=
 > v5.10 there is an unconditional installation of PE binaries which will
 > be rejected by the check-bin-arch script.

 > Make sure that these binaries are excluded from being checked to allow
 > the installation of the perf tests.

 > Fixes: 6fcdaa4c5096 ("package/linux-tools: Allow installation of perf scripts")
 > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
