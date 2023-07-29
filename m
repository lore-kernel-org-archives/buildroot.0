Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB681C00528
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 22:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E3CC8202D;
	Sat, 29 Jul 2023 22:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E3CC8202D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVeLIF1dSHGR; Sat, 29 Jul 2023 21:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C869E81FE9;
	Sat, 29 Jul 2023 21:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C869E81FE9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5C4B1BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C749409C3
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C749409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eR_KYs10EGZg for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:59:31 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61431409B6
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61431409B6
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6B5640004;
 Sat, 29 Jul 2023 21:59:27 +0000 (UTC)
Date: Sat, 29 Jul 2023 23:59:26 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230729235926.3a4a6c5e@windsurf>
In-Reply-To: <20230507214317.409305-3-bernd.kuhls@t-online.de>
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
 <20230507214317.409305-3-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690667968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E1HP4kBvX7Bm47vwoS6qBBZPCvMd+UPDLMLcyhyZW/k=;
 b=DwQ79rCLXvu45Cw4s2f8JKsLeCy3PWu/5Yhvfxz54MJO3UpbV1Gi+zd6zwINFhjpGifqXU
 Z0pbvyfAZfZwts3fRV+CQV7UbzCmvFxNje98/Hmxu5dhK3Mc+0b5XD+tGhV4AlMWCfv/03
 67wvdAl9twd8+IkRuC/fFGMFxNzG8mTgM33U1vah2fidEV20tfNoP/mDIH5WAS/KJdzo+t
 OFaRXpD+5ZU6NuavEfnwknS+cw/pwvmoptxqOck26nZroYPDXKqCrPbv9tmdQkndvl1aNl
 ovGqChfJ+U3bXWJPHk/2P7myvCcu43sktmBkqhTNtJ5v+jz66iuMavARJaiP/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DwQ79rCL
Subject: Re: [Buildroot] [PATCH 3/5] package/kodi-inputstream-adaptive: fix
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

On Sun,  7 May 2023 23:43:15 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...de-missing-cstdint-to-support-gcc-13.patch | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch

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
