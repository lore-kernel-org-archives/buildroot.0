Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA8C0015E
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 17:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE8140156;
	Sat,  5 Aug 2023 17:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE8140156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4MWAbAtdRnYY; Sat,  5 Aug 2023 17:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 514C6402C4;
	Sat,  5 Aug 2023 17:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 514C6402C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB6741BF85D
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9D8F82109
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 17:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9D8F82109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UK-x3rh_QJkT for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 17:06:26 +0000 (UTC)
X-Greylist: delayed 332 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 05 Aug 2023 17:06:25 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B513E81F31
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B513E81F31
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 17:06:25 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 5F444AA4
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 19:00:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NvNKV4Gvrxa for <buildroot@buildroot.org>;
 Sat,  5 Aug 2023 19:00:48 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
 by mx.kolabnow.com (Postfix) with ESMTPS id E80F368F
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 19:00:46 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
 by int-mx003.mykolab.com (Postfix) with ESMTPS id 9AC7226F2
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 19:00:46 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Sat, 05 Aug 2023 19:00:44 +0200
Message-ID: <10468366.tK2H9zQlTR@zgyarmati-w530>
In-Reply-To: <20230802175407.537056-1-bernd@kuhls.net>
References: <20230802175407.537056-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received:received:received; s=dkim20160331; t=
 1691254848; x=1693069249; bh=b0Vb71+EoH/KowR/y19X/Fys+wV07MG+Bkc
 hkICSFho=; b=Bx23Cnh9f6up/gYVHkjhMGFNZGnpuAQokvpUGphxeKt2+K/JHos
 rDS7NA/9M61sNak7OPxUPT8/kzNJv8+EVOj5aUOPxq41J2WdDMTV1FcHTq1lrAsp
 Sxj0vacu5QwwIr68Ee9LClZaAi07mkrlqqFaAtdMiVzZewlas4xw/0jx/Nu3CWfC
 S1JqcgldSIOBS2ufvXXnNxvLN4KxBY6MnUabOPrqXITTwneSY+ZU9Dxa3QUprEzW
 /xfMwQDhuybt8GjI93VOHNjQTBhjT61Zxv8wQW1BBUtdODvoM71kekEOVGp7cwp5
 Jxti4z/Ya28pIbkX9rkbwMfd7pr0y7oc9GuOIBE3BvfVpR6ue6bGtbWMkfoYJU7P
 KkK8ErbW1txOHXOt27IlyJZL9u+cXQABnkUiA+d+XJ5eoun/dRu8la0YgE+VI1MZ
 ZSb0hbRnTaXdnT5PrHBolnJhCkOXuCp1yjAHpkfHGJCIx/0zmRWKJR1viVjH81NB
 l+PDn8ex/v+CtRBTyebF8i2ifyqSwsCQBrivid19GNL0ELDpFVd3b5DNH2A0mQ7r
 7kaXGYClktBG1pD4BT6H1qJuXmR+wwuG2vdb6A0E62lL80Abon2BXAsjO6PolZqv
 D/286WKcWY655zT8Qy/AVlbc81fcfKaj0apa9QpUgJqCVlbS8PsVi8ts=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=Bx23Cnh9
X-Mailman-Original-Authentication-Results: ext-mx-out001.mykolab.com
 (amavisd-new); 
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: bump version to 9.2.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear Bernd,

 thanks for working on this!

Test-compiled the package, and  if  BR2_PACKAGE_LIBCURL is not enabled, the 
the configuration fails with:

> -- PROJ_LIBRARIES                 = proj
> CMake Error at src/apps/CMakeLists.txt:80 (message):
> projsync requires Curl
>

It seems unfortunately we need sth like:

> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index 641613a02a..ef1ba567f2 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -28,6 +28,7 @@ PROJ_DEPENDENCIES += libcurl
> 
>  PROJ_CONF_OPTS += -DENABLE_CURL=ON
>  else
>  PROJ_CONF_OPTS += -DENABLE_CURL=OFF
> +PROJ_CONF_OPTS += -DBUILD_PROJSYNC=OFF
> 
>  endif
>  
>  ifeq ($(BR2_PACKAGE_TIFF),y)


Regards,

 

On 2023. augusztus 2., szerda 19:54:07 CEST Bernd Kuhls wrote:
> Release notes: https://github.com/OSGeo/PROJ/blob/master/NEWS
> 
> Switch package to cmake, add json-for-modern-cpp dependency.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/proj/Config.in |  7 ++++---
>  package/proj/proj.hash |  6 +++---
>  package/proj/proj.mk   | 14 +++++++-------
>  3 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/package/proj/Config.in b/package/proj/Config.in
> index 1952fc7d9a..d9a9918c43 100644
> --- a/package/proj/Config.in
> +++ b/package/proj/Config.in
> @@ -1,9 +1,10 @@
>  config BR2_PACKAGE_PROJ
>  	bool "proj"
>  	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
>  	select BR2_PACKAGE_SQLITE
>  	help
>  	  proj.4 is a standard UNIX filter function which converts
> @@ -14,7 +15,7 @@ config BR2_PACKAGE_PROJ
> 
>  	  http://proj4.org/
> 
> -comment "proj needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
> +comment "proj needs a toolchain w/ C++, gcc >= 4.9, threads, wchar"
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
> diff --git a/package/proj/proj.hash b/package/proj/proj.hash
> index 96d94e458e..054499beca 100644
> --- a/package/proj/proj.hash
> +++ b/package/proj/proj.hash
> @@ -1,5 +1,5 @@
> -# Fetched from http://download.osgeo.org/proj/proj-8.1.1.tar.gz.md5
> -md5  f017fd7d35311b0d65b2cf0503844690  proj-8.1.1.tar.gz
> +# From http://download.osgeo.org/proj/proj-9.2.1.tar.gz.md5
> +md5  c8e878049ef27330ac94624e1a75b0db  proj-9.2.1.tar.gz
>  # Locally calculated
> -sha256  82f1345e5fa530c407cb1fc0752e83f8d08d2b98772941bbdc7820241f7fada2 
> proj-8.1.1.tar.gz +sha256 
> 15ebf4afa8744b9e6fccb5d571fc9f338dc3adcf99907d9e62d1af815d4971a1 
> proj-9.2.1.tar.gz sha256 
> 6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
> diff --git a/package/proj/proj.mk b/package/proj/proj.mk
> index bc924b41fb..641613a02a 100644
> --- a/package/proj/proj.mk
> +++ b/package/proj/proj.mk
> @@ -4,12 +4,12 @@
>  #
>  ###########################################################################
> #####
> 
> -PROJ_VERSION = 8.1.1
> +PROJ_VERSION = 9.2.1
>  PROJ_SITE = http://download.osgeo.org/proj
>  PROJ_LICENSE = MIT
>  PROJ_LICENSE_FILES = COPYING
>  PROJ_INSTALL_STAGING = YES
> -PROJ_DEPENDENCIES = host-pkgconf host-sqlite sqlite
> +PROJ_DEPENDENCIES = host-pkgconf host-sqlite json-for-modern-cpp sqlite
> 
>  PROJ_CFLAGS = $(TARGET_CFLAGS)
>  PROJ_CXXFLAGS = $(TARGET_CXXFLAGS)
> @@ -25,16 +25,16 @@ PROJ_CONF_ENV = \
> 
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  PROJ_DEPENDENCIES += libcurl
> -PROJ_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr/bin/curl-config
> +PROJ_CONF_OPTS += -DENABLE_CURL=ON
>  else
> -PROJ_CONF_OPTS += --without-curl
> +PROJ_CONF_OPTS += -DENABLE_CURL=OFF
>  endif
> 
>  ifeq ($(BR2_PACKAGE_TIFF),y)
>  PROJ_DEPENDENCIES += tiff
> -PROJ_CONF_OPTS += --enable-tiff
> +PROJ_CONF_OPTS += -DENABLE_TIFF=ON
>  else
> -PROJ_CONF_OPTS += --disable-tiff
> +PROJ_CONF_OPTS += -DENABLE_TIFF=OFF
>  endif
> 
> -$(eval $(autotools-package))
> +$(eval $(cmake-package))


-- 
Zoltan Gyarmati
https://zgyarmati.de


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
