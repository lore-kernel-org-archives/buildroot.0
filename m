Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A70ACAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 21:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F02D26106D;
	Wed, 24 Sep 2025 21:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8w_mDM7i72u; Wed, 24 Sep 2025 21:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B20261054
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B20261054;
	Wed, 24 Sep 2025 21:19:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C50B199
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E34940E2E
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvGS8HyWaYE2 for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 21:19:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3CF5140E28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CF5140E28
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CF5140E28
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 21:19:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 43ED5780368;
 Wed, 24 Sep 2025 23:19:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 24 Sep 2025 23:19:09 +0200
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 23:19:09 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, martin.chabot@gmail.com, michal.simek@amd.com,
 brandon.maier@collins.com, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com
In-Reply-To: <20250831133526.332716-1-neal.frager@amd.com>
References: <20250831133526.332716-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <af51c0114184f7fb0374a11b5f08205a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758748755;
 bh=ObduKUR7OkdqeDfYmeR6wQksRvVmpYsOqBBLFpsqY4Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UdQQWcLQX+yvRuxuTNasQjiLo7L+E5WPv5aFVEb5Ohtp5T/sOIY8nZUy0Q10w952w
 XmBf18Jz9lBqODMMRAdbRSFaDmim9WMOmF/1k0R5j40o7BkSCsB5bcIfgvc88wMhJS
 i3xRWiTICWYJf3iZB3vcEms8zo4TAotzPUE9SZ6kyTDSJa34aoat0TGjo+BC/h/7MU
 CtHomJTUIOwsIXs9hZwkAlQEoB4/3JxGyFrzQSdWcsTQaUSaBViTPXFS3zpj8ZRb7y
 cl0nnRq4ZnDoNT+L3pFnlwkwrke57HHUTSsJysQeyYBA79R58szSaIr9Z7RtEnUz9V
 i1htUVx+phjjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UdQQWcLQ
Subject: Re: [Buildroot] [PATCH v4 1/2] boot/uboot: add support for custom
 zynq ps7_init_gpl.c
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 31/08/2025 15:35, Neal Frager via buildroot wrote:
> On Zynq, the booloader is responsible for some basic initializations, 
> such as
> enabling peripherals, DDR and configuring pinmuxes. The ps7_init_gpl.c 
> file
> (and optionally, ps7_init_gpl.h) contains the code for such 
> initializations.
> 
> Although U-Boot contains ps7_init_gpl.c files for some boards, each of 
> them
> describes only one specific configuration. Users of a different board, 
> or
> needing a different configuration, can generate custom files using the 
> Xilinx
> Vivado development tools.
> 
> This patch adds Buildroot support for custom zynq ps7_init_gpl.c files 
> in the
> same way that is already done for zynqmp when working with custom 
> hardware
> that is not already supported by u-boot.
> 
> To test this feature, the following configs can be added to any 
> zynq_defconfig:
> 
> BR2_TARGET_UBOOT_ZYNQ=y
> BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE=<path to custom board 
> ps7_init_gpl.c>
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Brandon Maier <brandon.maier@collins.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
