Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F36BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FAA481443;
	Mon, 27 Dec 2021 10:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQC4IrrraP4O; Mon, 27 Dec 2021 10:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BE118141A;
	Mon, 27 Dec 2021 10:34:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD1C71BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D47FA409AB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovoxPYvTcmxh for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:34:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB4DB409AA
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:34:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2F5261C0009;
 Mon, 27 Dec 2021 10:34:26 +0000 (UTC)
Date: Mon, 27 Dec 2021 11:34:25 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211227113425.027c95f8@windsurf>
In-Reply-To: <20211212134955.3178311-1-bernd.kuhls@t-online.de>
References: <20211212134955.3178311-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bento4: new package
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

On Sun, 12 Dec 2021 14:49:55 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Needed for the upcoming Nexus version of kodi-inputstream-adaptive,
> the bundled version of bento4 was removed upstream:
> https://github.com/xbmc/inputstream.adaptive/commit/70625e76702186c73ddb43440f44262c48e14755
> 
> Backported upstream commit to fix cmake install as patch 0001.
> 
> Added feature- and bugfix-patches from kodi, they were sent upstream:
> https://github.com/axiomatic-systems/Bento4/issues/648

Thanks for the new package. To be honest, the number of extra patches
looked a bit scary, but as this package is only ever going to be used
by Kodi, I think it's fine. And hopefully some of those patches will
make their way upstream, at least this process has started.

So: applied to master!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
