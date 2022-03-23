Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023CEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98C6340CBA;
	Wed, 23 Mar 2022 21:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mJcDiytpqaqg; Wed, 23 Mar 2022 21:02:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B6D14051A;
	Wed, 23 Mar 2022 21:02:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58B671BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55DD2849B3
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skxAXk5FUU16 for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:02:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E770A84987
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:02:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 66BABFF803;
 Wed, 23 Mar 2022 21:02:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nX882-009pbf-Au; Wed, 23 Mar 2022 22:02:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kamel Bouhara via buildroot <buildroot@buildroot.org>
References: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
 <20220310095602.2435745-2-kamel.bouhara@bootlin.com>
Date: Wed, 23 Mar 2022 22:02:50 +0100
In-Reply-To: <20220310095602.2435745-2-kamel.bouhara@bootlin.com> (Kamel
 Bouhara via buildroot's message of "Thu, 10 Mar 2022 10:55:59 +0100")
Message-ID: <878rt0fklh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/4] package/odb: backport more upstream
 commits to fix build with gcc 11.x
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kamel" == Kamel Bouhara via buildroot <buildroot@buildroot.org> writes:

 > From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Commit ac9855e761443dee4f9d461b83e12443d37e8678 ("package/odb: fix
 > build with gcc 11") already fixed some gcc 11.x issues, but not all of
 > them. This commit backports two upstream patches fixing the remaining
 > issues, ensuring host-odb can be built on a gcc 11.x machine.

 > Fixes:

 >   http://autobuild.buildroot.net/results/d37c4271e66d923f7af6a4e3dbad603fcd1c8119/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 > ---
 > Note: the above autobuilder issue has stopped appearing after
 > September 29, 2021, which initially sounded odd. However, on October
 > 3, we started rejecting build results from Xogium's autobuilder (for
 > other reasons), and all those issues were coming from Xogium's
 > autobuilder. And this is pretty logical: Xogium's autobuilder was
 > known to be running a very recent Arch Linux, and therefore was the
 > only autobuild machine running gcc 11.x as the host compiler.

Committed to 2021.02.x, 2021.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
