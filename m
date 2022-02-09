Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF01C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5E8415B0;
	Wed,  9 Feb 2022 21:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tc4vUSJt12Mm; Wed,  9 Feb 2022 21:57:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F0441621;
	Wed,  9 Feb 2022 21:57:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6397F1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 514D640567
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FR05NCsdi5ij for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:56:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0A554013B
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:56:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CEAF1C0004;
 Wed,  9 Feb 2022 21:56:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nHuxF-0004nO-2t; Wed, 09 Feb 2022 22:56:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220209165213.4498-1-peter@korsgaard.com>
 <20220209165213.4498-103-peter@korsgaard.com>
 <20220209213635.GG2249818@scaer>
Date: Wed, 09 Feb 2022 22:56:49 +0100
In-Reply-To: <20220209213635.GG2249818@scaer> (Yann E. MORIN's message of
 "Wed, 9 Feb 2022 22:36:35 +0100")
Message-ID: <874k57ya8u.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 102/107] package/python-configobj: drop
 python2 specific package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2022-02-09 17:52 +0100, Peter Korsgaard spake thusly:
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 > [--SNIP--]
 >> diff --git a/DEVELOPERS b/DEVELOPERS
 >> index 9c1411648e..8112873f14 100644
 >> --- a/DEVELOPERS
 >> +++ b/DEVELOPERS
 >> @@ -2796,7 +2796,6 @@ F:	package/ne10/
 >> F:	package/pkg-python.mk
 >> F:	package/pkg-autotools.mk
 >> F:	package/pkg-generic.mk
 >> -F:	package/python/

 > Not sure how you managed to have this hunk in this patch, but given the
 > tediousness of this series, I am not going to ask you to fix and respin,
 > so, as I replied to patch 84, I cherry-picked this hunk in to that
 > previous patch, and so dropped it here.

Ups, thanks for fixing it. I originally had the python host package
after these (but somehow forgot to amend the DEVELOPERS change), which is why it
ended up here.

 > Applied to master, thanks.

Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
