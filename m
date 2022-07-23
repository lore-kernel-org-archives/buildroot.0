Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C99C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 922AE4243D;
	Sat, 23 Jul 2022 16:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 922AE4243D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qs_CFTwGlIYO; Sat, 23 Jul 2022 16:57:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 574DD42431;
	Sat, 23 Jul 2022 16:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 574DD42431
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E89521BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C15F74243A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C15F74243A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOninEWh1CZw for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:57:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71F5142438
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71F5142438
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:57:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7F68160004;
 Sat, 23 Jul 2022 16:57:19 +0000 (UTC)
Date: Sat, 23 Jul 2022 18:57:19 +0200
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220723185719.17f2b829@windsurf>
In-Reply-To: <20220606085108.1628288-2-joel@jms.id.au>
References: <20220606085108.1628288-1-joel@jms.id.au>
 <20220606085108.1628288-2-joel@jms.id.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658595440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7So6c5SulOxG6otNuzZd/Wctqqwm/mHuU2PSjy+526U=;
 b=cX1XlJczaRQUGLZ1SHTTofcjycvOLb7sUUT3s66IvulsX5hz8gIDyfyOFWzSon3LY4tG7g
 Ks8k4PXHSeJuktsAmRfzXT6JbPMBgnA85sdXJuA28stXvh33HYGA+Sj8IZ70BuuyFtQHPD
 Dzo2QvxFDLGveUCNpTIa5FoiaQwjrngLJYK0maJ8yAuliFb930u0ibONr2Iatct54TSu6E
 xVLg3jqUz8cTTgaAE+u/IRJK+PjPPO8sZuz+M1+mQezFzuwsehV5QGjxJdv5BQRnFyEsKu
 S1S/VeEeBEvoKUjo62DR+/GvJcps295Oz8n2Ee/qf/kqlxunxqaDW5rZXbMHdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cX1XlJcz
Subject: Re: [Buildroot] [PATCH 1/2] package/librtas: Bump to v2.0.3
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

On Mon,  6 Jun 2022 18:21:07 +0930
Joel Stanley <joel@jms.id.au> wrote:

> Includes build fixes for musl, so remove the glibc restriction.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/librtas/Config.in    | 5 -----
>  package/librtas/librtas.hash | 2 +-
>  package/librtas/librtas.mk   | 2 +-
>  3 files changed, 2 insertions(+), 7 deletions(-)

There was a build issue with uClibc toolchains that don't have SSP
support, which I have fixed by adding a patch, and I reported the issue
upstream: https://github.com/ibm-power-utilities/librtas/issues/25.

I updated the commit log to mention explicitly that uClibc builds now
work fine as well.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
