Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39D2C369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 20:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D9D182105;
	Wed, 30 Apr 2025 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7xV-1p2Lh7g; Wed, 30 Apr 2025 20:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 415EF820FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 415EF820FF;
	Wed, 30 Apr 2025 20:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F07C4236
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 20:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6889400EA
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 20:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83jNZk04IQxI for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 20:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.235;
 helo=lelvem-ot02.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1D2A40199
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1D2A40199
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1D2A40199
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 20:06:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53UK69dY020507
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Apr 2025 15:06:09 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53UK69R5059679
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Apr 2025 15:06:09 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Apr 2025 15:06:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Apr 2025 15:06:08 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53UK68Qd039910;
 Wed, 30 Apr 2025 15:06:08 -0500
Date: Wed, 30 Apr 2025 15:06:08 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: <buildroot@buildroot.org>, Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi
 <X15000177@gmail.com>, <linux-amarula@amarulasolutions.com>
Message-ID: <20250430200608.y6l5qvlswb2cq6dp@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250429222236.823478-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429222236.823478-1-dario.binacchi@amarulasolutions.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1746043569;
 bh=9IzHnG0zJ01vQ+u1Yh9A9dSMRLUV0Ll/hH8SXFsVjoM=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ikeyHkgvu4ZpfO/5cNYFzZqle0Zl5QtDRDV8pK/mNNrdu7lIku+VfR4VMQSnoX/aY
 7pEUXdx0J+GkkCHdcnhTiKPX5JGHNVjZUFrH0/JXmGRsNZoURN5XT0TeJtFXxqSK8k
 gmVjUXD/lGFMJFFKZaFb8d1zSxTAkhrJYOuTWEH0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ikeyHkgv
Subject: Re: [Buildroot] [PATCH 1/1] boot/ti-k3-boot-firmware: bump to
 version 11.00.11
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

On April 30, 2025 thus sayeth Dario Binacchi:
> Release-notes:
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tag/?h=11.00.11
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Bryan Brattlof <bb@ti.com>

I'll have to ask around internally if someone got anywhere with finding 
a better way of doing this. The TI firmware needed for U-Boot are not 
updated this often but because it's based off linux-firmware we add a 
weekly tag to it to keep everything in sync.

~Bryan

> ---
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash | 2 +-
>  boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> index d9cb66cd6a27..571bbf121949 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  ab20ffbe7bba7e94be246b3417d33a914b3f07c16c47ef5a7f7602349a666a61  LICENSE.ti
> -sha256  884c454b1a518e6d31304acb201493156685fb8ff111383c842bb292a1b35c9b  ti-linux-firmware-11.00.10.tar.xz
> +sha256  f9e09b84e206d605a9fb5691a325dcd4a7d6a3e6bf70a69cbc169d1a5c617804  ti-linux-firmware-11.00.11.tar.xz
> diff --git a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> index e04165edd1e0..117c0a9a5ade 100644
> --- a/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> +++ b/boot/ti-k3-boot-firmware/ti-k3-boot-firmware.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TI_K3_BOOT_FIRMWARE_VERSION = 11.00.10
> +TI_K3_BOOT_FIRMWARE_VERSION = 11.00.11
>  TI_K3_BOOT_FIRMWARE_SITE = https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/snapshot
>  TI_K3_BOOT_FIRMWARE_SOURCE = ti-linux-firmware-$(TI_K3_BOOT_FIRMWARE_VERSION).tar.xz
>  TI_K3_BOOT_FIRMWARE_INSTALL_IMAGES = YES
> -- 
> 2.43.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
