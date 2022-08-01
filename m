Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE6BC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 22:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D297A813B1;
	Mon,  1 Aug 2022 22:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D297A813B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7ZTVDPsQK0N; Mon,  1 Aug 2022 22:13:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D280C8137F;
	Mon,  1 Aug 2022 22:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D280C8137F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA381BF31F
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 22:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DCD5401DA
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 22:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DCD5401DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QgDMw57fHl0k for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 22:13:03 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB54C4022E
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB54C4022E
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 22:13:02 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IdXxoMCUUTCpUIdXyoQYmd; Tue, 02 Aug 2022 00:05:58 +0200
Message-ID: <93edea73-13ab-daea-34af-c86fa6225caf@benettiengineering.com>
Date: Tue, 2 Aug 2022 00:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Jesse T <mr.bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220730061219.3061864-1-Mr.Bossman075@gmail.com>
 <20220801225044.63ead8d4@windsurf>
 <CAJFTR8SkMjAe1=V411g9BmdzYDZv+5mtLMQ29w=2BJj4LS1sWw@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAJFTR8SkMjAe1=V411g9BmdzYDZv+5mtLMQ29w=2BJj4LS1sWw@mail.gmail.com>
X-CMAE-Envelope: MS4xfL28qTyZCaH2LY7dFRkfyijby2BRInZ7VJYTqgBzZvKAsa3MOi20zFQX78XZnGswzILlDkA/m3yJNhL/GUZJMxRBcqB3g2Fbylh16tMNLjccRAfLYrzM
 n1lJ7hbh0nGeZoNBQ2+QlCAJjg2YPgVfE3hoZc7IwAXUN2+qXG3NBA2tFXMl0EN5f9iy2I+/zjbOrbF1yhwZPmrUg87e+ok09Gz68DfVgCqotku+nyypjnc4
 5T+u31+4rgb8lH2VB4l4wsS9AE8G1sTR9V401MB+cH3gnjLNJN+61/ioeWosDneqzbOE/woPhKE1qlwnPteWl89mhJhsZpm6/FBuF1P1j7YAyTo1NALjEXNC
 gqyzobLhZXlgDGTgaOGwVd8/q5Riu1OgbbzJryTKyhfxKXm0Gzs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659391558; bh=OU0EUIithdeHIksIMR8cmanc/d2SDx6QwCeodsLajTI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=TkBri+lnzd6g4mGZmClvKqM32byqgZ7S4sjaDhpurCdoNpozx8zjwAVsTpR8hcXkH
 mtGttJ2BTo0rtpEZF3P0/6xYDP/k+B1lBGdSIfDt0HzN9k4T6FeAx1McnKdMMKMJlW
 wcuhEjRxlmUnn3QcE3kKm6nddrJyMeVR+0TdiLjUopOWhWd6bxacG/QYDVIO6ci4Us
 /G6kcePfYiJb9rE84IvoGXumse3Vr/MBFRs9TIwrN+LhMG2eOEBGcg/w1jVdJFNdyE
 NSREcnbiynlJ2OlDsEPTwOpb7VGM9Lw0qLoLJmcIHbWNqo3KoU2JBOv36s2jFW8gWK
 RuZP5xkqxsYVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TkBri+ln
Subject: Re: [Buildroot] [PATCH v2] configs/imxrt1050-evk: New defconfig
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
Cc: maeva.manuel@oss.nxp.com, Fabio Estevam <festevam@gmail.com>,
 stephane.viau@oss.nxp.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 01/08/22 23:46, Jesse T wrote:
> On Mon, Aug 1, 2022 at 4:50 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello Jesse,
>>
>> Thanks for your contribution!
>>
>> On Sat, 30 Jul 2022 02:12:19 -0400
>> Jesse Taube <mr.bossman075@gmail.com> wrote:
>>
>>> Add defconfig for imxrt1050-evk is a development board from NXP.
>>>
>>> The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
>>> first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
>>> up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
>>> cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and
>>> 1x 100Mb ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it
>>> uses only simple SDRAM, it gives the chance of a 4 or less layer PCBs.
>>> Seeing that these chips are comparable to the STM32F7xxs which have
>>> buildroot ported to them it seems reasonable to add support for them.
>>>
>>> https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
>>>
>>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> Thanks a lot, it looks mostly good, but I have a few comments/questions.
>>
>>>   N:   Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> +F:   board/freescale/imxrt1050evk/*
>>>   F:   board/olimex/a*
>>>   F:   configs/amarula_vyasa_rk3288_defconfig
>>>   F:   configs/asus_tinker_rk3288_defconfig
>>> +F:   configs/imxrt1050-evk_defconfig
>>>   F:   configs/olimex_a*
>>>   F:   package/at/
>>>   F:   package/binutils/
>>
>> Any reason to add Giulio here?
> 
> We worked on Linux and U-Boot together.
> 
>>
>>> diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
>>> new file mode 100755
>>> index 0000000000..476958a691
>>> --- /dev/null
>>> +++ b/board/freescale/imxrt1050evk/post-build.sh
>>> @@ -0,0 +1,6 @@
>>> +#!/bin/sh
>>> +MKIMAGE=$HOST_DIR/bin/mkimage
>>> +
>>> +if [ -e $BINARIES_DIR/Image ]; then
>>
>> Why is this test needed? The Image file will be produced by the kernel
>> build, so it should be there. If it's not, we should really error out
>> hard. So I think doing without the test is better.
> 
> I was using board/nexbox/a95x/post-build.sh as a base, I can drop it.
> 
>>> +     $MKIMAGE -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d $BINARIES_DIR/Image $BINARIES_DIR/uImage
>>> +fi
>>> diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
>>> new file mode 100644
>>> index 0000000000..bbbcd5307f
>>> --- /dev/null
>>> +++ b/board/freescale/imxrt1050evk/readme.txt
>>> @@ -0,0 +1,24 @@
>>> +NXP i.MXRT1050 EVK board
>>> +---------------------
>>
>> Add the few missing '-'
>>
>> Also, as requested by Giulio, a short intro about the board + a link
>> would be useful here.
>>
>>
>>> +# Kernel
>>> +BR2_LINUX_KERNEL=y
>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19-rc5"
>>
>> 5.19 is out now, so you can use a non-rc version :)
> 
> Sorry I forgot to change when submitting...
> 
>>> +BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
>>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
>>> +BR2_LINUX_KERNEL_IMAGE_NAME="Image"
>>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
>>> +
>>> +# Filesystem
>>> +BR2_TARGET_ROOTFS_EXT2=y
>>> +BR2_TARGET_ROOTFS_EXT2_4=y
>>> +BR2_TARGET_ROOTFS_EXT2_LABEL="root"
>>> +BR2_TARGET_ROOTFS_EXT2_SIZE="3M"
>>
>> Why limit to 3 MB ? Is there a strong reason?
> 
> Because that's the nearest ceil(MB) size of the ext4 filesystem.
> I like dd-ing the images fast.
> 
> Also, leave the label
>> undefined.
>>
>>> +# Bootloader
>>> +BR2_TARGET_UBOOT=y
>>
>> Please used a version of U-Boot explicitly defined in the defconfig.
> 
> Read below.
> 
>>
>>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
>>> +BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
>>> +BR2_TARGET_UBOOT_FORMAT_IMG=y
>>> +BR2_TARGET_UBOOT_SPL=y
>>> +BR2_TARGET_UBOOT_SPL_NAME="SPL"
>>> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>>> +
>>> +# Required tools to create the SD card image
>>> +BR2_PACKAGE_HOST_GENIMAGE=y
>>> +BR2_PACKAGE_HOST_MKPASSWD=y
>>> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
>>> +
>>> +# Misc
>>> +BR2_BINUTILS_VERSION_2_36_X=y
>>> +# thumb2 ADR bug introduced in 2.37 fix is not yet in u-boot
>>
>> Do you have some detail on this bug? Like a link to the bug report, or
>> something like this? Note that binutils 2.39 is soon going to arrive,
>> so we will get rid of binutils 2.36... which means we will very soon
>> have a problem with this defconfig.
>>
> 
> https://patchwork.ozlabs.org/project/uboot/patch/20220712110023.3163770-1-andre.przywara@arm.com/
> 
> The patch above removes the need for binutils 2.36 and a U-Boot
> version hasn't been released with that commit yet.

Then the best practice is to backport the patch above locally to
binutils package for every version. But when trying to compile using an
external toolchain(not generated by Buildroot like official ARM
toolchain) then it will fail to boot.

As Thomas mentioned binutils 2.36.1 will be removed soon in favor of
2.39 that will contain that patch, but 2.37 and 2.38 will create
problems, as well as all the external ones.

Do you think there is a possible work-around for u-boot to avoid the
binutils bug? If yes one possibility is to add a local patch for u-boot
for this defconfig only with the work-around. This will make the board
to work everytime. It's a patch that doesn't have to be upstreamed but
only a local work-around.

What about that Thomas?

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

> This is the reason for no U-Boot version.
> 
> Thanks,
> Jesse T
> 
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
