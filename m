Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CECCC001DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 22:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EF141554;
	Sat,  5 Aug 2023 22:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0EF141554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1F_Vobty8sBw; Sat,  5 Aug 2023 22:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB92402F3;
	Sat,  5 Aug 2023 22:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FB92402F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9021BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2D1410B1
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2D1410B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zCRETiSGgayd for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 22:43:34 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 960ED401F5
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 22:43:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 960ED401F5
Received: by mail.gandi.net (Postfix) with ESMTPSA id 899411C0002;
 Sat,  5 Aug 2023 22:43:30 +0000 (UTC)
Date: Sun, 6 Aug 2023 00:43:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806004329.629ef51c@windsurf>
In-Reply-To: <20230805213326.3588196-1-bernd@kuhls.net>
References: <20230805213326.3588196-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691275411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=50SWlk25f8Ncz/czwoYVcXCq1sdGeDAzF9w6uMjYpu8=;
 b=Y8SJ3Xn5L/ENGkDXVc7sx1Hmvpjt2hMu6fhMQH6bMP/xQj4r8KhmorjMz+MQvRckmC5T2v
 jBu+dAgUjOgo44K3wtfmEikF3KDemUDrpnXmc5NZBtIy8hKPZRdB6z6KIYUaDmBytY3WCb
 MABp4CGHx2qrdxM26kpvGpyyJxrjloO9bAgPVrAxIlNfu2ajfUZaRw/O/pTmzVijW/Mikw
 LnZyHCvTfPSwhdJZ1/5R7i6DF8uIg4SS2nuw7LrfMo2CyxmNtk8LBKIdopoJIp10+em80b
 howUCHPQYKa2bWWBBNF7WVyJES5GFiZ4L/WMIJy3PYOojI4AT7uFna9+m+dZGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y8SJ3Xn5
Subject: Re: [Buildroot] [PATCH 1/1] package/gmp: bump version to 6.3.0
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

On Sat,  5 Aug 2023 23:33:26 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Removed patch which is included in this release.
> 
> Release notes:
> https://gmplib.org/list-archives/gmp-announce/2023-July/000050.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  ...z-inp_raw.c-Avoid-bit-size-overflows.patch | 27 -------------------
>  package/gmp/gmp.hash                          |  2 +-
>  package/gmp/gmp.mk                            |  5 +---
>  4 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch

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
