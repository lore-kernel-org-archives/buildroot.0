Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42CDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 21:03:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139276105A
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 21:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 139276105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCDC14048A;
	Mon, 25 Oct 2021 21:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDudTCWsvQ27; Mon, 25 Oct 2021 21:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC61C4048B;
	Mon, 25 Oct 2021 21:03:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3E01BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 21:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A49B980F7E
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 21:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjNusKMRZ5S4 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 21:03:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7796F80F54
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 21:03:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:88a7:5655:8f62:bf4c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 05D0719F57B;
 Mon, 25 Oct 2021 23:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635195780;
 bh=X3UKzw1OV+EYqZaWDKNxkh4YEwERHKmdsZcEx9wT1BE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f0Z3drBLNGISUvfHEb23fL3udBAYD+gIcaMdbo1FBY0hOmLVUekMegSwWk6bm+qmw
 rtRgF/NjrUXBYeXoNipowQiah6QcmPTBaJkLOT2iPFESeYHJ1qNvVio7ivOdiUtNbB
 lRhV0eYJOLMx+cn4zebDfYk7Bwmt9mzKbn0PNZSmt7gS5wewRiyyn5L0j0wxEdt1gR
 DRGUVxclsFg3Y7Hr0lkbF8v4OBPBG5scZh/wcU7+iURSPav9pAB/tnqH3Uz/7DNgOq
 Udu0Peoer1gsmaABxSCmExB5MHdzBXDj7AKe0LAUQH5vb8ny1y8Ig/tB1e0+orLmL/
 Iso/Chkdkfl/w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Oct 2021 23:02:41 +0200
Date: Mon, 25 Oct 2021 23:02:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211025210241.GV2400@scaer>
References: <20211025202002.589440-1-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211025202002.589440-1-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/1] package/qemu: bump host gcc
 requirements: propagate to all reverse dependencies
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
Cc: Daniel Price <daniel.price@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 Anisse Astier <anisse@astier.eu>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2021-10-25 13:20 -0700, Adam Duskett spake thusly:
> qemu now requires gcc >= 7.5, however, as there is no BR2_HOST_GCC_AT_LEAST_7_5,
> set the host gcc requirements to 8.
> 
> In addition:
>   - Add a missing comment in package/qemu/Config.in.host explaining the host gcc
>     requirements if host gcc < 8.
> 
> Fixes:
> http://autobuild.buildroot.org/results/32b7fee1f8cda2290fd4bd8ac9fe78bacb25b652
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Applied to master, with a fwew fixes:

  - target qemu also impacted
  - propagate to libvirt, gst1-python
  - reword commit log that 7.5 is the last 7.x release

Thanks!

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
>   - rebase against commit 17358061ad2b58d3eb96ea8c5631e235a484ac87
> 
>  package/gobject-introspection/Config.in | 6 +++---
>  package/nodejs/Config.in                | 6 +++---
>  package/python-bluezero/Config.in       | 6 +++---
>  package/python-gobject/Config.in        | 6 +++---
>  package/qemu/Config.in.host             | 7 ++++++-
>  5 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
> index c631c84755..42250eb776 100644
> --- a/package/gobject-introspection/Config.in
> +++ b/package/gobject-introspection/Config.in
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
>  	# compile errors with locale.c. As such, require 4.9 until this
>  	# can be verified.
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -	depends on BR2_HOST_GCC_AT_LEAST_7 # host-qemu
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # host-qemu
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	# gobject-introspection does not require python3 to run on the
>  	# target; however, because the tools run in a qemu wrapper, a
> @@ -42,9 +42,9 @@ comment "gobject-introspection needs python3"
>  	depends on !BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
>  
> -comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
> +comment "gobject-introspection needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_7
> +		!BR2_HOST_GCC_AT_LEAST_8
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 771f735e97..99c76bc3de 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -8,18 +8,18 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>  
> -comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar"
> +comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
> -		!BR2_HOST_GCC_AT_LEAST_7 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
> +		!BR2_HOST_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_USE_WCHAR
>  
>  config BR2_PACKAGE_NODEJS
>  	bool "nodejs"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
> -	depends on BR2_HOST_GCC_AT_LEAST_7
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # qemu
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	depends on BR2_USE_WCHAR
>  	# uses fork()
> diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
> index 3d40b1e275..d617b96d67 100644
> --- a/package/python-bluezero/Config.in
> +++ b/package/python-bluezero/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
>  	bool "python-bluezero"
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
> -	depends on BR2_HOST_GCC_AT_LEAST_7 # python-gobject -> gobject-introspection -> host-qemu
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection -> host-qemu
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
>  	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_DBUS # runtime
> @@ -13,9 +13,9 @@ config BR2_PACKAGE_PYTHON_BLUEZERO
>  
>  	  https://github.com/ukBaz/python-bluezero
>  
> -comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
> +comment "python-bluezero needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
>  	depends on BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_7
> +		!BR2_HOST_GCC_AT_LEAST_8
> diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
> index 910f990026..efc781a1ff 100644
> --- a/package/python-gobject/Config.in
> +++ b/package/python-gobject/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
>  	depends on BR2_USE_MMU # libglib2, gobject-introspection
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
> -	depends on BR2_HOST_GCC_AT_LEAST_7 # gobject-introspection -> host-qemu
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
>  	depends on BR2_PACKAGE_PYTHON3 # gobject-introspection
>  	select BR2_PACKAGE_GOBJECT_INTROSPECTION
> @@ -13,9 +13,9 @@ config BR2_PACKAGE_PYTHON_GOBJECT
>  
>  	  https://wiki.gnome.org/action/show/Projects/PyGObject
>  
> -comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 7"
> +comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> -		!BR2_HOST_GCC_AT_LEAST_7
> +		!BR2_HOST_GCC_AT_LEAST_8
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index a5b38c081b..df5d921125 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -37,7 +37,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  config BR2_PACKAGE_HOST_QEMU
>  	bool "host qemu"
>  	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
> -	depends on BR2_HOST_GCC_AT_LEAST_7
> +	depends on BR2_HOST_GCC_AT_LEAST_8
>  	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE \
>  		if !BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE && BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  	select BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE \
> @@ -50,6 +50,11 @@ config BR2_PACKAGE_HOST_QEMU
>  
>  	  http://www.qemu.org
>  
> +comment "host-qemu needs a host gcc >= 8"
> +	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
> +		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
> +	depends on !BR2_HOST_GCC_AT_LEAST_8
> +
>  if BR2_PACKAGE_HOST_QEMU
>  
>  comment "Emulators selection"
> -- 
> 2.32.0
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
