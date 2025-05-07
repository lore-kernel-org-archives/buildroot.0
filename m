Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A15CC3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 16:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B4E40925;
	Wed,  7 May 2025 16:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HftAiB6xg6L6; Wed,  7 May 2025 16:41:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE97940933
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE97940933;
	Wed,  7 May 2025 16:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ADB4FEDF
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F29F80E74
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0sTdHBytmvS for <buildroot@buildroot.org>;
 Wed,  7 May 2025 16:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2361180DB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2361180DB8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2361180DB8
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:41:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.82]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1vDMcn1j0u-00u7U2; Wed, 07
 May 2025 18:41:05 +0200
Message-ID: <b1d889ab-e5ce-4ff5-aaef-210e10c2c1cf@gmx.de>
Date: Wed, 7 May 2025 18:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@cairnwater.com, Buildroot <buildroot@buildroot.org>
References: <ddbed9a95b8f787377152092229828fd@cairnwater.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ddbed9a95b8f787377152092229828fd@cairnwater.com>
X-Provags-ID: V03:K1:C9Vsbm6fkk8d9WQfkqVd83G9KqAVk162DQLWpArK65xHM5w3+GI
 dwonQFqCtO22aY6gaJXPXt5DEKPtlzwjJB1HKFI0Q9BIvJMwfYllodA9v2FlBPAyYhpORI9
 XGhjA5qBCCJSVQ1k9TnuoQ+pz3UkWSiikCFYNJam+M0tr8WovNrPtLjPYYcmE4eJpSJ4QX+
 y+SbJzIjDCqiFZ0VKQJQA==
UI-OutboundReport: notjunk:1;M01:P0:55VG7GcAvEM=;L8P9KpS4+bwl8Rk42sQsa2dQU/E
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1746636065; x=1747240865; i=fiona.klute@gmx.de;
 bh=MSDo0E3g3QuaHitQ9w0d44uRuvh4NN/Elb2WB1oTYqM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=LGLKKTWJpaUX979HYcC0yzDci1Mu/649oH/JpTpjyHM7jVd0nZMDejM5KU6QLgGJ
 9LRSvn+RjjdexCl4mRb9OAl9pEeHipqr2Ee74j4INKMJN96e3blwuFMHAMkvMfMmP
 WJlvinLffTNio2M+c2pySILILnpILS5N5lRC/n2+bjJuvgyZZrP0SMmeMLbErd9Md
 CtnySHrhNOLVPQunYBJvVssRESnk4saQzIPPUOzphPO/+pCN4Mw1y+9RMuxpqAmjR
 cU+72pWAWrgszuB/GQtwdcHY1R+ClHdJh3sd4Fsyo4HQ1TSZWAGeDBX+U9pZr9E+Y
 X4WpqnmtKDWgBnFVNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=LGLKKTWJ
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Will!

Am 07.05.25 um 17:41 schrieb buildroot@cairnwater.com:
> Does anyone have any advice on how to add DTOs needed by libcamera to a 
> buildroot build?
> 
> We'd like to add Kieran's DTOs
> 
> https://git.uk.ideasonboard.com/camera/dt-overlays/src/branch/main/arch/ 
> arm64/boot/dts/freescale
> 
> to the buildroot default configuration for Debix Model A SBC
> 
> https://github.com/buildroot/buildroot/blob/master/configs/ 
> polyhex_debix_model_a_defconfig
> 
> Ideally we'd also like to add the overlays for the Sony IMX 708 Image 
> Sensor used in the RPi V3 camera but these aren't mainline:
> 
> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/arch/arm/boot/dts/ 
> overlays/imx708-overlay.dts
> https://github.com/raspberrypi/linux/blob/rpi-6.12.y/arch/arm/boot/dts/ 
> overlays/imx708.dtsi

You can use BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for that: Just place the 
DTSOs in the configured directory (with appropriate structure), and 
Buildroot will build them automatically. DTBOs will be in 
${OUTPUT_DIR}/images. From there you'll need to adjust the boot process 
for your board to actually apply the overlay. If you want to send a 
patch, the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should be inside the board 
directory.

With RPi overlays you'll probably have to adjust the overlays a bit so 
referenced names fit, etc. You're using a different board, and I've seen 
cases where DTS for RPi boards from mainline and RPi kernels use 
different names. But that doesn't change the build process. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
