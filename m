Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230EBCE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 13:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD16F814BB;
	Mon, 25 Sep 2023 13:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD16F814BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTJV-Fi7LqMr; Mon, 25 Sep 2023 13:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40764812C5;
	Mon, 25 Sep 2023 13:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40764812C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FB9F1BF5B4
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 761A661021
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 13:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761A661021
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ddCqpk5NsYl for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 13:57:23 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A838D60FF7
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 13:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A838D60FF7
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98F3BC0008;
 Mon, 25 Sep 2023 13:57:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkm5L-002cFP-0a; Mon, 25 Sep 2023 15:57:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230918194519.68987-1-ju.o@free.fr>
 <337d9023-7587-ef8f-3e61-f7bd16f333ff@mind.be>
Date: Mon, 25 Sep 2023 15:57:14 +0200
In-Reply-To: <337d9023-7587-ef8f-3e61-f7bd16f333ff@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Thu, 21 Sep 2023 20:51:40
 +0200")
Message-ID: <87zg1abbk5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/tcl: fix package patch
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > On 18/09/2023 21:45, Julien Olivain wrote:
 >> The commit 4e365d1768 "package/tcl: bump to version 8.6.13" did NOT
 >> refreshed the package patch, because the patch was still applying
 >> correctly and the package was working as expected.
 >> It was refreshed in the previous bump, in commit 9cf314745a
 >> "package/tcl: bump to version 8.6.12".

 >  I've added here that this commit was part of 2022.02, to make it
 >  easier for Peter to know that it should be backported.

 >  It was my original mistake to commit that incorrect change, so I've
 >  committed the fix as well :-)

 >  Applied to master, thanks.

So this presumably means it needs to be backported even though it
apparently worked (or built at least) without / with the dummy patch?

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
