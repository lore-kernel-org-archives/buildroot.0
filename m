Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36F1C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:55:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FACB610FD
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FACB610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 003FE4019A;
	Wed, 18 Aug 2021 21:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUn82c7anRZA; Wed, 18 Aug 2021 21:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB308402DC;
	Wed, 18 Aug 2021 21:54:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4E411BF2C7
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3E7580BCF
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0bx_tu0AzzE for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 21:54:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 895F980BCA
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 21:54:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 60ED31C0006;
 Wed, 18 Aug 2021 21:54:38 +0000 (UTC)
Date: Wed, 18 Aug 2021 23:54:37 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20210818235437.78a7826a@windsurf>
In-Reply-To: <CAFSsvmrYDiStTEn=fEBrUX2+ZZoro6KxMx1zS2FLxsaLzuTtfw@mail.gmail.com>
References: <20210818202212.684857-1-thomas.petazzoni@bootlin.com>
 <CAFSsvmrYDiStTEn=fEBrUX2+ZZoro6KxMx1zS2FLxsaLzuTtfw@mail.gmail.com>
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

On Wed, 18 Aug 2021 13:36:58 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> It seems like version 1.68.0 fixes the build failures. I have tested
> two different
> defconfigs that are on the failure list:
>   - bf7361dc482d8f3f97d523b7d56eabe5bc515ae8
>   - 97aa03f497536462abc85011ba1c94874d18f237
> 
> And the new version doesn't produce the failures that are plaguing the
> autobuilders.
> 
> Instead of removing the package, I would suggest updating it to 1.68.0 instead.

Thanks for looking into this. Did you confirm that you were able to
reproduce the failures *before* the version bump ?

One of the issue seems to because by the host-sentry-cli calling into
Git, which would probably work with in-tree builds, but not out-of-tree
builds for example. Another issue seems to be related to zlib being
available on the host system or not.

So to know if the 1.68.0 update fixes the issue, we need to make sure
that you were able to reproduce the failures with the current version,
in the same setup as the one you tested the version bump with.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
