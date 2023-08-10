Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE67C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4983140510;
	Thu, 10 Aug 2023 21:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4983140510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRQa8I9bj4BG; Thu, 10 Aug 2023 21:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8721A408D4;
	Thu, 10 Aug 2023 21:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8721A408D4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FC441BF379
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05F3640510
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05F3640510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y0-6ca7eEZ5S for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 21:10:52 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6004400DC
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 21:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6004400DC
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2C92C0005;
 Thu, 10 Aug 2023 21:10:48 +0000 (UTC)
Date: Thu, 10 Aug 2023 23:10:47 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230810231047.1ad640ab@windsurf>
In-Reply-To: <20230810174509.GG421096@scaer>
References: <20230809214806.2077591-1-thomas.petazzoni@bootlin.com>
 <20230810174509.GG421096@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691701849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cs/OMOGjGF2Bi2P3zPRm0D9dgZeKwulNnj3zAELxbv8=;
 b=g5U72x5R/MmCbmUKUDbTf+ctQdm5ZwQGtThs8aOevnADvgMf6mhx5hKtbC+viyRV84/D36
 4efbGJuU199v5QmCm3ACCKJI9jMTGmA+fB5JSyf/C9SRCIPTgWel6zxJeYSFTqfWh1cab7
 08nQMuUbtL5RPiQ/gEgMQkQemk8G296iMEYdzxW4A3PfDL33JG7J+Q7cC512hmKU0Q4qtA
 uk+bVYxu+B0YHXOyQeS7fFD3zoCFmHxPHmq4ddDYm42zTUuSmLp5nD/LrpVsnuXXWVGwrg
 R7p8qap5cCb9QScQ/sTwToQLMn2BCnTDixhXR5Iiyxb45poryOSJTsypqxhLpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g5U72x5R
Subject: Re: [Buildroot] [PATCH] boot/lpc32xxcdl: remove package
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
Cc: alexandre.belloni@bootlin.com, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 10 Aug 2023 19:45:09 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> There was still a reference to lpc32xxcdl in the test suite for
> check-symbol, so I dropped it there too.

Yes, I had seen it, but I thought "beh, it's just a test case, it could
be any name, it doesn't matter".

> I forgot to fix genrandconfig, though... I'll push a followup commit...

Ah indeed, genrandconfig I missed entirely.

Thanks for having handled this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
