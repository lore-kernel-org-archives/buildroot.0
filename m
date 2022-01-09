Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18545C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C524400A8;
	Sun,  9 Jan 2022 16:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDm5hHarl20Q; Sun,  9 Jan 2022 16:26:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9869A40471;
	Sun,  9 Jan 2022 16:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8A491BF48B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4E9981A9C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1sMEpGAsoAX for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:26:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 792078148E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:26:19 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 33BF760002;
 Sun,  9 Jan 2022 16:26:17 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6b1M-00022i-Jx; Sun, 09 Jan 2022 17:26:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20211222140737.1179968-1-fontaine.fabrice@gmail.com>
Date: Sun, 09 Jan 2022 17:26:16 +0100
In-Reply-To: <20211222140737.1179968-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 22 Dec 2021 15:07:37 +0100")
Message-ID: <87sftwan9z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: force host-python3
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build of nodejs fails if python 3.10 is installed on host.
 > As suggested by Arnout in
 > https://bugs.buildroot.org/show_bug.cgi?id=14451, use the same
 > workaround than in qt5webkit to force host-python3 (which is in version
 > 3.9)

 > It should be noted that python 3.10 support has been added in version
 > 14.18.2: https://github.com/nodejs/node/releases/tag/v14.18.2

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=14451

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

14.18.2 has in the mean time been applied, but the build should indeed
use our host-python3 - So committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
