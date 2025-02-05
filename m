Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821CBC02193
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 01:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE89F60634;
	Wed,  5 Feb 2025 01:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WiJQXJRY1yC; Wed,  5 Feb 2025 01:09:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A7C60BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4A7C60BA2;
	Wed,  5 Feb 2025 01:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB456185
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 01:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E615360BA2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 01:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1d02Kn_Ek6-h for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 01:09:34 +0000 (UTC)
X-Greylist: delayed 952 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 05 Feb 2025 01:09:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EAFDD60634
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAFDD60634
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.234;
 helo=lelvem-ot01.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAFDD60634
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 01:09:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5150rbEw3320487
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Feb 2025 18:53:37 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5150rbtp090772
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 4 Feb 2025 18:53:37 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 18:53:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 18:53:37 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5150rblf126680;
 Tue, 4 Feb 2025 18:53:37 -0600
Date: Tue, 4 Feb 2025 18:53:37 -0600
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <buildroot@buildroot.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>
Message-ID: <20250205005337.ibq6dgouhiqorcaa@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250204183813.2414194-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250204183813.2414194-1-miquel.raynal@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1738716817;
 bh=nNZklfvXTKaR65Yo/yIPHNdOX7PJo4bjmdrAB8oqeXY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=yd7SxO18C1eZEgR2lj3/hb6f2t74EPob7Q3rZNyQX93jxSp0aR5f/E9fbi31GPts3
 QMb7iookGjV9O+T0WiitjCwUkUHiS9aiGU6akMlLi3Y6f6OvwYdRRgX8I1nlH3p21D
 YRFYb3ptpoJZ0XNc0uqCCT1h3IEX+uEmhT86ulj8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=yd7SxO18
Subject: Re: [Buildroot] [PATCH] configs/ti_am62ax_sk_defconfig: Fix kernel
 configuration
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

On February  4, 2025 thus sayeth Miquel Raynal via buildroot:
> The k3-am62a7-sk.dts describes an I2C PMIC TPS659312 which features a
> number of regulators. One of them, ldo1, is used as power supply for the
> SD card host controller regulator. When the rootfs is on the SD
> card (like with this configuration), we need support for these three
> components (Regulator driver, I2C PMIC glue and PMIC MFD driver) to be
> built-in in order to avoid boot failures.
> 
> Tested on an AM62A LP SK.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> --
> Backport to: 2024.11.x
> The issue was probably there in 2024.08.x as well but I haven't tested
> and the kernel has been bumped since then.
> ---
>  board/ti/am62ax-sk/linux.config | 3 +++
>  configs/ti_am62ax_sk_defconfig  | 1 +
>  2 files changed, 4 insertions(+)
>  create mode 100644 board/ti/am62ax-sk/linux.config
> 

Ah nice catch. I guess my card is too old or worn enough that I wasn't 
going into these UHS modes. Looking at the conversation in the kernel[0] 
it looks like we either add this config or transition to an initrd style 
boot. I like this one better for now

Reviewed-by: Bryan Brattlof <bb@ti.com>

Thanks again
~Bryan

[0] https://lore.kernel.org/linux-arm-kernel/20240821110054.35u5ubgaogzjv6c4@rover/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
