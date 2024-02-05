Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578B2C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89E8940BED;
	Mon,  5 Feb 2024 21:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E8940BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WII754WAAfox; Mon,  5 Feb 2024 21:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72E2140B7C;
	Mon,  5 Feb 2024 21:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72E2140B7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E7301BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 682C981F15
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 682C981F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UV3x0dVCCAw for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:37:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5895681F13
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5895681F13
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EE5B40003;
 Mon,  5 Feb 2024 21:37:19 +0000 (UTC)
Date: Mon, 5 Feb 2024 22:37:18 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240205223718.5039e114@windsurf>
In-Reply-To: <20240126230520.427817-1-ju.o@free.fr>
References: <20240126230520.427817-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707169039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7v34OD42NKCU7NEXFPHr3mBFpKhRylQmkQidBualNgI=;
 b=lP3LCYKr7oOeroKfCBM7ckzt4RWeqzugivk7TWO5rxLJDHNuz3JvKuxZUZ+4Tj2VxSEEyU
 j+047e//Vto8ewO53+CklP154K/K7rWtTfNdquB/SF0AFqs27Fnjktywq3KObZBTLU5rMV
 T6hgglbduayOrkJMq8+xnixqDEOxqPDzrLs40VKYAKVIG9B5PYgDfxrXpX9G7eKDC2XvYi
 vsiYSz4eRgcMXJ9NFkch9VhVUZ+7WlOiRYICr/wJBCwVzx5LO9B5F9bIYKkL+yIQXeh3Jm
 YmUBwqS67x3KohldOjr2n/ZnOS86HnLcafXjl8GDuRqm981Mk6cS17oIpaO31w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lP3LCYKr
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add cryptsetup runtime
 test
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

On Sat, 27 Jan 2024 00:05:20 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |   2 +
>  .../testing/tests/package/test_cryptsetup.py  | 137 ++++++++++++++++++
>  .../test_cryptsetup/linux-cryptsetup.fragment |   5 +
>  3 files changed, 144 insertions(+)
>  create mode 100644 support/testing/tests/package/test_cryptsetup.py
>  create mode 100644 support/testing/tests/package/test_cryptsetup/linux-cryptsetup.fragment

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
