Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9827EEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 19:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B87040673;
	Mon, 26 Jun 2023 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B87040673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Y7HDqp7a2i6; Mon, 26 Jun 2023 19:44:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC6004086C;
	Mon, 26 Jun 2023 19:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC6004086C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 685BB1BF334
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 19:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4178F60B8B
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 19:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4178F60B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PL4XFSYicT64 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 19:44:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0EEF60B4C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C0EEF60B4C
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 19:44:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 19DFB6013F;
 Mon, 26 Jun 2023 21:44:03 +0200 (CEST)
Received: from [37.171.207.173:38651] via [37.171.207.173] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 Jun 2023 21:44:03 +0200
MIME-Version: 1.0
Date: Mon, 26 Jun 2023 21:44:03 +0200
From: Julien Olivain <ju.o@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
In-Reply-To: <20230622160212.2063472-2-dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-2-dannenberg@ti.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <e8896cc7ae65e8872a679415d020489d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687808645;
 bh=wFUUKGu8aGtXjm1i30x+raKtnMnAFPL5g/4KZUP+jVQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L8cq/z0G4mKWKWSwncAlEpX0Jpl3/BaJwBYqWz3WOgz4ogODafJPdD++lgYsC4OFo
 vsGe5YsC8WKxAnjHjpYoxVYUKXd5grrWXIuK8R+0XhLAcIAZjRFcGNi1y+XZKhCjJ4
 hTTbu3WNhaJsvKX/aDG8ftM3GFVepu1egsLPSLoVssHgf116gKJZRZw4aIsDnAyVWf
 jeevzqj5fKmqZLd2kXSepMeRILO1dTsNTmolnj2vhMGdI6Hjy4OIL60y/IzroFp/j1
 wcCChPInlbrlgtgaT6sG3nEimRT3acb5bj6vFNqNAT5+pF/P8V3QQpMxCgMIg1hMNA
 Wzy4dXbYpz7xA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L8cq/z0G
Subject: Re: [Buildroot] [PATCH v9 01/11] boot/ti-k3-r5-loader: allow for
 full build source customization
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
Cc: Andreas Dannenberg <dannenberg@ti.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andreas,

On 22/06/2023 18:02, Andreas Dannenberg via buildroot wrote:
> The TI K3 R5 loader package essentially is a wrapper to build a special
> version of U-boot SPL used as part of a multi-stage boot flow on TI K3
> devices, and as such needs full flexibility as to specifying the U-Boot
> sources used for the build. To accomodate this, add the same options as
> already available in the regular U-Boot package. For most use cases, 
> the
> same source settings (repo URL, versions, etc.) should be used for both
> ti-k3-r5-loader and uboot packages.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  boot/ti-k3-r5-loader/Config.in          | 65 +++++++++++++++++++++++--
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 32 +++++++++++-
>  2 files changed, 93 insertions(+), 4 deletions(-)

[...]

> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk 
> b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index afa309aa98..341888623e 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -2,11 +2,41 @@
>  #
>  # ti-k3-r5-loader
>  #

Running the command "utils/docker-run make check-package" reports
warnings here:

     boot/ti-k3-r5-loader/ti-k3-r5-loader.mk:5: should be 80 hashes 
(http://nightly.buildroot.org/#writing-rules-mk)
     boot/ti-k3-r5-loader/ti-k3-r5-loader.mk:6: should be a blank line 
(http://nightly.buildroot.org/#writing-rules-mk)

To fix this warning, you should keep the first 6 original lines 
unchanged
and move this comment just after.

> +# The ti-k3-r5 loader package should really be built from the same 
> U-Boot
> +# sources as the uboot package itself, so for most users so all 
> LOADER_SITE /
> +# LOADER_SOURCE type definitions should be set the same for both 
> packages.
> +# However it still makes sense to keep the ti-k3-r5-loader package 
> somewhat
> +# separated and independent from the uboot package to allow for 
> special use
> +# cases such as Falcon boot (which would skip the uboot package 
> completely).
> +#
>  
> ################################################################################
> 
> -TI_K3_R5_LOADER_VERSION = 2022.10
> +TI_K3_R5_LOADER_VERSION = $(call 
> qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_VERSION))
> +
> +ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL),y)
> +# Handle custom U-Boot tarballs as specified by the configuration
> +TI_K3_R5_LOADER_TARBALL = $(call 
> qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION))
> +TI_K3_R5_LOADER_SITE = $(patsubst %/,%,$(dir 
> $(TI_K3_R5_LOADER_TARBALL)))
> +TI_K3_R5_LOADER_SOURCE = $(notdir $(TI_K3_R5_LOADER_TARBALL))
> +else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT),y)
> +TI_K3_R5_LOADER_SITE = $(call 
> qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
> +TI_K3_R5_LOADER_SITE_METHOD = git
> +else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG),y)
> +TI_K3_R5_LOADER_SITE = $(call 
> qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
> +TI_K3_R5_LOADER_SITE_METHOD = hg
> +else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN),y)
> +TI_K3_R5_LOADER_SITE = $(call 
> qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL))
> +TI_K3_R5_LOADER_SITE_METHOD = svn
> +else
> +# Handle stable official U-Boot versions
>  TI_K3_R5_LOADER_SITE = https://ftp.denx.de/pub/u-boot
>  TI_K3_R5_LOADER_SOURCE = u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
> +endif
> +
> +ifeq 
> ($(BR2_TARGET_TI_K3_R5_LOADER)$(BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION),y)
> +BR_NO_CHECK_HASH_FOR += $(TI_K3_R5_LOADER_SOURCE)
> +endif
> +
>  TI_K3_R5_LOADER_LICENSE = GPL-2.0+
>  TI_K3_R5_LOADER_LICENSE_FILES = Licenses/gpl-2.0.txt
>  TI_K3_R5_LOADER_CPE_ID_VENDOR = denx

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
