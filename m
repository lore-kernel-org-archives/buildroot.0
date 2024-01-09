Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1CAC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2158741955;
	Tue,  9 Jan 2024 13:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2158741955
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIDMXMBNutvw; Tue,  9 Jan 2024 13:37:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF27418BB;
	Tue,  9 Jan 2024 13:37:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FF27418BB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A8E91BF2F4
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20637418BB
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20637418BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VOKgWuaFqjY8 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:37:22 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43208417E3
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43208417E3
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC2221BF208;
 Tue,  9 Jan 2024 13:37:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rNCI9-007UgU-35;
 Tue, 09 Jan 2024 14:37:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-2-adam.duskett@amarulasolutions.com>
 <871qaqbrfq.fsf@48ers.dk> <875y02r5ow.fsf@tarshish>
Date: Tue, 09 Jan 2024 14:37:17 +0100
In-Reply-To: <875y02r5ow.fsf@tarshish> (Baruch Siach's message of "Tue, 09 Jan
 2024 15:33:40 +0200")
Message-ID: <87cyuaaar6.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/6] package/google-breakpad: disable uclibc
 support
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Pascal Huerst <pascal.huerst@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Tue, Jan 09 2024, Peter Korsgaard wrote:
 >>>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:
 >> 
 >> > The google-breakpad package uses stab.h which is not included in uClibc.
 >> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 >> 
 >> Committed to 2023.02.x and 2023.11.x, thanks.

 > Not in 2023.02.x as of commit 34fee4fb35e04 ("package/php: bump version
 > to 8.2.14").

Thanks for the heads up, fixed now. I originally wanted to verify when
the breakage was introduced, but we don't seem to have any pre-2022
autobuilder results any more.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
