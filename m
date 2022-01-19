Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BF4C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E20415AB;
	Wed, 19 Jan 2022 21:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGoIuSZs5Dad; Wed, 19 Jan 2022 21:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAEA04155A;
	Wed, 19 Jan 2022 21:25:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 594E31BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4794D4155A
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:25:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wrjUuzH9Aow for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:25:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E290C4154D
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:25:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0218719F593;
 Wed, 19 Jan 2022 22:25:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642627541;
 bh=StG6aSOtbB87cY5M5SKbBaIqVH89ob49QYBnFqJbA00=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UxwHAACtYZfudqIge1m/QvqaiRVmGHpsFfiToijWLqAVp40/TPMZzdGP6YNlvYptx
 ClF1TLzWlz0jDLjURhhaIF3h9RpNKAHLiY3UFkS+F+pZb+0miXgs4ZQlvbuI9RTcQL
 GoXlyMGtwSCEtgIGOlIaZp11zlXQOYvA/Wb4H7oWupFVu/a6kIj0FHycykhA1d2jpx
 VFNtPKviVupul9+uRFaXq/E81KKnCegvMdxn1PppNUfXJGGcOOaxRkls4YtFmQrpni
 /C2+qiAWhdez+cAMejsiURvOJQt+1sxFalH3wHN1LfYwPpO3WtS4T8cLs1+teYGup5
 cZP8oKXATvscA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 22:25:35 +0100
Date: Wed, 19 Jan 2022 22:25:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220119212535.GD3095239@scaer>
References: <20220118211434.9854-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118211434.9854-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 1/6] configs/raspberrypi*: bump kernel
 version to 0b54dbd (5.10.92)
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2022-01-18 22:14 +0100, Peter Seiderer spake thusly:
> Now based on 5.10.92 (from 5.10.78).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Series of 6 patches applied to master, thanks.

I'll further reply to patch 6 with details specific to it...

Regards,
Yann E. MORIN.

> ---
>  configs/raspberrypi0_defconfig        | 2 +-
>  configs/raspberrypi0w_defconfig       | 2 +-
>  configs/raspberrypi2_defconfig        | 2 +-
>  configs/raspberrypi3_64_defconfig     | 2 +-
>  configs/raspberrypi3_defconfig        | 2 +-
>  configs/raspberrypi3_qt5we_defconfig  | 2 +-
>  configs/raspberrypi4_64_defconfig     | 2 +-
>  configs/raspberrypi4_defconfig        | 2 +-
>  configs/raspberrypi_defconfig         | 2 +-
>  configs/raspberrypicm4io_64_defconfig | 2 +-
>  configs/raspberrypicm4io_defconfig    | 2 +-
>  configs/raspberrypizero2w_defconfig   | 2 +-
>  12 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> index 64f7a93377..4506e94bce 100644
> --- a/configs/raspberrypi0_defconfig
> +++ b/configs/raspberrypi0_defconfig
> @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  
>  # Build the DTBs for A/B from the kernel sources: the zero is the same
> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> index f3e7c453ab..7a35794c2d 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index 7befbf07e6..9b484c5588 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> index ebb6e2252b..4d838ae0e8 100644
> --- a/configs/raspberrypi3_64_defconfig
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 6a9c4e0d02..0a59ab42a9 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index 7d06b0bb5e..40d0c0f888 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> index 2b5446d8f1..5942f7c4e1 100644
> --- a/configs/raspberrypi4_64_defconfig
> +++ b/configs/raspberrypi4_64_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
> index ac555ddd5e..4e5580c140 100644
> --- a/configs/raspberrypi4_defconfig
> +++ b/configs/raspberrypi4_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index 257e59536e..cca53f9b37 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  
>  # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
> diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
> index 1ab379c557..29cb0472d7 100644
> --- a/configs/raspberrypicm4io_64_defconfig
> +++ b/configs/raspberrypicm4io_64_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
> index 9941754e25..017aecc0dd 100644
> --- a/configs/raspberrypicm4io_defconfig
> +++ b/configs/raspberrypicm4io_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
> index ddd6b97b06..2ea503ca24 100644
> --- a/configs/raspberrypizero2w_defconfig
> +++ b/configs/raspberrypizero2w_defconfig
> @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,0b54dbda3cca2beb51e236a25738784e90853b64)/linux-0b54dbda3cca2beb51e236a25738784e90853b64.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> -- 
> 2.34.1
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
