Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FE6EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C951041F93;
	Wed, 12 Jul 2023 21:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C951041F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g5jVniAr5Ssv; Wed, 12 Jul 2023 21:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DACBB41F83;
	Wed, 12 Jul 2023 21:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DACBB41F83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED521BF400
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8A9741F8D
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:02:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A9741F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmzQf1_raip9 for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:02:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8618D41D89
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8618D41D89
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:02:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 154EBFF802;
 Wed, 12 Jul 2023 21:02:07 +0000 (UTC)
Date: Wed, 12 Jul 2023 23:02:06 +0200
To: Grzegorz Blach <grzegorz@blach.pl>
Message-ID: <20230712230206.359c037e@windsurf>
In-Reply-To: <20230611233619.128038-6-grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
 <20230611233619.128038-6-grzegorz@blach.pl>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689195728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZ3/4pP6jrgt0f75GkwYNO3vyZxoqvDscVXgnq+ViZI=;
 b=fF8xX1xj/V/2BpQZ9ZpqPGDaAtIny07rmmJxaAY0QYkm0TPEL6GEgakW31mrNWPEGd+j2u
 iCPWlBLgPkbBH31z3daX2YxQu6obzrKfPflYa4RLQkru4uD7BUC9B0ISqn1JhQFv7hnHUB
 EA6R4RH77+kE0U1R/C+J6A4iE91Qo4VL143aavLDKQgW2GGOsPa0Se3dxIO50OIuCB+/zZ
 WxK4qblJ0yV03su7o/qsBHzqwRQ6Gv9peDXImC65c7AJmKw9hpCj80PyObtDzbQRf19Lzm
 Ul2Rf3kR1qKX7UYhFo0mJ/kXgYkF1T2fTHuPkFZx0HDy6Sq/Ubxw4ooRaZEs/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fF8xX1xj
Subject: Re: [Buildroot] [PATCH 6/6] package/python-rpi-ws281x: bump to
 version 5.0.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 12 Jun 2023 01:36:19 +0200
Grzegorz Blach <grzegorz@blach.pl> wrote:

> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  package/python-rpi-ws281x/python-rpi-ws281x.hash | 4 ++--
>  package/python-rpi-ws281x/python-rpi-ws281x.mk   | 4 ++--
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
