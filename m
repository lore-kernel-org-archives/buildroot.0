Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AC3EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 19:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22C640249;
	Mon, 26 Jun 2023 19:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22C640249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEoVq5FdlTnD; Mon, 26 Jun 2023 19:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1FB5401F9;
	Mon, 26 Jun 2023 19:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1FB5401F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B4731BF334
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 19:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1093260737
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 19:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1093260737
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h5qfUHLcd2yi for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 19:53:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B79EE60594
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B79EE60594
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 19:53:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4CB702003C3;
 Mon, 26 Jun 2023 21:53:04 +0200 (CEST)
Received: from [37.171.207.173:38586] via [37.171.207.173] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 26 Jun 2023 21:53:04 +0200
MIME-Version: 1.0
Date: Mon, 26 Jun 2023 21:53:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
In-Reply-To: <20230622160212.2063472-2-dannenberg@ti.com>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-2-dannenberg@ti.com>
User-Agent: Webmail Free/1.6.1
Message-ID: <26fedd9020b4ae77f8c62a6ed8a5d1ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687809185;
 bh=hSPnUVA9JjhPjM4NRHJ/rsFn2skJOLA/KcnFUDVFJ4U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VhhjJdLGqsgSn3rUvsBc8ClTgTA+rUCX3ZIgJWEoiVYcNO4WVKY4C/XMPNTe6BIi6
 0pGNoZkVoVwcWW+ZpHcNw0G8Cva0AA4FrDgMnUien6oSevdvIwauG5/dyRDjuaAYlu
 fWjDEDe8StSqbf6AS36QTlbXmln7xpJEfMXIs4OiR6CFpPA+qKqxFfdcdFhoW3qwvf
 Ab2VTJanAf9lo2zbLUAnpPQFks/kiaO7DfjRdX/mrP9KqZ1CD/OXYmRXa8OltAxbPc
 WN9un/r1ygDQng+/IR2g2VGc8AxkaswMO7MwjnHzwl0B+IYAlC8BcPDAQUgGbbVDks
 o0+CQAutIS2Kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VhhjJdLG
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
> 
> diff --git a/boot/ti-k3-r5-loader/Config.in 
> b/boot/ti-k3-r5-loader/Config.in
> index 10602c8df3..2419babe70 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -1,14 +1,73 @@
>  config BR2_TARGET_TI_K3_R5_LOADER
> -	bool "ti-k3-r5-loader"
> +	bool "TI K3 R5 Loader"
>  	depends on BR2_aarch64
>  	help
> -	  Separate U-Boot build for R5 cores on TI's k3 boards.
> +	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
>  	  Usually used to build tiboot3.bin with k3-image-gen.
> 
>  if BR2_TARGET_TI_K3_R5_LOADER
> 
>  choice
> -	prompt "Configuration"
> +	prompt "U-Boot Version"
> +	help
> +	  Select the specific U-Boot version you want to use to build the
> +	  initial SPL running on the R5 core. Note that for most use cases
> +	  you'd want to use the exact same configuration here as it is used
> +	  to build the main U-Boot package.

The command "utils/docker-run make check-package" reports warnings here:

     boot/ti-k3-r5-loader/Config.in:13: help text: <tab><2 spaces><62 
chars> (http://nightly.buildroot.org/#writing-rules-config-in)
     boot/ti-k3-r5-loader/Config.in:14: help text: <tab><2 spaces><62 
chars> (http://nightly.buildroot.org/#writing-rules-config-in)
     boot/ti-k3-r5-loader/Config.in:15: help text: <tab><2 spaces><62 
chars> (http://nightly.buildroot.org/#writing-rules-config-in)

To fix this issue, the help text should be reflowed as follow:

choice
	prompt "U-Boot Version"
	help
	  Select the specific U-Boot version you want to use to build
	  the initial SPL running on the R5 core. Note that for most
	  use cases you'd want to use the exact same configuration
	  here as it is used to build the main U-Boot package.

> +
> +config BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
> +	bool "2022.10"
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
> +	bool "Custom version"
> +	help
> +	  This option allows to use a specific official versions
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
> +	bool "Custom tarball"
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT
> +	bool "Custom Git repository"
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG
> +	bool "Custom Mercurial repository"
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
> +	bool "Custom Subversion repository"
> +
> +endchoice
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE
> +	string "U-Boot version"
> +	depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL_LOCATION
> +	string "URL of custom U-Boot tarball"
> +	depends on BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
> +
> +if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || 
> BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG || 
> BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_URL
> +	string "URL of custom repository"
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_VERSION
> +	string "Custom repository version"
> +	help
> +	  Revision to use in the typical format used by
> +	  Git/Mercurial/Subversion E.G. a sha id, a tag, branch, ..
> +
> +endif
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_VERSION
> +	string
> +	default "2022.10"	if BR2_TARGET_TI_K3_R5_LOADER_LATEST_VERSION
> +	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE \
> +		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION
> +	default "custom"	if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL
> +	default BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_REPO_VERSION \
> +		if BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_GIT || 
> BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_HG || 
> BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_SVN
> +choice
> +	prompt "U-Boot Configuration"
>  	default BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
> 
>  config BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG

[...]

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
