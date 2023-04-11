Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8776AC77B6F
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 13:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E93841D8A;
	Tue, 11 Apr 2023 13:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E93841D8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yMwsnlubfD7f; Tue, 11 Apr 2023 13:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F371541BB6;
	Tue, 11 Apr 2023 13:27:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F371541BB6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89BFC1BF4E6
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 13:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62284415D3
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 13:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62284415D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iakqBMQl8L0q for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 13:26:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A577408A8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A577408A8
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 13:26:55 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EA4FEC0007;
 Tue, 11 Apr 2023 13:26:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pmE1K-0068im-Tq; Tue, 11 Apr 2023 15:26:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: David Laight <David.Laight@ACULAB.COM>
References: <20230407141930.694756-1-ovlevin@sberdevices.ru>
 <3eff15aa-5790-604e-d6de-90ed5d2d3eb7@mind.be>
 <877cuisixk.fsf@dell.be.48ers.dk>
 <f45690e2-1ed1-5019-3bc9-da0704785a3c@mind.be>
 <87y1myr2ht.fsf@dell.be.48ers.dk>
 <0b89aff09c044bdfb2644d1111b1ccb5@AcuMS.aculab.com>
Date: Tue, 11 Apr 2023 15:26:50 +0200
In-Reply-To: <0b89aff09c044bdfb2644d1111b1ccb5@AcuMS.aculab.com> (David
 Laight's message of "Tue, 11 Apr 2023 13:14:08 +0000")
Message-ID: <87ttxmr1lx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
Cc: "olegartys@gmail.com" <olegartys@gmail.com>,
 Oleg Lyovin <ovlevin@sberdevices.ru>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "sdfw_system_team@sberdevices.ru" <sdfw_system_team@sberdevices.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "David" == David Laight <David.Laight@ACULAB.COM> writes:

 > From: Peter Korsgaard
 >> Sent: 11 April 2023 14:08
 > ...
 >> 
 >> Sure, I would just be a step towards requiring make 4.0 (which is also
 >> 10 years old by now:
 >> https://lists.gnu.org/archive/html/make-w32/2013-10/msg00021.html), but
 >> true - We can also just consider going straight from 3.81 to 4.0.

 > I had to revert a Centos 7 from 3.82 to 3.81 (stolen from Ubuntu 13.04)
 > to fix an bug where make gets confused between dependency types.
 > (Someone else was hitting it.)

 > There are a variety of reasons why we build on Centos 7,
 > mostly because other software (not buildroot/busybox) still
 > has to run on it and it is useful to use a common build system.

OK, but (as I'm sure you are painfully aware of), supporting such old
systems gets harder and harder over time. Would building in a chroot or
container be an option?

According to
https://endoflife.software/operating-systems/linux/red-hat-enterprise-linux-rhel,
RHEL7 will be EOL in ~1 year from now (June 30th, 2024), so perhaps it
makes sense to only move to require make 4.0 in for 2024.02.x.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
