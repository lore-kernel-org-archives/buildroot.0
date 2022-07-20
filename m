Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DDAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 20:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 102D241B43;
	Wed, 20 Jul 2022 20:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 102D241B43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z881mLkpOVY1; Wed, 20 Jul 2022 20:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E2141B32;
	Wed, 20 Jul 2022 20:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E2141B32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D1BFA1BF473
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9357A83F82
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 20:24:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9357A83F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GozE2YUDHg_4 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 20:24:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E3C383F81
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E3C383F81
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 20:24:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 01BF360002;
 Wed, 20 Jul 2022 20:24:30 +0000 (UTC)
Date: Wed, 20 Jul 2022 22:24:30 +0200
To: "Barisani, Andrea" <andrea.barisani@withsecure.com>
Message-ID: <20220720222430.7eb519f6@windsurf>
In-Reply-To: <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
References: <20220720125707.1899437-1-festevam@gmail.com>
 <20220720183856.742c4a09@windsurf>
 <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658348671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8AvO+Eo5Mi3yI42M8Ud3NOELkp0USA+AcSYIV5pu4x8=;
 b=gQLqjXbg8l0nEu6IjDis5kKpNL6nBEE/fWNbZNlInpIvE1faX+Q5sqhTD959NV4J9StZDS
 t+W2r75Ie0XPle4EppIVnPU2Uvk7ZhhpNC6X4tiRUXHkCW5HWkAwmog0JUbrtZut1hwdTt
 5oTrqdFjEHn6W9KoLLcu8HUlDZ6x8WlTiIGhLGoNBsJwStwmKwMGfqgag2yrgqrjyrwV0x
 b9CWGjy0kvx6UwMPbXHJrEyMld2A1Hz1XcmaAEDV/cWAhrX1tPci+QP3iWHpBIj9eiWr9F
 va8tbVSimoiUBTjUB0wvBHAqIzNS+KdSLjEuILgZCY4SxlLbkDDYdRv8XKVTdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gQLqjXbg
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: Fabio Estevam <festevam@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 20 Jul 2022 17:05:42 +0000
"Barisani, Andrea" <andrea.barisani@withsecure.com> wrote:

> These flags are not crucible specific but they are necessary when
> compiling static Go binaries with CGO enabled (which crucible does
> not require by the way) to ensure portability as cgo versions of net
> and os/users are not portable. 

Thanks for your feedback, much appreciated!

So, I see we're passing CGO_ENABLED=1 (when thread support is
available) to all packages, and you're saying that this is incorrect as
not all Go packages need CGO? Passing CGO_ENABLED=1/0 should be a
per-package decision?

However, when CGO is enabled and we need static linking, passing
osusergo and netgo tags is needed, correct?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
