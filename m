Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65C9C52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 18:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68F7F40C6F;
	Thu, 15 Aug 2024 18:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kj9WIV0PRYe; Thu, 15 Aug 2024 18:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4FE34064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4FE34064E;
	Thu, 15 Aug 2024 18:03:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20C5E1BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 18:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 0DE4F40253
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 18:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id 5Hyl4EzcgIyn for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 18:02:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=203.205.221.155;
 helo=out203-205-221-155.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D715740243
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D715740243
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com
 [203.205.221.155])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id D715740243
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 18:02:57 +0000 (UTC)
Received: from [192.168.100.247] ([106.120.7.242])
 by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
 id EE418AE2; Fri, 16 Aug 2024 01:59:36 +0800
X-QQ-mid: xmsmtpt1723744776t6mu2afw5
Message-ID: <tencent_1403A32A92D09C0019277D8EFCA6D8462806@qq.com>
X-QQ-XMAILINFO: MTLOD8DDG1UaEU20mH5s5N38iIzdjUhj7CWhpgFH0in/ohtmA8flp5G7v/oHds
 Y5POTzqWJWLJewZ8JfNyA7pVJOvQSTHmuQ4V87ZqEqpNeNpHH7oSzRXS8ni3bMk/pEgw9h0fYwyq
 MRSk/O8g9tNJpvH6CSEo7j4IzIxB/f4ZDiIgGmvlVmaMAL+ZtL542XJeVTd29BYdp2iILLNGXvTf
 rAEp/lMjJsRFgNPAGFi37o2Rca7iWogorC+o5pzWPEuZacQEg8DpWOgCLOpc/qesKrbrwnNlyRg5
 5tfTEMuLaGPKhT90NwHU5kMRGATzsuIKbgsWRBshMgtwTC3bstoGvdSe226d4cQh5tyvNdtZUXkx
 icwiIb9f41KQ1jxpxYpZMSbypi/8MsML3L0QPqx+dDONGw0JybK1vBXCsE0yD3HyVGYna3z0nyHk
 pdGZ0f/CHPIViqXri2SHmUs9sYXXanDZqk2Ld6Fn0m4e9rek5rtaTXNM5goEtwBoPTb3RK//034r
 OtRC6K9EccSRv9cMUZG8XOKm93sV9awHRsuLL4FWLZOKqw6q5PFOXfAxFxPZMLZLSVGD9YA5q4jY
 TSnpCl2CMilTqpXZmMQnnQkJRzZ8hldFHp83lsngpCluFd1Yowd5jVO8MDdOLTAiAYZ3eCZ0p80E
 IPIiaY5xFCkqR1vOm6XGTYHnqarC3q1hogUUmiSr3FcaL1tslWZPkQUnj5SLNmSVsge8EmIxXMNH
 WMgVm5nBIChlYwjyoCX80r5uNk98wIi8n50ngZeMu7eKCZ57Ey2lkBSi7vs4WU97fKV+SI7tnXwe
 SDhuVzhmSCEx14odIqmjb/zTSQ56aaUgsjVlg/KJDU6EWjgpdjTWixFvggix4iBnvLcLnmMTKd/+
 3xbdfNh/sFDoVoU5EZpbmFPk0IMaFbmlRFvwwFVQjGV3m7H03jEhIepJWVv1hZXvhOP+BfmpwebT
 0o9+y4ozBlIfW4FqxdmzJYgEXYtYhFWFu2WfrrIePFG92zFjXc5ncp43AGwMjBT6Y0Tt64MtE=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-OQ-MSGID: <68b85619-ff31-4bd7-8d38-ea75b38a3983@foxmail.com>
Date: Fri, 16 Aug 2024 01:59:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <tencent_7E39529BBE1BB50CB4AA2A429702629C0808@qq.com>
 <tencent_96D562A129814C4EA71CECCDB60D1B060707@qq.com>
 <20240815001237.6404eab5@windsurf>
Content-Language: en-US
From: Darren Wang <wangdong115@foxmail.com>
In-Reply-To: <20240815001237.6404eab5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1723744973;
 bh=HLk0ryP7mCwrZc36+Glr7tOIdDCaXEqllxFWkjYe6uY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=lmRRDzmx6sFaAvRd9tQL+ACdG5ucvHQwu/RxPjG5l+2vMagyIXbml50qbWEH/vt2V
 oUK4YuJjwy4IM7rVmHrlJyUcVDTzFWwluaxTMcMwu5ckevdNfmsiHP0DBVIgCBCSVO
 UqBS7lCFIZO3OEac6ZgHRdMw32raH5z86LpvDKHc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=lmRRDzmx
Subject: Re: [Buildroot] [PATCH v2]
 configs/friendlyarm_nanopi_neo_defconfig: new defconfig
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 2024/8/15 06:12, Thomas Petazzoni via buildroot wrote:
> Hello Dong,
> 
> On Wed, 14 Aug 2024 01:02:44 +0800
> Dong Wang <wangdong115@foxmail.com> wrote:
> 
>> This patch adds a new defconfig for the NanoPi NEO board made by
>> FriendlyARM. This board is based on the Allwinner H3 SoC.
>>
>> See: https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO
>>
>> This patch uses the mainline kernel and u-boot for the board.
>>
>> The configurations are based on the previously dropped defconfig
>> maintained by Yann E. MORIN <yann.morin.1998@free.fr>.
>>
>> Signed-off-by: Dong Wang <wangdong115@foxmail.com>
> 
> Thanks a lot for this v2, which I applied to next, but after fixing a
> number of things (see below). Also, there's one remaining fix to fix as
> a follow-up, see below as well.

Thanks for the review and feedback! I am very delighted to see my first 
patch to the open source community get applied!

> 
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index d7d0af3543..9eb54bc2bc 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -868,6 +868,10 @@ F:	package/logsurfer/
>>   N:	Dominik Michael Rauh <dmrauh@posteo.de>
>>   F:	package/gdal/
>>   
>> +N:	Dong Wang <wangdong115@foxmail.com>
>> +F:	board/friendlyarm/nanopi-neo
> 
> We like directory paths to end with a final / in the DEVELOPERS file,
> so I fixed this.
> 
>> diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
>> new file mode 100644
>> index 0000000000..ec78fd0e56
>> --- /dev/null
>> +++ b/board/friendlyarm/nanopi-neo/genimage.cfg
>> @@ -0,0 +1,17 @@
>> +# Minimal SD card image for the NanoPi NEO.
>> +image sdcard.img {
>> +	hdimage {
>> +	}
>> +
>> +	partition u-boot {
>> +		in-partition-table = false
>> +		image = "u-boot-sunxi-with-spl.bin"
>> +		offset = 8K
>> +		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
> 
> I don't understand this "size" value, and especially the - 16KB(GPT),
> since this image is not using a GPT partition table. Could you clarify,
> and perhaps send a follow-up patch to fix this?

My bad. I copied this part from board/orangepi/common/genimage.cfg 
without a second thought. This is wrong. I just sent another patch to 
fix this!

> 
>> diff --git a/board/friendlyarm/nanopi-neo/patches/linux.hash b/board/friendlyarm/nanopi-neo/patches/linux.hash
> 
> The files for those hashes were wrong, I don't know how you generated
> them, but they need to be in a subdir for each package:

I copied them from boot/uboot/uboot.hash and linux/linux.hash. They were 
also the ones that were checked against when I built the image and 
test... So I didn't even noticed the wrong directory...

> 
> board
>   + friendlyarm
>     + nanopi-neo
>       + patches
>         + linux
>           + linux.hash
> 
> Also, the hash for linux-headers was missing (as a symlink to linux). I
> fixed those issues by just running ./utils/add-custom-hashes.

Thanks for the fix!

> 
> 
>> diff --git a/configs/friendlyarm_nanopi_neo_defconfig b/configs/friendlyarm_nanopi_neo_defconfig
>> new file mode 100644
>> index 0000000000..8d1dde247d
>> --- /dev/null
>> +++ b/configs/friendlyarm_nanopi_neo_defconfig
>> @@ -0,0 +1,50 @@
>> +# Architecture
>> +BR2_arm=y
>> +BR2_cortex_a7=y
>> +BR2_ARM_FPU_VFPV4=y
>> +
>> +# Linux headers same as kernel, a 6.6 series
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>> +
>> +# Hashes
>> +BR2_GLOBAL_PATCH_DIR="board/friendlyarm/nanopi-neo/patches"
>> +BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>> +
>> +# System
>> +BR2_TARGET_GENERIC_HOSTNAME="nanopi-neo"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the NanoPi NEO"
>> +
>> +# Image
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/friendlyarm/nanopi-neo/post-build.sh"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/friendlyarm/nanopi-neo/genimage.cfg"
>> +
>> +# Kernel
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.44"
>> +BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h3-nanopi-neo"
>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>> +
>> +# Filesystem
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_4=y
>> +
>> +# Bootloader
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_neo"
>> +BR2_TARGET_UBOOT_NEEDS_DTC=y
>> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
>> +
>> +# Host utilities
>> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> 
> dosfstools is no longer needed, as you no longer have a FAT partition.
> 
>> +BR2_PACKAGE_HOST_GENIMAGE=y
>> +BR2_PACKAGE_HOST_MTOOLS=y
> 
> mtools is also no longer needed.
> 
> Thanks again!
> 
> Thomas

Thanks!

Dong

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
