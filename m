Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1511C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 11:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5799A4159F;
	Thu,  9 Nov 2023 11:21:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5799A4159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qDTwa_CJahm; Thu,  9 Nov 2023 11:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 328CE414DA;
	Thu,  9 Nov 2023 11:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 328CE414DA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 903B21BF28A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 768D161329
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 11:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 768D161329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3DE2R0mTTQ0a for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 11:21:16 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC18161319
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 11:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC18161319
Received: from [192.168.50.220] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1360rKnrVH8Hd1360rscJS; Thu, 09 Nov 2023 12:21:13 +0100
Message-ID: <90fc81f5-d445-4917-bb02-46e2e353642a@benettiengineering.com>
Date: Thu, 9 Nov 2023 12:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
References: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
X-CMAE-Envelope: MS4xfB1ZKHaA6oafcIBhW48HvYbTFrNY7WQsOo6o1nYKKMKiSHwqW4jOgSbHXCH8rN5Jk6X3Gkxt3xTQemZ5SQo2MGZ/AHpZe15/8HnEF/6Gg4wyB+LTDA9k
 3uFiT9pfLdMKAVp78Qy805+yIhtRVKfGxnP6ZuykqjbweDfQpOLfiD6hsGyW8Q+9wV+DF5KEB/i33dLbwa8CfvgBdwX2H3/eNhnM6amY95yOgWEuK8KK3xwc
 q9YETzOJEXUYFE1hfUJ3uCRtP+K/dgaE2dpw0Iy0ulgLWo4h0Utdfwiv4+mSlLHQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699528873; bh=/R4APckJqLyfz1A3dMjqbGjoBjBmKL32KUOVZylQEck=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=n8zlTsH4rlRUFAAA+yoLM03++dZYfOUPp9n1SrQwhWuPF8fTwgb/SOBQGWviT07cY
 wLKscZ34NIboYjlRcrf434rr5rY/Q4QHSHA1wlpWwtKvYPKcVM5O6gkQr5m4/rjVkz
 GhFOWDxyE4XXyhz3dNmVytjLUpHxGI4jpcSlr64Wg+gMMVq50tyGf1/rZnbZ3K3/h/
 osOfK3DF7P4tpkpOq5QJqNHZtxcw5FMP3c+pQ2IO6wbolLIC0kYmh5pU6oxfYpFzYx
 WzyhHTZO+QdVOufFE78lgmoURM8mjaZwScCh92R2q1wZT769rpf+heVDT/yabWnf4M
 6YOQDFaWJuVag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=n8zlTsH4
Subject: Re: [Buildroot] [PATCH v1] configs/imxrt1050-evk: Bump Kernel and
 U-boot
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jesse,

On 09/11/23 04:59, Jesse Taube wrote:
> Bump Linux to 6.6 and U-Boot to 2024.01-rc2
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
>   configs/imxrt1050-evk_defconfig | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
> index af060fb9f4..0eb6f626c9 100644
> --- a/configs/imxrt1050-evk_defconfig
> +++ b/configs/imxrt1050-evk_defconfig
> @@ -7,12 +7,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
>   
>   # Toolchain
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
>   
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6"
>   BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
>   BR2_LINUX_KERNEL_UIMAGE=y
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -30,7 +30,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01-rc2"

I would really avoid to bump to a rc version. Please use v2023.10
or let's wait for v2024.01 to be released.

Thank you
Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

>   BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
>   BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
>   BR2_TARGET_UBOOT_FORMAT_IMG=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
