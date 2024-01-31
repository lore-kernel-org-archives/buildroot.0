Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ADCC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 09:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B3F640204;
	Wed, 31 Jan 2024 09:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B3F640204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtrRfVGxAccl; Wed, 31 Jan 2024 09:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E824643550;
	Wed, 31 Jan 2024 09:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E824643550
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C69621BF2C5
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 09:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F49C401CA
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 09:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F49C401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uybiInfWLs1i for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 09:17:49 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36E8E401C4
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 09:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E8E401C4
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 944FB1814B9; Wed, 31 Jan 2024 10:17:43 +0100 (CET)
In-Reply-To: <20240118220422.167000-1-fontaine.fabrice@gmail.com>
References: <20240118220422.167000-1-fontaine.fabrice@gmail.com>
Date: Wed, 31 Jan 2024 10:17:43 +0100
To: "Fabrice Fontaine" <fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Message-ID: <dd15-65ba1000-3-150e7bc0@74979863>
User-Agent: SOGoMail 5.9.1
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1706692666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qhSA+Aga5VnIqcpaa/LeFHVCvbLPYYyMjsrkrpX2Q6s=;
 b=LwV4hmLzyuoJUt3TlY27lADOZqBTRifAanUyUAEu5zQzAU4zrVB2jarS/3AhfHX4zruc4E
 3c7N+WymXdHda/2E1hAXB1mr74NTGXKSmWBoGhuNNnxR7jkEnDbLvP1GedRrQY4DpXeXYr
 sYPo5+bzl/8/qS0IkOIoHoEa9rE2jgk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=LwV4hmLz
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/re2=3A_propagate_l?=
 =?utf-8?q?ibabseil-cpp_dependencies?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?utf-8?q?Yann_E=2E_MORIN?= <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thursday, January 18, 2024 23:04 CET, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

Hi Fabrice,

> Commit fc7606010e4edde7a34c545fac0fe7f82d4a5e18 forgot to propagate
> libabseil-cpp dependencies to re2
> 

whoops, yes I forgot that.

> Fixes:
>  - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5webengine/Config.in | 7 +++++--
>  package/re2/Config.in              | 7 +++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index cfa5893f41..49c9d0e450 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -10,11 +10,12 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # qt5base-icu
>  	depends on BR2_USE_MMU # libglib2, qt5base-dbus
>  
> -comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, threads, wchar"
> +comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, dynamic library, threads, wchar"
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
> -		!BR2_HOST_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>  
>  comment "qt5webengine needs an OpenGL and EGL-capable backend"
> @@ -24,6 +25,8 @@ comment "qt5webengine needs an OpenGL and EGL-capable backend"
>  config BR2_PACKAGE_QT5WEBENGINE
>  	bool "qt5webengine"
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # re2
> +	depends on !BR2_STATIC_LIBS # re2
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
>  	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # re2
> diff --git a/package/re2/Config.in b/package/re2/Config.in
> index 0ac0041f6d..b79e711ad3 100644
> --- a/package/re2/Config.in
> +++ b/package/re2/Config.in
> @@ -1,8 +1,10 @@
>  config BR2_PACKAGE_RE2
>  	bool "re2"
> +	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_STATIC_LIBS # libabseil-cpp
>  	select BR2_PACKAGE_LIBABSEIL_CPP
>  	help
>  	  RE2 is a fast, safe, thread-friendly alternative
> @@ -12,7 +14,8 @@ config BR2_PACKAGE_RE2
>  
>  	  https://github.com/google/re2
>  
> -comment "re2 needs a toolchain w/ C++, threads, gcc >= 8"
> +comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
> +	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> -- 
> 2.43.0

LGTM. 

Minor: Yann proposed a similar patch [0] recently where he also adds a comment to grpc for !BR2_STATIC_LIBS coming from re2.

Reviewed-by: Michael Nosthoff <buildroot@heine.tech>

[0] https://patchwork.ozlabs.org/project/buildroot/patch/afdc6d0fddd8f45aea24b544612a680bfa241475.1706448055.git.yann.morin.1998@free.fr/

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
