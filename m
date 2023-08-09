Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFC7EB64DD
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 08:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71CC682C04;
	Wed,  9 Aug 2023 08:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71CC682C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HjntfCUOONr; Wed,  9 Aug 2023 08:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0FDA82B75;
	Wed,  9 Aug 2023 08:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0FDA82B75
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C52CA1BF3B0
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 08:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B03460AED
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 08:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B03460AED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mslGzEHriiW0 for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 08:05:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2943460A9D
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 08:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2943460A9D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 187B6E000B;
 Wed,  9 Aug 2023 08:05:54 +0000 (UTC)
Date: Wed, 9 Aug 2023 10:05:54 +0200
To: "chris.wood@lmco.com" <chris.wood@lmco.com>
Message-ID: <20230809100554.62bae1e6@windsurf>
In-Reply-To: <PH1P110MB1155CA9BDBBEADDFE214E69FE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
References: <PH1P110MB115562DCC66A2B57EA65AB0CE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB09929404D9FDB9F5E043A920C60DA@SA1P110MB0992.NAMP110.PROD.OUTLOOK.COM>
 <PH1P110MB1155CA9BDBBEADDFE214E69FE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691568356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfCGkN/EUVvEdZ+LwurqyTELT4t9MPgm0PJCYxwLVEA=;
 b=fnfcMQHg3yBxI9wEYxq7YHh3YdY0WpP4g0dLEfM6UPFXanBBisaEZBNW8htXmZJTbOiNnm
 DEIAVd/dtTm+mQO6FOjX70gbfflPQ0+c2mefELHohRREtAYbPJBybtYdcxTt6yS21fHnxJ
 OaMV7kzhaO4ZPffQ5pmYumJUZSXBPntDJjdhE4gsa8TMnw+Wfl5TYzlfSk8V9dw90s2dKy
 lTfKwH1IILfYpLkcvIIJpRXjfLVBak4c95sDnt8htB7YyozbTgLkUIFmK53aq3x5ipuh4E
 C5ELK5d9nExty30RhhiXiHRT04RCV2//dSFFhWdN7DsnUXM1mcmcDdS+WsvLdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fnfcMQHg
Subject: Re: [Buildroot] FW: Buildroot Licensing Issue Uncovered
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

Adding Yann E. Morin and Alexandre Belloni in the loop. See further
below for some feedback.

On Tue, 8 Aug 2023 23:01:40 +0000
"chris.wood@lmco.com" <chris.wood@lmco.com> wrote:

> We are desiring to use the buildroot software version 2023-5 and were
> performing a licensing scan for the purpose of creating Software Bill
> of Material and came across a reference to a license that is not an
> open-source license it is an NXP Semiconductor commercial license.
> The licensed file is located in the boot/directory/lpc3200cdl, and
> the file containing the license reference is
> "0002-delete_redundant_files.patch". The reference says:
>
> "- * Software that is described herein is for illustrative purposes only
> - * which provides customers with programming information regarding the
> - * products. This software is supplied "AS IS" without any warranties.
> - * NXP Semiconductors assumes no responsibility or liability for the
> - * use of the software, conveys no license or title under any patent,
> - * copyright, or mask work right to the product. NXP Semiconductors
> - * reserves the right to make changes in the software without
> - * notification. NXP Semiconductors also make no representation or
> - * warranty that such application will be suitable for the specified
> - * use without further testing or modification."
>
> To obtain clarification on the statement "...conveys no license or
> title under any patent, copyright, or mask work right to the
> product..." we asked NXP who responded that the software is freeware
> offered to customers purchasing their boards, and that it is not
> open-source software and furthermore stated that they have no
> relationship to the buildroot software product and wondered if you
> have an agreement with them allowing you to include it in your
> software.
> 
> We are hoping that you can provide licensing permission evidence or
> other actions that will be taken to clear up this oversight so that
> we may use your software without concern.

Thanks for getting this to our attention, very interesting.

A first point of clarification is that we do *not* include lpc32xxcdl
in our software. Buildroot can download it and build it from you, but
from a licensing perspective, lpc32xxcdl is *not* distributed as part
of Buildroot. It would be distributed as part of the embedded Linux
system you build with Buildroot, if you have enabled lpc32xxcdl in your
configuration.

Another aspect is that the lpc32xxcdl package is quite old, and back
then we did not include license information about the packages: you can
see that boot/lpc32xxcdl/lpc32xxcdl.mk does not have any LICENSE or
LICENSE_FILES variables like most of our packages now have. This means
that lpc32xxcdl has been added at a time (2012) when license review
was not done in a systematic fashion like it is done today for all new
packages that come in.

I am not a lawyer nor a legal person, but I agree that the words "NXP
Semiconductors assumes no responsibility or liability for the use of
the software, conveys no license or title under any patent, copyright,
or mask work right to the product" are very unclear in what they allow
to do with the software.

Are you using lpc32xxcdl in particular in your product?

Based on the unclear wording of the license terms of lpc32xxcdl and the
fact that LPC3250 is a very old platform and there hasn't been much (if
any) interest about it for many years, I would be inclined to say that
we should simply drop this package from Buildroot.

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
