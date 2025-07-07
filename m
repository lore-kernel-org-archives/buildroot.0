Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3882CC83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 15:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCCE2417C7;
	Mon,  7 Jul 2025 15:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ltn-KjUmHOwm; Mon,  7 Jul 2025 15:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B353141795
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B353141795;
	Mon,  7 Jul 2025 15:18:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D369F15F
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B90A2814C7
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqVupLqlhLL2 for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 15:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34A9680FA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A9680FA6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34A9680FA6
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 15:18:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.75]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1v2cSr1sWZ-00oo3i; Mon, 07
 Jul 2025 17:18:30 +0200
Message-ID: <38b865b9-f5a3-42d0-8e48-3cee9ea87555@gmx.de>
Date: Mon, 7 Jul 2025 17:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abelino Romo <abelino.romo@gmail.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241127052541.3689574-1-abelino.romo@gmail.com>
 <20241129221021.360174-1-abelino.romo@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241129221021.360174-1-abelino.romo@gmail.com>
X-Provags-ID: V03:K1:zyotvQXlokM9mZ/0f900xxW9ZQtJdXhUomhI3MALGaK2zsS9bDZ
 LanWRdqZD0Czw6PmJYp68bXtK60d94eTyH9iuaTifuHc+dtR2jWU5aWSoUm+2U3e0RrohMJ
 9kYT9XIQFcW8cQFpAt101/qFx3DTMFZx0G8XnOwkvwDdr038pFj4UmjmHb8sPeT+3MC2Agp
 CFnd+ze9uTyVngaRJWNNA==
UI-OutboundReport: notjunk:1;M01:P0:SSrpHUP24vU=;tUvPHzZbC7x05LZMRIfs3ubMWqK
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1751901510; x=1752506310; i=fiona.klute@gmx.de;
 bh=0CPjWnboGPUUBD+WAPYcVV5oGsCXR891ndwe4F8d9MA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=JnzRMKH9GFSlCr3y+MhW/kVk9NcTN73JO1YcHTrif+xjyvSdLYb3F6YD2G2gHDCo
 O47aXjV8pFEB0UbYnxgXx+6pQth86C4ZENynWW3TZBQaN0dzh9jpNoLmYwTlfcseZ
 Gy/R62pTEglthoNGDBUEvWRKNl/rieI6S0y9y79z1AueEutZ8I9GPhEyradyu7dqs
 IcJWbb3/uCtkdnPRhHmqh0775K5wp7sFlFIchOcWgDZ2+CtS1AgSWHa2PGWPWYUGH
 sLDQUCWZ5wqgxbsnnRf+sNHvs1YEEgMvKiCkHXsepopkPlcJjNGBo1qOtj6n8pVNk
 oo+pdSbQSQyUD7eJtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=JnzRMKH9
Subject: Re: [Buildroot] [PATCH v3 1/2] package/tpm2-tss: bump version to
 4.1.3
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 29.11.24 um 23:10 schrieb Abelino Romo:
> On v3.2.2, testing with an Infineon SLB9673 resulted in the following
> error when attempting to read from a previously written NV index.
> Upgrading to the latest release, v4.1.3, resolves the issue:
> 
> ```shell
> ~# tpm2_nvread 0x1900001
> WARN: Reading full size of the NV index
> ERROR:esys:../tpm2-tss-3.2.2/src/tss2-esys/esys_iutil.c:1096:esys_GetResourceObject() Error: Esys handle does not exist (70018).
> ERROR: Esys_SequenceComplete(0x70018) - esapi:The ESYS_TR resource object is bad
> ERROR: Failed to get shandle
> ERROR: Failed to read NVRAM area at index 0x1900001
> ERROR: Unable to run tpm2_nvread
> ```
> 
> Between v3.2.2 and v4.1.3, the most notable update is v4.1.0 [1], which
> includes a fix for CVE-2024-29040, along with 40+ bug fixes and 10+ new
> features. Bumping to v4.1.3 adds access to these improvements and
> addresses the NV index read issue.
> 
> [1] https://github.com/tpm2-software/tpm2-tss/releases/tag/4.1.0
> 
> Signed-off-by: Abelino Romo <abelino.romo@gmail.com>

Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

I've tested using the TPM with package/tpm2-pkcs11.

There's a trivial merge conflict with the package/tpm2-abrmd init script 
rewrite I sent earlier [1] because both patches remove adjacent lines in 
.checkpackageignore, but that should be easy to fix and more reason to 
merge. :-)

Best regards,
Fiona

[1] 
https://patchwork.ozlabs.org/project/buildroot/patch/20250707141052.280200-3-fiona.klute@gmx.de/

> ---
> Changes v2 -> v3:
>    - Use manually uploaded tarball - the artifact from releases/download URL -
> 	  and not the archive tarball.
> 	  (suggested by Thomas Petazzoni)
> 
> 	- Updated Signed-Off formatting.
> 	  (suggested by Thomas Petazzoni)
> 
>   .checkpackageignore                           |  1 -
>   ...01-Temporary-fix-for-build-without-C.patch | 44 -------------------
>   package/tpm2-tss/Config.in                    |  2 +
>   package/tpm2-tss/tpm2-tss.hash                |  2 +-
>   package/tpm2-tss/tpm2-tss.mk                  |  9 ++--
>   5 files changed, 6 insertions(+), 52 deletions(-)
>   delete mode 100644 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index b793026881..906a733b7b 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1237,7 +1237,6 @@ package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_pat
>   package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
>   package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
>   package/tpm2-abrmd/S80tpm2-abrmd Shellcheck lib_sysv.Indent lib_sysv.Variables
> -package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
>   package/transmission/S92transmission Shellcheck lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
>   package/triggerhappy/S10triggerhappy Shellcheck lib_sysv.Indent lib_sysv.Variables
>   package/trinity/0001-Fix-build-with-GCC-10.patch lib_patch.Upstream
> diff --git a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch b/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
> deleted file mode 100644
> index 812c753ffb..0000000000
> --- a/package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 7dc753ad27a8cd14c9b00be94ca89b847cf05ce9 Mon Sep 17 00:00:00 2001
> -From: Carlos Santos <unixmania@gmail.com>
> -Date: Mon, 23 Dec 2019 08:02:19 -0300
> -Subject: [PATCH] Temporary fix for build without C++
> -
> -C++ is required only for the fuzzing tests but AC_PROG_CXX is included
> -by configure.ac even when fuzzing is not enabled (which we don't do on
> -Buildroot).
> -
> -The patch applied upstream had issues and was reverted[1]. Use a local
> -patch to solve the problem temporaryly.
> -
> -Fixes:
> -    http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
> -    http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
> -    http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
> -    http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
> -    http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
> -    http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
> -    http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
> -    http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47
> -
> -1. https://github.com/tpm2-software/tpm2-tss/commit/60c26e4c4faba6ba12469485653e17092b510840
> -
> -Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ----
> - configure.ac | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index ff59dd7c..3e4028fb 100755
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -26,7 +26,6 @@ AX_IS_RELEASE(dash-version)
> - AX_CHECK_ENABLE_DEBUG([info])
> -
> - AC_PROG_CC
> --AC_PROG_CXX
> - AC_PROG_LN_S
> - AC_USE_SYSTEM_EXTENSIONS
> - LT_INIT()
> ---
> -2.26.2
> -
> diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
> index 857987ae36..d87c1e0d8d 100644
> --- a/package/tpm2-tss/Config.in
> +++ b/package/tpm2-tss/Config.in
> @@ -39,6 +39,8 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
>   	select BR2_PACKAGE_JSON_C
>   	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>   	help
>   	  This option allows to enable Feature API (FAPI).  Feature
>   	  API (FAPI) as described in the "TSS 2.0 Feature API
> diff --git a/package/tpm2-tss/tpm2-tss.hash b/package/tpm2-tss/tpm2-tss.hash
> index c9fa4e6ae0..891c1285b0 100644
> --- a/package/tpm2-tss/tpm2-tss.hash
> +++ b/package/tpm2-tss/tpm2-tss.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  ba9e52117f254f357ff502e7d60fce652b3bfb26327d236bbf5ab634235e40f1  tpm2-tss-3.2.2.tar.gz
> +sha256  37f1580200ab78305d1fc872d89241aaee0c93cbe85bc559bf332737a60d3be8  tpm2-tss-4.1.3.tar.gz
>   sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
> diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
> index b76d16e71e..c8a7df7724 100644
> --- a/package/tpm2-tss/tpm2-tss.mk
> +++ b/package/tpm2-tss/tpm2-tss.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -TPM2_TSS_VERSION = 3.2.2
> +TPM2_TSS_VERSION = 4.1.3
>   TPM2_TSS_SITE = https://github.com/tpm2-software/tpm2-tss/releases/download/$(TPM2_TSS_VERSION)
>   TPM2_TSS_LICENSE = BSD-2-Clause
>   TPM2_TSS_LICENSE_FILES = LICENSE
> @@ -13,9 +13,6 @@ TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
>   TPM2_TSS_INSTALL_STAGING = YES
>   TPM2_TSS_DEPENDENCIES = openssl host-pkgconf
>   
> -# 0001-configure-Only-use-CXX-when-fuzzing.patch
> -TPM2_TSS_AUTORECONF = YES
> -
>   # systemd-sysusers and systemd-tmpfiles are only used at install time
>   # to trigger the creation of users adn tmpfiles, which we do not care
>   # about at build time. groupadd, useradd, and setfacl are used in the
> @@ -36,10 +33,10 @@ TPM2_TSS_CONF_OPTS = \
>   TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
>   
>   ifeq ($(BR2_PACKAGE_TPM2_TSS_FAPI),y)
> -TPM2_TSS_DEPENDENCIES += json-c libcurl
> +TPM2_TSS_DEPENDENCIES += json-c libcurl util-linux
>   TPM2_TSS_CONF_OPTS += --enable-fapi
>   else
> -TPM2_TSS_CONF_OPTS += --disable-fapi
> +TPM2_TSS_CONF_OPTS += --disable-fapi --disable-policy
>   endif
>   
>   define TPM2_TSS_USERS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
