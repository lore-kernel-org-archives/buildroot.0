Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3123BC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4D9C40C90;
	Fri, 16 May 2025 10:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AKEOBFCl_Ed; Fri, 16 May 2025 10:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A9D4180F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A9D4180F;
	Fri, 16 May 2025 10:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 299C01AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AB1B4180F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXAQohfjPXTN for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:49:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32EA240C90
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32EA240C90
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32EA240C90
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:49:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 21DEC1C0FC0; Fri, 16 May 2025 12:49:49 +0200 (CEST)
Message-ID: <d7c13553-dc60-4433-8e6c-54b8c69912c8@rnout.be>
Date: Fri, 16 May 2025 12:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250502162208.864286-1-james.hilliard1@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250502162208.864286-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392589; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Kq1PR3IpioJspeFg3M267bSmBdoyPTgI9SP+Zis6aFM=;
 b=Vb5DHz4DUFmYtMqm1pkTFb1k7bLHxSJ//5g9XXoE7taSnL+pPM8EjwweXC38NPydkcZGPr
 Rifa4z1lKImlOrWukD+lTQnySrlhOSGvtCqxz34IsSZLBHpfSFINvewzX5cmtXyJXkJ3Os
 VPvzlJhjr9ZuPrwVPO+P11iDCcMiUdj90vqvNOggAmB1h27gvS6RKlVJJ/yQuR7RpTRwb0
 dAbqoKQg0yiGOTp2tziNElNJTSBqbCNVrqJNbFpNcFreVP8VYvfmFI24XdS5iOHIPk6m1S
 YLW/AtLP1iIY/iZ3svQcGh2IDREoyIgr0Hx4hRRX/kpSs7wZR/739/i8d7vNKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Vb5DHz4D
Subject: Re: [Buildroot] [PATCH 1/1] package/hiredis: bump to version 1.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/05/2025 18:22, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...ption-to-not-install-NuGet-packaging.patch | 51 -------------------
>   package/hiredis/hiredis.hash                  |  2 +-
>   package/hiredis/hiredis.mk                    |  2 +-
>   3 files changed, 2 insertions(+), 53 deletions(-)
>   delete mode 100644 package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
> 
> diff --git a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
> deleted file mode 100644
> index dbe8bc0ae6..0000000000
> --- a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From ff7a064490e0aacf718a5263b25b2ddaad0d245e Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Sat, 20 Jan 2024 13:53:39 +0100
> -Subject: [PATCH] CMakeList: add option to not install NuGet packaging
> -
> -The NuGet hiredis.target packaging description file is of no use on
> -systems that are not using NuGet, like Linux systems, and the spurious
> -presence of that file is not "clean".
> -
> -Add a cmake option to allow users to disable installation of that file.
> -As some people may have relied on that file to be installed, continue to
> -install it by default.
> -
> -Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> -Upstream: https://github.com/redis/hiredis/commit/ff7a064490e0aacf718a5263b25b2ddaad0d245e
> ----
> - CMakeLists.txt | 11 ++++++++---
> - 1 file changed, 8 insertions(+), 3 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index b7d6ee8..0fcf29b 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -6,6 +6,9 @@ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
> - OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
> - OPTION(ENABLE_EXAMPLES "Enable building hiredis examples" OFF)
> - OPTION(ENABLE_ASYNC_TESTS "Should we run all asynchronous API tests" OFF)
> -+# Historically, the NuGet file was always install; default
> -+# to ON for those who rely on that historical behaviour.
> -+OPTION(ENABLE_NUGET "Install NuGET packaging details" ON)
> -
> - MACRO(getVersionBit name)
> -   SET(VERSION_REGEX "^#define ${name} (.+)$")
> -@@ -105,9 +108,11 @@ if (MSVC AND BUILD_SHARED_LIBS)
> -         CONFIGURATIONS Debug RelWithDebInfo)
> - endif()
> -
> --# For NuGet packages
> --INSTALL(FILES hiredis.targets
> --    DESTINATION build/native)
> -+if (ENABLE_NUGET)
> -+    # For NuGet packages
> -+    INSTALL(FILES hiredis.targets
> -+        DESTINATION build/native)
> -+endif()
> -
> - INSTALL(FILES hiredis.h read.h sds.h async.h alloc.h sockcompat.h
> -     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/hiredis)
> ---
> -2.43.0
> -
> diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
> index 16ee442d93..b9b4fe556e 100644
> --- a/package/hiredis/hiredis.hash
> +++ b/package/hiredis/hiredis.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  82ad632d31ee05da13b537c124f819eb88e18851d9cb0c30ae0552084811588c  hiredis-1.2.0.tar.gz
> +sha256  25cee4500f359cf5cad3b51ed62059aadfc0939b05150c1f19c7e2829123631c  hiredis-1.3.0.tar.gz
>   sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
> diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
> index 86f35bd4cd..f7acb2f131 100644
> --- a/package/hiredis/hiredis.mk
> +++ b/package/hiredis/hiredis.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HIREDIS_VERSION_MAJOR = 1.2
> +HIREDIS_VERSION_MAJOR = 1.3
>   HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
>   HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
>   HIREDIS_LICENSE = BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
