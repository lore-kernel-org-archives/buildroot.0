Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B756BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 16:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F3BD40368;
	Fri,  3 Dec 2021 16:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGyXbja_Otkb; Fri,  3 Dec 2021 16:42:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BD5240367;
	Fri,  3 Dec 2021 16:42:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6E201BF589
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D629440190
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 16:42:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSME6ES7n6G9 for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 16:42:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50D964010E
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 16:42:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 486211C000D
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 16:42:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mtBe7-0006IL-CC
 for buildroot@buildroot.org; Fri, 03 Dec 2021 17:42:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20211202170146.20676-1-peter@korsgaard.com>
Date: Fri, 03 Dec 2021 17:42:51 +0100
In-Reply-To: <20211202170146.20676-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 2 Dec 2021 18:01:45 +0100")
Message-ID: <877dcld4hg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] Makefile: release: use .tar.xz instead of
 .tar.bz2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > xz compresses better than bzip2, and is (getting) more popular, so build
 > release tarballs as .tar.xz (in addition to .tar.gz) instead of .tar.bz2,
 > similar to how the kernel did ~8 years ago:

 > https://www.kernel.org/happy-new-year-and-good-bye-bzip2.html

 > -rw-r--r-- 1 peko peko 5,1M Dec  2 17:55 buildroot-2021.11-rc3.tar.xz
 > -rw-r--r-- 1 peko peko 5,7M Nov 30 18:15 buildroot-2021.11-rc3.tar.bz2
 > -rw-r--r-- 1 peko peko 6,8M Nov 30 18:15 buildroot-2021.11-rc3.tar.gz

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
