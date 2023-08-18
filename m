Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006E4C001DE
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 07:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8221B421F1;
	Fri, 18 Aug 2023 07:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8221B421F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImhhItYcwp5c; Fri, 18 Aug 2023 07:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72AA84205E;
	Fri, 18 Aug 2023 07:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72AA84205E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F05A1BF378
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 07:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D06894205E
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 07:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D06894205E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7V3Dh04TOBD for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 07:44:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8422241FE3
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 07:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8422241FE3
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0D011BF206;
 Fri, 18 Aug 2023 07:44:43 +0000 (UTC)
Date: Fri, 18 Aug 2023 09:44:42 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230818094442.28ade821@windsurf>
In-Reply-To: <20230817194638.780863-8-adam.duskett@amarulasolutions.com>
References: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
 <20230817194638.780863-8-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692344684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Pmar9NbvVZccA4+JOCGD0sH2TVvQ80Poq6J02LUfdw=;
 b=NP8q83pTch28t1cTpaThNYeDGPj3OMVbmU3beHJEGYkZ7EH0t283i7JlgwXkf1JnjL0JQV
 uCKxw8K4tFxZExc1jyzR8Gxh2Og8WaFufXeTbe2jR1J2vKk1i3+MiqW9fEOSiuJw/HcXAO
 uX0KQG8kg/IdMJKZGaTythbEqbcbz443DzqhPlKs42Lrz1Ao7xeiMbqt7p/WnjzVeGlbZx
 bX1iYjBzLa+meW8BKIONzjJYCAlZdLMuOcr/vM/oZkxXn9/7eOVSNfO/n0q6kNHPnVvSix
 9FpSiiK7s0pENKruR6IrbnvsG9DEkSk9nHgZOx0WARAJxftnW/WmIOORDOLciw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NP8q83pT
Subject: Re: [Buildroot] [PATCH v3]
 configs/flutter_x86_64_efi_demo_defconfig: new flutter demo config
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org, Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Thu, 17 Aug 2023 13:46:38 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> This config uses board/flutter_x86_64 to demonstrate Buildroots new flutter
> capabilities. When ran, flutter-gallery automatically starts on boot.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Thanks for adding a demo. I think instead of a defconfig, we want to
turn this into a runtime test in support/testing/. I've Cc'ed Julien
Olivain who is our runtime test master. He has recently contributed
tests that involves graphics stuff, precisely using vkms.

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
