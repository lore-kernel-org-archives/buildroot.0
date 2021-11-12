Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16321C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:14:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E0760F39
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9E0760F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F090405F7;
	Fri, 12 Nov 2021 22:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjT-HD9nqEPb; Fri, 12 Nov 2021 22:14:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A65AE405E3;
	Fri, 12 Nov 2021 22:14:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20AED1BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EC70403F9
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C6iqlh_cus7a for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:13:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E67D340355
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:13:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7F1EE19F57B;
 Fri, 12 Nov 2021 23:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636755214;
 bh=an4MAVAM7aAeaaeLALqwrhJZda9tlKN3rc2UnTOIAWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T3AXqgJ4W7dO+2b7F+4OJP19IDU4AuEaWpErR1afQ86F5dn/O0PaVZkWvpr+O+rO/
 N8/iYYoiLznDaIoUjLpdZzgseWSoghcNNcryGsPTiYSYZaV1coz9VeEoffNgJqBTRa
 7Is2ge60lQQb5kTREgfixS5JO7Rbz4X2eXkyNNp+3wO8dEkLQVJ3VqchZzoN+hStzY
 WYyKXInZQ/UylUoz2OTURr0mPudmFk/PJTs2wqTFUI5HwKbQ+l9HU6W6+/P/DCwa61
 bDo4stk8Vu+6p1Vi1YCg3Y3HFGLkiSQDZCtHFICPnQOWLUuDsNm/l8vqJrQjs4MdpU
 qOo4oF8GTvhCg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 23:13:23 +0100
Date: Fri, 12 Nov 2021 23:13:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211112221323.GE247986@scaer>
References: <20211111200439.15379-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211111200439.15379-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next v1 1/7] configs/raspberrypi*: bump
 kernel version to 9878a11 (5.10.78)
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-11-11 21:04 +0100, Peter Seiderer spake thusly:
> Now based on 5.10.78 (from 5.10.76).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to next, thanks.

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
>  11 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
> index e49be1af7a..64f7a93377 100644
> --- a/configs/raspberrypi0_defconfig
> +++ b/configs/raspberrypi0_defconfig
> @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  
>  # Build the DTBs for A/B from the kernel sources: the zero is the same
> diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
> index 6be7401f6c..f3e7c453ab 100644
> --- a/configs/raspberrypi0w_defconfig
> +++ b/configs/raspberrypi0w_defconfig
> @@ -9,7 +9,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
> diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> index c59ee064b9..7befbf07e6 100644
> --- a/configs/raspberrypi2_defconfig
> +++ b/configs/raspberrypi2_defconfig
> @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
> index 7d863c1731..ebb6e2252b 100644
> --- a/configs/raspberrypi3_64_defconfig
> +++ b/configs/raspberrypi3_64_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index f923a3028b..6a9c4e0d02 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
> index dea5060590..7d06b0bb5e 100644
> --- a/configs/raspberrypi3_qt5we_defconfig
> +++ b/configs/raspberrypi3_qt5we_defconfig
> @@ -12,7 +12,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> index 436ea57f13..2b5446d8f1 100644
> --- a/configs/raspberrypi4_64_defconfig
> +++ b/configs/raspberrypi4_64_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
> index ca506b38df..ac555ddd5e 100644
> --- a/configs/raspberrypi4_defconfig
> +++ b/configs/raspberrypi4_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
> index f6fa92fb34..257e59536e 100644
> --- a/configs/raspberrypi_defconfig
> +++ b/configs/raspberrypi_defconfig
> @@ -11,7 +11,7 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
>  
>  # Build the DTBs for A/B, A+/B+ and compute module from the kernel sources
> diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
> index f29e4c492a..1ab379c557 100644
> --- a/configs/raspberrypicm4io_64_defconfig
> +++ b/configs/raspberrypicm4io_64_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
> index fac706c4d2..9941754e25 100644
> --- a/configs/raspberrypicm4io_defconfig
> +++ b/configs/raspberrypicm4io_defconfig
> @@ -11,7 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,581049d718caf95f5feb00607ac748d5841cf27c)/linux-581049d718caf95f5feb00607ac748d5841cf27c.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
>  
>  # Build the DTB from the kernel sources
> -- 
> 2.33.1
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
