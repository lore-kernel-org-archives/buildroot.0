Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755BAC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 22:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B5198210D;
	Tue,  8 Aug 2023 22:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B5198210D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GhLKGPHNXUDW; Tue,  8 Aug 2023 22:12:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47678812EF;
	Tue,  8 Aug 2023 22:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47678812EF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3411BF3A3
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02B2D41761
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 22:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B2D41761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sb_4uAyjjo-4 for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 22:12:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 915D44175E
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 22:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 915D44175E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F0B260003;
 Tue,  8 Aug 2023 22:12:13 +0000 (UTC)
Date: Wed, 9 Aug 2023 00:12:12 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230809001212.0d61539b@windsurf>
In-Reply-To: <20230808180959.28091-2-ps.report@gmx.net>
References: <20230808180959.28091-1-ps.report@gmx.net>
 <20230808180959.28091-2-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691532733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mshztIKT5Xxo2BppzJSIpweQElxUsYSJ2TcO9GUg8ek=;
 b=MfWLnmLq3/W9sUySQdtWazxUWqi1ANp20qF0U3gCIOrGlOuVM45fQQAm7ZlEVJ5Vuk/V5w
 NVXTsnzxGRFYGZ70enc2xfCasQmsd49ynyQaz5tEuJUSHgmmEVNIXrdCcyo9ouU0bsBWz3
 R2tPDW/NE2gn42Ln46Y5XZwHlefDmqA/LnqvARQGbkFaCswFQ5iMdLs49GeafUHncWUyFF
 +lcBs1rhG2I/Fy4Rb45X+4NqgP2jXAGwY7EO1FQHbkM1Esyumik4TED10FpNNer1UOTb7Z
 p7E81YuOwDQchGd8CbuGaV58usqqoflodnoDqa0YBy0Qj3LG7f0eMZqvIwOCuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MfWLnmLq
Subject: Re: [Buildroot] [PATCH v1] board/raspberrypi/config*.txt: remove
 failing 'dtoverlay=krnbt=on'
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Aug 2023 20:09:59 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> Remove failing 'dtoverlay=krnbt=on' from config.txt introduced with commit
> 689b9ac439 ("package/rpi-firmware: rework boot/config file handling") [1] by
> changing an dtoverlay option wrongly to an extra line (instead of changing
> to an proper dtparam line), but as no one complained since 2021 just

I'm failing to pase the "changing an dtoverlay option wrongly to an
extra line (instead of changing to an proper dtparam line)". I'm
confused by the "to an extra line".

Do you mean that:

dtoverlay=krnbt=on

should have been:

dtparam=krnbt=on

?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
