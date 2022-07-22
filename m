Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DD7C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 05:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0538D846E7;
	Fri, 22 Jul 2022 05:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0538D846E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NbzTMV4odNQ; Fri, 22 Jul 2022 05:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C691F846B2;
	Fri, 22 Jul 2022 05:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C691F846B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0664A1C11A5
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 05:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4CED846B2
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 05:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4CED846B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-sgaLqwEDMk for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 05:51:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B07584661
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B07584661
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 05:51:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3ADF2240002;
 Fri, 22 Jul 2022 05:51:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oElZ3-002z7o-50; Fri, 22 Jul 2022 07:51:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: John Keeping <john@metanate.com>
References: <YtgsCjq5XQU1x1kX@donbot>
Date: Fri, 22 Jul 2022 07:51:05 +0200
In-Reply-To: <YtgsCjq5XQU1x1kX@donbot> (John Keeping's message of "Wed, 20 Jul
 2022 17:23:38 +0100")
Message-ID: <87a6911yra.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] package/fscryptctl: how to update with breaking
 changes?
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

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > Hi,
 > fscryptctl is currently pointing to a commit SHA from 2017 and there is
 > now a v1.0.0 tag from 2021 (with the only subsequent changes being
 > documentation & test related).

 > However, updating isn't straightforward as Buildroot's current version
 > only supports v1 encryption policies but upstream has introduced v2
 > policies and then deprecated and removed support for v1 policies before
 > the v1.0.0 release [1].

 > What is the best way to handle this in Buildroot?

 > Do we need to provide a choice to keep support for v1 policies if anyone
 > needs them?  Or do we just update and pull in the breaking change?

I think we should just update. There likely aren't a lot of v1 users and
the format has some known vulnerabilities.

Please send a patch doing so, thanks.

 > (There are no package changes needs to update to v1.0.0, it's just a
 > case of changing the version and hash.)

 > [1] https://github.com/google/fscryptctl/commit/d2066cded914860164ffacebc24ea0afc0b57963



 > Thanks,
 > John

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
