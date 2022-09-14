Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2F8ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98708825BF;
	Wed, 14 Sep 2022 22:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98708825BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-ns_atgQmcc; Wed, 14 Sep 2022 22:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3C1781D7D;
	Wed, 14 Sep 2022 22:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3C1781D7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2071BF38C
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE5E440C9B
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE5E440C9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUTL02VUUmGl for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:22:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB2040BA7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB2040BA7
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:22:29 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EAF9240002;
 Wed, 14 Sep 2022 22:22:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oYam3-007rLm-12; Thu, 15 Sep 2022 00:22:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220808205427.B62D5868D2@busybox.osuosl.org>
Date: Thu, 15 Sep 2022 00:22:26 +0200
In-Reply-To: <20220808205427.B62D5868D2@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Mon, 8 Aug 2022 23:08:12 +0200")
Message-ID: <87bkrhoau5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/xfsprogs: fix build for
 architectures without MAP_SYNC
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=8acfedf922325a0fb7d7d6e7a1287eab6fae386a
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Back port a patch from upstream that will be in the next xfsprogs release:

 > https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?h=for-next&id=28965957f4ea5c79fc0b91b997168c656a4426c5

 > required a tiny bit of massaging to apply cleanly to xfsprogs-5.14.2.

 > Fixes: http://autobuild.buildroot.net/results/407131b767fc8241e8f5f5001c0b5d4e2c488dea

 > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
