Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92658C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D9E6409FC;
	Tue,  2 Aug 2022 22:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D9E6409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZgl6x06lqQj; Tue,  2 Aug 2022 22:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FFF1409ED;
	Tue,  2 Aug 2022 22:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FFF1409ED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC2B11BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8694960ABF
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8694960ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSRCPTY8bls6 for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:06:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B4C7600C6
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B4C7600C6
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:06:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B69DA200008;
 Tue,  2 Aug 2022 22:06:28 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:06:27 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20220803000627.74f6a12f@windsurf>
In-Reply-To: <20220625224224.1446787-1-christian@paral.in>
References: <20220625224224.1446787-1-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659477989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUuKnjNn5hm7kSDIMaluKqeHZdvHIrYBUi9sKTl1BLc=;
 b=no9Tt9gTGCKmJfIv3BgIEhhfQPR0MzHn/EE9aT9DYUOAEOPnvR/mwrvs+mu6J5pjh10bU1
 NShBdVV9Yhxtfr3/dU6OoIypQteffGZlU0RFHUvm9FrvuDhV7px6IWW2NDjGzEBigNwBpm
 8ZZ0lBvHAwwvcueDkDtgvozP4Odtjmg5JqYyPsBfm6AAWbwut1bT45pMATn7a45rCmEX7z
 WBckmAmv43YlhjROmCO+cst1Ao2BinhGPfaZktUkix8fU5SgR1HNoNLWtW5AWurdoJYcKK
 S4QS08sK94Ej7MvQ+Z68m5AUnsjSD7rP/PiponeUa7vCyXQVCPnfWUjFzqiPuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=no9Tt9gT
Subject: Re: [Buildroot] [PATCH 1/1] package/gocryptfs: fix build against
 riscv
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 25 Jun 2022 15:42:24 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Replace dependency jacobsa/crypto with a fork with support for riscv64.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/caa60874781c4077273884eb37281cc9e02ef9ac/
> - https://github.com/rfjakob/gocryptfs/issues/666
> 
> Upstream PR: https://github.com/jacobsa/crypto/issues/13
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...-fix-jacobsa-crypto-build-on-riscv64.patch | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
