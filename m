Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39248C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 20:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AECDF410B1;
	Sun, 27 Nov 2022 20:22:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AECDF410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p4ITg4YRpqBT; Sun, 27 Nov 2022 20:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE24410B0;
	Sun, 27 Nov 2022 20:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAE24410B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFF4A1BF39F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BC2D817A7
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC2D817A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEB0EMGyqQuO for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 20:22:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D9E7817C0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D9E7817C0
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 20:22:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E113B100007;
 Sun, 27 Nov 2022 20:22:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ozOA8-000odo-CW; Sun, 27 Nov 2022 21:22:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <6cff8-6370db80-5-75c4db80@248833567>
 <6b6fbfea-d87e-3230-b471-235d91c60f7f@mind.be>
Date: Sun, 27 Nov 2022 21:22:04 +0100
In-Reply-To: <6b6fbfea-d87e-3230-b471-235d91c60f7f@mind.be> (Arnout
 Vandecappelle's message of "Thu, 24 Nov 2022 13:36:41 +0100")
Message-ID: <877czgdu6r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/swupdate: add libubootenv as
 dependency
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
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 13/11/2022 12:56, Michael Nosthoff via buildroot wrote:
 >> Hi Thomas,
 >> On Saturday, November 12, 2022 21:32 CET, Thomas Petazzoni
 >> <thomas.petazzoni@bootlin.com> wrote:
 >> 
 >>> Hello Michael,
 >>> 
 >>> On Thu, 10 Nov 2022 11:23:12 +0100
 >>> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
 >>> 
 >>>> when using BR2_PER_PACKAGE_DIRECTORIES and configuring swupdate to
 >>>> use uboot the build fails because libubootenv is not a dependency.
 >>>> 
 >>>> Fixes:
 >>>> bootloader/uboot.c:23:10: fatal error: libuboot.h: No such file or directory
 >>>> 23 | #include <libuboot.h>
 >>>> 
 >>>> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

 >  I rewrote the commit message completely, taking into account the
 >  discussion below, and applied to master, thanks.

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
