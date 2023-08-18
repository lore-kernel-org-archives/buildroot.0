Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BAFC001DE
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 07:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 266414186A;
	Fri, 18 Aug 2023 07:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 266414186A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYEDifVbMOwQ; Fri, 18 Aug 2023 07:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FBAA4179D;
	Fri, 18 Aug 2023 07:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FBAA4179D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09F7E1BF378
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 07:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AD0740502
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 07:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AD0740502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXHe4mYmRODo for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 07:43:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21264404A8
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 07:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21264404A8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2EFA41C000D;
 Fri, 18 Aug 2023 07:43:17 +0000 (UTC)
Date: Fri, 18 Aug 2023 09:43:16 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230818094316.5798d041@windsurf>
In-Reply-To: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
References: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692344598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bgrCxqouA0ZSFOI6Eo4FZz4YCk3Nqa/DFQ9qIaDw6DE=;
 b=pdaIBvAlOIOYIQzKptmoihY37QHX2OAam1/arNbR2mxQL+EU9CNY2Z89JoU0mPSiXsC/4b
 ssfz3AFstgr3J/Cs4XDVo+6UQqqLgxWthUhOUrmrf1t3saOB8rTCm4DSLZu0GhZF74PB5+
 xoYUSrMNSmhJ9O8aVRea9sMqvU2c7rbuMJIe/NOkazrJZbpmsTJ6/YpYcchV4/okDMcSi/
 dvpTFTrSnKtbNv3VLsbVfS6W8HvrcJbB7kvkUwB3VsByc8oL0HHYzbT4fCSpPeSTjk8+eA
 6XlDvclwAjV4BCR5errmTNZ184MsHUwoi9F+QH+BQ2kRCyoWix1QL7XWeYdeTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pdaIBvAl
Subject: Re: [Buildroot] [PATCH v4] flutter: new packages
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Thu, 17 Aug 2023 14:58:48 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> This patch series should provide Buildroot with everything necessary to build
> and run flutter applications. I even included a demo config and board file for
> new users to quickly get started.

Thanks for continuing the effort on this. Please note that your patch
series lacks numbering on patches (aka PATCH 1/6, PATCH 2/6, etc.).

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
