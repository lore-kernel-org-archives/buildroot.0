Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9D2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 10:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD2B042364;
	Sat, 11 Dec 2021 10:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjTRbQKa-svu; Sat, 11 Dec 2021 10:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9F7940126;
	Sat, 11 Dec 2021 10:12:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7BA1BF46A
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3961E428B2
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mngdCEw07mav for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 10:12:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6504428B1
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:12:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 995BBFF811;
 Sat, 11 Dec 2021 10:12:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mvzMV-0008Ci-Q9; Sat, 11 Dec 2021 11:12:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20211128131842.274555-1-texier.pj2@gmail.com>
 <87tuftfw70.fsf@dell.be.48ers.dk>
Date: Sat, 11 Dec 2021 11:12:15 +0100
In-Reply-To: <87tuftfw70.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 30 Nov 2021 17:24:35 +0100")
Message-ID: <87wnkb30xs.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/genimage: bump to version 15
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Pierre-Jean" == Pierre-Jean Texier <texier.pj2@gmail.com> writes:
 >> This includes the following changes:

 > [snip]

 > Not exactly the most useful summary to read, but OK. Diff'ing the
 > readme, I notice:

 >> 1d72d80 image-hd: stricter option handling

 > Which introduces a partition-table-type = none/mbr/gpt/hybrid and
 > deprecates partition-table, which is used by:

 > board/altera/socrates_cyclone5/genimage.cfg

 > Care to send a followup patch to update that? Given

 >> 5bd7283 image-hd.c: ignore in-partition-table when the image has no partition table

 > You can presumably drop the explicit in-partition-table from that file
 > as well.

It looks like it isn't just about deprecation warnings. The new
genimage now really errors out on some of the configuration files, E.G.:

https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935239

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
