Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D67DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 313E841815;
	Mon,  6 Jun 2022 10:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5c7Qm-mgPC-L; Mon,  6 Jun 2022 10:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13E5D417E6;
	Mon,  6 Jun 2022 10:27:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E873D1BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D73A160EA8
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4l_605arazis for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:27:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F248B60E2E
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:27:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04EEB200002;
 Mon,  6 Jun 2022 10:27:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ny9xI-00Clsr-Nq; Mon, 06 Jun 2022 12:27:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
References: <20220205222331.3432353-1-arnout@mind.be>
Date: Mon, 06 Jun 2022 12:27:28 +0200
In-Reply-To: <20220205222331.3432353-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 5 Feb 2022 23:23:31 +0100")
Message-ID: <87pmjmxf1r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/manuali/makeusers-syntax.txt: add
 caveat for upgrading
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

 > With the change of the range of UIDs that is generated from the
 > automatic ID (-1), it became apparent that there is a potential problem
 > with these automatic IDs when upgrading: they may have changed, which
 > means that persistent files that exist outside of the rootfs suddenly
 > have a different owner.

 > Add a caveat section to the manual, as well as an explanation of how to
 > work around the problem.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
