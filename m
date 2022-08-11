Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868E2C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E87960F5C;
	Thu, 11 Aug 2022 20:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E87960F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdi2akHKcYkN; Thu, 11 Aug 2022 20:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12A3B60E40;
	Thu, 11 Aug 2022 20:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12A3B60E40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5107C1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C88F4013B
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C88F4013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id og0ivQvoHoLB for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:24:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A52E4400E2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A52E4400E2
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:24:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 75E7A2000B;
 Thu, 11 Aug 2022 20:24:03 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:24:01 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20220811222401.0163576a@windsurf>
In-Reply-To: <20220811095221.1226557-1-buildroot@heine.tech>
References: <20220811095221.1226557-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660249443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EwPbWsaKmAwJyffdLTwquSc3NbXbvx9iVsNNshwpHYM=;
 b=Bfo6isW2WiUBuieOol+mF9XtIKF4H0uZ3MgFB0NilbVobITATL6JUjLtj8Pizxjrt5PyfR
 fAesbbNWb28+gymd7HZhWW+/csrFnkhSCR2Jbprp2t+o5fF5z9LSHrjamLvr1YuqR//dqt
 dmuvUYSWsILWJkwliFRwBlcSRJiGEozOedsJFTQmrGLsSmJ2avr0+1KsbnDKesr5QncN4C
 4ygNoXYdLZk5fIpVWXccW9A22wkiEnupqVlz9O3AJ9jpV+J2Uge9FuOl43diQIDs7PFwuf
 Tg5f3W6QA4U2swsRqMxkzd1qgUyPMFXMZ/BCZz0eOMuXo6ey4rdaiBhgLwlcrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Bfo6isW2
Subject: Re: [Buildroot] [PATCH] package/boost: bump to version 1.80.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Thu, 11 Aug 2022 11:52:22 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> - drop upstreamed patches
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

How many reverse dependencies of boost did you build with this new
version? Major Boost versions tend to break stuff :-/

Also, are there new Boost modules/libs that would require new options
in package/boost/Config.in? By default, Boost enables all its
modules/libs by default, so if we don't handle them explicitly, to be
able to add them to the BOOST_WITHOUT_FLAGS variable of boost.mk, those
new modules/libs will be enabled by default. Apparently
https://www.boost.org/users/history/version_1_80_0.html, seems to say
"No new libraries.".

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
