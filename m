Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D68BC27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 17:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E57D340272;
	Fri,  7 Jun 2024 17:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvR4qIp83C4o; Fri,  7 Jun 2024 17:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA20405EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CA20405EC;
	Fri,  7 Jun 2024 17:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B78071BF479
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF87684C93
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 17:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enWrPsf9DEZh for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 17:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 515CB84C92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 515CB84C92
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 515CB84C92
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 17:26:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 457HQIeT044842;
 Fri, 7 Jun 2024 12:26:18 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 457HQIE4005999
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 7 Jun 2024 12:26:18 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 12:26:18 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 12:26:17 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 457HQHWa112821;
 Fri, 7 Jun 2024 12:26:17 -0500
Date: Fri, 7 Jun 2024 12:26:17 -0500
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240607172617.s42p343dw4ijgck4@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240607093712.2880785-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607093712.2880785-1-yann.morin.1998@free.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717781178;
 bh=i42CU3ZoPihtedtCrE8L83jOQWK12ft/9Z5VV2U1jN0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MP48IW+bJAebbcGqh9C1ndqPQrI0dW6XSTJFeTtPq+hj91M6EfoBaW5aFSESFUxp5
 q3RaUZbfLtxJiwypJVfItYL62+3WZdDvD1p9UAxdVYMDCmBMiFcv2GjwQTMs+BPBcM
 uVDLnAOQxtP1HbCiTNQR8apAgecqNeGqpeeQ4oss=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=MP48IW+b
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: share download files
 with uboot
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>,
 Paresh Bhagat <p-bhagat@ti.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On June  7, 2024 thus sayeth Yann E. MORIN:
> ti-k3-r5-loader is just a U-Boot SPL running on the R5 core on TI's K3
> processors, so it makes sense to just share the downloads with U-Boot.
> 
> With commit ebe238f2b595 (package/pkg-download: use _DL_SUBDIR as root
> dir of generated archives), the root of the generated archive will also
> be based on _DL_SUBDIR, but the name of the archive, _SOURCE, is still
> based on the current package unless explicitly set. For ti-k3-r5-loader,
> that would create an archive which fiename does not match its root
> directory; although Buildroot does not care (we --strip-components=1
> when extracting), this would be a bit surprising to anyone manually
> extrating the archive, as it diverges from the usual expectations.
> 
> Do like we do for linux-headers, and force the ti-k3-r4-loader archive
> filename to be u-boot-VERSION.tar.gz
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Anand Gadiyar <gadiyar@ti.com>
> Cc: Bryan Brattlof <bb@ti.com>
> Cc: Xuanhao Shi <X15000177@gmail.com>
> Cc: Paresh Bhagat <p-bhagat@ti.com>
> 

Nice! Thank you.

Reviewed-by: Bryan Brattlof <bb@ti.com>

This should also free us from the ti-k3-r5-loader.hash files correct? I 
can send the cleanup once this is merged unless you would like to.

    $ find -iname ti-k3-r5-loader.hash
    ./boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
    ./board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
    ./board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash

>
> ---
> PS. Not sure if we should do that in the package infra, though, or even
> if we can even do it. It's a special case for packages that are both
> sharing their downloads, *and* being downloaded from a VCS, which is
> not a situation common enough to warrant a generic implementation in the
> infras... Thoughts?

My thinking is these are unique enough cases and I'm not too sure how 
common the need will be to do this kind of thing. So it should be fine 
to keep it out of the core package system.

~Bryan

> ---
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index 98a6d473f1..e426f039e0 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -5,6 +5,7 @@
>  ################################################################################
>  
>  TI_K3_R5_LOADER_VERSION = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
> +TI_K3_R5_LOADER_DL_SUBDIR = uboot
>  
>  ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL),y)
>  # Handle custom U-Boot tarballs as specified by the configuration
> @@ -14,12 +15,15 @@ TI_K3_R5_LOADER_SOURCE = $(notdir $(TI_K3_R5_LOADER_TARBALL))
>  else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT),y)
>  TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
>  TI_K3_R5_LOADER_SITE_METHOD = git
> +TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
>  else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG),y)
>  TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
>  TI_K3_R5_LOADER_SITE_METHOD = hg
> +TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
>  else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN),y)
>  TI_K3_R5_LOADER_SITE = $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
>  TI_K3_R5_LOADER_SITE_METHOD = svn
> +TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.gz
>  else
>  # Handle stable official U-Boot versions
>  TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
> -- 
> 2.45.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
