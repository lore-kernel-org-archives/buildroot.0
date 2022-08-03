Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BDFC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 08:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E65740A97;
	Wed,  3 Aug 2022 08:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E65740A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoriCPW8VN91; Wed,  3 Aug 2022 08:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAA0B40A8C;
	Wed,  3 Aug 2022 08:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAA0B40A8C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 270F01BF5DA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 08:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E89D381B7B
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 08:55:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E89D381B7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCef7PkFoJ6f for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 08:55:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7C6E81570
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7C6E81570
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 08:55:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4E7D460006;
 Wed,  3 Aug 2022 08:55:53 +0000 (UTC)
Date: Wed, 3 Aug 2022 10:55:52 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220803105552.64bba905@windsurf>
In-Reply-To: <20220803063145.27856-1-mf@go-sys.de>
References: <20220803063145.27856-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659516954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qW0L4WFM+gyZ9NCWBuRUV9QWmcUY5k2459gQHM0Ecjo=;
 b=TVliCk7099XXTVEMQupTq92PeGGzVH6CahkfqQ48lVfJz8z9HKrYAKrfIDiMJhd69rY+XV
 iYyhtTNSxWcYoavHYwb7O8cXH2fe7E6TlixUZRJpAqET9afoMTvYsmYGz74GZP1GGbEpRJ
 t+ak7T8mIeg9nPB5K53cVnUX0N45/wuOY3CeS0//fzY9ZO02Un/H3yg1ZXM45eGbMB2gCt
 99ODgeLc+cjG6QjfHQqt9dfCvikGwkYIwZetyf7N2EMLX0MYjX1OduY43QGAbo77y7Fb3z
 h4WyFvp+AaLOAiE0VOHwIzsv/Z8eltkacrjoaoYUem3Ftsm1cMfPlUDWs/2h0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TVliCk70
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuplot: bump version to 5.4.4
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 3 Aug 2022 08:31:45 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/gnuplot/gnuplot.hash | 8 ++++----
>  package/gnuplot/gnuplot.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
