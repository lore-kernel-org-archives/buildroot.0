Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E78C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2B8E417C9;
	Sat, 26 Aug 2023 21:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B8E417C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PeuwVYvabvtZ; Sat, 26 Aug 2023 21:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A9134156A;
	Sat, 26 Aug 2023 21:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A9134156A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0C14B1BF283
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 21:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9A1782060
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 21:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9A1782060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DLM_qQCm57l for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 21:05:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A715581F44
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 21:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A715581F44
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58438E0003;
 Sat, 26 Aug 2023 21:05:52 +0000 (UTC)
Date: Sat, 26 Aug 2023 23:05:50 +0200
To: Jan Havran <havran.jan@email.cz>
Message-ID: <20230826230550.6618fa9e@windsurf>
In-Reply-To: <YwIRMgNSkvP/T9a+@arch-zen.localdomain>
References: <YwIRMgNSkvP/T9a+@arch-zen.localdomain>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693083953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q6+vex+e45b+MFhC089I9pnSbEnOdEIqZ9DsVsPzB3w=;
 b=QdHGViNJwlu3dxuavPe6dZmqa/9O9pZcHl2CyQuotL2VSscpYF3n0FIZSQFC/2oF5klcnV
 EXwqROPkEl8HkOT/Fx6ytlocFbSj9ArGJsVxPGaG6CojcbM/o/dY2lVAQBE7X+wAkZf+YV
 ikm87tAiCHovhwkN/MAQyNgg7ckL/f7HoTzwCJ7u+r9U9p30r4cr4o4O6zKMme4rOv/7Z4
 lpG/YcSopuDdLhOeQnjgaKU3vQ3MWklvHh8QBctnxEQXOpKgk1rAI0BvW6V8T9/rwuV72u
 Ymxsg/YhSIubKqeiSuh0bI4ma8v0CaROFAm6S4i3l0XAYn3kbeX8J78a02P4AQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QdHGViNJ
Subject: Re: [Buildroot] [PATCH v2] board/pine64/pinecube: new board
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 21 Aug 2022 13:04:18 +0200
Jan Havran <havran.jan@email.cz> wrote:

> Add support for PineCube with:
> - U-Boot 2022.04
> - Linux 5.15.61
> 
> PineCube is a low-powered, open source IP camera
> with the following specs:
>  - Allwinner S3 Cortex-A7
>  - 128 MiB DDR3
>  - 16 MiB SPI flash
>  - 5 MPx OV5640 camera
>  - MicroSD slot
>  - 10/100M Ethernet with passive PoE
>  - 802.11 b/g/n WiFi
>  - Bluetooth 4.1
>  - USB 2.0
>  - 26 pins GPIO header
>  - Microphone
>  - IR LEDs for night vision
> 
> Board homepage: https://www.pine64.org/cube/
> Board wiki:     https://wiki.pine64.org/wiki/PineCube
> 
> Signed-off-by: Jan Havran <havran.jan@email.cz>

Sorry for the super long delay, I have now applied your patch to our
next branch. It will be part of 2023.11. Don't hesitate to send a
follow-up patch updating to a newer kernel and/or U-Boot version.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
