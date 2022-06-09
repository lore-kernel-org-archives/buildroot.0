Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACCFCCA473
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 11:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F464610DC;
	Thu,  9 Jun 2022 11:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYqx4J6D4ath; Thu,  9 Jun 2022 11:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D10260B72;
	Thu,  9 Jun 2022 11:24:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3491BF3A9
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 11:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A6BF610D9
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 11:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTlcyVt2o-MB for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 11:24:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 493B360B10
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 11:24:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0DD8B40011;
 Thu,  9 Jun 2022 11:24:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nzGHI-001yan-5l; Thu, 09 Jun 2022 13:24:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joel Stanley <joel@jms.id.au>
References: <20220606075149.1548504-1-joel@jms.id.au>
Date: Thu, 09 Jun 2022 13:24:40 +0200
In-Reply-To: <20220606075149.1548504-1-joel@jms.id.au> (Joel Stanley's message
 of "Mon, 6 Jun 2022 17:21:49 +0930")
Message-ID: <87zgim13lz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/diffutils: Fix build on ppc32 with
 musl
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

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 >  sigsegv.c: In function 'sigsegv_handler':
 >  sigsegv.c:225:75: error: 'mcontext_t' has no member named 'uc_regs';
 >  did you mean 'gregs'?

 >   ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]

 > Musl defines pt_regs differently to glibc. Backport a patch from
 > upstream gnulib (the source for this file in findutils).

 > Fixes:

 >  http://autobuild.buildroot.net/results/1b40146436eb2b3500d0d8faef96b3374f8e5cda/

 > Signed-off-by: Joel Stanley <joel@jms.id.au>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
