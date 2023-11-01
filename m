Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF94C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429B58174A;
	Wed,  1 Nov 2023 11:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 429B58174A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0M501XRkaGB5; Wed,  1 Nov 2023 11:03:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95665842FB;
	Wed,  1 Nov 2023 11:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95665842FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11F671BF2F4
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF1A870379
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF1A870379
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vk6VjL1hGrFG for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:03:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A586A7037D
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A586A7037D
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0B4BFF812;
 Wed,  1 Nov 2023 11:03:49 +0000 (UTC)
Date: Wed, 1 Nov 2023 12:03:48 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20231101120348.38b1e18d@windsurf>
In-Reply-To: <20231030101115.2214402-3-aperez@igalia.com>
References: <20231030101115.2214402-1-aperez@igalia.com>
 <20231030101115.2214402-3-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698836630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65Gi5A2bBIGb/lP2/t4UW1jzKZs3y543QxPidCi5juM=;
 b=bTQV3K0JTWc1X8BMEIRK1F7IJZmbSHpF4Qf/wfIM0dqo345JSx0zh7z5XYY+bW7qjUihR1
 zxsmLePpJm+bGNWCW9vNxhdm2xhqhDdifmSmvOWNx0dWOYntBjQgpxIF6Pj6BlkmTRgWHF
 3cKTcO7QgOix4IXdGofauZydJY+QN/7SSin6MF4NdClhcKJjkK25VQ8qqsEXB1xCtimeWG
 m5sESDY+L+Z72bfhjKOskmCLcLMlDT3XKaeZFioi8bSIcUcJ42ZIMqO1TyP51Tx/u6VTyQ
 b0ELpbkX0MKPaukWzfS8rAq8CTab/bVFOVAfYzFTxGkaSNWdZZKENEQ++E+krA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bTQV3K0J
Subject: Re: [Buildroot] [PATCH 2/3] package/cage: bump to version 0.1.5
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Oct 2023 12:11:06 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Update Cage to version 0.1.5, which is a bug fix release that
> supports using wlroots 0.16.x.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  .../cage/0001-Upgrade-to-wlroots-0.15.patch   | 312 ------------------
>  package/cage/cage.hash                        |   4 +-
>  package/cage/cage.mk                          |   2 +-
>  3 files changed, 3 insertions(+), 315 deletions(-)
>  delete mode 100644 package/cage/0001-Upgrade-to-wlroots-0.15.patch

You had forgotten to update the .checkpackageignore file with the
removed patch, so I did that when applying to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
