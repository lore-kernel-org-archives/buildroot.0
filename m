Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41DCC00528
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 22:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 929AA402F3;
	Sat,  5 Aug 2023 22:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 929AA402F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjHIzSXfvuPI; Sat,  5 Aug 2023 22:44:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A679E409F2;
	Sat,  5 Aug 2023 22:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A679E409F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6053C1BF28F
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66684408C5
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 22:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66684408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOzxP_7DP95v for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 22:43:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65BCC405DF
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 22:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65BCC405DF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D89DC0004;
 Sat,  5 Aug 2023 22:43:45 +0000 (UTC)
Date: Sun, 6 Aug 2023 00:43:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230806004343.43412b00@windsurf>
In-Reply-To: <20230805213505.3588260-1-bernd@kuhls.net>
References: <20230805213505.3588260-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691275426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogt/qTF0Igz4jwKLpdy/jyduao2VgzTELMe6sX3px7s=;
 b=Pq67+ohZ5vtGNCaS4Fduo41RwAEC80JG05iHr1dlalPRUJHy7HCNgqrUQ/wn1OfYwIHhg1
 4812w/tWCU3NYm5MQ58jzeFVu6oXLed1LmARkWd32W56st4F8LhYS4Xi82ruabsXUN1ZwY
 /akAM+UjVZ7idkKH54Z7PMjUu8+vq26uKGCHM1AfdShxvp/JyxZHJPrXeMFomYxFTBU4N+
 D4CDo+flnIjcTUsXb3+8RgZCIpMceBMywz7sKtZ2D9aZ4U23EKL+Jdpsr9HWtisU2RFnhv
 DoV5ThU0b+ynKX70wZH5OJRgJ86GIfANfFW7WJ+IVlpi3DD2xARdOlT2ZznZGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Pq67+ohZ
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump version to 0.3.77
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Aug 2023 23:35:05 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/pipewire/pipewire.hash | 2 +-
>  package/pipewire/pipewire.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
