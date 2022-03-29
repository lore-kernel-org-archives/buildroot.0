Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A7BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 075CE6111E;
	Tue, 29 Mar 2022 20:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PVmzFpDdhZ3k; Tue, 29 Mar 2022 20:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D82261122;
	Tue, 29 Mar 2022 20:29:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FAAD1BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C8A141934
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96hYOc4T9rN9 for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:29:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C263541932
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:29:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9BC31100003;
 Tue, 29 Mar 2022 20:29:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZISd-00GAh7-Ou; Tue, 29 Mar 2022 22:29:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Kyle Harding via buildroot <buildroot@buildroot.org>
References: <20220317162530.427876-1-kyle@balena.io>
Date: Tue, 29 Mar 2022 22:29:03 +0200
In-Reply-To: <20220317162530.427876-1-kyle@balena.io> (Kyle Harding via
 buildroot's message of "Thu, 17 Mar 2022 12:25:30 -0400")
Message-ID: <87mth88pv4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/unbound: use system libevent
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
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Kyle" == Kyle Harding via buildroot <buildroot@buildroot.org> writes:

 > The file descriptor limit when using the builtin mini-event
 > cannot handle more than 1024 file descriptors.

 > https://unbound.docs.nlnetlabs.nl/en/latest/topics/performance.html?highlight=libevent#using-libevent

 > Signed-off-by: Kyle Harding <kyle@balena.io>

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
