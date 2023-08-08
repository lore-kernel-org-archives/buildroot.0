Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7958FC001DE
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 07:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E46E40A7D;
	Tue,  8 Aug 2023 07:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E46E40A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id la0CF2i0TbYF; Tue,  8 Aug 2023 07:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F1FD40A5E;
	Tue,  8 Aug 2023 07:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F1FD40A5E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEC021BF82F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88B7D81F3E
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 07:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88B7D81F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i2XSRpUi44-J for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 07:45:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7831F81F56
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 07:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7831F81F56
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DBD41BF20B;
 Tue,  8 Aug 2023 07:45:54 +0000 (UTC)
Date: Tue, 8 Aug 2023 09:45:53 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230808094553.5a518729@windsurf>
In-Reply-To: <20230808070245.368539-1-thomas@devoogdt.com>
References: <20230808070245.368539-1-thomas@devoogdt.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691480754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2rNoxycNAkQLCqDUK+yRNMHqBVE72d96IoXctJ4dDs=;
 b=TR37WDivxpIxMpm4nW+RHVK+FG2gbdrq686a6wMFI0JAk3EvTHJiFRYE65COpLdoTxeD7j
 eSXwSZwZayQr9FHFsrLF8bF2cZxaeX3t+129RK9dUeLFUdcUv+AushMt1R/JnlKMyaW4nf
 IRR7051QzynJHiMsI0ucxBDPvPdvXAqR/uz8HyvFGOVyJicFSWLl2p3y5sb5glKy3sNfFx
 GAVa8chlw1ESMh517A83nzsj8dpsmZ/GkssVQLGjbbhiebcNqpHT64HiQFA7gbPwl99Elz
 8+78OhAQuDrjm4DMAMXkkBKRO89bu6ix6w92ZQczNm4k+Z5TZWLgK14wfixFkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TR37WDiv
Subject: Re: [Buildroot] [PATCH v1] package/qt6/qt6svg: use the CMAKE_NINJA
 flag
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  8 Aug 2023 09:02:45 +0200
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
> to specify what cmake backend to use, instead of special-coding it's use.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> Same change as for qt6base, qt6serialbus, and qt6serialport.
> Missed that one because I searched for --build on an older clone.
> ---
>  package/qt6/qt6svg/qt6svg.mk | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

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
