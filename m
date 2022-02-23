Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCFBC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 09:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19A8E40180;
	Wed, 23 Feb 2022 09:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CPNww5t4wXgC; Wed, 23 Feb 2022 09:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF367403BF;
	Wed, 23 Feb 2022 09:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 492541BF41A
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 09:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43A4B40180
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 09:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJzGCNPXtFBh for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 09:19:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18069403BF
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 09:19:13 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id MnnhnYxZTQUuPMnnhnNzsm; Wed, 23 Feb 2022 10:19:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645607951; bh=8UirbcigjuRLK7wYNoiyQ29D3VojCj7MHn6c9RPnjxU=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jRIrrkd0dJSoA+hUOTTBKGMolbnoEicLr/NceMTJfjCQm9HHwsFWTNVB7bEpUcTID
 BkwWNsoqHzwKoVlVBlwO++tyCH3JCxL/brEhXTog3lEOsbOlmdaqp3sRBrM0O5bbUG
 xtlSGaSdyZUmrbqnU9wlQ+6HHWdmyNfwu5jof/R0ZyPy6zUGlz+/myW9b18Jk9MJoJ
 4eEkR9cIhXNvK1PwtPGi67rd5N5yUkycDn1BlfUep6LpBehzo5yfhj+O5cujHhkZDP
 9YdRCOIZdxl0rFSU6jchH9mSWX33PofvMO0ssSW8dYiIHJwsqEPHpJYz7hR1phYQAe
 VcoxDkGCi0r3Q==
Message-ID: <84e159d2-0123-e5b1-c42e-99b70c99f43c@benettiengineering.com>
Date: Wed, 23 Feb 2022 10:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>, buildroot@buildroot.org
References: <20220223071049.21153-1-peterlin@andestech.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220223071049.21153-1-peterlin@andestech.com>
X-CMAE-Envelope: MS4wfEDjN4p5lOWUV5OGw6XvjFwP5wIQm+xrQ6JIZBAc3dENnEOrgpEbEE5WZddPpb+jZFBZDVkI1xOJI2rtfrsK/pylTYHvI5oEKi4uqJY7BR41y9jwFfiw
 HA7NdP1rkgg2M8dc/D/GS+f2SgJUl9iYiv/K10RjCFa1yS51ZVKt5wR+8l0/+A96nePMAb3KQ8oBsbkOSrfIZM1sMJhJAkHABjCApPX+6yQR4pLBNc9LF75Y
 31aFsLTDUmugRg0gDf3Oo8ZPXMLAiXLdDqRoy2PFMt5zDXoPfPyP9aJazCwR5adooI3NIh6/950S7k7hOyecBJbIVP6bONZajWmBlmjof4oZgB4Hd3DmQJ6L
 xjGchBgreCBhAk1xqTPVBx8W5T7jN6Uk9B84+ijMrgRl99HbOa0=
Subject: Re: [Buildroot] [PATCH v4 1/3] board/andes: rearrange andes folder
 structure
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, alankao@andestech.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 23/02/22 08:10, Yu Chien Peter Lin wrote:
> Rename ae3xx to ae300 for nds32 architecture and add ae350 platform.
> 
> AE300 (NDS32):
> - http://www.andestech.com/en/products-solutions/andeshape-platforms/ae300/
> AE350 (RISC-V):
> - http://www.andestech.com/en/products-solutions/andeshape-platforms/ae350-axi-based-platform-pre-integrated-with-n25f-nx25f-a25-ax25/
> 
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Signed-off-by: Alan Kao <alankao@andestech.com>
> ---
> Changes v1 -> v2:
>     - move linux source code and its patches to AndesTech Github repo
>     - rename ae350_andestar45_defconfig to andes_ae350_45_defconfig
>     - change C library to uClibc
>     - remove OpenSSL package
>     - remove rootfs.cpio and rootfs.tar
>     - update DEVELOPERS
> Changes v2 -> v3:
>     - specifiy branch to download from AndesTech linux repo
>     - change boot.cmd to extlinux.conf
>     - add post-build.sh for extlinux.conf to retrieve Image and DTB
>     - fix format and update genimage_sdcard.cfg
>     - update readme.txt
>     - add packages (python3, pylibfdt and openssl) for u-boot binman
>     - reorder item in DEVELOPERS
> Changes v3 -> v4:
>     - rename ae3xx folder to ae300
>     - rename andes_ae3xx_defconfig to andes_ae300_defconfig
>     - update readme.txt and item in DEVELOPERS

Some of these change ^^^ must have been moved to the single patch, like 
DEVELOPERS is updated in patch 3/3. I've also forgotten to point you to 
add a --cover-letter, so keep in mind both points for next time.

I've built tested both defconfig successfully, so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: build tested only]

And the other patches of this series is all reviewed, so to me it's 
ready to be committed, but this will happen after Buildroot 2022.02 is 
released, since between rc1 to the release Maintainers only accept 
fixes. Another possibility is that they will commit these patches to 
next branch.

Please remember to tag V3.

Thank you for your effort!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   .../{ae3xx/ae3xx.fragment => ae300/ae300.fragment}     |  0
>   .../linux/0001-nds32-Fix-boot-messages-garbled.patch   |  0
>   ...-dtc-Remove-redundant-YYLOC-global-declaratio.patch |  0
>   board/andes/{ => ae300}/readme.txt                     | 10 +++++-----
>   .../{andes_ae3xx_defconfig => andes_ae300_defconfig}   |  4 ++--
>   .../toolchain-external-andes-nds32/Config.in           |  2 +-
>   6 files changed, 8 insertions(+), 8 deletions(-)
>   rename board/andes/{ae3xx/ae3xx.fragment => ae300/ae300.fragment} (100%)
>   rename board/andes/{ => ae300}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
>   rename board/andes/{ => ae300}/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch (100%)
>   rename board/andes/{ => ae300}/readme.txt (71%)
>   rename configs/{andes_ae3xx_defconfig => andes_ae300_defconfig} (69%)
> 
> diff --git a/board/andes/ae3xx/ae3xx.fragment b/board/andes/ae300/ae300.fragment
> similarity index 100%
> rename from board/andes/ae3xx/ae3xx.fragment
> rename to board/andes/ae300/ae300.fragment
> diff --git a/board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch b/board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
> similarity index 100%
> rename from board/andes/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
> rename to board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
> diff --git a/board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch b/board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
> similarity index 100%
> rename from board/andes/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
> rename to board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
> diff --git a/board/andes/readme.txt b/board/andes/ae300/readme.txt
> similarity index 71%
> rename from board/andes/readme.txt
> rename to board/andes/ae300/readme.txt
> index 0f95c65549..51c05c9235 100644
> --- a/board/andes/readme.txt
> +++ b/board/andes/ae300/readme.txt
> @@ -1,10 +1,10 @@
>   Intro
>   =====
>   
> -Andestech(nds32) AE3XX Platform
> +Andestech(nds32) AE300 Platform
>   
> -The AE3XX prototype demonstrates the AE3XX example platform on the FPGA.
> -It is composed of one Andestech(nds32) processor and AE3XX.
> +The AE300 prototype demonstrates the AE300 example platform on the FPGA.
> +It is composed of one Andestech(nds32) processor and AE300.
>   
>   How to build it
>   ===============
> @@ -12,10 +12,10 @@ How to build it
>   Configure Buildroot
>   -------------------
>   
> -The andes_ae3xx_defconfig configuration is a sample configuration with
> +The andes_ae300_defconfig configuration is a sample configuration with
>   all that is required to bring the FPGA Development Board:
>   
> -  $ make andes_ae3xx_defconfig
> +  $ make andes_ae300_defconfig
>   
>   Build everything
>   ----------------
> diff --git a/configs/andes_ae3xx_defconfig b/configs/andes_ae300_defconfig
> similarity index 69%
> rename from configs/andes_ae3xx_defconfig
> rename to configs/andes_ae300_defconfig
> index 52634caa50..ffcb4d7d38 100644
> --- a/configs/andes_ae3xx_defconfig
> +++ b/configs/andes_ae300_defconfig
> @@ -1,10 +1,10 @@
>   BR2_nds32=y
> -BR2_GLOBAL_PATCH_DIR="board/andes/patches/"
> +BR2_GLOBAL_PATCH_DIR="board/andes/ae300/patches"
>   BR2_TOOLCHAIN_EXTERNAL=y
>   BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
>   BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> -BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae3xx/ae3xx.fragment"
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/andes/ae300/ae300.fragment"
>   BR2_TARGET_ROOTFS_INITRAMFS=y
> diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> index 9c937b8c44..ecd50cc805 100644
> --- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> +++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> @@ -12,4 +12,4 @@ config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
>   	help
>   	  nds32 toolchain for the nds32 architecture. It uses GCC
>   	  8.2.1, GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates
> -	  code that runs on ae3xx platform
> +	  code that runs on ae300 platform

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
