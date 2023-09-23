Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5A4CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 20:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87ED381FE9;
	Sat, 23 Sep 2023 20:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87ED381FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRv_lFlQfFJE; Sat, 23 Sep 2023 20:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A871F81FE5;
	Sat, 23 Sep 2023 20:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A871F81FE5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 427391BF292
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B4B8409F8
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 20:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B4B8409F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVQKwYoQ08LA for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 20:16:37 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7889409F3
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 20:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7889409F3
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B1DF7780368;
 Sat, 23 Sep 2023 22:16:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Sep 2023 22:16:32 +0200
Date: Sat, 23 Sep 2023 22:16:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230923201632.GD1469982@scaer>
References: <20230923183424.907966-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923183424.907966-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695500194;
 bh=y6CJSJ0oSD4trgzIdrH5QeaUJXBXvRDBPq/Ei3Lo70g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eng4fMfLULbgcADWIQrlonIvkWYUlcv3famj8jnxor9Cip5FSmK2XmIMg52AOOsbD
 u06rRxP/92KTWGG+gTg0QcWokA2umO52p05VaBauLLASrvekLQhSiG4U/zjMj+7BEc
 teR+h/cRRzjdTmm/mBz6sm3nt+F1RJdXbLjtbJ2n/fnXBRA2gJfmHBpLLC+0VUlodq
 TYGcq+X1Wb0ld3xiDmSuSHYyoP5Hvb6dv+gZBUemWvaumG1/qLioe2KTFhWRWeBCMi
 yj+qCaM1pckBZXJsNNiz3UwfU33vRvZmoyJcRhx+9UOn52uUKntXSVMkVNqSmTvvsW
 Es5CyU34pT+Og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Eng4fMfL
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: bump to version 2.0.27
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

On 2023-09-23 20:34 +0200, Julien Olivain spake thusly:
> For release announce, see:
> https://lists.infradead.org/pipermail/kexec/2023-August/027830.html
> 
> This new version introduced a usage of memfd_create() in [1]. This
> function was introduced in Kernel 3.17. Therefore, this commit adds
> this new dependency. This direct use of memfd_create() requires a
> glibc >= 2.27. As is, this version would no longer work with uclibc-ng
> or musl libc. This commit also adds a patch to allow compilation with
> glibc < 2.27, and also uclibc and musl. See the patch commit log for
> more details.
> 
> [1] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/?id=714fa11590febc9cf6fd3c6309374a040a05ebb0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
[--SNIP--]
> diff --git a/package/kexec/Config.in b/package/kexec/Config.in
> index 836d740788..3308d56b8d 100644
> --- a/package/kexec/Config.in
> +++ b/package/kexec/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
>  config BR2_PACKAGE_KEXEC
>  	bool "kexec"
>  	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd_create()
>  	help
>  	  Kexec is a user space utility for loading another kernel
>  	  and asking the currently running kernel to do something with
> @@ -25,3 +26,6 @@ config BR2_PACKAGE_KEXEC_ZLIB
>  	  Support for compressed kernel images
>  
>  endif
> +
> +comment "kexec needs a toolchain w/ headers >= 3.17"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17

You forgot to add the dependency on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
> index 4e16a53a35..650f0992de 100644
> --- a/package/kexec/kexec.hash
> +++ b/package/kexec/kexec.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
> -sha256  7fe36a064101cd5c515e41b2be393dce3ca88adce59d6ee668e0af7c0c4570cd  kexec-tools-2.0.26.tar.xz
> +sha256  38d78bcfa33a88928324b57dc81f50c1dfc279eede45e80957ca18f4e84b8187  kexec-tools-2.0.27.tar.xz
>  # locally calculated
>  sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
> diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
> index 562b09012b..5d30f4884b 100644
> --- a/package/kexec/kexec.mk
> +++ b/package/kexec/kexec.mk
> @@ -4,11 +4,13 @@
>  #
>  ################################################################################
>  
> -KEXEC_VERSION = 2.0.26
> +KEXEC_VERSION = 2.0.27
>  KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
>  KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
>  KEXEC_LICENSE = GPL-2.0
>  KEXEC_LICENSE_FILES = COPYING
> +# 0002-kexec-provide-a-memfd_create-wrapper-if-not-present-.patch
> +KEXEC_AUTORECONF = YES
>  KEXEC_CPE_ID_PRODUCT = kexec-tools
>  KEXEC_CPE_ID_VENDOR = kexec-tools_project
>  KEXEC_SELINUX_MODULES = kdump
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
