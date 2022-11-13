Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76889C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 086E360BAB;
	Sun, 13 Nov 2022 14:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 086E360BAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bM6FfD42emxO; Sun, 13 Nov 2022 14:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A1BF60881;
	Sun, 13 Nov 2022 14:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A1BF60881
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4ADB71BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26AF140575
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26AF140575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rv-71qjAH851 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:33:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722414020B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 722414020B
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:33:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6DF001C0004;
 Sun, 13 Nov 2022 14:33:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouE2l-005MYr-JI; Sun, 13 Nov 2022 15:33:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Woody Douglass via buildroot <buildroot@buildroot.org>
References: <94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotics.com>
Date: Sun, 13 Nov 2022 15:33:07 +0100
In-Reply-To: <94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotics.com>
 (Woody Douglass via buildroot's message of "Fri, 7 Oct 2022 16:27:32
 +0000")
Message-ID: <871qq6rkkc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] Force cmake packages to use makefiles
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
Cc: Woody Douglass <wdouglass@carnegierobotics.com>,
 "s.martin49@gmail.com" <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Woody" == Woody Douglass via buildroot <buildroot@buildroot.org> writes:

 > Force cmake packages to use the "Unix Makefiles" generator
 > in case CMAKE_GENERATOR is set in the host environment. This
 > patch further isolates the buildroot build environment from
 > the host.

 > Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
