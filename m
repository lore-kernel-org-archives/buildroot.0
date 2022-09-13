Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE50C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 17:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62F778149C;
	Tue, 13 Sep 2022 17:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62F778149C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKyyO-i383lV; Tue, 13 Sep 2022 17:31:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69C27813F9;
	Tue, 13 Sep 2022 17:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69C27813F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4F01BF853
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 17:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08BB9600C4
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 17:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BB9600C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ofmR4WgAuvIF for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 17:31:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDE1C600B8
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDE1C600B8
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 17:31:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A018A40002;
 Tue, 13 Sep 2022 17:31:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oY9lE-003SCc-F8; Tue, 13 Sep 2022 19:31:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20220913145541.3567799-1-thomas.devoogdt@barco.com>
Date: Tue, 13 Sep 2022 19:31:48 +0200
In-Reply-To: <20220913145541.3567799-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Tue, 13 Sep 2022 16:55:41 +0200")
Message-ID: <87mtb3rxiz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gdk-pixbuf: fix test compilation
 (don't build the test suite)
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Not needed + breaks compilation on some platforms.
 > Patch is part of 2.42.9, so can be dropped with the next minor/major bump.
 > https://github.com/GNOME/gdk-pixbuf/commit/801eef111df624f4377baed9a90c94b6a2d4340c

What tree is this against? We are already using 2.42.9 (since the merge
of next to master after the 2022.08 release).

Patches should be against current master.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
