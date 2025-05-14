Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E8AC3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 17:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8E3283807;
	Wed, 14 May 2025 17:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2eKjKH54JIR; Wed, 14 May 2025 17:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C19C583770
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C19C583770;
	Wed, 14 May 2025 17:36:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E137150
 for <buildroot@buildroot.org>; Wed, 14 May 2025 17:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 436BD607D7
 for <buildroot@buildroot.org>; Wed, 14 May 2025 17:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4CIF6S_08wd for <buildroot@buildroot.org>;
 Wed, 14 May 2025 17:36:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.175.196.64;
 helo=euk33.eukhosting.net; envelope-from=buildroot@cairnwater.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60696607CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60696607CC
Received: from euk33.eukhosting.net (euk33.eukhosting.net [213.175.196.64])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60696607CC
 for <buildroot@buildroot.org>; Wed, 14 May 2025 17:36:25 +0000 (UTC)
Received: from [::1] (port=58200 helo=euk33.eukhosting.net)
 by euk33.eukhosting.net with esmtpa (Exim 4.98.1)
 (envelope-from <buildroot@cairnwater.com>)
 id 1uFG1m-0000000EpHh-1aud; Wed, 14 May 2025 18:36:22 +0100
MIME-Version: 1.0
Date: Wed, 14 May 2025 18:36:21 +0100
From: buildroot@cairnwater.com
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Buildroot <buildroot@buildroot.org>
In-Reply-To: <e147c44847cdb3c965cbf99e41751d26@cairnwater.com>
References: <ddbed9a95b8f787377152092229828fd@cairnwater.com>
 <b1d889ab-e5ce-4ff5-aaef-210e10c2c1cf@gmx.de>
 <ce099431e6ef3f34d075533934004d29@cairnwater.com>
 <94c4f329-b903-49df-a1c2-8e91185469cc@gmx.de>
 <e147c44847cdb3c965cbf99e41751d26@cairnwater.com>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <06288a46ae8ca333eb295497dece6254@cairnwater.com>
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
 bh=TaS7j4zSWYmEcPw0VTT38pePPZhV8iTP9j1aTBUpNlE=; b=Uzsprlm/QTvjNW7/aEuhJpcD3X
 jYD4kaC9yxCP7l8A1zew158dPjAFQxwbkSWuwul1wC1c/Iv4xUjoQw/1B3rk0TcXrB2fnCI2rlb3d
 uv+RU2h58LupBegPA2hl/LSPfISdkZwyPV0GDAePoy6bPOQeghL5lmDkai+uARgdqq4Rn5Kbpz/7b
 HMkrJuENMmMJ7TLRxGAlHu5/hMWyUEQhFOmFD+u6CHfz1lnd0mzVbyefr+Bp9bj+q/VEcTtuV2J0p
 1rJ3xovUCOZ8ofCpDrVHjcBaa1ZDsqVpUfJyeNT3CjcRFG/RVweI8K/Zx7j0eLHnCPaLs6WCQXXRp
 jpRfoPOw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=cairnwater.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=cairnwater.com header.i=@cairnwater.com
 header.a=rsa-sha256 header.s=default header.b=Uzsprlm/
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

Thank you very much!

> It's expected to match the structure of the per-arch dts directory in 
> the kernel source, with vendor directories. The 
> polyhex_debix_model_a_defconfig uses the freescale/imx8mp-debix-model-a 
> DTS, so inside your BR2_LINUX_KERNEL_CUSTOM_DTS_DIR you'll probably 
> need something like freescale/my-camera.dtso (whatever you want to call 
> your DTSOs, the DTBOs will match the source names).

How do I work out where the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR is?

I had a look in the defconfig here:

https://github.com/buildroot/buildroot/blob/master/configs/polyhex_debix_model_a_defconfig

It seems to specify other parameters related to BR2_LINUX_KERNEL but not 
the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR so I got a bit lost trying to work 
out where the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR is and whether it's a 
directory that already exists or a new directory that I should create 
myself?

Is BR2_LINUX_KERNEL_CUSTOM_DTS_DIR something that's not already in the 
defconfig and that I'd have to add to the defconfig?

BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-debix-model-a"
BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

> On some boards (like RPi) the firmware can also do it (only useful if 
> U-Boot & kernel then use that FDT), last time I
> checked mainline Linux cannot, but some patched kernels can.

Yes - that's my understanding as well - my knowledge of this is very 
limited but I think maybe RPi can do this and maybe NXP's i.MX Linux can 
do this but I'm not sure whether mainline Linux can do it at the moment.

> There are a number of options with U-Boot, which one to pick
> depends on how you configure the boot (at a glance the defconfig seems 
> to use extlinux.conf):

I'd probably want to stick as close as I can to what's there at the 
moment.

> Either way you may have to enable overlay support in the U-Boot build 
> config (if it isn't by default).

I looked in

https://github.com/buildroot/buildroot/blob/master/configs/polyhex_debix_model_a_defconfig

but couldn't work out how to enable overlay support. Is that usually an 
existing line in the defconfig that should be amended or a new line that 
should be added?

Thank you very much for all your help!

Will

On 2025-05-08 08:46, buildroot@cairnwater.com wrote:
> Hi Fiona,
> 
> Thank you very much - that's an enormous help - I'd have got very 
> confused trying to work that out.
> 
> I'll study what you said and the links in detail and take more time to 
> think about it.
> 
> Thank you very much again!
> 
> Will
> 
> On 2025-05-07 21:06, Fiona Klute wrote:
>> Am 07.05.25 um 20:31 schrieb buildroot@cairnwater.com:
>>> Hi Fiona,
>>> 
>>> Thank you very much! That's a big help to know to use 
>>> BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for that.
>>> 
>>> What directory structure is needed for the overlays? Just the DTO 
>>> files in a directory or something more complicated?
>> 
>> It's expected to match the structure of the per-arch dts directory in 
>> the kernel source, with vendor directories. The 
>> polyhex_debix_model_a_defconfig uses the 
>> freescale/imx8mp-debix-model-a DTS, so inside your 
>> BR2_LINUX_KERNEL_CUSTOM_DTS_DIR you'll probably need something like 
>> freescale/my-camera.dtso (whatever you want to call your DTSOs, the 
>> DTBOs will match the source names).
>> 
>>>> From there you'll need to adjust the boot process for your board to 
>>>> actually apply the overlay. If you want to send a patch, the 
>>>> BR2_LINUX_KERNEL_CUSTOM_DTS_DIR should be inside the board 
>>>> directory.
>>> 
>>> Thank you very much. I don't know how to do that. What's the best way 
>>> to get the boot process to apply the overlay? I'd heard that it can 
>>> be done by the kernel or by U-Boot but I'm doing this for the first 
>>> time so I'm not sure what I'm doing.
>> 
>> I'm not familiar with the board, but usually U-Boot will be the right 
>> place. On some boards (like RPi) the firmware can also do it (only 
>> useful if U-Boot & kernel then use that FDT), last time I checked 
>> mainline Linux cannot, but some patched kernels can. There are a 
>> number of options with U-Boot, which one to pick depends on how you 
>> configure the boot (at a glance the defconfig seems to use 
>> extlinux.conf):
>> 
>> * If you use extlinux.conf, use the "devicetree-overlay" option.
>> * If you use a boot script, load the overlay and apply it before 
>> starting the kernel.
>> * If you use a FIT image, add the overlay to it and the relevant boot 
>> config defined in it.
>> 
>> See also:
>> https://docs.u-boot.org/en/latest/develop/distro.html (for 
>> extlinux.conf)
>> https://docs.u-boot.org/en/latest/usage/fdt_overlays.html (for the 
>> latter 2 options)
>> 
>> Either way you may have to enable overlay support in the U-Boot build 
>> config (if it isn't by default).
>> 
>> On the Buildroot side you need to make sure that the DTBOs and 
>> adjusted config get included in the image where U-Boot expects them 
>> (depending on the boot setup you use), if you need to make adjustments 
>> there it'll probably be in a post-build or post-image script, or in 
>> the genimage config.
>> 
>> The defconfig seems to put everything into the root partition image, 
>> so it might just work, as long as you use the right path in the U-Boot 
>> config. Maybe just set BR2_LINUX_KERNEL_CUSTOM_DTS_DIR, build, and see 
>> if you end up with a DTBO somewhere in your /boot dir. If yes, 
>> adjusting the U-Boot config to use it should be enough. ;-)
>> 
>> Best regards,
>> Fiona
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
