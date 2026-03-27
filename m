Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43CB10ED674
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 14:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E393416DB;
	Fri, 27 Mar 2026 14:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzujPB3X1M9j; Fri, 27 Mar 2026 14:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B0DC41731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774621311;
	bh=MCM5NcvkFNZYcg8ISG2TfL9x94Cht3B3LX9q1kyFSO0=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mmzmjyrfyY41DDjRiUuhTtQIgX+nfu0wzIVtwtghMbMYIDqpBE8JXDcLpCe4rJGF/
	 WIZATgPYD7iO43meTOxRZOt+ePxeikkrlGws/iP2HNi3n6k4GnSEmAqCjCdsEZgC88
	 72JK0eQNFVbVCdoljwyKwtZQjdqRvNbuaPRmKWigV7dKy+ib2m5YdmnUHNwYOCe3I4
	 r2vAa7ypJ7yLzfDQmJ/YQ7xRMNyY7e7qH0bKuXcwFoKgHoTf1RWRIL9jFw3yO5aKrT
	 sabVXSiVe1RL4tc2b82St9b5j0AfwidZKTwVOSLyPFthic9spDaIS9+i0MbCyWx6c/
	 pmnJAbxJ4GY/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B0DC41731;
	Fri, 27 Mar 2026 14:21:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96C41249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 14:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88BF141731
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 14:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzGD7x21viBb for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 14:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD557416DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD557416DB
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD557416DB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 14:21:47 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 684HwlecDtpTf684HwW7Ws; Fri, 27 Mar 2026 15:21:45 +0100
Message-ID: <b2049a43-6bb5-4f16-b6ac-1205e2d337a3@benettiengineering.com>
Date: Fri, 27 Mar 2026 15:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <CADvTj4qihD1uocWibJpjL1SypAEGea-vCFWfnG7_znv4xhXykA@mail.gmail.com>
 <20260327141659.1109640-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260327141659.1109640-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfJ35IdzC3iShuOnHEWb+nGMpQy+Q2kG1UjGe2ftLvI901Ds1ZgMrTEvnjoYqFc6W3u+HACR6Uwl7uWJCzyIXpjeMUf1CZmw0rLO+vD1D8z6WnuR33CA9
 SOmxWLRSbsfcgyWA2Sr7/lh0sgVa8UfJzgMRhNK7gPAmB24zezVDBVGCCu08/TjlIpMpQo6J/pS9sE+HIIqkP0OI5M4s+bwJtZvOmShP45DOBgHFGGMN5yiP
 wV83B8n3nSgs16ICGUVoJQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774621305; bh=aectwj/O/TqqaI1hqHtO2uij55yuHUZwHIS/A8/Jgko=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BWpB8kF9+0Rxoot+J826PICOkFFUwp6zcwpyY+wmdY0gJ4nBurt3+TrE6hPyoBaJz
 KUFUWUZg7ZgIPnWO+vtUppTGhQwy82teesOJ2fWDVv5lhEsRsdpXgp4XxwbrXdfff9
 BzrxlBBqyGT2ygzmh3MWKLMXFhmAxRepRJysuKZyg5+/13hIhr5DDbC/okX2TDeWCQ
 a4SywU90qwppHWUxlg4vfZjon5y+c9bRp2XA/lxgdiSnlOcME7UsHkCoOw6XAySpuJ
 Qrd2MCd7DIV6ya6egRDOjLDH8tJbnwZPQZuamFGJhWKjOpfZCisvGOTSmy8UXCWlBW
 7dDg+gAy3bbjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BWpB8kF9
Subject: Re: [Buildroot] [PATCH v3] packge/swupdate: bump to version 2025.12
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


On 27/03/2026 15:16, Giulio Benetti wrote:
> * backport locally patch [1] to fix build failure due to missing crypto
>    backend
> * libconfig is required by default[2] so let's select it
> * align swupdate.config to the most basic one with openssl crypto
>    backend enabled by default
> * drop HAVE_LIBCRYPTO since it's not used anymore by swupdate even if
>    present
> * add libgpgme support
> 
> [1]: https://github.com/sbabic/swupdate/commit/10334fb21796b75f3a1208a3d5a98a307712218b
> [2]: https://github.com/sbabic/swupdate/commit/4b9a71476c886be1a6affe21d6a0334b254a04e1
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---

V1->V2:
* drop Config.in choice since we can have multiple crypto backends
* add libgpgme as a possible crypto backend
* select openssl as default crypto backend
* set CONFIG_SSL_IMPL_OPENSSL=y in swupdate.config

V2->V3:
* don't use a crypto backend by default since James Hillard provided a
patch committed upstream that still allow to build without it
* document the adding of libgpgme in commit log

---
>   ...no-crypto-configuration-link-failure.patch | 67 +++++++++++++++++++
>   package/swupdate/Config.in                    |  6 +-
>   package/swupdate/swupdate.config              |  2 -
>   package/swupdate/swupdate.hash                |  2 +-
>   package/swupdate/swupdate.mk                  | 20 +++---
>   5 files changed, 81 insertions(+), 16 deletions(-)
>   create mode 100644 package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch
> 
> diff --git a/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch b/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch
> new file mode 100644
> index 0000000000..15f33aa3ab
> --- /dev/null
> +++ b/package/swupdate/0001-build-fix-no-crypto-configuration-link-failure.patch
> @@ -0,0 +1,67 @@
> +From 4e7c2f6c4b978efae69d777705de84411a01c147 Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Tue, 24 Mar 2026 14:23:58 -0600
> +Subject: [PATCH] build: fix no-crypto configuration link failure
> +
> +When no crypto backend is selected, the crypto directory contributes
> +no objects, so this kbuild variant does not generate
> +crypto/built-in.o.
> +
> +The top-level build still linked that file unconditionally, causing
> +the final link to fail.
> +
> +Introduce a hidden SWUPDATE_CRYPTO helper selected by the Kconfig
> +options that actually populate crypto/, and only descend into the
> +crypto directory when that helper is enabled.
> +
> +Upstream: https://github.com/sbabic/swupdate/commit/10334fb21796b75f3a1208a3d5a98a307712218b
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + Makefile       | 3 ++-
> + crypto/Kconfig | 5 +++++
> + 2 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index aa9604aa..759fd191 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -369,7 +369,8 @@ include $(srctree)/Makefile.flags
> + # This allow a user to issue only 'make' to build a kernel including modules
> + # Defaults to vmlinux, but the arch makefile usually adds further targets
> +
> +-objs-y		:= core handlers crypto bootloader suricatta
> ++objs-y		:= core handlers bootloader suricatta
> ++objs-$(CONFIG_SWUPDATE_CRYPTO) += crypto
> + libs-y		:= corelib mongoose parser fs containers
> + bindings-y	:= bindings
> + tools-y		:= tools
> +diff --git a/crypto/Kconfig b/crypto/Kconfig
> +index 4b9db821..cc953542 100644
> +--- a/crypto/Kconfig
> ++++ b/crypto/Kconfig
> +@@ -23,9 +23,13 @@ menu "Crypto libraries"
> + 		depends on HAVE_GPGME
> + endmenu
> +
> ++config SWUPDATE_CRYPTO
> ++	bool
> ++
> + config HASH_VERIFY
> + 	bool "Allow to add sha256 hash to each image"
> + 	depends on SSL_IMPL_OPENSSL || SSL_IMPL_WOLFSSL || SSL_IMPL_MBEDTLS
> ++	select SWUPDATE_CRYPTO
> + 	help
> + 	  Allow to add a sha256 hash to an artifact.
> + 	  This is automatically set in case of Signed Image
> +@@ -83,6 +87,7 @@ menu "Encryption"
> + config ENCRYPTED_IMAGES
> + 	bool "Images can be encrypted with a symmetric key"
> + 	depends on SSL_IMPL_OPENSSL || SSL_IMPL_WOLFSSL || SSL_IMPL_MBEDTLS
> ++	select SWUPDATE_CRYPTO
> + comment "Image encryption needs an SSL implementation"
> + 	depends on !SSL_IMPL_OPENSSL && !SSL_IMPL_WOLFSSL && !SSL_IMPL_MBEDTLS
> +
> +--
> +2.47.3
> +
> diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
> index 3708df0881..112e53a127 100644
> --- a/package/swupdate/Config.in
> +++ b/package/swupdate/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_SWUPDATE
>   	depends on BR2_USE_MMU # fork()
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
>   	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_LIBCONFIG
>   	select BR2_PACKAGE_LIBUBOOTENV
>   	help
>   	  swupdate provides a reliable way to update the software on
> @@ -25,8 +26,9 @@ config BR2_PACKAGE_SWUPDATE
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
> index a6b7a74948..0f672805be 100644
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
