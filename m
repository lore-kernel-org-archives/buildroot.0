Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26131C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32EF60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E32EF60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF008404B4;
	Wed,  4 Aug 2021 01:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWUFiomu2OLn; Wed,  4 Aug 2021 01:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A93FB4037A;
	Wed,  4 Aug 2021 01:19:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD7851BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8E32401FA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tObB3ovMly0 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:35:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 651D24010B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:35:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 433CE240006;
 Tue,  3 Aug 2021 21:35:24 +0000 (UTC)
Date: Tue, 3 Aug 2021 23:35:23 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20210803233523.5e2b7ff6@windsurf>
In-Reply-To: <20210803194758.GH27036@scaer>
References: <20210802162244.620782-1-arnout@mind.be>
 <20210802162244.620782-2-arnout@mind.be>
 <20210803054842.GF27036@scaer>
 <4b68e8fc-81ce-d0f9-9337-df95eb3715ea@mind.be>
 <68f35ba6-c038-6d46-c4ea-ee0cbc46bceb@heine.tech>
 <20210803194758.GH27036@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [RFC 2/2] docs/manual/migrating.txt: add
 "individual packages" section
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Tue, 3 Aug 2021 21:47:58 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> People are really still using tarballs in these days? ;-) But OK, you've
> got a point.
> 
> However, I would still think that people who want to follow a process
> when updating are probably already using buildroot a git submodule of
> some sorts, so yes, they will have a git tree to look at.
> 
> People who use a released tarball are not really looking for a sustained
> or long-term vision, and are not planning on upgrading.

I was also surprised, but the other day, a person working for a large
IP vendor company complained that he was not able to download the
Buildroot tarballs. For some reason, the IP of this company had been
blocked in iptables rules of buildroot.org. When I suggested to use Git
instead, and especially the Github or Gitlab mirrors as a workaround,
it apparently wasn't considered really a good solution.

So it does seem like some people are still using the tarballs, indeed.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
