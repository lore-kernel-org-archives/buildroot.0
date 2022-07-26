Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790FEC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 011DC40124;
	Tue, 26 Jul 2022 21:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011DC40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uTv3F6Uq54sk; Tue, 26 Jul 2022 21:11:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1BBC40116;
	Tue, 26 Jul 2022 21:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1BBC40116
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 50CE41BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 291D6408F1
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 291D6408F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mKby_RV6jjto for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:11:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B10E4408E5
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B10E4408E5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:11:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QLBAPK066398;
 Tue, 26 Jul 2022 16:11:10 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QLBA3u006080
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 16:11:10 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 16:11:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 16:11:10 -0500
Received: from [128.247.75.130] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QLBAla089566;
 Tue, 26 Jul 2022 16:11:10 -0500
Message-ID: <7589dc27-72aa-d7f7-2993-804123204f2a@ti.com>
Date: Tue, 26 Jul 2022 16:11:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-5-x-shi@ti.com> <20220726210013.45bf33ec@windsurf>
In-Reply-To: <20220726210013.45bf33ec@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658869870;
 bh=2LVl6cBeYn9P+ZseC/bFWMZYvfsPITHJ809Od0i+wbQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=LfHWi4GuiYHwjDa2pcOPjxTCN/0t+JvaVj+AkS8lMIIMTxWgVOYcRydviIEr2KT5J
 3AnRN9eERkUFCWjbJs7o/x0m4TK4RbrbNFB/95V4MrliIg/iu9O4KSuZHFfNckG6I+
 tpWCafkQgz6FvOuQwPbgtTyD6ivbo8TLuvK22hXU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=LfHWi4Gu
Subject: Re: [Buildroot] [PATCH 4/4] configs/am64x_sk_defconfig: add new
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/26/22 14:00, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 26 Jul 2022 11:50:41 -0500
> Xuanhao Shi <x-shi@ti.com> wrote:
> 
>> Adds the new defconfig for TI's AM64X_SK board after patch.
>>
>> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
>> ---
>>   configs/am64x_sk_defconfig | 44 ++++++++++++++++++++++++++++++++++++++
> 
> This should be squashed into the previous commit.
> 
> Also, please add entries in the DEVELOPERS file for the board/
> directory and this new defconfig.
> 
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 configs/am64x_sk_defconfig
>>
>> diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
>> new file mode 100644
>> index 0000000000..629bff6519
>> --- /dev/null
>> +++ b/configs/am64x_sk_defconfig
>> @@ -0,0 +1,44 @@
>> +BR2_aarch64=y
>> +BR2_TOOLCHAIN_EXTERNAL=y
>> +BR2_INIT_SYSTEMD=y
> 
> We want our defconfigs to be minimal, so keep the default toolchain and
> default init system.
> 
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/am6x/genimage.cfg"
>> +BR2_LINUX_KERNEL=y
> 
> You must specify an explicit kernel version so that the build is
> reproducible.
> 
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig"
> 
> Drop $(TOPDIR)/, it is not needed.
> 
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>> +BR2_PACKAGE_LINUX_FIRMWARE=y
>> +BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
>> +BR2_PACKAGE_K3_IMAGE_GEN=y
>> +BR2_PACKAGE_K3_IMAGE_GEN_UBOOT_SPL_DEFCONFIG="am64x_evm_r5"
>> +BR2_PACKAGE_K3_IMAGE_GEN_SOC="am64x"
>> +BR2_PACKAGE_K3_IMAGE_GEN_CONFIG="evm"
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> 
> You must specify an explicit TF-A version so that the build is
> reproducible.
> 
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="SPD=opteed"
>> +BR2_TARGET_OPTEE_OS=y
> 
> You must specify an explicit OP-TEE version so that the build is
> reproducible.
> 
>> +BR2_TARGET_OPTEE_OS_PLATFORM="k3"
>> +BR2_TARGET_OPTEE_OS_CORE_IMAGES="tee-pager_v2.bin"
>> +BR2_TARGET_UBOOT=y
> 
> You must specify an explicit U-Boot version so that the build is
> reproducible.
> 
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am64x_evm_a53"
>> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
>> +BR2_TARGET_UBOOT_FORMAT_IMG=y
>> +BR2_TARGET_UBOOT_SPL=y
>> +BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
>> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
>> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN=y
>> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM=y
>> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SITE="https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10"
>> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_SOURCE="gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2"
>> +BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM_LICENSE="GPL-3.0+"
>> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
>> +BR2_PACKAGE_HOST_GENIMAGE=y
>> +BR2_PACKAGE_HOST_MTOOLS=y
> 
> Thanks!
> 
> Thomas

Noted. I'll rework this patch and squash it with the previous one.

Thanks!

Xuanhao
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
