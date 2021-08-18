Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E327C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 10:18:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D2960E09
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 10:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7D2960E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D69605A7;
	Wed, 18 Aug 2021 10:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rjUqpyeJQtOi; Wed, 18 Aug 2021 10:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA63605F8;
	Wed, 18 Aug 2021 10:18:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B561D1BF86B
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 10:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1ABC403B4
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 10:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIByuVbIWK4u for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 10:18:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0761D40397
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 10:17:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3EED9E0005;
 Wed, 18 Aug 2021 10:17:55 +0000 (UTC)
Date: Wed, 18 Aug 2021 12:17:54 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20210818121754.1b949392@windsurf>
In-Reply-To: <87im042i42.fsf@dell.be.48ers.dk>
References: <871r6s4avr.fsf@dell.be.48ers.dk>
 <20210817125624.54e64a83@windsurf>
 <87wnok2upg.fsf@dell.be.48ers.dk>
 <20210817131229.4932baf0@windsurf>
 <87im042i42.fsf@dell.be.48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-08-15
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

On Tue, 17 Aug 2021 17:42:05 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Thank you for bringing this to our attention. We appreciate community
> input in order to provide the most accurate and up-to-date information
> as possible. After reviewing the information provided, we have made the
> appropriate modifications to reflect that the affected versions of
> Mosquitto are up to (including) 2.0.7. Please allow up to 24 hours for
> the changes to be reflected on the website and in the data feeds.

Great. In my experience they were really responsive, and it seems that
once again they were responsive, which is good.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
