Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C264DC001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 20:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6721E60743;
	Mon, 31 Jul 2023 20:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6721E60743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mw0rntG-X9q; Mon, 31 Jul 2023 20:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B5A5610DB;
	Mon, 31 Jul 2023 20:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B5A5610DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F7871BF954
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0E7460FF0
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0E7460FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zliVwZd8Itei for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 20:50:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E80E06059F
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 20:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E80E06059F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E2BB20003;
 Mon, 31 Jul 2023 20:49:57 +0000 (UTC)
Date: Mon, 31 Jul 2023 22:49:56 +0200
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20230731224956.0d3d88c7@windsurf>
In-Reply-To: <20230428152211.20394-3-flaniel@linux.microsoft.com>
References: <20230428152211.20394-1-flaniel@linux.microsoft.com>
 <20230428152211.20394-3-flaniel@linux.microsoft.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690836597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2o5H0IDc7JFTjK9AT4fkZiLRssENoEnq+8SqEdMmFM=;
 b=GM1r0xzoYlbDBEdUhFxVrW6ByqWKhl5zJi9mOMv5wBTHCqh2EL6Gv/dDfraQNky1nYX451
 l3i2Z+ao+pMw8/lCrykVH3z4rngGDLapU8psNBrARDhFXX860LwWDt9GLE2ifffPB26f+C
 SAHZDQ5lAYr9XYlJMC5bpXG5nctrvk0gbvmPoAJzjcIUfAvXOWWBl96LfcNsX8NoyKdzot
 b6X3x8xBm95Rcje4e9z8kvt22XLhrelQONA78ByfuQ0GHz0RFgVBbfeVDKjr4EP8r1lvx3
 yv2mxWOwyq4XSkxduxrt1yaANP8S+KZEWp4nccwvkBnKlG2zCPdGefwlay5rDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GM1r0xzo
Subject: Re: [Buildroot] [RFC PATCH v1 2/2] package/falcosecurity-libs: bump
 to version 0.10.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Francis,

On Fri, 28 Apr 2023 16:22:11 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:

> diff --git a/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch b/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
> new file mode 100644
> index 0000000000..38a8bdd4f4
> --- /dev/null
> +++ b/package/falcosecurity-libs/0002-cmake-Install-shared-libraries.patch
> @@ -0,0 +1,61 @@
> +From b6d847fe8aa0513c6d19bd8187133699b9c4efd3 Mon Sep 17 00:00:00 2001
> +From: Francis Laniel <flaniel@linux.microsoft.com>
> +Date: Fri, 28 Apr 2023 15:14:27 +0100
> +Subject: [PATCH] cmake: Install shared libraries.
> +
> +This is needed as sysdig is compiled as a non static binary which relies on
> +these libraries.

Not clear. An executable can use a mix of shared and static libraries.

What is the upstream status of this? How is falcosecurity-libs supposed
to be used by sysdig according to upstream?

All patches now need to have an "Upstream: <link>" tag that indicates
where the patch has been submitted.

> +diff --git a/cmake/modules/libelf.cmake b/cmake/modules/libelf.cmake
> +index 8ca2f4f7..73d13d26 100644
> +--- a/cmake/modules/libelf.cmake
> ++++ b/cmake/modules/libelf.cmake
> +@@ -10,7 +10,7 @@ if(LIBELF_INCLUDE)
> +     add_custom_target(libelf)
> + elseif(NOT USE_BUNDLED_LIBELF)
> +     find_path(LIBELF_INCLUDE elf.h PATH_SUFFIXES elf)
> +-    find_library(LIBELF_LIB NAMES libelf.a libelf.so)
> ++    find_library(LIBELF_LIB NAMES libelf.so)

Is this really related?

> diff --git a/package/falcosecurity-libs/falcosecurity-libs.hash b/package/falcosecurity-libs/falcosecurity-libs.hash
> index 2e239ca2fe..ef805cbcf6 100644
> --- a/package/falcosecurity-libs/falcosecurity-libs.hash
> +++ b/package/falcosecurity-libs/falcosecurity-libs.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256  80903bc57b7f9c5f24298ecf1531cf66ef571681b4bd1e05f6e4db704ffb380b  falcosecurity-libs-e5c53d648f3c4694385bbe488e7d47eaa36c229a.tar.gz
> +sha256  2a4b37c08bec4ba81326314831f341385aff267062e8d4483437958689662936  falcosecurity-libs-0.10.5.tar.gz
>  sha256  21ec9433a87459b3477faf542bacec419dc03af841309eac35edeffe481cf10b  COPYING
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
>  sha256  f17d3f2c2d565a74a7d5bf96f880c43701e141897e8dff0c8aa13e5d07aaf226  driver/MIT.txt
> diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
> index 92d5c61832..acd46cf7a5 100644
> --- a/package/falcosecurity-libs/falcosecurity-libs.mk
> +++ b/package/falcosecurity-libs/falcosecurity-libs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FALCOSECURITY_LIBS_VERSION = e5c53d648f3c4694385bbe488e7d47eaa36c229a
> +FALCOSECURITY_LIBS_VERSION = 0.10.5
>  FALCOSECURITY_LIBS_SITE = $(call github,falcosecurity,libs,$(FALCOSECURITY_LIBS_VERSION))
>  FALCOSECURITY_LIBS_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
>  FALCOSECURITY_LIBS_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
> @@ -57,17 +57,19 @@ endef
>  # For the others, it was taken by inspecting
>  # falcosecurity-libs/*/CMakeLists.txt, which normally creates these
>  # files, but doesn't work well with the kernel-module infrastructure.
> +# The magical number for API_VERSION and SCHEMA_VERSION are taken from
> +# corresponding files.

Which corresponding files? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
