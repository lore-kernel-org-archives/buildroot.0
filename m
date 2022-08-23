Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C50C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F7960B5C;
	Tue, 23 Aug 2022 19:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F7960B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTG407cHFgwg; Tue, 23 Aug 2022 19:45:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20BA660B38;
	Tue, 23 Aug 2022 19:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BA660B38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDE7F1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBEA240323
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBEA240323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zEF2P7w2LOyI for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:44:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A73384011C
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A73384011C
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:44:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A3ED7240004;
 Tue, 23 Aug 2022 19:44:52 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:44:51 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20220823214451.15f14249@windsurf>
In-Reply-To: <20220822115036.1676570-1-dario.binacchi@amarulasolutions.com>
References: <20220822115036.1676570-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661283892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pd/SrLsmmanecamgjELAYeuB9fWPv/zZoQEUoH/mYMM=;
 b=OGZRoILhAQuuD+r19zd8nx0BXcCabo1x+dFi9wUvGvA/9WfVM7xmU0FpQ2J2cJHCJkrtDP
 BZmDOBwvabHKRTxkm4BqbfeUna9ltA9R9aexw04/8eDx1nyveowVfD5TZK7Fge9C6D7dAB
 tyXO9vN6Iv/kIQfSB59YYCCkrIfED5dYq9WbaM8KlwtuJTlQuwMBBXvkfcP9kKWabUsS5k
 QhCgMDzzAwTcCBG/KPi1DLARQ9tGNGz5x+Eji92q5QR1qMtHRe2gRHBPxDI6c36nJQse0C
 zojsIvG0E7Lh4eY7VyBIk7PfyZfu7FO8MjcaOkkLyKinLwXOqZbr3CdTmJpYRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OGZRoILh
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.4.240
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

On Mon, 22 Aug 2022 13:50:36 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 2 +-
>  package/uuu/uuu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
