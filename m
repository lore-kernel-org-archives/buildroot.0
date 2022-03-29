Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7CFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 19:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF6484344;
	Tue, 29 Mar 2022 19:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5X1aQTc3kin; Tue, 29 Mar 2022 19:48:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 996A484340;
	Tue, 29 Mar 2022 19:48:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B51F1BF83B
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97B8E40184
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 19:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ydu5UZzKyZz4 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 19:48:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C63D4015D
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 19:48:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0D4FE100005;
 Tue, 29 Mar 2022 19:47:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZHoq-00Fzdy-Lw; Tue, 29 Mar 2022 21:47:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Joel Stanley <joel@jms.id.au>
References: <20220315130737.428449-1-joel@jms.id.au>
Date: Tue, 29 Mar 2022 21:47:56 +0200
In-Reply-To: <20220315130737.428449-1-joel@jms.id.au> (Joel Stanley's message
 of "Tue, 15 Mar 2022 23:37:37 +1030")
Message-ID: <87lewsa6c3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] fakeroot: Fix segfault on ppc64le
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

 > When generating a filesystem image on a power10 build machine running
 > Ubuntu, we see a segfault when fakeroot is running chmod.

 > This has been reported and fixed upstream in Debian in version 1.26-1.2:

 >  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=995393#53

 > Add the samae patch to resolve the segfault.

 > Signed-off-by: Joel Stanley <joel@jms.id.au>
 > ---
 > This isn't a commit in the fakeroot tree, rather a patch from the Debian
 > packaging.

 > I would appreciate if this was added to the 2022.02 stable tree.

 > Signed-off-by: Joel Stanley <joel@jms.id.au>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
