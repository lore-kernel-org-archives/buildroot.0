Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCB0ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 22:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48E6081454;
	Tue, 30 Aug 2022 22:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48E6081454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zljO5ndtRR9e; Tue, 30 Aug 2022 22:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73617813CD;
	Tue, 30 Aug 2022 22:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73617813CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F2131BF372
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A4A9813CD
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A4A9813CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sz9XxGyxMpPZ for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 22:34:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE91E81392
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE91E81392
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 22:34:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 75BD5FF802;
 Tue, 30 Aug 2022 22:34:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oT9oj-0003cx-FI; Wed, 31 Aug 2022 00:34:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220727210911.BC56F86743@busybox.osuosl.org>
Date: Wed, 31 Aug 2022 00:34:45 +0200
In-Reply-To: <20220727210911.BC56F86743@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 27 Jul 2022 23:12:41 +0200")
Message-ID: <87edwxmkca.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] support/scripts/pkg-stats: add better
 checking in check_package_get_latest_version_by_guess()
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=f1e3b2bb01903faf7595ed3151140bbf767681e0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The 'rtl8723ds' name, when queried from release-monitoring.org at
 > https://release-monitoring.org/api/projects/?pattern=rtl8723ds returns
 > one project, with one "stable_versions" array, which is empty. This
 > was not expected by the pkg-stats code, causing an exception:

 > Task exception was never retrieved
 > future: <Task finished name='Task-764' coro=<check_package_latest_version_get() done, defined at /home/thomas/projets/buildroot/./support/scripts/pkg-stats:558> exception=IndexError('list index out of range')>
 > Traceback (most recent call last):
 >   File "/home/thomas/projets/buildroot/./support/scripts/pkg-stats", line 566, in check_package_latest_version_get
 >     if await check_package_get_latest_version_by_guess(session, pkg):
 >   File "/home/thomas/projets/buildroot/./support/scripts/pkg-stats", line 544, in check_package_get_latest_version_by_guess
 >     projects[0]['stable_versions'][0],
 > IndexError: list index out of range

 > This commit therefore improves the checks done on the results received
 > from release-monitoring.org to avoid this issue.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
