Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89FCC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 17:56:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4527E6108B
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 17:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4527E6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19CA460607;
	Thu, 19 Aug 2021 17:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sbPwlWme12tM; Thu, 19 Aug 2021 17:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83D2260642;
	Thu, 19 Aug 2021 17:56:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DBA1B1BF31A
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 17:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB0F742504
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 17:56:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n00kBgATJ_BY for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 17:56:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77B0140805
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 17:56:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 9F02B240004;
 Thu, 19 Aug 2021 17:56:31 +0000 (UTC)
Date: Thu, 19 Aug 2021 19:56:30 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210819195630.2ee6dfe1@windsurf>
In-Reply-To: <CAFSsvmrFUXB4ogAUObhutx_vQFOEkVQL6ashiG2vpHNrzzNSGQ@mail.gmail.com>
References: <20210818202212.684857-1-thomas.petazzoni@bootlin.com>
 <CAFSsvmrYDiStTEn=fEBrUX2+ZZoro6KxMx1zS2FLxsaLzuTtfw@mail.gmail.com>
 <20210818235437.78a7826a@windsurf>
 <CAFSsvmqmKHD0k4fOWAV+Zdj+m=jSvafFYtw1vMsOj1Jf5rRMSA@mail.gmail.com>
 <20210819181926.771fe4f1@windsurf>
 <CAFSsvmrFUXB4ogAUObhutx_vQFOEkVQL6ashiG2vpHNrzzNSGQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/sentry-cli: remove package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Adam,

On Thu, 19 Aug 2021 09:30:43 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Ugh, out of tree still fails. Yeah, I'm bad at this whole
> troubleshooting thing :(

Ah ah :-)

> Sorry for wasting your time! Remove this terrible package!

Well, I don't think it's a terrible package, but I'm not personally
interested in it, and despite those zillions of failures being reported
for weeks/months, nobody cared enough to fix it up.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
