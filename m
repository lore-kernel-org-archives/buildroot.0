Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A4FC19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 12:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B10F240614;
	Wed,  8 May 2024 12:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0iECvf5DWIa; Wed,  8 May 2024 12:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B19DD408D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B19DD408D5;
	Wed,  8 May 2024 12:05:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 717741BF3EE
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 12:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A75740854
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 12:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpPwNorUYCid for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 12:05:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D9B174075C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B174075C
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9B174075C
 for <buildroot@buildroot.org>; Wed,  8 May 2024 12:05:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 448C57Fd123359;
 Wed, 8 May 2024 07:05:07 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 448C57Jt065603
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 8 May 2024 07:05:07 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 May 2024 07:05:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 May 2024 07:05:07 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 448C57j4038151;
 Wed, 8 May 2024 07:05:07 -0500
Date: Wed, 8 May 2024 07:05:07 -0500
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20240508120507.iooiohvqwltvqkt7@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
 <20240430-optee-update-v2-5-5bdc2f940db1@ti.com>
 <20240506221040.7d93b31e@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506221040.7d93b31e@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1715169907;
 bh=dHGZYIsoDrleeAsyW5hNGmTy1wUYeZ/YRyrnbwHeU1U=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=i+VA4VTYMNmMlhM+RA5YfuW5Y1yYAd63869tNWd0mvN3SV4LWrYXptWjHqWA4VYgo
 7Pvcp9RCUWNuCVz0tQsplWAec/nrpl3p7HycC7FrObwByQZQ0n2xsBSxumuHUrZZzd
 oTeVinfAm2A9crHOFX2F+N50AYHfCjT8dpKrJfDU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=i+VA4VTY
Subject: Re: [Buildroot] [PATCH RESEND v2 05/11]
 configs/ti_am62x_sk_defconfig: update TFA to v2.10
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Anand Gadiyar <gadiyar@ti.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On May  6, 2024 thus sayeth Thomas Petazzoni via buildroot:
> On Thu, 2 May 2024 11:26:55 -0500
> Bryan Brattlof via buildroot <buildroot@buildroot.org> wrote:
> 
> > Update the TFA firmware to the latest LTS tag for v2.10 release of
> > arm-trusted-firmware
> > 
> > Signed-off-by: Bryan Brattlof <bb@ti.com>
> > ---
> >  .../ti/am62x-sk/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
> >  configs/ti_am62x_sk_defconfig                                           | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> The update of TF-A/U-Boot/Linux in one defconfig could be done in one
> single commit, so you could have done:
> 
>   configs/ti_am62x_sk: update Linux, U-Boot, TF-A
>   configs/ti_am64x_sk: update Linux, U-Boot, TF-A
> 
> This is generally considered a good enough split.
> 

Ah that's a good balance. Thank you

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
