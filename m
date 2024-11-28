Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06112D690EC
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 08:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5ABE42449;
	Thu, 28 Nov 2024 08:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeeVqcMjNTRc; Thu, 28 Nov 2024 08:38:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 926A342555
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 926A342555;
	Thu, 28 Nov 2024 08:38:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3ECA1167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 08:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 949BD608DA
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 08:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpe_N722rMJs for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 08:38:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.5;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 315CD608C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315CD608C4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by smtp3.osuosl.org (Postfix) with ESMTP id 315CD608C4
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 08:38:39 +0000 (UTC)
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-120 (Coremail) ; Thu, 28 Nov 2024 16:38:37 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 28 Nov 2024 16:38:37 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Julien Olivain" <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <8acb5897b8fc142d1e91cf5e68bfb378@free.fr>
References: <20241127032336.345826-1-andyshrk@163.com>
 <8acb5897b8fc142d1e91cf5e68bfb378@free.fr>
X-NTES-SC: AL_Qu2YAPuTvEkq4SKaZukZnEobh+Y5UcK2s/ki2YFXN5k0qiTx3icwbG5AE1jE9fm/KwSmoQmXQjhw185jW61SUJhgOrGDoLEQ0osjfDPVE/DR
MIME-Version: 1.0
Message-ID: <2486874f.8976.19371ec13aa.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: eCgvCgAnLVQNLEhn4lEyAA--.61743W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRGlXmdIJKDMNwAEsX
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
 Message-ID; bh=IKB+zselGqm6dc50OklnBrzZGEXSFEdypdHAGleQ7ZY=; b=S
 GOMuBlO8Le596p3o8P1CyCKdvUH0IQ4bn2D5piep9oYMXSMOo1M5tTleAsKISkVL
 xQv+qLEyatTyeNYscYO8rGCq8favsDsygZt5kRBzhSzEGVk1HC6ah2pC1SB1Lpu4
 yK38Oe8EuLxpbLzt0hEo/YU1ac06csHaCi3KCD8U+o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=SGOMuBlO
Subject: Re: [Buildroot] [PATCH] configs/rock5b_defconfig: Increase the
 filesystem size to 512MB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

At 2024-11-28 05:58:49, "Julien Olivain" <ju.o@free.fr> wrote:
>Hi Andy,
>
>On 27/11/2024 04:23, Andy Yan wrote:
>> The current 250MB filesystem size is not enough which will casue
>> failure like bellow:
>> 
>> Copying files into the device: __populate_fs: Could not allocate block
>> in ext2 filesystem while writing file "libharfbuzz-subset.so.0.60900.0"
>> mkfs.ext4: Could not allocate block in ext2 filesystem while populating
>> file system
>> *** Maybe you need to increase the filesystem size
>> (BR2_TARGET_ROOTFS_EXT2_SIZE)
>
>Building this defconfig with the commands:
>
>     make rock5b_defconfig
>     make
>

I also run with the cmd above, but before that, I had compiled other board without doing a make clean, 
and I'm not sure if the compilation results from the previous boards affected this compilation.

I try do make clean before make rock5b_defconfig, it did compile successfully.


>succeed. See for example:
>https://gitlab.com/buildroot.org/buildroot/-/jobs/8429067667
>
>The filesystem size is usually increased when the defconfig is
>no longer building (without adding packages). So if you get the
>build error when adding packages to your config, you should increase
>the filesystem size to the right size for your project.
>
>
>> Signed-off-by: Andy Yan <andyshrk@163.com>
>> ---
>>  configs/rock5b_defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
>> index 38b5aad206..43710b6545 100644
>> --- a/configs/rock5b_defconfig
>> +++ b/configs/rock5b_defconfig
>> @@ -28,7 +28,7 @@ 
>> BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_273
>>  
>> BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
>>  BR2_TARGET_ROOTFS_EXT2=y
>>  BR2_TARGET_ROOTFS_EXT2_4=y
>> -BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
>> +BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
>>  BR2_TARGET_UBOOT=y
>>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
>> --
>> 2.34.1
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>Best regards,
>
>Julien.
>_______________________________________________
>buildroot mailing list
>buildroot@buildroot.org
>https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
