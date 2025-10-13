Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F475CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 19:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 374C541269;
	Mon, 13 Oct 2025 19:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOE3SqS-nwwU; Mon, 13 Oct 2025 19:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD4741276
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD4741276;
	Mon, 13 Oct 2025 19:48:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55F3C294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 19:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BFEC41276
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 19:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KraejUJhYwK6 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 19:48:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16E3941269
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16E3941269
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16E3941269
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 19:48:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9064BB0055E;
 Mon, 13 Oct 2025 21:48:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Oct 2025 21:48:12 +0200
MIME-Version: 1.0
Date: Mon, 13 Oct 2025 21:48:12 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20251012213141.3512892-2-bernd@kuhls.net>
References: <20251012213141.3512892-1-bernd@kuhls.net>
 <20251012213141.3512892-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0b0b35f53322a4b66ccb201b18ca1e95@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760384895;
 bh=87MY18qXJL82LyrXmV2MLKuzSuPiVSYPfZwROxZ8EEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QDdmfFN7Y5sole/NZFtZBpJpU2dqQCEn+OGla5XnPmMwbERZfSGVW1t9rgRXhvrkJ
 OIMBxT6SdILKaAW1WMp1c9bsV9pf/SwAymVEEWfMJRNw3lky0tzBiCtBfvkp+ncf0X
 xvkt+2uYCnNWirn7+ewb+iiUgellpTKBGljzeJXyzBj6zyeI3X1eqW+8aZS9ExIhxx
 Vqi5DP/puvJAlJAY8AiKMEgw1wpPAcekJ7N9/EZLGnwfs0JBWgGgeeJYVxux93rx+W
 C4T8ps2iyQ/kFG5ktyDyS4y6U4mv+jOQbnoNKcUjd72JL4fzT60r6igeAwRv/6fgsr
 w63UYfVtnPUiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QDdmfFN7
Subject: Re: [Buildroot] [PATCH 2/3] package/libxml2: bump version to 2.15.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

THanks for the patch.

On 12/10/2025 23:31, Bernd Kuhls wrote:
> Removed all patches because they are included in this release, although
> with different commits than mentioned in our patch files:
> 
> 0001: 
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0
> 0002: 
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/f7ebc65f05bffded58d1e1b2138eb124c2e44f21
> 0003: 
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/c24909ba2601848825b49a60f988222da3019667
> 0004: 
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/c340e419505cf4bf1d9ed7019a87cc00ec200434
> 
> Updated license hash due to upstream commit:
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7
> 
> Removed python3 bindings due to their pending removal in 2.16:
> https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
> which prevents us from adding a dependency on host-doxygen due to
> upstream commit
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393ff3e6eef6dec2376317e2
> "Doxygen will also be required to build the Python bindings."
> 
> Removed lzma support due to upstream removal:
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf123eb7358690c214b0b
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...ix-integer-overflow-in-xmlBuildQName.patch |  59 ------
>  ...emory-safety-issues-in-xmlSchematron.patch | 186 ------------------
>  ...ull-pointer-dereference-leading-to-D.patch |  70 -------
>  ...uffer-overflows-of-interactive-shell.patch | 103 ----------
>  package/libxml2/libxml2.hash                  |   6 +-
>  package/libxml2/libxml2.mk                    |  39 +---
>  6 files changed, 6 insertions(+), 457 deletions(-)
>  delete mode 100644 
> package/libxml2/0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
>  delete mode 100644 
> package/libxml2/0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
>  delete mode 100644 
> package/libxml2/0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
>  delete mode 100644 
> package/libxml2/0004-fix-potential-buffer-overflows-of-interactive-shell.patch
[...]
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 36cdd5a63d..09c5fcc163 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -LIBXML2_VERSION_MAJOR = 2.13
> -LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).8
> +LIBXML2_VERSION_MAJOR = 2.15
> +LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).0

This new version introduces build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2097179479

For reference, the v2.13.0 build correctly:
https://gitlab.com/jolivain/buildroot/-/pipelines/2097205593

This is likely due to:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/f070acc56400410a3ad27f4df313526749364962

libxml2 enables by default --with-modules, which requires dlopen(), 
which
cannot build in static builds.

Maybe the same comment applies for pthread support.

Could you have a look please?

>  LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
>  LIBXML2_SITE = \
>  	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
> @@ -15,18 +15,6 @@ LIBXML2_LICENSE_FILES = Copyright
>  LIBXML2_CPE_ID_VENDOR = xmlsoft
>  LIBXML2_CONFIG_SCRIPTS = xml2-config
> 
> -#0001-tree-Fix-integer-overflow-in-xmlBuildQName.patch
> -LIBXML2_IGNORE_CVES += CVE-2025-6021
> -
> -#0002-schematron-Fix-memory-safety-issues-in-xmlSchematron.patch
> -LIBXML2_IGNORE_CVES += CVE-2025-49794 CVE-2025-49796
> -
> -#0003-Schematron-Fix-null-pointer-dereference-leading-to-D.patch
> -LIBXML2_IGNORE_CVES += CVE-2025-49795
> -
> -# 0004-fix-potential-buffer-overflows-of-interactive-shell.patch
> -LIBXML2_IGNORE_CVES += CVE-2025-6170
> -
>  # relocation truncated to fit: R_68K_GOT16O
>  ifeq ($(BR2_m68k_cf),y)
>  LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
> @@ -37,21 +25,7 @@ LIBXML2_CONF_OPTS = --with-http --with-gnu-ld 
> --without-debug
>  HOST_LIBXML2_DEPENDENCIES = host-pkgconf
>  LIBXML2_DEPENDENCIES = host-pkgconf
> 
> -HOST_LIBXML2_CONF_OPTS = --without-zlib --without-lzma
> -
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -LIBXML2_DEPENDENCIES += python3
> -LIBXML2_CONF_OPTS += --with-python
> -else
> -LIBXML2_CONF_OPTS += --without-python
> -endif
> -
> -ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
> -HOST_LIBXML2_DEPENDENCIES += host-python3
> -HOST_LIBXML2_CONF_OPTS += --with-python
> -else
> -HOST_LIBXML2_CONF_OPTS += --without-python
> -endif
> +HOST_LIBXML2_CONF_OPTS = --without-zlib
> 
>  ifeq ($(BR2_PACKAGE_ICU),y)
>  LIBXML2_DEPENDENCIES += icu
> @@ -67,13 +41,6 @@ else
>  LIBXML2_CONF_OPTS += --without-zlib
>  endif
> 
> -ifeq ($(BR2_PACKAGE_XZ),y)
> -LIBXML2_DEPENDENCIES += xz
> -LIBXML2_CONF_OPTS += --with-lzma
> -else
> -LIBXML2_CONF_OPTS += --without-lzma
> -endif
> -
>  LIBXML2_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> 
>  ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
