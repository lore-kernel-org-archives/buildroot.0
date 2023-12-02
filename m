Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6342C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9234A4211D;
	Sat,  2 Dec 2023 16:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9234A4211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLh0hcNRsZIs; Sat,  2 Dec 2023 16:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4CE742118;
	Sat,  2 Dec 2023 16:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4CE742118
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FC5C1BF5A5
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 16:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33CE642118
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 16:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33CE642118
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3HpZZVdpI3t for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 16:34:47 +0000 (UTC)
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A36F742114
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 16:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A36F742114
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9Sx1rarUe7U3P9Sx2r73Jn; Sat, 02 Dec 2023 17:34:44 +0100
Message-ID: <51da90ab-8b97-46a6-8ec7-4faa4ae4d4f1@benettiengineering.com>
Date: Sat, 2 Dec 2023 17:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: nigel_wang <asd617140123@gmail.com>, buildroot@buildroot.org
References: <20231127064349.12099-1-asd617140123@gmail.com>
 <20231127064349.12099-2-asd617140123@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231127064349.12099-2-asd617140123@gmail.com>
X-CMAE-Envelope: MS4xfMLmVDzq4kUg2ARWpjQ5WNyfbmiIHDQ7BCP0/Jkdmkg3BCCdaJarzGad2pyh1MukgFAUJ8vBAnAvZ7nbhVYLWVXtvSDkJc6G6nw3pW3l2fNOxAV+J5z/
 E+UH0geJVyvvggT1KcJ3u9Yl0h3TdIM16iDoUZUjQYhpOB0Vw5MVTdF6pESV4FUhd6w03BEZ5rzDu4lXf5msyX642bgcayhal1zIGo7+g9JdYpRtm8wS8ooe
 76GXVtywgmF9q1CrlJnSW12PH+5bszX8xi/LooprRLsOjk9l0JbS9lF73l9G54jmsVZt5CSTRkRH0ZGbRact0w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701534884; bh=RVW0p1BfS1zEiLL75G+eIa3YcX3NtG3dpG6/i6NoKp8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=HCKr12Rxi/rdt/dsQvwtobNyrDnxJ8vQKU18F/ohs9Zo7VRcPH+A6BU/hZSCuVjRN
 cuamAt88iFZnwQg3gd3WVhQrgod2qVNbqi9D4ruhvX3yRX+va3HQwZ2bK3eWCFvRje
 X419INvgt+F9YTGfxBaei7eKwM7MTrrosIlOjPhJgRSCn5VpwAwevELJ2o40hXz7Ge
 p/jNuzHtJlTDibGqKlHl0B03F5ugnym0LpYtCGOx9XuadAXXJqqsYpZ2KrMxnqy/Lh
 kIYDJ9VSpr7lsco2o8Eddke6aaxvpJuzanWxntJ/GVw4YmUy5y+rl5YJOGJoNGHVMe
 kbrhN0gsDEWog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HCKr12Rx
Subject: Re: [Buildroot] [PATCH 2/2] configs/cubieboard4_defconfig : add
 *_defconfig for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nigel,

On 27/11/23 07:43, nigel_wang wrote:

here commit log is missing but you will squash this patch with 1/2

> Signed-off-by: nigel_wang <asd617140123@gmail.com>
> ---
>   configs/cubieboard4_defconfig | 42 +++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 configs/cubieboard4_defconfig
> 
> diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defconfig
> new file mode 100644
> index 0000000000..6a5f9e3fce
> --- /dev/null
> +++ b/configs/cubieboard4_defconfig
> @@ -0,0 +1,42 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_FPU_NEON_VFPV4=y
> +
> +# Linux headers same as kernel, a 5.15 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y

Please bump to newer Linux version like 6.6 that is LTS

> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"

ditto,

> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"

Is there a reason why you haven't used sunxi_defconfig? It's a more
size-optimized version for sunxi SoCs and it should work correctly.
If it does please change it with "sunxi"

> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun9i-a80-cubieboard4"
> +
> +# Bootloader
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard4/boot.cmd"

Here please use extlinux.conf and remove unnecessary variables.

> +
> +# System
> +BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y

While building using utils/docker-run I've found that the default rootfs 
size of 60MB is too few since it needs 80MB so please set it to 120M if
using sunxi_defconfig for Linux doesn't reduce the size below 60MB. This
can happen because sunxi_defconfig has very less modules installed to
target.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
