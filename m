Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EB8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A76D61130
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A76D61130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5D93407D0;
	Wed,  6 Oct 2021 16:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtCWYpGhVEXR; Wed,  6 Oct 2021 16:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DDF0404AF;
	Wed,  6 Oct 2021 16:44:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10C7E1BF309
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00F664053E
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:44:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RinwOXJRgRaR for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:44:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC689404A8
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:43:59 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 745E324000F;
 Wed,  6 Oct 2021 16:43:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mYA1L-0006AW-D1; Wed, 06 Oct 2021 18:43:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Asaf Kahlon <asafka7@gmail.com>
References: <20210928064400.573159-1-asafka7@gmail.com>
 <20210928064400.573159-3-asafka7@gmail.com>
 <87o8825gyq.fsf@dell.be.48ers.dk>
 <CALFsTFVRxx+eWKxK9oXVrq6kyOjW+-EGuK5At3bNhw6LjbiHtQ@mail.gmail.com>
Date: Wed, 06 Oct 2021 18:43:55 +0200
In-Reply-To: <CALFsTFVRxx+eWKxK9oXVrq6kyOjW+-EGuK5At3bNhw6LjbiHtQ@mail.gmail.com>
 (Asaf Kahlon's message of "Wed, 6 Oct 2021 18:51:45 +0300")
Message-ID: <87zgrm2jec.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-meld3: bump to version
 2.0.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:

 > Hello,
 > On Wed, Oct 6, 2021 at 6:08 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Asaf" == Asaf Kahlon <asafka7@gmail.com> writes:
 >> 
 >> > Plus, indent with two spaces in the hash file.
 >> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 >> 
 >> Looking at the 2.0.1 release, it seems to be unmaintained:
 >> 
 >> https://github.com/Supervisor/meld3/commit/ed4e7b30eeae9e03170f388f5c6fc31aac21bf7d
 >> 
 >> How about bumping the supervisor package and dropping meld3?

 > Actually, according to supervisor's documentation, our supervisor
 > version doesn't depend on python-meld3 so can just remove it even
 > without a bump.

Yes, I also just noticed that it isn't used since supervisor 4.1.0.

 > I'll send a patch.

Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
