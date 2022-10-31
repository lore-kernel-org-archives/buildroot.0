Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51888FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26E840347;
	Mon, 31 Oct 2022 10:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D26E840347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4zxE5jEY44D4; Mon, 31 Oct 2022 10:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7B3D4031E;
	Mon, 31 Oct 2022 10:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7B3D4031E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E2A1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D3CC401CA
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 10:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D3CC401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flMgZCy9an18 for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 10:38:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBEA640192
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBEA640192
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 10:38:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8247440003;
 Mon, 31 Oct 2022 10:38:09 +0000 (UTC)
Date: Mon, 31 Oct 2022 11:38:08 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20221031113808.7d046f38@windsurf>
In-Reply-To: <CA+h8R2or7KY0dFzJFV-zbdx8wjhu6r=9YGNG1PLvPpoth27gTA@mail.gmail.com>
References: <20220821050119.578342-1-christian@paral.in>
 <CA+h8R2or7KY0dFzJFV-zbdx8wjhu6r=9YGNG1PLvPpoth27gTA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667212690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjJ5U7ObArI4MZlVg5QR60rrFRQPBdznuAIx2Bqt1GY=;
 b=ZJwzI2jlXCSYWtyw4Y9r3Wu1NK0MM76OVNIL9ZGrZNFkQtUyijgPpCGUG2L8vZBVVWM371
 85/bQLNxVpb5dWKTKI6LFV8M00qKvFzWiz4Tdpqfxa/nd20iLQRDY9vyHilplpWAKSzjFF
 IxxNmFQJ30GFGqIsdXe1vYmM8mVJ79O4MnuAh0d3Jh3U8C2SRl+YsZxV1HUIdv4dzvJR2C
 D2asIWXifVJvY6b12Jp32DLmns4Gg0swnjMkNE2eeEXS3EqK9Wm0O3ffOxw4ZsOwrQVc+z
 HJH1CxxWuXqo35BpDRUrm6kFxbg17S1EabGHhaqyfIypQI+8xmrMaix+WDc6jg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZJwzI2jl
Subject: Re: [Buildroot] [PATCH v1 1/1] package/conmon: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 18 Sep 2022 14:04:08 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> This package requires a dependency on host-pkgconf and libglib2
> 
> I will include this in the next revision.

ACK, patch marked as Changes Requested then.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
