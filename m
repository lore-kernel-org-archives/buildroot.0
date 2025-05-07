Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4536C3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 20:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C2580F04;
	Wed,  7 May 2025 20:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FghdaNByBKeH; Wed,  7 May 2025 20:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D9D980F00
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D9D980F00;
	Wed,  7 May 2025 20:07:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A9732151
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5EB480EEB
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gK0Grki76HYF for <buildroot@buildroot.org>;
 Wed,  7 May 2025 20:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3041280EA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3041280EA2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3041280EA2
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:07:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.82]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1uZapQ2SP7-00TnDm; Wed, 07
 May 2025 22:06:17 +0200
Message-ID: <94c4f329-b903-49df-a1c2-8e91185469cc@gmx.de>
Date: Wed, 7 May 2025 22:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@cairnwater.com
Cc: Buildroot <buildroot@buildroot.org>
References: <ddbed9a95b8f787377152092229828fd@cairnwater.com>
 <b1d889ab-e5ce-4ff5-aaef-210e10c2c1cf@gmx.de>
 <ce099431e6ef3f34d075533934004d29@cairnwater.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <ce099431e6ef3f34d075533934004d29@cairnwater.com>
X-Provags-ID: V03:K1:OvAwccrhm7w7yd1Fs7f9OmISwq3UaKnxgRVeWNIFgmClXuAjB0x
 tL9YGrjljWi+g+IreHoH0l0/khImL8WXULVAQyZp9NG73lLzXuQqYz8wGmsjm3PUEwmSWMP
 Kjxe0QnqcxvEqB/UQtAi2+TEtm8wAJ7o7Bb7YBN5wNmQcDIhiVBKw5byNKJxyqKYUARgAE0
 sl232GesWCYXMuIHJg6IA==
UI-OutboundReport: notjunk:1;M01:P0:hMbq4RBEKaY=;CvCG7KP+3XADi7myYtRIMHWW9T5
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1746648377; x=1747253177; i=fiona.klute@gmx.de;
 bh=7mDJA0waLLoHZ4cmTaWagUK5yr7yOK5rRWAIfROBSzw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=RI7OZqLJFUZD3G+RX1U8Qp8NQwd7JwTiqirFzKvwFKYM04eLpWTEkQfh7ikUGIzs
 RzK0qHK6BsrB/MxRc939nGjMjXT3z35FXNaZqmnOvUQKh5IesKToWC24JwJ9nxhJw
 ppd6l0E4db7IDJLRyprkhfzC33r4G9jUu+G2OjtDI1+Y54wipyLltG9qiukZVXiJh
 88SQJzoAgD2/Mm1GIxXIGx4enFugrI7UYi64+3aGc5YiGYnMqKQXIoFV49vnoTieN
 NkgiDvhqjIqoYT3X/bXLR4WPUdVRiEQdAtTXu1Znx3StKxTDUcl7GV+ftTEDL7K5N
 vWDfP+GW7Sh2VRnQXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=RI7OZqLJ
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

Am 07.05.25 um 20:31 schrieb buildroot@cairnwater.com:
> Hi Fiona,
> 
> Thank you very much! That's a big help to know to use 
> BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for that.
> 
> What directory structure is needed for the overlays? Just the DTO files 
> in a directory or something more complicated?

It's expected to match the structure of the per-arch dts directory in 
the kernel source, with vendor directories. The 
polyhex_debix_model_a_defconfig uses the freescale/imx8mp-debix-model-a 
DTS, so inside your BR2_LINUX_KERNEL_CUSTOM_DTS_DIR you'll probably need 
something like freescale/my-camera.dtso (whatever you want to call your 
DTSOs, the DTBOs will match the source names).

>> From there you'll need to adjust the boot process for your board to 
>> actually apply the overlay. If you want to send a patch, the 
>> BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should be inside the board directory.
> 
> Thank you very much. I don't know how to do that. What's the best way to 
> get the boot process to apply the overlay? I'd heard that it can be done 
> by the kernel or by U-Boot but I'm doing this for the first time so I'm 
> not sure what I'm doing.

I'm not familiar with the board, but usually U-Boot will be the right 
place. On some boards (like RPi) the firmware can also do it (only 
useful if U-Boot & kernel then use that FDT), last time I checked 
mainline Linux cannot, but some patched kernels can. There are a number 
of options with U-Boot, which one to pick depends on how you configure 
the boot (at a glance the defconfig seems to use extlinux.conf):

* If you use extlinux.conf, use the "devicetree-overlay" option.
* If you use a boot script, load the overlay and apply it before 
starting the kernel.
* If you use a FIT image, add the overlay to it and the relevant boot 
config defined in it.

See also:
https://docs.u-boot.org/en/latest/develop/distro.html (for extlinux.conf)
https://docs.u-boot.org/en/latest/usage/fdt_overlays.html (for the 
latter 2 options)

Either way you may have to enable overlay support in the U-Boot build 
config (if it isn't by default).

On the Buildroot side you need to make sure that the DTBOs and adjusted 
config get included in the image where U-Boot expects them (depending on 
the boot setup you use), if you need to make adjustments there it'll 
probably be in a post-build or post-image script, or in the genimage config.

The defconfig seems to put everything into the root partition image, so 
it might just work, as long as you use the right path in the U-Boot 
config. Maybe just set BR2_LINUX_KERNEL_CUSTOM_DTS_DIR, build, and see 
if you end up with a DTBO somewhere in your /boot dir. If yes, adjusting 
the U-Boot config to use it should be enough. ;-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
