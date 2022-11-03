Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84D0C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F26C417D1;
	Thu,  3 Nov 2022 13:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F26C417D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URjDbfn8HLP7; Thu,  3 Nov 2022 13:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325EF41634;
	Thu,  3 Nov 2022 13:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 325EF41634
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B25B11BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BB1040297
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB1040297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMuKDLqtjP2J for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:46:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EB64404A1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EB64404A1
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:46:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 369B9E0005;
 Thu,  3 Nov 2022 13:46:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oqaYR-00AWpV-65; Thu, 03 Nov 2022 14:46:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <27279_1663677903_6329B5CF_27279_384_1_a0ff8f4ff44501c533f2779965524fc93294a825.1663677504.git.yann.morin@orange.com>
Date: Thu, 03 Nov 2022 14:46:47 +0100
In-Reply-To: <27279_1663677903_6329B5CF_27279_384_1_a0ff8f4ff44501c533f2779965524fc93294a825.1663677504.git.yann.morin@orange.com>
 (yann morin's message of "Tue, 20 Sep 2022 14:45:00 +0200")
Message-ID: <87y1ssp2uw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/gpsd: drop legacy cleanup
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Since gpsd-3.22, the systemd service files no longer contain hard-coded
 > paths to /usr/local/, but use @SBINDIR@ which is replaced appropriately
 > at build time, and contains the correct path.

 > Drop the legacy fixup now.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
