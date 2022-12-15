Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66737C4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 15:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D749B61035;
	Thu, 15 Dec 2022 15:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D749B61035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0V3dSIsd0x7; Thu, 15 Dec 2022 15:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B88F6102D;
	Thu, 15 Dec 2022 15:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B88F6102D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09D281BF3C8
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 15:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D895C40257
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 15:29:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D895C40257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gy0hAiyRVlu8 for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 15:29:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A457401F2
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A457401F2
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 15:29:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F1EF100005;
 Thu, 15 Dec 2022 15:29:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p5qBC-001Er4-WF; Thu, 15 Dec 2022 16:29:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <20220917215300.1330070-1-james.hilliard1@gmail.com>
 <cca657ee-bbf2-2fcc-8e09-e7d7f6733694@theobroma-systems.com>
 <878rj9u79k.fsf@dell.be.48ers.dk>
 <450d76a0-6324-5ec5-e3ba-e9f615555810@theobroma-systems.com>
Date: Thu, 15 Dec 2022 16:29:50 +0100
In-Reply-To: <450d76a0-6324-5ec5-e3ba-e9f615555810@theobroma-systems.com>
 (Quentin Schulz's message of "Thu, 15 Dec 2022 14:20:40 +0100")
Message-ID: <87zgbor8gh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wayland: bump to version 1.21.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <quentin.schulz@theobroma-systems.com> writes:

Hi,

 > It cleanly applies after
 > https://gitlab.freedesktop.org/wayland/wayland/-/commit/03e8a1f84b6a15c9531db1ca8d0a25f9fcffaf25 
 > is applied too. So that could be an option too yes.

OK, good. Then I would prefer that for 2022.02.x.


 > There doesn't seem to be an exploit PoC available somewhere (as is
 > often the case) and I wouldn't even have a machine at hand with that
 > much RAM/swap to test this properly if there was one.

It indeed doesn't sound like a very relatistic vulnerability for a
Buildroot system. I guess you flagged it just because it comes up by the
CVE scan rather than any real concerns about the vulnerability?


 > As for the reverse dependencies, I was planning on doing a simple test
 > with weston (which is the only compositor we use) but that is of the 
 > same version in 2022.02.x that it is in master so that won't tell us much.

 > Are you concerned about something specifically? Is there something
 > you'd want me to check?

No, nothing specific - We just don't have any runtime tests for wayland,
so it is handy if you have a working setup where you can do a quick
smoke test.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
