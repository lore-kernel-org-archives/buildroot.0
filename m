Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2294C4345F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 08:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64CEB4057C;
	Mon,  6 May 2024 08:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qTMP8idP10l; Mon,  6 May 2024 08:53:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205C340580
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205C340580;
	Mon,  6 May 2024 08:53:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A37D61BF38A
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CB2240580
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2pdkIIyo-eT for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 08:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35F794057C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F794057C
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35F794057C
 for <buildroot@buildroot.org>; Mon,  6 May 2024 08:53:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4468rF4F064185;
 Mon, 6 May 2024 03:53:15 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4468rFPs006339
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 6 May 2024 03:53:15 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 03:53:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 May 2024 03:53:15 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4468rFGk047222;
 Mon, 6 May 2024 03:53:15 -0500
Date: Mon, 6 May 2024 03:53:15 -0500
To: Bryan Brattlof <bb@ti.com>
Message-ID: <20240506085315.lb4frefetaffps6i@dasso>
References: <20240430-optee-update-v2-0-5bdc2f940db1@ti.com>
 <20240430-optee-update-v2-2-5bdc2f940db1@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240430-optee-update-v2-2-5bdc2f940db1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714985595;
 bh=6A1848SHp5JBgjAo51mewO5Q6aXQs1JQkONyzgq2gr8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ybcSxp3igckPYEJkg1ipCT3Nwt5BoURkwxgMUA74RBkzJuWKkldjfLuujFSJCHaRU
 pKHEhg67RqhK4dEdUpQwmZghqEDV052bt+Vjg79eLSSoUGPu6X06Ys2up9KXH85LAL
 k1iWN0Yypq5//Fqe2nsa5Tynv6tJHETh2Ppyd6I4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ybcSxp3i
Subject: Re: [Buildroot] [PATCH RESEND v2 02/11] boot/uboot: bump to version
 v2024.04
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 buildroot@buildroot.org, Etienne Carriere <etienne.carriere@foss.st.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryan,

On Thu, May 02, 2024 at 11:26:52AM -0500, Bryan Brattlof via buildroot wrote:
> Update to the latest tagged release of U-Boot
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  boot/uboot/Config.in  | 6 +++---
>  boot/uboot/uboot.hash | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8d2228dc7dd45..00d3f3bfbbfdd 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -41,7 +41,7 @@ choice
>  	  Select the specific U-Boot version you want to use
>  
>  config BR2_TARGET_UBOOT_LATEST_VERSION
> -	bool "2024.01"
> +	bool "2024.04"

Similar to your other patch ("boot/optee-os: bump to release v4.2.0")
changing the global default will affect other platforms so there's some
risk for breakage I suppose. Why not keeping those specific changes to
the AM62/AM64 platforms?

--
Andreas Dannenberg
Texas Instruments Inc


>  
>  config BR2_TARGET_UBOOT_CUSTOM_VERSION
>  	bool "Custom version"
> @@ -85,7 +85,7 @@ endif
>  
>  config BR2_TARGET_UBOOT_VERSION
>  	string
> -	default "2024.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
> +	default "2024.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
>  	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
>  		if BR2_TARGET_UBOOT_CUSTOM_VERSION
>  	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
> @@ -291,7 +291,7 @@ config BR2_TARGET_UBOOT_USE_BINMAN
>  	help
>  	  Use binman tool for generation and signing of boot images.
>  
> -	  https://docs.u-boot.org/en/v2024.01/develop/package/binman.html
> +	  https://docs.u-boot.org/en/v2024.04/develop/package/binman.html
>  
>  menu "U-Boot binary format"
>  
> diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
> index fbe5d215409d2..a8021fb696b1a 100644
> --- a/boot/uboot/uboot.hash
> +++ b/boot/uboot/uboot.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
> +sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
> 
> -- 
> 2.43.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
