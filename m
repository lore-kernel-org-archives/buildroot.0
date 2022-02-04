Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3D3C433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 10:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2B8C400E0;
	Fri,  4 Feb 2022 10:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4j5pkdXQG2AN; Fri,  4 Feb 2022 10:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC824020B;
	Fri,  4 Feb 2022 10:14:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6D691BF34D
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5D03408B9
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 10:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8pISwYMmVqU for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 10:14:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp4.osuosl.org (Postfix) with ESMTP id F21EB408AB
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 10:14:00 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FvbGnNG034NL9FvbHnV9Ks; Fri, 04 Feb 2022 11:13:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643969637; bh=gPj+rlS2Awl4w1wnmSrgtFbYfbovsGvwsJ3zukFkA1M=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=md8ED6bnKLJmbJTaIw6e6Lv9fRuHXIvFU3TA/0qVwgoXjpRPpf26dz/0dJ9NgxxgV
 5PQmBtEv4PN7cFBT4TG0rCZO/XwianIPk1l0joIZCIH9Kjke7uSfv0iprSgkYAYmzm
 BvmHEKQtEEv2N70QIdmuUe7JeUNWj8PZvJ4xEqp6yk0MMjM165BY4tIjDZUnRkJbya
 xkA4Zd5UjI2tD7JidVLUDJBL67webXjMMZFMr0Mx3IZDI++Cfxd3u8FquD7MVHEYK1
 vNKL1AnxL2/Owv1pHiGzPDWqbWj9Q2qChAhgwemvDeOB4eYx3FYalBrsE9PPqycD4i
 HAOSxAnQ9hsXQ==
Message-ID: <2b671b31-5f2e-e3f1-b365-e5f2be2ca4fc@benettiengineering.com>
Date: Fri, 4 Feb 2022 11:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220203134402.1647985-1-neal.frager@xilinx.com>
 <20220203134402.1647985-2-neal.frager@xilinx.com>
 <80d97a22-5159-3111-75a3-9286e4776385@benettiengineering.com>
 <SJ0PR02MB775844C568A8974CFF89518BD7299@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB775844C568A8974CFF89518BD7299@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfLDvQNSlyZwUG7kRaWp02SLWNqKroVOPkcBn0XEOJ+3giUfmu+mQiyjnnp3bKZqhvA6dqFp7wNMOHDO12XjLTfRGkmay4oYNLMDKqB1D1oDpSUoPZrbp
 yfk6sV8E32y4ja5Id7YIbQbapa5gShK5zDwf5ssZ8xI+hKjFEcptk0KHxQV92hQQdqLkns66L5M0pB44yOJC/1nUFdtUp2xq8L7UeHfKWhP1dqdzkVaDU9nh
 wfMsTZRNSWMIRsw0lUhwnnvyjB6cxwdLCfc0R0p8RIM=
Subject: Re: [Buildroot] [PATCH 2/2] Add configs/zynqmp_zcu102_defconfig
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 04/02/22 08:09, Neal Frager wrote:
> Hi Giulio,
> 
>> Hi Neal,
> 
>> can you please improve commit log doing a presentation of what is zynqmp_zcu102?
> 
>> Is this for thi boards
>> https://www.xilinx.com/products/boards-and-kits/ek-u1-zcu102-g.html ?
> 
>> If yes please describe its features and point the url at the end of commit log.
> 
> Yes, no problem.  I will add the url that describes the board to the commit log.
> 
> On 03/02/22 14:44, Neal Frager wrote:
>> Signed-off-by: Neal Frager <neal.frager@xilinx.com>
>> ---
>>    configs/zynqmp_zcu102_defconfig | 34 +++++++++++++++++++++++++++++++++
>>    1 file changed, 34 insertions(+)
>>    create mode 100644 configs/zynqmp_zcu102_defconfig
>>
>> diff --git a/configs/zynqmp_zcu102_defconfig
>> b/configs/zynqmp_zcu102_defconfig new file mode 100644 index
>> 0000000000..5f98e72aaf
>> --- /dev/null
>> +++ b/configs/zynqmp_zcu102_defconfig
>> @@ -0,0 +1,34 @@
>> +BR2_aarch64=y
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
>> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"
> 
>> Here you need also:
>> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> 
> Thanks for making me aware of this.  I will add it to both defconfigs.
> 
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +# BR2_TARGET_ROOTFS_TAR is not set
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>> +BR2_TARGET_UBOOT_SPL=y
>> +BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
>> +BR2_TARGET_UBOOT_ZYNQMP=y
>> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/2021.2/bin/pmufw-v2021.2.bin"
> 
>> This ^^^ URL is unreachable and I've found this as substitution:
>> https://github.com/lucaceresoli/zynqmp-pmufw-binaries/blob/v2021.2/bin/pmufw-v2021.2.bin
> 
>> Luca, is that the correct one? I've switched to v2021.2 tag and copied the link.
> 
> Sorry about this one.  I was balancing a couple too many versions of my defconfig files and this typo slipped through the cracks.  I have corrected it in both defconfigs for the next version of the patch.
> 
>> +BR2_TARGET_UBOOT_FORMAT_ITB=y
>> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
>> +BR2_PACKAGE_HOST_GENIMAGE=y
>> +BR2_PACKAGE_HOST_MTOOLS=y
> 
>> I've built with gitlab-CI, check this patch for the manual to reproduce:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/
> 
>> BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y came out using the docker.
> 
>> Can anyone test it on real hardware? Luca maybe?
> 
> Regarding the board test, there is one thing still missing.  U-Boot 2021.01 uses distro boot, so for U-Boot to properly boot the Linux kernel and rootfs, a boot.scr file needs to be in the boot partition of the SD card.  I have been getting it to work by manually adding this file to the SD card image after the build.  But a better way would be that this file is already included with the genimage.cfg.  How does buildroot typically handle U-Boot boot.scr files?  I would be happy to add this to the automated build process, but I do not wish to re-invent the wheel.

Lately a lot of extlinux.conf has been used instead of boot.scr, so you 
could go for something like this:
https://git.buildroot.net/buildroot/tree/board/stmicroelectronics/stm32mp157c-dk2/overlay/boot/extlinux/extlinux.conf

and point to it in board defconfig.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
