Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A39C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 20:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6D61610F9;
	Thu,  1 Dec 2022 20:50:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6D61610F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bzYzlZW1Ss7b; Thu,  1 Dec 2022 20:50:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03A0C610F7;
	Thu,  1 Dec 2022 20:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A0C610F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E77AB1BF83C
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C348E40B76
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C348E40B76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRjN7Rn_vFA6 for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 20:50:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8B0940112
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8B0940112
 for <buildroot@uclibc.org>; Thu,  1 Dec 2022 20:50:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A6A91C0008;
 Thu,  1 Dec 2022 20:50:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p0qW1-006v4X-LD; Thu, 01 Dec 2022 21:50:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20221130010306.3797360-1-james.hilliard1__5877.50912397809$1669770216$gmane$org@gmail.com>
 <pan$285bc$eec3bcd9$887d35c$efa80bd5@ID-313208.user.individual.net>
Date: Thu, 01 Dec 2022 21:50:41 +0100
In-Reply-To: <pan$285bc$eec3bcd9$887d35c$efa80bd5@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Wed, 30 Nov 2022 07:24:42 +0100")
Message-ID: <87mt86c0gu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: fix Formatting of
 non-void pointers is disallowed
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Tue, 29 Nov 2022 18:03:06 -0700 schrieb James Hilliard:
 >> Backport a patch from upstream.
 >> 
 >> Fixes:
 >> /home/buildroot/buildroot/output/per-package/kodi/host/x86_64-buildroot-
 > linux-gnu/sysroot/usr/include/fmt/core.h:1751:17:
 >> error: static assertion failed: Formatting of non-void pointers is
 >> disallowed.
 >> 1751 |   static_assert(formattable_pointer,
 >> |                 ^~~~~~~~~~~~~~~~~~~
 >> 
 >> Signed-off-by: James Hilliard
 >> <james.hilliard1@gmail.com>

 > Hi James,

 > this is a duplicate of http://patchwork.ozlabs.org/project/buildroot/
 > patch/20221002144629.2105385-2-bernd.kuhls@t-online.de/

Applied Bernd's patch and marked this as superseeded, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
