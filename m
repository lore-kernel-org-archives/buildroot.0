Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E7AC41513
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 19:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E4F041DA7;
	Wed,  2 Aug 2023 19:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E4F041DA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrQ0C_enxhMl; Wed,  2 Aug 2023 19:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE4541DC0;
	Wed,  2 Aug 2023 19:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE4541DC0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 535EA1BF2F5
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C40180C00
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 19:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C40180C00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cn8sXuV8zrks for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 19:26:14 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0558E8139A
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 19:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0558E8139A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:79c1:a9ed:b3cf:6f2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1415A200401;
 Wed,  2 Aug 2023 21:26:10 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 02 Aug 2023 21:26:09 +0200
Date: Wed, 2 Aug 2023 21:26:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230802192609.GI421096@scaer>
References: <20230802164628.389812-1-romain.naour@gmail.com>
 <20230802164628.389812-2-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802164628.389812-2-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691004372;
 bh=/Hegclm479cHMz0NRxyLl2bl9vak5jAZkQA2bCHF/QA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8fvgwNFm6DvMPO8n0slzSWOruOK+/JKnJ4/nY0ctlIX3roM+ui5MqoA9n2AQ4j6a
 W7uEdIawNRZ/duRoYgCABXg9J+eEeeIlHu5B3Neby3NA3kfx82C6K9ZwD57XLETOxb
 TBk29LARm20ey+BIIINTDozjn4Q9jFRt+4LxmwbkfKcfEptBVLP0ueFb8r38lZtJ1I
 n1sRMcqtRRkyBM7AVROXJqUIjeM2ppXP4O2zBN8qd/UHXylxm6Jzl/9J7RcjQO3jRD
 DQE2TNnG/Wa7OCD9BHXPTOhndGs7u+pqjiHSGLf6mxn0MSUntH10qRTfkh3NVCe+GY
 gDYIDEPp0HBCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J8fvgwNF
Subject: Re: [Buildroot] [PATCH 2/2] package/systemd: bump linux-headers
 dependency to 4.14
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

On 2023-08-02 18:46 +0200, Romain Naour spake thusly:
> The recent update to systemd v254 requires a toolchain w/ linux headers
> >= 4.14 to provide LOOP_SET_BLOCK_SIZE [1] (added in systemd v253 [2]).
> 
> Note:
> Buildroot already warn the user if a toolchain w/ linux headers < 4.15
> is used while enabling systemd as init system [3]. It was matter of
> time before problem occurs.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=89e4fdecb51cf5535867026274bc97de9480ade5
> [2] https://github.com/systemd/systemd/commit/1163ddb386ef46f63942171e6eab0ca64eb818e4
> [3] 9a095643b4dd34eb7acb69662aa64fa945f4b542
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/systemd/Config.in | 7 +++----
>  system/Config.in          | 6 +++---
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 174ee77b29..a3e424cb4c 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>  	depends on !BR2_STATIC_LIBS # kmod
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_TOOLCHAIN_HAS_SSP
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # LOOP_SET_BLOCK_SIZE
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
>  	select BR2_PACKAGE_HAS_UDEV
> @@ -237,7 +237,6 @@ config BR2_PACKAGE_SYSTEMD_HOMED
>  	depends on BR2_USE_MMU # cryptsetup -> lvm2
>  	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # fscrypt_key
>  	select BR2_PACKAGE_CRYPTSETUP
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> @@ -248,11 +247,11 @@ config BR2_PACKAGE_SYSTEMD_HOMED
>  
>  	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
>  
> -comment "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
> +comment "homed support needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> -		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
> +		BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_SYSTEMD_HOSTNAMED
>  	bool "enable hostname daemon"
> diff --git a/system/Config.in b/system/Config.in
> index 1ca7690ea3..24798dc068 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -124,19 +124,19 @@ config BR2_INIT_SYSTEMD
>  	depends on BR2_TOOLCHAIN_USES_GLIBC
>  	depends on BR2_TOOLCHAIN_HAS_SSP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  	depends on BR2_HOST_GCC_AT_LEAST_5
>  	select BR2_ROOTFS_MERGED_USR
>  	select BR2_PACKAGE_SYSTEMD
>  	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
>  
> -comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
> +comment "systemd needs a glibc toolchain w/ SSP, headers >= 4.14, host and target gcc >= 5"
>  	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
>  		!BR2_TOOLCHAIN_HAS_SSP || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
> +		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
>  		!BR2_HOST_GCC_AT_LEAST_5
>  
> -- 
> 2.41.0
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
