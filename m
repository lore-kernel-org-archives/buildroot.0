Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA59FCDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 10:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82972416DA;
	Mon, 16 Oct 2023 10:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82972416DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0lkLqkyMSnT; Mon, 16 Oct 2023 10:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 893184179D;
	Mon, 16 Oct 2023 10:12:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 893184179D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 232F61BF327
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09322418B0
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 10:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09322418B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1v7tTbo7W1Q for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 10:12:25 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD7CF418AF
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 10:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD7CF418AF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AA0A20003;
 Mon, 16 Oct 2023 10:12:20 +0000 (UTC)
Date: Mon, 16 Oct 2023 12:12:19 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20231016121219.13dee053@booty>
In-Reply-To: <20230924151205.2099293-7-neal.frager@amd.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-7-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697451142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuIDYmmFMGrtkoDwWCqcZh13HDH375b+ty/Ozb+8HIs=;
 b=JL0Esn7GEJeBMse0AoqkqP9Mycbn9DUDtkux9oZvRWLpx9oANzzQUKqO0q5ULEkRsybMFT
 t61Ytd6AT5uwr0TuRRoiS28XdB6gW+GWctgqV6o2rIGEZidlEnbCvfamJ5853je4dPFFeF
 TxNqSBnUmf7BOsSwDXcSplcub7nCkjrdW3++ysWaoi6td5ck9qfSeFY1E1taYdoitZT1NL
 GwGgflz7piTS0vKpxJDsWBOuE/PzUpWVhuBkfXaF2UPsQGtYDktjcl3HNERygXhKt3tfVE
 Oj2LI8p0TCH1wPt+DUGFKTC3jGuXXLNam16j1hSaBm853QqrtU29xt5LD0hO3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JL0Esn7G
Subject: Re: [Buildroot] [PATCH v4 07/10] configs/zynqmp*: build pmufw source
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 24 Sep 2023 16:12:02 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch migrates the zynqmp config files to use the new
> zynqmp-firmware package for building the zynqmp pmufw from source.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
