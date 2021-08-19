Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0285C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:32:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C5C46109E
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C5C46109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 596B04011B;
	Thu, 19 Aug 2021 21:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrIbRQHZVt05; Thu, 19 Aug 2021 21:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EFC940176;
	Thu, 19 Aug 2021 21:32:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 477631BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D3594023F
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id roDak85Etjyt for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:31:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4E6840176
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:31:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BEAAB1C0003;
 Thu, 19 Aug 2021 21:31:46 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:31:45 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20210819233145.1802a72f@windsurf>
In-Reply-To: <CADYdroNf7PmpdHsfO_Hxz9ynWsLEcFVL9oX=+2nCMykuV3fNmw@mail.gmail.com>
References: <20210802123300.564709-1-arnout@mind.be>
 <CADYdroNf7PmpdHsfO_Hxz9ynWsLEcFVL9oX=+2nCMykuV3fNmw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH for-next] package/gtest: remove partial host
 package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Norbert,

On Mon, 2 Aug 2021 15:09:06 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> >  $(eval $(cmake-package))  
> 
> add this here:
> $(eval $(host-cmake-package))
> 
> It works, and I see no particular reason not to allow the host package.
> 
> > -# The host package does not build anything, just installs gmock_gen stuff, so
> > -# it does not need to be a host-cmake-package.
> > -$(eval $(host-generic-package))
> > --
> > 2.31.1
> >  
> 
> With this change the patch is identical to my local version, and thus
> Reviewed-by: Norbert Lange <nolange79@gmail.com>

Are you saying that you are using the gmock_gen script in your
workflow? If so, how does that fit with the commit description from
Arnout, which says:

  This script, however, is no longer maintained and is not needed for most
  practical uses of gmock. Even if it is used, its output is meant to be
  hand-edited, so it shouldn't be used as part of the build flow.

Thanks for your feedback,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
