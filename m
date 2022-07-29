Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A45C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8F2B40C6D;
	Fri, 29 Jul 2022 19:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8F2B40C6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRko1b-x_mOS; Fri, 29 Jul 2022 19:54:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E02DE40C62;
	Fri, 29 Jul 2022 19:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E02DE40C62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9439D1BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F48C846F7
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F48C846F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id df0Fhwi42oWq for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:54:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E32C83F54
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E32C83F54
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:54:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 89AB160006;
 Fri, 29 Jul 2022 19:54:11 +0000 (UTC)
Date: Fri, 29 Jul 2022 21:54:10 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220729215410.0d187433@windsurf>
In-Reply-To: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
References: <20220729162430.1028453-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659124452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYhXoJjLrw4V78nk168q5tFIUTWJju4HILCiuV2VrSs=;
 b=HsQCBP5wpJvAlO5Yo3nP+MortvKEV1Iv5Bizxy4YNHcL9FpAKD4CmOEJv/wuuJ7mWkEFg+
 8bBKFgfMqLfho2XPJp1BoqVGQ5ATTwx/bKBBUQIXU2nylgc13yoHKBKjRxMVMRF9TI227r
 Rr0mw13j7hA2M/fcwJ+dWTSkPjV6CylR5MgfWXYwNL13HsAUVHZWLUu3kmj0yewr/HDHPR
 W+dwbVblszX7KYlk3ppEx4RMMR0WzNa0jTLbbLSTRJUvIw/HQFAZ9RGTz6aFA0LV7iXuK7
 JF3nZoo8+QtKFsqVy1rztQJR1jsx935aCRGG4ztSs4SJnic797p3jXZ06ZZZqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HsQCBP5w
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/Config.in: fix
 BR2_TOOLCHAIN_HAS_GCC_BUG_99140 number
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 18:24:29 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> While introducing gcc bug 99410 I've named BR2_TOOLCHAIN_HAS_GCC_BUG_ to
> 99140 that is wrong. So let's fix this by changing bug option to
> BR2_TOOLCHAIN_HAS_GCC_BUG_99410.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/belle-sip/belle-sip.mk | 2 +-
>  toolchain/Config.in            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied after fixing the typo noticed by Arnout.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
