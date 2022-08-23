Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E694C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97109409E2;
	Tue, 23 Aug 2022 21:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97109409E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kz_PrnihH4wD; Tue, 23 Aug 2022 21:39:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9FA1403C8;
	Tue, 23 Aug 2022 21:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9FA1403C8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B55F1BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9FDE403C8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9FDE403C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQnwLBq3cq0v for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:39:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8EAB403C2
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8EAB403C2
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:39:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 91820240006;
 Tue, 23 Aug 2022 21:39:36 +0000 (UTC)
Date: Tue, 23 Aug 2022 23:39:35 +0200
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Message-ID: <20220823233935.047ae825@windsurf>
In-Reply-To: <20220816070517.2770099-1-bram.vlerick@openpixelsystems.org>
References: <20220816070517.2770099-1-bram.vlerick@openpixelsystems.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661290777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aS1Y/Vlb04Trsl+amLcn5WbUGINBMftbF+Fyggy2XqM=;
 b=GPl+GT3osmaVh9PXMQRF7ezbgaUHi3eZ9B3ee+BUey7abJoLqTSYktOIVCg/CwpVLfyLGL
 F+u9xuxx7d7VJcEA6+D0Yu3qN71xtMMk4yDUhqLCNkdKTQKyE94Y8Ei273gJm+3ERiQpx4
 v0jA2BcrFILxzd4OjRmFALj4mjEp24tTBW0iTIGRvlKUolWADr2FAJGKfIe9KMJ2Drs+eF
 Yv9PsIifqj9k4ryqBfJv+wSSM2dw3e6lmH+xGbueD+NbqoWo2Ji/MB1Hr31HIQtyaawkgy
 kZGDAgwSOCDEHsqJa1/FWr8pAqEsF8L0bWKflUBOkNaFKM6j2+/daN9u05yqAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GPl+GT3o
Subject: Re: [Buildroot] [PATCH v2 1/1] package/freescale-imx/firmware-imx:
 allow ddr firmware version override
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bram,

On Tue, 16 Aug 2022 09:05:17 +0200
Bram Vlerick <bram.vlerick@openpixelsystems.org> wrote:

> Add support for selecting a specific version of the DDR firmware
> version. For example Variscite's imx8mp-var-dart SOM requires the
> "_202006" version of the lpddr4_pmu_train_* binaries.
> 
> Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
> ---
>  package/freescale-imx/firmware-imx/Config.in  | 10 +++++
>  .../firmware-imx/firmware-imx.mk              | 39 +++++++++++++------
>  2 files changed, 37 insertions(+), 12 deletions(-)

Thanks for this new iteration, which I have applied to our next branch.
This means this change will not be in Buildroot 2022.08, but in
Buildroot 2022.11.

Thanks again for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
