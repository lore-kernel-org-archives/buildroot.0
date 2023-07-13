Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCE9C001DC
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 20:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D8E240B29;
	Thu, 13 Jul 2023 20:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D8E240B29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTcP9t6plmcs; Thu, 13 Jul 2023 20:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B623D405B3;
	Thu, 13 Jul 2023 20:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B623D405B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7731BF3D0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 071EB60D62
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 20:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 071EB60D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3M46mP7Pgqa4 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 20:11:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E14D260B10
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E14D260B10
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 20:11:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A247FF807;
 Thu, 13 Jul 2023 20:11:21 +0000 (UTC)
Date: Thu, 13 Jul 2023 22:11:19 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230713221119.0c83afa4@windsurf>
In-Reply-To: <20230713075740.328213-1-james.hilliard1@gmail.com>
References: <20230713075740.328213-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689279081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4dhZkCT0ItbGs7RVO8deUqe1D6rpo4MWIi/vMFkRo4=;
 b=OknZA26ua4Y5+m7TqU57QaHUW3HYjf56qOiOVWKUNn9yhhy8jmqeWZk6ufRgSobF86ybvg
 ddiOAn8NIg7YVW5CMB5G7nH3JtcAh/nuzgNVTtK9UKsua2jGrVLye0G1W+QQBBAumNfDo5
 66KR+N2mD5rUY3+uagR41uj512bE0Xpi3fmYX5h3jbw+AZs2eRXDfVCICGOVcitKxE8NUw
 lTZtXmvsb8m8yMblPRkmuNV8pybr7pNLZh3SjYj/6dGkMF48b1Ue8KAypP/zLx+hoP931i
 lT5NcgFCch59uNrxpCeRa4P51ett9ZnkKw0iFLq9b62d8uotAOYjr7bdAcNg0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OknZA26u
Subject: Re: [Buildroot] [PATCH v2 1/1] package/strace: use bundled headers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 13 Jul 2023 01:57:40 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> There is a bug in the configure script, while we could apply the
> upstream patching fixing this bug the better solution is to switch
> to using the bundled headers instead.
> 
> The reason for this is that strace needs the headers of the running
> kernel rather than those that were used to build the toolchain.
> 
> The running kernel is often more recent than the one used in the
> toolchain so we do want to use the more up-to-date headers.
> 
> As such we should use the strace bundled headers as they will be
> the most up-to-date headers.

But then isn't there a chance that the bundled headers are too *recent*
compared to the running kernel? What happens in this case?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
