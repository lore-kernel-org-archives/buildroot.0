Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA7CC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CAE5421FD;
	Mon,  6 Nov 2023 22:32:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CAE5421FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqlR5NKCKBYG; Mon,  6 Nov 2023 22:32:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677E9421EA;
	Mon,  6 Nov 2023 22:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 677E9421EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B75231BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FD9C612C6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD9C612C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EYLg-_BgeOmZ for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:25:59 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84A8761286
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84A8761286
Received: by mail.gandi.net (Postfix) with ESMTPSA id B813960002;
 Mon,  6 Nov 2023 22:25:57 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:25:28 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232528.13533718@windsurf>
In-Reply-To: <20231105033953.2797111-1-james.hilliard1@gmail.com>
References: <20231105033953.2797111-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZmRrsZIw1+oC1TLAA+vSEFB81eYZ7CKRO8cBx6rkLR0=;
 b=CdB+0/lxvNlBuYwf0fYXgT8qfxoyf0Zv2BTuR5Kj8UfFTN2f3srgDswI/8KE9qRdut6Pme
 Neuwr+e5cLCqvzSSaToz6RNfPMW+Fay5m6Kttd5MQ0Fkmv0Qjw/bdalogb/k9K7BvPvdNq
 BXWIVaTKCjpNjkcSCXwbdeUZ322S3MCSmbSN890fQP4RoGNiMZsmhgjQIt1xDJOpcr3veU
 G9iL9pRzFVv1lUA0YyeXQ6tSnsu28DO2tdTniVydXrYPuTyoUwfWn7D++6R0oPqlfnlNJq
 wJvzd5zQ+HRCWRDnRjwPIKok5XOiSX3MKvfwb7bL1DI+TlCVWHFPp2CKThqLjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CdB+0/lx
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cssutils: bump to
 version 2.9.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  4 Nov 2023 21:39:53 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cssutils/python-cssutils.hash | 4 ++--
>  package/python-cssutils/python-cssutils.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
