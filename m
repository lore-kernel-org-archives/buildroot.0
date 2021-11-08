Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D60BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 10:00:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C878561039
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 10:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C878561039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 804B140255;
	Mon,  8 Nov 2021 10:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiSd0dFBV4Ye; Mon,  8 Nov 2021 10:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7C7C40175;
	Mon,  8 Nov 2021 10:00:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7625F1BF995
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 10:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64D4F40175
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 10:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POKt_THkCGRR for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 10:00:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B12C40101
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 09:59:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ec40:2d6d:9ac7:d39c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id F403FB0057F;
 Mon,  8 Nov 2021 10:59:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636365598;
 bh=Oa5fTnvTD7AtT+p9PX+GVIjvD1ii7lLlsjYi1yhMV64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3lI2XmAUKCQe/B1VRZiiyw9oZErPWEtco7aeXmNoOiQFOvt3bGgMQrBG5WKDQhj2
 apMl6SQ1kxNvWkDIUln8md/UkqCdS1s139MGyrRMZp5kGtXy0BI9ZaJ1crjI/Slchz
 hU0DuSDE1kj4sYyrwA1jqaut8Lgtvs4iCic7aRX2ftUMjsoqSu0m+tkaP7hZ4oiFRu
 KSYnzXmRRWSnHndDxdCHsdFe80rVXdd4rCy7KQ8+dOVOwKHs0xjpRm24qeuuJyElwH
 vRTVNdPniwuX22iUOxsYWy5a+ZasCQJYZbJo2sSr3ohdZhz17nx9nOkkbwSF0A01V+
 +CbZ58nDCbXyQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Nov 2021 10:59:52 +0100
Date: Mon, 8 Nov 2021 10:59:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211108095952.GC680793@scaer>
References: <20211107192930.370979-1-romain.naour@gmail.com>
 <20211107192930.370979-2-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211107192930.370979-2-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] configs/qemu_aarch64_sbsa_defconfig:
 add gitlab runtime testing tag
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2021-11-07 20:29 +0100, Romain Naour spake thusly:
> Enable the runtime testing by adding the tag in the readme.txt
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Dick Olsson <hi@senzilla.io>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> The gitlab job needs more that 3h to build and execute the test:
> https://gitlab.com/kubu93/buildroot/-/jobs/1755899154
> Tested locally using the Buildroot docker image.
> 
> I'm not sure about the comment about SeaBIOS package, the test works
> fine with the current host-qemu (6.1.0).
> ---
>  board/qemu/aarch64-sbsa/readme.txt  | 2 +-
>  configs/qemu_aarch64_sbsa_defconfig | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
> index b62947f55f..cf5f66d4d6 100644
> --- a/board/qemu/aarch64-sbsa/readme.txt
> +++ b/board/qemu/aarch64-sbsa/readme.txt
> @@ -23,7 +23,7 @@ Run the emulation with:
>      -nographic \
>      -pflash output/images/SBSA_FLASH0.fd \
>      -pflash output/images/SBSA_FLASH1.fd \
> -    -hda output/images/disk.img
> +    -hda output/images/disk.img # qemu_aarch64_sbsa_defconfig
>  
>  Note that if you want to run sbsa-ref emulation with QEMU provided by
>  your distro (i.e., not host-qemu by Buildroot) then you may need to
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
> index d1e0adadd1..e7d3bd03ca 100644
> --- a/configs/qemu_aarch64_sbsa_defconfig
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -16,8 +16,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
>  
>  # Image
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG) -c board/qemu/aarch64-sbsa/genimage.cfg"
>  
>  # Linux headers same as kernel
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
