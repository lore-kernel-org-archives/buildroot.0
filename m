Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04342C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 18:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7447882730;
	Thu,  9 Jun 2022 18:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FeB2WebMtjOp; Thu,  9 Jun 2022 18:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8320F823CB;
	Thu,  9 Jun 2022 18:53:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 574EA1BF9B6
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 18:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52CFE4097A
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 18:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UY0o0v3w_P9r for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 18:53:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A89CA4091F
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 18:53:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36241200004;
 Thu,  9 Jun 2022 18:53:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzNHZ-002HEN-R6; Thu, 09 Jun 2022 20:53:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220605150807.1668716-1-fontaine.fabrice@gmail.com>
Date: Thu, 09 Jun 2022 20:53:25 +0200
In-Reply-To: <20220605150807.1668716-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 Jun 2022 17:08:07 +0200")
Message-ID: <87ilp91xei.fsf@dell.be.48ers.dk>
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

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
