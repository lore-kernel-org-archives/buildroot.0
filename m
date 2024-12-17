Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65F8E77187
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 21:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB65605C7;
	Tue, 17 Dec 2024 21:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aQJO2fFMz1E3; Tue, 17 Dec 2024 21:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67994610BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67994610BD;
	Tue, 17 Dec 2024 21:30:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A980BC0
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4E6B605C7
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBs4kSbNiNwm for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 21:30:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AEE1460710
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEE1460710
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEE1460710
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:30:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A3D9C13F899;
 Tue, 17 Dec 2024 22:30:22 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60136])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Dec 2024 22:30:22 +0100
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 22:30:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Alexey Brodkin <alexey.brodkin@synopsys.com>
In-Reply-To: <20241217130042.1120454-1-fancp2007@gmail.com>
References: <20241217130042.1120454-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5ff19c448b4f3ecd90e9b69c7bb94ef6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734471024;
 bh=n7gx+pcYjJvKlEjHD85nekjxraAWI/bKzRdEK68IchI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jXQy2pTQxqQRo7OUm7oQfWIyw3F0KUQBk3TZjVM4jpluPiWKZ5S+zXJfkewu9CHSz
 Qz0pq/SCAZPUe3Hohzbsv+uD54iw3Yfr1y80l+b6t+xWQkt7Hciv9cArx2PpQlq6hI
 qgDa+FBdycybNpBeE+o4QodNGg9kbvxgrY/Ia3Q904ZqM9mC/tub9LmS4Y0eT5d+Pu
 r7f9/3QIzSBHTcU21x0E7WbFTWY4NvM0Z9nKYks2CvIkNJlukBAdsvWTFvHTDfb7U2
 EQPAf3I4+z181yOXXroQ8PqtG6ltGT1bID0ZLrQz7tv37z9DnZ9IoY+Hhk94KD2YT+
 pHq0K3d2C3YBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jXQy2pTQ
Subject: Re: [Buildroot] [PATCH] configs/cubieboard2_defconfig: bump Linux
 to 6.12.5
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/12/2024 14:00, Scott Fan wrote:
> Bump Linux kernel version to 6.12.5 and update the hash accordingly.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.

> ---
>  board/cubietech/cubieboard2/patches/linux/linux.hash | 2 +-
>  configs/cubieboard2_defconfig                        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash 
> b/board/cubietech/cubieboard2/patches/linux/linux.hash
> index 4759f8354e..450cb12423 100644
> --- a/board/cubietech/cubieboard2/patches/linux/linux.hash
> +++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256  
> 62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  
> linux-6.11.11.tar.xz
> +sha256  
> 39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  
> linux-6.12.5.tar.xz
> diff --git a/configs/cubieboard2_defconfig 
> b/configs/cubieboard2_defconfig
> index 9c0e51b37d..c24e7b3428 100644
> --- a/configs/cubieboard2_defconfig
> +++ b/configs/cubieboard2_defconfig
> @@ -1,7 +1,7 @@
>  BR2_arm=y
>  BR2_cortex_a7=y
>  BR2_ARM_FPU_NEON_VFPV4=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
>  BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard2/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard2/rootfs_overlay"
> @@ -9,7 +9,7 @@ 
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c 
> board/cubietech/cubieboard2/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.5"
>  BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
