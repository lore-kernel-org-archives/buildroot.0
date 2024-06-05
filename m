Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9B9C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 17:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25A6940502;
	Wed,  5 Jun 2024 17:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dY-W7hPf4a7; Wed,  5 Jun 2024 17:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C87BB41871
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87BB41871;
	Wed,  5 Jun 2024 17:54:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 468011BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32A5D423D9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 17:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbWpuZFDSOO8 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 17:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACC5740502
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC5740502
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACC5740502
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 17:54:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 455HsZ7N087448;
 Wed, 5 Jun 2024 12:54:35 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 455HsZEt082559
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Jun 2024 12:54:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jun 2024 12:54:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jun 2024 12:54:35 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 455HsZFu080401;
 Wed, 5 Jun 2024 12:54:35 -0500
Date: Wed, 5 Jun 2024 12:54:35 -0500
To: Paresh Bhagat <p-bhagat@ti.com>
Message-ID: <20240605175435.pbfqas47c7wpvj3r@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240604061556.3167647-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240604061556.3167647-1-p-bhagat@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717610075;
 bh=s2KZGxFGoewt7g5rXsdwXZ8A8XaQb+DieDAu45RTD0c=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=sIPe5fbK+WUudLid2qcbOptBufZytVzIDkYx4sYE17sjcdq5BcJFMiQFWWIQYvral
 5U/b2LFHOa8U2DV2OLX3QV6ur65IC2et/HrXFI+ciJickKpoc2638r9OkW6CTQnRPL
 /G62D3V02crIPZ8fwY5Nvu31lwaoMxcDLt8G6L2U=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=sIPe5fbK
Subject: Re: [Buildroot] [PATCH 1/1] boot/ti-k3-boot-firmware: Add config
 option to specify version
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Gyan Gupta <g-gupta@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, Syed Mohammed Khasim <khasim@ti.com>,
 buildroot@buildroot.org, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Oops! Just noticed some white-space issues while cleaning up.

On June  4, 2024 thus sayeth Paresh Bhagat via buildroot:
> Previously the version of ti-k3-boot-firmware (TI_K3_BOOT_FIRMWARE_VERSION) was
> fixed in mk file. Introduce a new config option 
> BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION so that user can change the version
> for ti-k3-boot-firmware using menuconfig.
> 
> This provides greater flexibilty for users to select different versions of
> ti-k3-boot-firmware without modfying the build script directly.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  boot/ti-k3-boot-firmware/Config.in            | 30 +++++++++++++++++++
>  .../ti-k3-boot-firmware.mk                    |  2 +-
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
> index d80bb4bdb3..adc201c468 100644
> --- a/boot/ti-k3-boot-firmware/Config.in
> +++ b/boot/ti-k3-boot-firmware/Config.in
> @@ -5,3 +5,33 @@ config BR2_TARGET_TI_K3_BOOT_FIRMWARE
>  	  This package downloads and installs the TI-specific ti-sysfw
>  	  and ti-dm firmware needed to boot TI K3 platforms (which
>  	  include AM62x, AM64x, AM65x and more).
> +
> +if BR2_TARGET_TI_K3_BOOT_FIRMWARE
> +choice
> +	prompt "ti-k3-boot-firmware version"
> +	default BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
> +	help
> +		Select the version of Ti k3 boot firmware you want to use

Do you mind replacing the indentation with a <Tab> + 2 <Space> here? to 
align with the help label a little better. 

> +
> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
> +	bool "09.02.00.009"
> +
> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
> +	bool "Custom version"
> +	help
> +      This option allows to use a specific official version from
> +      git.ti.org.
> +

For now ;) but same here. <Tab> + 2 <Space>

~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
