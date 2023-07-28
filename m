Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D43EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8576F61247;
	Fri, 28 Jul 2023 20:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8576F61247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtJyJJxcY3tl; Fri, 28 Jul 2023 20:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 275B9614F4;
	Fri, 28 Jul 2023 20:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 275B9614F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7993B1BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C4F614E5
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C4F614E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bf_WyKskOeUB for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:57:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 410A8614DF
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:57:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 410A8614DF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CCD4240002;
 Fri, 28 Jul 2023 20:57:07 +0000 (UTC)
Date: Fri, 28 Jul 2023 22:57:06 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230728225706.11257a28@windsurf>
In-Reply-To: <20230602085741.3338373-1-dario.binacchi@amarulasolutions.com>
References: <20230602085741.3338373-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690577827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uNja01GYkvA3+m3IqR8LHz9ovrzfjCLqO35pMBojiUw=;
 b=RywqZpMqtkUPh+9u86Lq3QBHfhdHQUXnDhyh4tDa8y1TXMSUom+MBS3QqLKgTsgBcmGRiP
 k8UZzjkAYuQgpbNvegctZGG9enfhD04eJoV11Oe/H0LqOXOQ1A27Tqso5EbzFC3ynTBJB4
 CyimdSJOPd3vPZMJsmfh6LBoRCOcHWw4QzDO79tLWcD/SbZaNljZOVdw/MXOrbxskCWbXx
 zY1U2apKVjLDQ4tOLvfMgSbD1+iOyfk98Bt8aKWHFv5S4JPipqfWvwLZCNXt2nROhFTd8A
 lACqQaPK95LOhI9rxroLAKyfIpv2ZsoUecAJ7Qp3kPRl6QPtcnRjreCavxJrRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RywqZpMq
Subject: Re: [Buildroot] [PATCH 1/1] package/libmnl: remove dependency on
 kernel headers version
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
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dariobin@libero.it>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  2 Jun 2023 10:57:41 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> As agreed in [1], now that the patch for including kernel headers has
> been applied upstream, we can remove the restrictions in Buildroot to
> avoid compilation failures.
> 
> The patch is an adaptation of the one applied upstream.
> 
> [1] https://patchwork.ozlabs.org/project/buildroot/patch/20230520210153.3944842-1-dario.binacchi@amarulasolutions.com/
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...ache-copy-of-can.h-and-can-netlink.h.patch | 548 ++++++++++++++++++
>  package/libmnl/Config.in                      |   4 -
>  package/libmnl/libmnl.mk                      |   1 +
>  3 files changed, 549 insertions(+), 4 deletions(-)
>  create mode 100644 package/libmnl/0002-include-cache-copy-of-can.h-and-can-netlink.h.patch

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
