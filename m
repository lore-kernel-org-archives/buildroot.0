Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A816DC433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 22:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32287408A7;
	Wed, 26 Oct 2022 22:19:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32287408A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RXP0KFGGltUS; Wed, 26 Oct 2022 22:19:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25C9A401ED;
	Wed, 26 Oct 2022 22:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25C9A401ED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C0AAD1BF4DA
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 22:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A9D3401DB
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 22:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A9D3401DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t77TxAcuUtkP for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 22:19:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14239401D9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14239401D9
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 22:19:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D49D60008;
 Wed, 26 Oct 2022 22:19:15 +0000 (UTC)
Date: Thu, 27 Oct 2022 00:19:11 +0200
To: Tobias Waldekranz <tobias@waldekranz.com>
Message-ID: <20221027001911.30ad7215@windsurf>
In-Reply-To: <875yg69tjz.fsf@waldekranz.com>
References: <20221020141412.346992-1-tobias@waldekranz.com>
 <20221020141412.346992-4-tobias@waldekranz.com>
 <20221026221528.393a1d39@windsurf> <875yg69tjz.fsf@waldekranz.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666822756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WX76z/tcPeGkuvpkfoWyYoHpVuOZ9txPgKcqRTbG9mE=;
 b=Sna1j1dt/wvfAAisjSMr69ZuuxT3Lug5frYcc4XHWbNffN/3BAo7mS/349MgwRzLJ/t8bz
 LHZGE2HrT5SANOMSaeop1eA3YQvXC/6w9lmC30ZGyqWS7XEwGFlcE9X59LbS12pGp700iT
 DpOtH0/FpdwmBbwoffPBlUoOkwpJK51uBU4CKdYZhYaWM9QyxL+XTpAJQEtkh0A6pDHhhR
 ojEdPmLGPPJro5xGLz0YLXTOomNmVxWBfNMSgzHHoGh7XLm7n1Qm3TMUi1ruSdFqnKMCxj
 Z4AQi46ozEYtae07N6YTfdv6tHd3jNiPpI1KYVzfhrZ9taL83Ny2KLAdIeVw1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Sna1j1dt
Subject: Re: [Buildroot] [PATCH 3/4] package/libbpf: extract dependencies to
 separate kconfig symbol
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tobias,

On Wed, 26 Oct 2022 23:14:08 +0200
Tobias Waldekranz <tobias@waldekranz.com> wrote:

> Fair enough, I will drop this change in v2 and copy the information to
> kmemd.mk instead. Is there a convention for how to comment dependencies
> that stem from grandparent packages? E.g. v2, kmemd.mk will declare:

No need to send a v2, I already applied the patches locally, did the few
fixes, I will push them soon.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
