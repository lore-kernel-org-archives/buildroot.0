Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A7DC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7BCB4184B;
	Wed, 30 Aug 2023 21:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7BCB4184B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1Izx444LIMDW; Wed, 30 Aug 2023 21:56:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0E2F41823;
	Wed, 30 Aug 2023 21:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0E2F41823
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 924CA1BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6980941C1F
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6980941C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndbO-H8oLBNr for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:55:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41D9F41C14
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41D9F41C14
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3EDD2E0002;
 Wed, 30 Aug 2023 21:55:01 +0000 (UTC)
Date: Wed, 30 Aug 2023 23:55:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230830235500.762321df@windsurf>
In-Reply-To: <20230830204509.1181166-1-bernd@kuhls.net>
References: <20230830204509.1181166-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693432501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xry6/DBkYdU1A1U4iZ9vB00NwwxaiqN/X1FPvltuX4I=;
 b=p6/LYmLaYDoURsMXgCfRxSQ85bmD/SEfvV3Y4sWiRCJy88VbU5V6LclF1CucdIfRHW6yTq
 qNRK9gOgmTgfVa5vn1xNSqMosecvIFZak5MtI/MMs8IdyFlV6CJiU3YXVvmboNq+OXaM2p
 Mh4KGB0XoVG9Ug8BW18i/jtKHaW4PwMaqJv4CBaJ7Lno/WT23IeYeBrU0FTqQwFAGe2Sxx
 fPXSYImxWAJLRduyZWCUlGGhrInQT7AjRNXNuRejF2qB8pZycY3fpobgUHXO7Ur1qS/zcl
 VhdClGrc1oHU8VpBb+53+4JlG3xUsRFEVehfs84hZZ+TXQbpK6vCooVcADGpBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p6/LYmLa
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to
 2.4.116
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

On Wed, 30 Aug 2023 22:45:09 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.x.org/archives/xorg-announce/2023-August/003416.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdrm/libdrm.hash | 6 +++---
>  package/libdrm/libdrm.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
