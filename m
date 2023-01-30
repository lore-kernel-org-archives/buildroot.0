Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D33C636D3
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9A7340B84;
	Mon, 30 Jan 2023 21:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9A7340B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bGEhfmuZR_e9; Mon, 30 Jan 2023 21:51:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F320440C00;
	Mon, 30 Jan 2023 21:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F320440C00
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A6BF61BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8042381985
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8042381985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IunqC4zEn-7t for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:51:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598A7817BD
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598A7817BD
 for <buildroot@busybox.net>; Mon, 30 Jan 2023 21:51:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4DF7A240003;
 Mon, 30 Jan 2023 21:51:13 +0000 (UTC)
Date: Mon, 30 Jan 2023 22:51:12 +0100
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20230130225112.44782784@windsurf>
In-Reply-To: <20221128104057.19164-1-mf@go-sys.de>
References: <20221128104057.19164-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675115473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ITjnMWRC8D87Y2p/6tOX5+9PrnXFSYNMCZRxb68k78=;
 b=guVSKmEtw7ndh+6ti11lk2DGlI+fMIrVioBa5sZ35oRfToHmVXQUBkZXjA1/HjhODRfefD
 zindvDbjvXgDEugH69CW5ra8l0sDkj2GcJYXil5gvRsWxML5Tzs/Gm0VvHnjtdV0Eckd5g
 bqFZSWHOuMTeOL/HAL4EjTM+n+bfsUqZmDvvWLzqfWreiK3IzCSZsbCY8leI8Oqbu7COZK
 qIUPEqS2f/HaZVYfJ1DWOwaYeFLC5ML27hb9sqAipVzKLn5Z6pRLE06m5D0BNLiKT3X5dK
 txiOHRDNp28Y2+Ljd+R6hh+OrfMM2NcsekEN2+DFONmdj9qR7jV0JOA1fZ+Elw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=guVSKmEt
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.26.0
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
Cc: buildroot@busybox.net, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 28 Nov 2022 11:40:57 +0100
Michael Fischer <mf@go-sys.de> wrote:

> patch 0001: already applied upstream
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  ...t-have-a-mode-configured-use-the-pre.patch | 76 -------------------
>  package/sdl2/sdl2.hash                        |  4 +-
>  package/sdl2/sdl2.mk                          |  2 +-
>  3 files changed, 3 insertions(+), 79 deletions(-)
>  delete mode 100644 package/sdl2/0001-If-a-CRTC-doesn-t-have-a-mode-configured-use-the-pre.patch

Sorry for missing this patch, but in the mean time, it has been
superseded by:

  https://gitlab.com/buildroot.org/buildroot/-/commit/d33a8417bf1bc5d7276e19da5c37da210d4de31a

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
