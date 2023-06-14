Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14488EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 11:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B253C833CE;
	Wed, 14 Jun 2023 11:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B253C833CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DxUua3zn8cDz; Wed, 14 Jun 2023 11:41:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAD618348C;
	Wed, 14 Jun 2023 11:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAD618348C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2E651BF2CA
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C5A3405B1
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 11:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C5A3405B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BT2WzcoWYt4n for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 11:40:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6246F4158A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6246F4158A
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 11:40:52 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 862AEE000A;
 Wed, 14 Jun 2023 11:40:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Oro-005p83-S3; Wed, 14 Jun 2023 13:40:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230528190111.2430580-1-romain.naour@gmail.com>
 <20230528190111.2430580-5-romain.naour@gmail.com>
Date: Wed, 14 Jun 2023 13:40:48 +0200
In-Reply-To: <20230528190111.2430580-5-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 28 May 2023 21:01:11 +0200")
Message-ID: <878rcms24f.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 5/5] package/ipython: add missing
 dependencies
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

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported [1], the test TestIPythonPy3 fail since it was updated
 > to 8.6.0 release just after 2022.11.

 >   ModuleNotFoundError: No module named 'stack_data'

 > Indeed there is no such python3-stack-data in Buildroot.
 > For example, Fedora packaging added python3-stack-data while updating
 > to ipython 8.0.1.

 > With python-stack-data added, the test TestIPythonPy3 still fail
 > with:

 >   ModuleNotFoundError: No module named 'sqlite3'

 > Since ipython 8 sqlite3 fallback imports has been removed [2].

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819089

 > [1] http://lists.busybox.net/pipermail/buildroot/2023-May/668086.html
 > [2] https://github.com/ipython/ipython/commit/7a0bdabecfa745b60c3a711e1da2df378687e746

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
