Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ABFC0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1C1881EEA;
	Sat, 29 Jul 2023 22:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1C1881EEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POH2AqcgOuiq; Sat, 29 Jul 2023 22:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4071581F08;
	Sat, 29 Jul 2023 22:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4071581F08
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E187D1BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC01C4016B
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC01C4016B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGpLlcgxds0u for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:59:42 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4B1240165
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4B1240165
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9337C1C0002;
 Sat, 29 Jul 2023 21:59:32 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:59:31 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230729235931.1af871e8@windsurf>
In-Reply-To: <20230507214317.409305-4-bernd.kuhls@t-online.de>
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
 <20230507214317.409305-4-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690667978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdNfzJjrfLmNKSOMvtJVoemMoMQHb43iWK52O05Lp68=;
 b=APaGBUF3tDjfTqioGWFCXO+1dMtf8dmDgedXDagGAnbKNcC0JBTWtGEtSkvipyj6fJPKxk
 2bG7bPAG6KUkwKiBffkcq+0+AYcHzrW4W/3MJiHWGrwnhZansXB+7dxRxSyvq7RaSQ1gnS
 HLfHC/h6FRNYx+pA7E9x3FXHht8HUqvakgblj89Oe3lqsS4HitTJ2vQzbAA7m1wFj2TQqW
 dE2zeQu9ytwIfJrD0XXeqEsb5SagVPpRvqXzDzKQMvl9p8QINnr0MmTKWuZEucF0ZP9L1h
 XyF5lX2gX6XPT3Qd1n3gNOD4fy7DAoc90K37RXVTHnh4xUh3nEG3D1tnav0/ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=APaGBUF3
Subject: Re: [Buildroot] [PATCH 4/5] package/kodi-inputstream-ffmpeg: fix
 build with gcc-13
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 May 2023 23:43:16 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...de-missing-cstdint-to-support-gcc-13.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch

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
