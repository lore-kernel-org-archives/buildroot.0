Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAABC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 18:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEE186128D;
	Wed,  7 May 2025 18:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8b6ia-1QcnV; Wed,  7 May 2025 18:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD40F6122A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD40F6122A;
	Wed,  7 May 2025 18:31:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0BA4439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D20F36122A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rprdRGp3j_OD for <buildroot@buildroot.org>;
 Wed,  7 May 2025 18:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.175.196.64;
 helo=euk33.eukhosting.net; envelope-from=buildroot@cairnwater.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AFBDC6121C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFBDC6121C
Received: from euk33.eukhosting.net (euk33.eukhosting.net [213.175.196.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFBDC6121C
 for <buildroot@buildroot.org>; Wed,  7 May 2025 18:31:33 +0000 (UTC)
Received: from [::1] (port=51920 helo=euk33.eukhosting.net)
 by euk33.eukhosting.net with esmtpa (Exim 4.98.1)
 (envelope-from <buildroot@cairnwater.com>)
 id 1uCjYI-0000000EHRc-2xjy; Wed, 07 May 2025 19:31:30 +0100
MIME-Version: 1.0
Date: Wed, 07 May 2025 19:31:30 +0100
From: buildroot@cairnwater.com
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Buildroot <buildroot@buildroot.org>
In-Reply-To: <b1d889ab-e5ce-4ff5-aaef-210e10c2c1cf@gmx.de>
References: <ddbed9a95b8f787377152092229828fd@cairnwater.com>
 <b1d889ab-e5ce-4ff5-aaef-210e10c2c1cf@gmx.de>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <ce099431e6ef3f34d075533934004d29@cairnwater.com>
X-Sender: buildroot@cairnwater.com
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - euk33.eukhosting.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cairnwater.com
X-Get-Message-Sender-Via: euk33.eukhosting.net: authenticated_id:
 buildroot@cairnwater.com
X-Authenticated-Sender: euk33.eukhosting.net: buildroot@cairnwater.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=cairnwater.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BjQQb27aro5mgva2CNtvyX3JytU8txeNF7PafPEA+FQ=; b=GQ80qohBdPrPDiZQPhRDZyRt9o
 Ti0Ugka2ZHELIbp427oRIHNqmsNO2/SwzeKILaiyjZpMcodwefoGz3Zp3fCfeOio2IHWZdyqnuXKK
 djvN6UdD1sEkgju1z9K2xsA/Ki21FZ7k826jlvxEsIX1agXXQB399so0q0YFMstiw0N8uVBcoF+LD
 BdlNbmmr4c1Yfs7XWpJ0b6nM4NcuRh5Dncrx0woaOY4pWEtiaZp8TqPqssnP1Tl210jxLApWXEhkQ
 BELSLp37UBcElrUZyLwfFp1ygacW+P8m/34PQo5LQyFBfIYTGvG9RPaov1dsZ80VgOaJmcU+i3rqE
 sg7OP0zA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=cairnwater.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=cairnwater.com header.i=@cairnwater.com
 header.a=rsa-sha256 header.s=default header.b=GQ80qohB
Subject: Re: [Buildroot] Adding Device Tree Overlays for MIPI-CSI2 Camera
 and libcamera to a buildroot Build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

Thank you very much! That's a big help to know to use 
BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for that.

What directory structure is needed for the overlays? Just the DTO files 
in a directory or something more complicated?

> From there you'll need to adjust the boot process for your board to 
> actually apply the overlay. If you want to send a patch, the 
> BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should be inside the board directory.

Thank you very much. I don't know how to do that. What's the best way to 
get the boot process to apply the overlay? I'd heard that it can be done 
by the kernel or by U-Boot but I'm doing this for the first time so I'm 
not sure what I'm doing.

Will


On 2025-05-07 17:41, Fiona Klute via buildroot wrote:
> Hi Will!
> 
> Am 07.05.25 um 17:41 schrieb buildroot@cairnwater.com:
>> Does anyone have any advice on how to add DTOs needed by libcamera to 
>> a buildroot build?
>> 
>> We'd like to add Kieran's DTOs
>> 
>> https://git.uk.ideasonboard.com/camera/dt-overlays/src/branch/main/arch/ 
>> arm64/boot/dts/freescale
>> 
>> to the buildroot default configuration for Debix Model A SBC
>> 
>> https://github.com/buildroot/buildroot/blob/master/configs/ 
>> polyhex_debix_model_a_defconfig
>> 
>> Ideally we'd also like to add the overlays for the Sony IMX 708 Image 
>> Sensor used in the RPi V3 camera but these aren't mainline:
>> 
>> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/arch/arm/boot/dts/ 
>> overlays/imx708-overlay.dts
>> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/arch/arm/boot/dts/ 
>> overlays/imx708.dtsi
> 
> You can use BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for that: Just place the 
> DTSOs in the configured directory (with appropriate structure), and 
> Buildroot will build them automatically. DTBOs will be in 
> ${OUTPUT_DIR}/images. From there you'll need to adjust the boot process 
> for your board to actually apply the overlay. If you want to send a 
> patch, the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should be inside the board 
> directory.
> 
> With RPi overlays you'll probably have to adjust the overlays a bit so 
> referenced names fit, etc. You're using a different board, and I've 
> seen cases where DTS for RPi boards from mainline and RPi kernels use 
> different names. But that doesn't change the build process. :-)
> 
> Best regards,
> Fiona
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
