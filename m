Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A61C83F1B
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 14:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91BA583A90;
	Thu, 10 Jul 2025 14:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XB-2ptQglTsW; Thu, 10 Jul 2025 14:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C63783A95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C63783A95;
	Thu, 10 Jul 2025 14:01:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EA2E12E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 14:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D9840E1F
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 14:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUMrsF5IvJfw for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 14:01:47 +0000 (UTC)
X-Greylist: delayed 547 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 10 Jul 2025 14:01:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5985540534
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5985540534
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.245;
 helo=fllvem-ot03.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5985540534
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 14:01:47 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56ADqc6M1521447;
 Thu, 10 Jul 2025 08:52:38 -0500
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56ADqcZJ3559064
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 10 Jul 2025 08:52:38 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 08:52:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 08:52:37 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56ADqb9X1755428;
 Thu, 10 Jul 2025 08:52:37 -0500
Date: Thu, 10 Jul 2025 08:52:37 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: <buildroot@buildroot.org>, Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi
 <X15000177@gmail.com>, <linux-amarula@amarulasolutions.com>
Message-ID: <20250710135237.7skksf5ewrhrmmyo@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250709222624.9650-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250709222624.9650-1-dario.binacchi@amarulasolutions.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1752155558;
 bh=NY2fO1qMHx1gEy1jcxOxzHz5tDmTBsHGoOHQibhaPGc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=laq/d++QoQtxNDrUGJu6DStAymTg2nzQanC10rgGj6Gwg7C6rXCRi4In91N4VxZyD
 zsRDS3MgkdQXfQkiDJSyTx4YxxIMV23vhNGaaUrZKgFhnP48NqE26a3TyKpwuhQw26
 6vrR0RwH33B3kRxvb0Y6XYKCD+md7TyPArrm4TvY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=laq/d++Q
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and
 Linux versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On July 10, 2025 thus sayeth Dario Binacchi:
> This patch bumps:
> 
> - U-Boot to version v2025.07
> - Linux kernel to version 6.12.36 (LTS)
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
>  board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
>  configs/ti_am62x_sk_defconfig              | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 

Thanks for updating these!

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
