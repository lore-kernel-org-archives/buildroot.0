Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383E2C433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 14:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D298C41846;
	Fri, 14 Oct 2022 14:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D298C41846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VpyYRbV2bl9U; Fri, 14 Oct 2022 14:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D304F41571;
	Fri, 14 Oct 2022 14:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D304F41571
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACC1F1BF2F9
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86A6841571
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:11:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86A6841571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y4d9f7bu4gSy for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 14:11:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57967410DF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57967410DF
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 14:11:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8CE8B40008;
 Fri, 14 Oct 2022 14:11:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ojLPY-00G5QJ-O7; Fri, 14 Oct 2022 16:11:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Chris Packham <judge.packham@gmail.com>
References: <20221002004931.1805825-1-judge.packham@gmail.com>
Date: Fri, 14 Oct 2022 16:11:40 +0200
In-Reply-To: <20221002004931.1805825-1-judge.packham@gmail.com> (Chris
 Packham's message of "Sun, 2 Oct 2022 13:49:30 +1300")
Message-ID: <875ygmlckj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/micropython: Bug fix release
 1.19.1
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

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > This is a bug fix release.  The changes are:
 > - extmod/machine_i2c: only use WRITE1 option if transfer supports it

 >   This fixes the machine.SoftI2C.readfrom_mem() method on esp32, so it
 >   writes the address to read from.

 > Signed-off-by: Chris Packham <judge.packham@gmail.com>

Committed, thanks.

Does this mean that it also needs to be backported to 2022.08.x? If this
is an esp32-only issue then presumably not?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
