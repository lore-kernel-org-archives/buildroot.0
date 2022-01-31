Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63A6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 17:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 784AE40142;
	Mon, 31 Jan 2022 17:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYIDxg5FvEIj; Mon, 31 Jan 2022 17:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4671E401F2;
	Mon, 31 Jan 2022 17:45:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0941F1BF4DB
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAF4460EA4
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zg1fce7Pywz for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 17:45:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F98B60C22
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 17:45:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (15)
Received: from [192.168.10.50] (dynamic-78-8-131-46.ssp.dialog.net.pl
 [78.8.131.46])
 by server220076.nazwa.pl (Postfix) with ESMTP id 3F6961C55AE;
 Mon, 31 Jan 2022 18:45:30 +0100 (CET)
Message-ID: <3ea22a9d-938a-5086-66c6-a8f5510c8573@grinn-global.com>
Date: Mon, 31 Jan 2022 18:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220131153022.351662-1-heiko.thiery@gmail.com>
 <CAOf5uwkFjQCGBOD4JMn4MG_SR74-bW1SHoDFiEC7mqH_C8Xq7w@mail.gmail.com>
 <CAEyMn7aDyH24AYVMZaLvt9SQMtVu9yhzftPqbSsuJ671tY-kNQ@mail.gmail.com>
 <12be81a6-7f2e-35b8-4f44-d8a20fce74f1@benettiengineering.com>
 <CAOf5uwmeT8WVUc3xvP0DjrVDLj9egvJz0+JEvWhgojnEVhyTyw@mail.gmail.com>
 <86bf975a-1599-005a-5ebc-a149cc973da4@benettiengineering.com>
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <86bf975a-1599-005a-5ebc-a149cc973da4@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH v5] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On 31.01.2022 18:11, Giulio Benetti wrote:
> On 31/01/22 17:42, Michael Nazzareno Trimarchi wrote:
>
> [SNIP]
>
>>>>>> diff --git a/configs/kontron_bl_imx8mm_defconfig 
>>>>>> b/configs/kontron_bl_imx8mm_defconfig
>>>>>> new file mode 100644
>>>>>> index 0000000000..0cf0115bfa
>>>>>> --- /dev/null
>>>>>> +++ b/configs/kontron_bl_imx8mm_defconfig
>>>>>> @@ -0,0 +1,58 @@
>>>>>> +# Architecture
>>>>>> +BR2_aarch64=y
>>>>>> +BR2_ARM_FPU_VFPV3=y
>>>>>> +
>>>>>> +BR2_GLOBAL_PATCH_DIR="board/kontron/bl-imx8mm/patches"
>>>>>> +
>>>>>> +# System
>>>>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
>>>>>> +
>>>>>> +# Kernel
>>>>>> +BR2_LINUX_KERNEL=y
>>>>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>>>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
>>>>>> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>>>>>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>>>>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-kontron-n801x-s"
>>>>>> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
>>>>>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>>>>> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>>>>>> +
>>>>>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
>>>>>> +
>>>>>> +BR2_PACKAGE_FREESCALE_IMX=y
>>>>>> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
>>>>>> +BR2_PACKAGE_FIRMWARE_IMX=y
>>>>>> +
>>>>>> +# Filesystem / image
>>>>>> +BR2_TARGET_ROOTFS_EXT2=y
>>>>>> +BR2_TARGET_ROOTFS_EXT2_4=y
>>>>>> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>>>>>> +
>>>>>> +# Bootloader
>>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
>>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
>>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
>>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
>>>>>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="IMX_BOOT_UART_BASE=0x30880000" 
>>>>>>
>>>>>> +BR2_TARGET_UBOOT=y
>>>>>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>>>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>>>>>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
>>>>>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
>>>>>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>>>>>> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>>>>>> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>>>>>> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>>>>>> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
>>>>>> +BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
>>>>>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>>>>>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
>>>>>> +BR2_TARGET_UBOOT_SPL=y
>>>>>> +
>>>>>> +# Required host tools to create the SD/eMMC image
>>>>>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/bl-imx8mm/post-build.sh" 
>>>>>>
>>>>>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>>>>>> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
>>>>>> +BR2_PACKAGE_HOST_GENIMAGE=y
>>>>>
>>>>> I have seen that some people like to have this organization but it's
>>>>> not really nice to maintain. I would like
>>>>> to savedefconfig and use that one instead of having nice commented
>>>>> part. Is this mandatory?
>>>>
>>>> As far as I know there is no rule how to do that. For me it seems to
>>>> be more readable and clean. But this is only my opinion.
>>>
>>> As Heiko pointed it's a very good habit.
>>>
>>> One thing that must be taken into account while doing it, is to keep 
>>> the
>>> various BR2_* configs ordered as they are ordere inside the various
>>> Config.in
>>
>> There are good information indeed but even those information must be
>> keep updated. Daily work show me that work on
>> savedefconfig make things nicely. Some of your option can be at some
>> point autoselect by another one and so on.
>
> Yes, you're right, I've noticed that too. It's "not that automatic", 
> but if you check the first 25 defconfigs you can see that more or less 
> the 70% use the "descriptive" way. So basically one should 
> savedefconfig to another file and compare to the configs/*_defconfig 
> and eventually modify.
>
> Anyway there is still not a standard decided. So maintainers will 
> accept both ways.

The global sync via `savedefconfig` for all existing configs should 
solve everything. Besides, it should be impossible to edit those files 
manually.

Best
Bartek
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
