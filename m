Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547D0CD5BDE
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 07:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D3CC61341;
	Wed, 27 May 2026 07:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLiIi1y-djbl; Wed, 27 May 2026 07:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2769E61343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779866620;
	bh=emKZvkD8QJmksZ4QOOLvjxcH/hnHv0EfOfohzGkXpE4=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A5HLJgm2zeGaDfHw5BtyR2nirCk7rYTpL58bOQvy9beG4Tc0fm09qIkGfYt47ACt/
	 CQM6HuQVtuDLiAsL7V9u1mXAVbNNrkKYh9cP+vCgJUsKfCQzYqSFaE58TxKoEpnwHM
	 9+KGdHtHB+C+uKWu23AmQ6A50s9fJpzZ0hiwbh+Y4u0QxsRTT9a6F84WIywu5YkzL1
	 fKicSscW9cDWzmX+RM6M7jKBZnVD4Ahq7lvha9JpyixdF41w+DBC/4epIv3HOr7YVI
	 26zXDcTNCehMiAWt9WFNhHR0rYzYO/HWd20sl86H8zSmzyPlu/thXOxRursRlmXiJw
	 F1L0Sq7H/fVCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2769E61343;
	Wed, 27 May 2026 07:23:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC34F21F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 07:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD30E839B8
 for <buildroot@buildroot.org>; Wed, 27 May 2026 07:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xB4O1MnPl6Kb for <buildroot@buildroot.org>;
 Wed, 27 May 2026 07:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1467283981
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1467283981
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1467283981
 for <buildroot@buildroot.org>; Wed, 27 May 2026 07:23:34 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 837AF440F36;
 Wed, 27 May 2026 10:22:44 +0300 (IDT)
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>, Joseph
 Kogut <joseph@anodize.com>
In-Reply-To: <20260527070041.1554793-1-chakrabortyshubham66@gmail.com>
 (Shubham Chakraborty's message of "Wed, 27 May 2026 12:30:37 +0530")
References: <20260527070041.1554793-1-chakrabortyshubham66@gmail.com>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Wed, 27 May 2026 10:23:30 +0300
Message-ID: <87fr3dl3il.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1779866564;
 bh=s19nXB2oYW1MPg2BQjHnSl1I6K1rM7sEvVEEjmir0FA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=muNwKRJ4ztfv8gTWYu1hSTmZ1AWmqmPJvEVASF8jcRBCD6OG2xsfFhErS/3T86t1s
 4CSRS4UKY4Uvj41V5/Gl9j59MzEHhgKBY8w1cxX5ImOMHXF40m+D6+AqrCMPdZQWi8
 950jJaW9snnCT8yDqm2JKJl27WYV4eKASefSnvC6bnEnNyJqqjNi7+fNevxsLvrJr9
 YPKoQO75TNMwbpf9ejYPQAHlY58MuuRQyIvbN1va5rkRJe0h6x5GMSg0cFUpDXwnJx
 XXgJsYDRSy7I7ZbI6+Pc5+7GtwXRwIgILhdE2vG0UiN2UhNDIE+p4n9v7TUAmfKrkw
 g0QBr82Ex9H8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=muNwKRJ4
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 11.0.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Shubham

On Wed, May 27 2026, Shubham Chakraborty wrote:
> Changes include:
> - Refined architecture support conditions for better target/host compatibility
> - Removed support for 32-bit ARM, i386, MIPS targets (now 64-bit only where applicable)
> - Added host architecture dependencies for QEMU tools
> - New build dependencies: host-python-setuptools and host-python-wheel without these
>   the build of host fails.
> - Added --disable-download flag to prevent runtime downloads
> - Fixed typo: BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT to BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>
> For upstream release notes, see:
> - https://wiki.qemu.org/ChangeLog/11.0
>
> Tested using:
> - ./utils/test-pkg -p qemu -a
>
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---

Joseph has been working on a similar patch:

  https://patchwork.ozlabs.org/project/buildroot/patch/20260513-qemu-v11-0-0-v2-1-de2e8e3c5869@anodize.com/

baruch

>  package/qemu/Config.in      | 6 +-----
>  package/qemu/Config.in.host | 8 +++++++-
>  package/qemu/qemu.hash      | 2 +-
>  package/qemu/qemu.mk        | 7 ++++++-
>  4 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index 0b16c8c284..4469ba6340 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -2,13 +2,9 @@ config BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
>  	bool
>  	# Only tested on these architectures
>  	default y if BR2_aarch64
> -	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> -	default y if BR2_i386
> -	default y if BR2_mips
> -	default y if BR2_mipsel
>  	default y if BR2_powerpc64
>  	default y if BR2_powerpc64le
> -	default y if BR2_riscv
> +	default y if BR2_riscv && BR2_ARCH_IS_64
>  	default y if BR2_s390x
>  	default y if BR2_x86_64
>  
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index c7dd5876e5..c72f418668 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -24,12 +24,18 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  	default y if BR2_x86_64
>  	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
>  	depends on !BR2_powerpc_620 && !BR2_powerpc_630
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64" || \
> +		BR2_HOSTARCH = "powerpc64le" || BR2_HOSTARCH = "s390x" || \
> +		BR2_HOSTARCH = "loongarch64" || BR2_HOSTARCH = "riscv64"
>  
>  config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
>  	bool
>  	default y if BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  	default y if BR2_mips64
>  	default y if BR2_mips64el
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64" || \
> +		BR2_HOSTARCH = "powerpc64le" || BR2_HOSTARCH = "s390x" || \
> +		BR2_HOSTARCH = "loongarch64" || BR2_HOSTARCH = "riscv64"
>  
>  config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  	bool
> @@ -37,7 +43,7 @@ config BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  
>  comment "host-qemu needs a host gcc >= 8"
>  	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS || \
> -		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORT
> +		BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  	depends on !BR2_HOST_GCC_AT_LEAST_8
>  
>  config BR2_PACKAGE_HOST_QEMU
> diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
> index f8e750225f..7c7325a6ce 100644
> --- a/package/qemu/qemu.hash
> +++ b/package/qemu/qemu.hash
> @@ -1,4 +1,4 @@
>  # Locally computed, tarball verified with GPG signature
> -sha256  9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c0ca6d6672785883a  qemu-10.2.0.tar.xz
> +sha256  c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b63e4932052a4854d6  qemu-11.0.0.tar.xz
>  sha256  dd3ce02338c3a48abb6ba59b48809f7108a8bd242cb0cc8be90daafa30707c28  COPYING
>  sha256  31c90ce76b6f5aab90a205851e71d5c27e31c0aa3d7017a4383b98a6fe3f1faa  COPYING.LIB
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index b7007e3b98..8999e33f87 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version, check whether the list of supported targets
>  # needs to be updated.
> -QEMU_VERSION = 10.2.0
> +QEMU_VERSION = 11.0.0
>  QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
>  QEMU_SITE = https://download.qemu.org
>  QEMU_SELINUX_MODULES = qemu virt
> @@ -28,6 +28,8 @@ QEMU_DEPENDENCIES = \
>  	host-pkgconf \
>  	host-python3 \
>  	host-python-distlib \
> +	host-python-setuptools \
> +	host-python-wheel \
>  	libglib2 \
>  	zlib
>  
> @@ -372,6 +374,8 @@ HOST_QEMU_DEPENDENCIES = \
>  	host-pkgconf \
>  	host-python3 \
>  	host-python-distlib \
> +	host-python-setuptools \
> +	host-python-wheel \
>  	host-slirp \
>  	host-zlib
>  
> @@ -528,6 +532,7 @@ define HOST_QEMU_CONFIGURE_CMDS
>  		--enable-slirp \
>  		--enable-tools \
>  		--disable-guest-agent \
> +		--disable-download \
>  		$(HOST_QEMU_OPTS)
>  endef

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
