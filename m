Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42442F54AB9
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 13:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDBAC80E84;
	Tue, 24 Mar 2026 13:39:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaZXjtrBJWYN; Tue, 24 Mar 2026 13:39:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1629980E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774359567;
	bh=eVKiPKQdHDZO7x8L7gF16epMLp+Ha4Q2fNsKijkURWQ=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bNBxmRBFSntQAESzcfBtky04UASeUzIpbyfI1ijYshHjSe9SA7crYsOobCPHikFbE
	 R+GMtrkzdgqTKA53hbkuZJDCAXNuuyHv5FGsz8VIOyDHfc5SJbqoT1M24cN3OG/LGH
	 PtiamNaKg3rrqzTiMjs532++vWe0NGxfr7iPyMKMzy9oScFsLZ2TEZa4YTUXzoIfrk
	 z+QQlk76uRON2GJXDu4a38O86ehcvJVDPa32GjV/AD3LU9yMnm1guY3l1U6bYvMkug
	 skxtvLMNkJjgHyqjc0NMEYgcwHZ4aUBX2znBmjhsdezl0I0peFXqF5b6tusss51fM1
	 8aF+Qa4VIRasg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1629980E85;
	Tue, 24 Mar 2026 13:39:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A065B353
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85E0D40F8B
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgSL-pJjfxb1 for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 13:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5F7F4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5F7F4005B
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5F7F4005B
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 13:39:23 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 51ybwb6EO0dL051ybwPG7i; Tue, 24 Mar 2026 14:39:21 +0100
Message-ID: <6b4acd9c-1b85-4fbf-8e2b-aca75b71ba85@benettiengineering.com>
Date: Tue, 24 Mar 2026 14:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260324133448.2021140-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260324133448.2021140-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfOM5bVe9SQYU5rgQLorwtnBGOF9rR0TcZTqq4W5R/lRQHsXjOlOQOXj/LpuDmjYq0k5rwzSIPAEQC1bABUoRkw9KfkGKNxtywVB+jyFclZrX9NhMdAC/
 Hz/qb9iT8QOY0R9KaXturcVDfR7Orx+BJ4WtN8f4unwUIAzd2/2LVUOEUs3u4Utqe/40LyZqyDpSyKR+YYNDrBuDBbhrwfh7MzY0VfacOZ/fb1QUJufr+eUU
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774359561; bh=gsDVao8qHYT8pANBkulsalvHu0UiyyAee6cl+fFCM+Y=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Ojyjp9X6kYLq+OCETz8RCn+k70phnGay2SPeqwVmGzLiT0iyVyBepFls0byaGveDE
 S2p6pMfD8JAnzCVdQu9cw6NXL0z6UFdPNuRFPxnvF0yD/JT0e0E/J2Cal/MZ37v+sa
 PchwiT9QfmfpHhG10CROYIXYEz2x/CiQkTd0NGqM0i78JJtD95cgPhl/hARTJCyaHW
 0Hfg3zLvBp3WerEdGXZ/+msOrH1ENa+faNQHhpZGwicum+ZQIHD1Gy4GQDBCkOfpax
 BJ5lLXbriXGk5PDshMIxJRX1KUb5b8MGoFFXk7XFraDdD0a/ujBGlBBLpw30X3xHUU
 hcG6YtjQrK+qA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Ojyjp9X6
Subject: Re: [Buildroot] [PATCH v2] packge/swupdate: bump to version 2025.12
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

On 24/03/2026 14:34, Giulio Benetti wrote:
> * as stated here[2] now swupdate requires at least one crypto backend so
>    as done for libssh let's enable BR2_PACKAGE_OPENSSL if no other crypto
>    backend supported by swupdate is enabled
> * libconfig is required by default[1] so let's select it
> * align swupdate.config to the most basic one with openssl crypto
>    backend enabled by default
> * drop HAVE_LIBCRYPTO since it's not used anymore by swupdate even if
>    present
> 
> [1]: https://github.com/sbabic/swupdate/commit/4b9a71476c886be1a6affe21d6a0334b254a04e1
> [2]: https://groups.google.com/g/swupdate/c/bLY3DyLzII0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---

Here I've forgotten:
V1->V2:
* drop Config.in choice since we can have multiple crypto backends
* add libgpgme as a possible crypto backend
* select openssl as default crypto backend
* set CONFIG_SSL_IMPL_OPENSSL=y in swupdate.config

>   package/swupdate/Config.in       |  8 ++++++--
>   package/swupdate/swupdate.config |  4 +---
>   package/swupdate/swupdate.hash   |  2 +-
>   package/swupdate/swupdate.mk     | 20 +++++++++-----------
>   4 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> index 3708df0881..83cdec691d 100644
> --- a/package/swupdate/Config.in
> +++ b/package/swupdate/Config.in
> @@ -5,7 +5,10 @@ config BR2_PACKAGE_SWUPDATE
>   	depends on BR2_USE_MMU # fork()
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
>   	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_LIBCONFIG
>   	select BR2_PACKAGE_LIBUBOOTENV
> +	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_LIBGPGME || \
> +	       BR2_PACKAGE_MBEDTLS || BR2_PACKAGE_WOLFSSL)
>   	help
>   	  swupdate provides a reliable way to update the software on
>   	  an embedded system.
> @@ -25,8 +28,9 @@ config BR2_PACKAGE_SWUPDATE
>   	    want to have Lua support.
>   	  * Select BR2_PACKAGE_LIBCURL if you want to use the download
>   	    feature.
> -	  * Select BR2_PACKAGE_OPENSSL or BR2_PACKAGE_MBEDTLS if you
> -	    want to add encryption support.
> +	  * Select at least one of these crypto backends:
> +	    BR2_PACKAGE_OPENSSL or BR2_PACKAGE_MBEDTLS or
> +	    BR2_PACKAGE_WOLFSSL or BR2_PACKAGE_LIBGPGME.
>   	  * Select BR2_PACKAGE_MTD if you want to use swupdate with
>   	    UBI partitions.
>   	  * Select BR2_PACKAGE_ZLIB if you want to deal with gzip
> diff --git a/package/swupdate/swupdate.config b/package/swupdate/swupdate.config
> index a6b7a74948..d913d16b09 100644
> --- a/package/swupdate/swupdate.config
> +++ b/package/swupdate/swupdate.config
> @@ -2,7 +2,6 @@
>   # Automatically generated file; DO NOT EDIT.
>   # Swupdate Configuration
>   #
> -CONFIG_HAVE_DOT_CONFIG=y
>   
>   #
>   # Swupdate Settings
> @@ -24,7 +23,6 @@ CONFIG_SW_VERSIONS_FILE="/etc/sw-versions"
>   #
>   CONFIG_SOCKET_CTRL_PATH="/tmp/sockinstctrl"
>   CONFIG_SOCKET_PROGRESS_PATH="/tmp/swupdateprog"
> -CONFIG_SOCKET_REMOTE_HANDLER_DIRECTORY="/tmp/"
>   
>   #
>   # MTD support needs libmtd
> @@ -60,7 +58,7 @@ CONFIG_BOOTLOADER_NONE=y
>   #
>   # U-Boot support needs libubootenv, libz
>   #
> -CONFIG_SSL_IMPL_NONE=y
> +CONFIG_SSL_IMPL_OPENSSL=y
>   
>   #
>   # Image downloading support needs libcurl
> diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
> index bc911d1820..b3f43648f8 100644
> --- a/package/swupdate/swupdate.hash
> +++ b/package/swupdate/swupdate.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated
> -sha256  678b47fd2419727c4d0abf5c9f3bc0dc4b67e95951132bd1c8f5603e88947779  swupdate-2025.05.tar.gz
> +sha256  8517f3730eeb66e20e651b881dd4b9c10ca9ae05e3883db59b5df18ab1eaa533  swupdate-2025.12.tar.gz
>   sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
>   sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
>   sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 05329d13b8..b2778d2aec 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SWUPDATE_VERSION = 2025.05
> +SWUPDATE_VERSION = 2025.12
>   SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
>   SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
>   SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
> @@ -18,7 +18,7 @@ SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
>   	LICENSES/MIT.txt \
>   	LICENSES/OFL-1.1.txt
>   SWUPDATE_INSTALL_STAGING = YES
> -SWUPDATE_DEPENDENCIES = json-c libubootenv
> +SWUPDATE_DEPENDENCIES = json-c libconfig libubootenv
>   
>   # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
>   # available in all external toolchains, and use CC for linking. Ensure
> @@ -51,13 +51,6 @@ else
>   SWUPDATE_MAKE_ENV += HAVE_LIBBLKID=n
>   endif
>   
> -ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
> -SWUPDATE_DEPENDENCIES += libconfig
> -SWUPDATE_MAKE_ENV += HAVE_LIBCONFIG=y
> -else
> -SWUPDATE_MAKE_ENV += HAVE_LIBCONFIG=n
> -endif
> -
>   ifeq ($(BR2_PACKAGE_LIBCURL),y)
>   SWUPDATE_DEPENDENCIES += libcurl
>   SWUPDATE_MAKE_ENV += HAVE_LIBCURL=y
> @@ -82,6 +75,13 @@ else
>   SWUPDATE_MAKE_ENV += HAVE_LIBGPIOD=n
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBGPGME),y)
> +SWUPDATE_DEPENDENCIES += libgpgme
> +SWUPDATE_MAKE_ENV += HAVE_GPGME=y
> +else
> +SWUPDATE_MAKE_ENV += HAVE_GPGME=n
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBURIPARSER),y)
>   SWUPDATE_DEPENDENCIES += liburiparser
>   SWUPDATE_MAKE_ENV += HAVE_URIPARSER=y
> @@ -126,10 +126,8 @@ endif
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   SWUPDATE_DEPENDENCIES += openssl
>   SWUPDATE_MAKE_ENV += HAVE_LIBSSL=y
> -SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=y
>   else
>   SWUPDATE_MAKE_ENV += HAVE_LIBSSL=n
> -SWUPDATE_MAKE_ENV += HAVE_LIBCRYPTO=n
>   endif
>   
>   ifeq ($(BR2_PACKAGE_P11_KIT),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
