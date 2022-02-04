Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8A4C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 01:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BAA860BB2;
	Fri,  4 Feb 2022 01:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c97R__8TrPDo; Fri,  4 Feb 2022 01:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 500AB60BB0;
	Fri,  4 Feb 2022 01:40:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E9F01BF2BA
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 01:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D4C682B51
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 01:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cfbu920MzGYs for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 01:40:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90C6A8275A
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 01:40:24 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FnaInvP8FI46dFnaIny7kY; Fri, 04 Feb 2022 02:40:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643938823; bh=aKaI1osYEBNI6FDfKMwf4MeS9KXlFYKyHUPBTch2ZJk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fVxi3MwpQi+l1ChVhdNcp6x+/9Zwm47wiWkos1IuRzbgQRWpq3jtBczNeTZSRk/AX
 OJSsLzWou/sclvm9Eh3vu0GJYzYQBisoAj5QkuWI1p1FlkaAs9r7LeDloqXqEUXiNw
 DtvLU3sMIQ0uYmBTXC7A62kNrVkFLvpUggUC9PfkJVYdTRaUh5lQlop0xwtF6ELG59
 FOYwcq04ptNO0zo959m7La9mR/ypLtOYKBLVIoA3GVg4qoZwMilisDGVmW4AziBOGn
 esFP507/EBInNLXoDsoMFag9lvhNT8d55l5jtsSl7wdN9pt0PXjmY1KSBcRzzBl/sG
 6/z2OGoZWUwpQ==
Message-ID: <80d97a22-5159-3111-75a3-9286e4776385@benettiengineering.com>
Date: Fri, 4 Feb 2022 02:40:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220203134402.1647985-1-neal.frager@xilinx.com>
 <20220203134402.1647985-2-neal.frager@xilinx.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220203134402.1647985-2-neal.frager@xilinx.com>
X-CMAE-Envelope: MS4wfIp1G9Jz5mSEk4PU8dOXfHpedOFNh8Tjest1VomqVqxm0hiSjhiDzII9x5u1Yp5/BNntsVVz5C3g+rRj6CXk698EGyrSs4Ed6b2GVrw19pyATw9uSbxS
 e5UH2fCKyie8Aj9M4HFWCqIpbzvS7xsUye6M37AQfryNtGUB0nNrCKKBxAPtvFhynm7v5BwMXqNe774+gAOnB2lpmJzctAjn8wcIwGUlWKYwkKPhXjVegGpQ
 Ig9oQEIxgWHqGQ5oqN28ZQ7bLv9fS+iJx+Zo5I3onnM=
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
Cc: luca@lucaceresoli.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

can you please improve commit log doing a presentation of what is 
zynqmp_zcu102?

Is this for thi boards 
https://www.xilinx.com/products/boards-and-kits/ek-u1-zcu102-g.html ?

If yes please describe its features and point the url at the end of 
commit log.

On 03/02/22 14:44, Neal Frager wrote:
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>
> ---
>   configs/zynqmp_zcu102_defconfig | 34 +++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 configs/zynqmp_zcu102_defconfig
> 
> diff --git a/configs/zynqmp_zcu102_defconfig b/configs/zynqmp_zcu102_defconfig
> new file mode 100644
> index 0000000000..5f98e72aaf
> --- /dev/null
> +++ b/configs/zynqmp_zcu102_defconfig
> @@ -0,0 +1,34 @@
> +BR2_aarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/zynqmp/post-image.sh"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/Xilinx/linux-xlnx.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xlnx_rebase_v5.10_2021.2"
> +BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynqmp"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-zcu102-rev1.0"

Here you need also:
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.4"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="zynqmp"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/xilinx/u-boot-xlnx.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xlnx_rebase_v2021.01_2021.2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="xilinx_zynqmp_virt"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/boot.bin"
> +BR2_TARGET_UBOOT_ZYNQMP=y
> +BR2_TARGET_UBOOT_ZYNQMP_PMUFW="https://github.com/lucaceresoli/zynqmp-pmufw-binaries/raw/2021.2/bin/pmufw-v2021.2.bin"

This ^^^ URL is unreachable and I've found this as substitution:
https://github.com/lucaceresoli/zynqmp-pmufw-binaries/blob/v2021.2/bin/pmufw-v2021.2.bin

Luca, is that the correct one? I've switched to v2021.2 tag and copied 
the link.

> +BR2_TARGET_UBOOT_FORMAT_ITB=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y

I've built with gitlab-CI, check this patch for the manual to reproduce:
https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/

BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y came out using the docker.

Can anyone test it on real hardware? Luca maybe?

For the rest it built correctly.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
