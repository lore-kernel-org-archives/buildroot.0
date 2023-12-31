Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD0FC3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 31 Dec 2023 20:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EDC660737;
	Sun, 31 Dec 2023 20:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EDC660737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DPPHmUg1acmI; Sun, 31 Dec 2023 20:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C7560A5F;
	Sun, 31 Dec 2023 20:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C7560A5F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE1E61BF3FC
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 20:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 873FA8161D
 for <buildroot@lists.busybox.net>; Sun, 31 Dec 2023 20:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 873FA8161D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6txEGmg0NhS for <buildroot@lists.busybox.net>;
 Sun, 31 Dec 2023 20:27:56 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B513815CC
 for <buildroot@buildroot.org>; Sun, 31 Dec 2023 20:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B513815CC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7EEB15FF88;
 Sun, 31 Dec 2023 21:27:48 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 31 Dec 2023 21:27:48 +0100
Date: Sun, 31 Dec 2023 21:27:48 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZZHOxLRXJ9U8apJA@landeda>
References: <20231231172538.1279608-1-wbx@openadk.org>
 <20231231172538.1279608-5-wbx@openadk.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231231172538.1279608-5-wbx@openadk.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704054474;
 bh=EC9eYYAhrIaAz78plLhUenVTBu2IV3UZuTJ/zWNdcuc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cGKQVdj+ET678e9ifC9vNBuVa32iLSDbQEf908UMFxjvFiBadZx1RtKNg/a+q0ZpT
 +QGCxikhKua7CdKD51ci5/UBsok4cE/lIR+5c3m7iw69A3ujNfF37qI0mlzAbf9RA4
 d78htNBbhX8k+oH6qTROrceGgIJrkdabDmC7+k/SdQhpVCW2dDBjmoSrW7LM7JWofh
 WBgg2zcarAFd7C0skZk0CoeZdIKBTx2I8C9YOVdc2n1HBX/Pw8ESwXL7TYb59YYhi+
 veSc2MtyauNvxflFJyzRj/jRifXyRiZ3IwxW1Yiic+kBZkkJBqGjcV6fqc4mpHhwrK
 QKB/h6/WB7SFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cGKQVdj+
Subject: Re: [Buildroot] [PATCH 4/6] configs/qemu: add qemu_arc_defconfig
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
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2023-12-31 18:25 +0100, Waldemar Brodkorb spake thusly:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Add a bit of explanations in the commit log, especially given the
following...

> ---
[--SNIP--]
> diff --git a/board/qemu/arc/readme.txt b/board/qemu/arc/readme.txt
> new file mode 100644
> index 0000000000..93bb9c2152
> --- /dev/null
> +++ b/board/qemu/arc/readme.txt
> @@ -0,0 +1,8 @@
> +You need Qemu fork from here:
> +https://github.com/foss-for-synopsys-dwc-arc-processors/qemu

So, we are dropping all the arc specific versions for the toolchain
components, but we eventually introduce a defconfig that relies on an
arc specific version of qemu, that we do not even package in Buildroot,
so that users can't even enable host-qemu in Buildroot.

That is a bit sad...

What is the rationale for introducing this defconfig, then?

Regards,
Yann E. MORIN.

> +Run the emulation with:
> +
> + qemu-system-arc -monitor none -serial stdio -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -cpu archs -kernel output/images/vmlinux -nographic # qemu_arc_defconfig
> +
> +The login prompt will appear in the terminal that started Qemu.
> diff --git a/configs/qemu_arc_defconfig b/configs/qemu_arc_defconfig
> new file mode 100644
> index 0000000000..d65e28a3d0
> --- /dev/null
> +++ b/configs/qemu_arc_defconfig
> @@ -0,0 +1,30 @@
> +# Architecture
> +BR2_arc=y
> +BR2_arcle=y
> +BR2_archs38=y
> +
> +# System
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Filesystem
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Image
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> +
> +# Linux headers same as kernel
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arc/linux.config"
> +BR2_LINUX_KERNEL_VMLINUX=y
> +
> +# host-qemu for gitlab testing
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> -- 
> 2.30.2
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
