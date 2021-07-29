Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61324C4338F
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 21:03:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C59760EC0
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 21:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C59760EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05B9A40462;
	Thu, 29 Jul 2021 21:03:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBT_VuvLakaJ; Thu, 29 Jul 2021 21:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24161404EE;
	Thu, 29 Jul 2021 21:03:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5C91BF380
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 21:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C112406A3
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 21:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHNDhC5wiG8W for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 21:03:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86D9A4069F
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 21:03:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 695F02000A;
 Thu, 29 Jul 2021 21:03:03 +0000 (UTC)
Date: Thu, 29 Jul 2021 23:03:02 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210729230302.44f61ce5@windsurf>
In-Reply-To: <f3047763-02cf-cfca-b42f-c40f913ff1c9@mind.be>
References: <20210721171538.592498-1-thomas.petazzoni@bootlin.com>
 <f3047763-02cf-cfca-b42f-c40f913ff1c9@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/website: mention mailing list archives
 at lore.kernel.org
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Thu, 22 Jul 2021 21:26:23 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Any particular reason to skip the links in docs/manual/resources.txt and
> docs/website/contribute.html ?

I have done a separate commit to update docs/manual/resources.txt.
However, contribute.html does not have any reference to the mailing
list *archive*, only to the main info page for the mailing list, which
allows to subscribe, so there was nothing to update there IMO.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
