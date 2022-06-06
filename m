Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE91C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 09:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C603409A6;
	Mon,  6 Jun 2022 09:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZEiykgWh74o; Mon,  6 Jun 2022 09:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46929409A1;
	Mon,  6 Jun 2022 09:48:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E889C1BF3C6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7B99840CD
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 09:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WwtSbtRMlMAQ for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 09:48:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC8CE84081
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 09:48:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8A33140002;
 Mon,  6 Jun 2022 09:48:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ny9LO-00CkZo-9T; Mon, 06 Jun 2022 11:48:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220605150807.1668716-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Jun 2022 11:48:18 +0200
In-Reply-To: <20220605150807.1668716-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 Jun 2022 17:08:07 +0200")
Message-ID: <87fskiyvfh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: zone modules need
 libatomic_ops
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > ngx_{http,stream}_upstream_zone_module need libatomic_ops since their
 > addition in commit 621ec32677082d901806338e6f50f03349dceb76 and
 > https://github.com/nginx/nginx/commit/cf31347ee84fdaa02f768e641d1a2f1352b6a56a
 > https://github.com/nginx/nginx/commit/79a03b3ff6d950e60a06c6d979bd7a909709e82d:

 > src/core/ngx_rwlock.c:125:2: error: #error ngx_atomic_cmp_set() is not defined!
 >   125 | #error ngx_atomic_cmp_set() is not defined!
 >       |  ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f7f6be00029d430dc575bc5b3e3e2031cea0460c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
