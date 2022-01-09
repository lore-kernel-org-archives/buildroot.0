Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6F8C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39FCC404D4;
	Sun,  9 Jan 2022 21:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v0ALu_gthBcO; Sun,  9 Jan 2022 21:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18E744058E;
	Sun,  9 Jan 2022 21:02:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 173731BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05E62819E6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:02:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKPSbXKaZVGi for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:02:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A09CE8198D
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 21:02:41 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id l10so23065332wrh.7
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 13:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JSVsRkVmoTEbEqjrL80biA9znqxGpNQGqyFrYxraic4=;
 b=c3WU8bpKO8gVnWaxU2ZvUCFNQffWSgulNyII1J0m667TxFmAkkJGGwuBUBpxuhIp1/
 c968yll+pLAgM6HwePYUdntlTYAGLmG69gGKd0esdP2yARj3wpNYlZ9AvFkZ5rhswLcA
 4oe1kVTsn+hWJvUiY/R01x8V7dVJOi5fBpHHYVD103sH86zhW4R2EknCVB3MEnDLxpsY
 aPg+bkOrP6XGnfAMHtCm5np2hlHlWO5lRHyyiB7yaBk0BdkfOsLtfxoFtL6fNI84zAoe
 zAOSj7hBGl3wHBGxKrHoE7bGpXZcsAg5+2OcE47oldqrEBbCLZTRN1kpCQJD/tlVsVhl
 fN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JSVsRkVmoTEbEqjrL80biA9znqxGpNQGqyFrYxraic4=;
 b=8FV4J8/tQ9W8fuumWz+XUJnXxa1pLHlRlzx37p8cx6aMMfHlyeOaEFiuLibjkiwQqi
 Zy32XeyZLK4VRwb+tP7QQOASXknwLhUwrUtdR0uFT6C0JCN9aRXr7qc8A9p9eIq2LEnv
 T5i5yRsOSbqL7Ri5SIZyb77NubthOAoGRwmBAJrNq0I9c5lMDnhvDjhGOq2xfg1ADGN7
 Oo3izEp69P99GFuYFj6HDEp4Xge+CZGPwuxLWr5nde0NZeaQyjze1aLexLMZal5BjAHo
 TqpQwVB3WrYaYUXp6OJ8hcZWBbuCAI/QyAlwE+USTrgX0Pc/3ozPRQbUFQm8zpUZmpGn
 iE5g==
X-Gm-Message-State: AOAM533jXnzNDZgDLHajhvIz2u0wY/nYQWi/a1XmDsBgycgXMsClPUDn
 82MJM0736zdYHWFGXU/2tMghBA==
X-Google-Smtp-Source: ABdhPJzvisxlypasLBdyDu3RXD0jrLHW0WOdS46C+0UHEB167FNSKWfpt3PTnLQqWGKODmMTkksoTg==
X-Received: by 2002:a5d:644a:: with SMTP id d10mr5732646wrw.355.1641762159977; 
 Sun, 09 Jan 2022 13:02:39 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id d5sm4757681wms.28.2022.01.09.13.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 13:02:39 -0800 (PST)
Message-ID: <249a1325-0fe2-0691-b599-950d839665d4@mind.be>
Date: Sun, 9 Jan 2022 22:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-8-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-8-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 07/12] package/vulkan-tools: new package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/01/2021 23:28, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Rest of the series is Changes Requested because it all depends on vulkan-loader.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    - fix license SPDX (Yann E. MORIN)
>    - disable ICD (as it is only a mock ICD for testing purpouse)
> ---
>   package/Config.in                      |  1 +
>   package/vulkan-tools/Config.in         | 17 +++++++++++++++++
>   package/vulkan-tools/vulkan-tools.hash |  3 +++
>   package/vulkan-tools/vulkan-tools.mk   | 25 +++++++++++++++++++++++++
>   4 files changed, 46 insertions(+)
>   create mode 100644 package/vulkan-tools/Config.in
>   create mode 100644 package/vulkan-tools/vulkan-tools.hash
>   create mode 100644 package/vulkan-tools/vulkan-tools.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 86676b57ef..b156d8de1a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -340,6 +340,7 @@ comment "Graphic libraries"
>   	source "package/tk/Config.in"
>   	source "package/vulkan-headers/Config.in"
>   	source "package/vulkan-loader/Config.in"
> +	source "package/vulkan-tools/Config.in"
>   
>   comment "Other GUIs"
>   	source "package/qt5/Config.in"
> diff --git a/package/vulkan-tools/Config.in b/package/vulkan-tools/Config.in
> new file mode 100644
> index 0000000000..54fa539dab
> --- /dev/null
> +++ b/package/vulkan-tools/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_VULKAN_TOOLS
> +	bool "vulkan-tools"
> +	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
> +	depends on !BR2_STATIC_LIBS # vullan-loader
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
> +	select BR2_PACKAGE_VULKAN_HEADERS
> +	select BR2_PACKAGE_VULKAN_LOADER
> +
> +	help
> +	  The Khronos official Vulkan Tools and Utilities.
> +
> +	  https://github.com/KhronosGroup/Vulkan-Tools
> +
> +comment "vulkan-tools needs a toolchain w/ C++, dynamic library, threads, gcc >= 4.9"
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/vulkan-tools/vulkan-tools.hash b/package/vulkan-tools/vulkan-tools.hash
> new file mode 100644
> index 0000000000..a4cf97ab34
> --- /dev/null
> +++ b/package/vulkan-tools/vulkan-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  98a3a00471da65df833b4ffeb1ab29ec1d169d5feab54270cf4cd8f50f82e682  vulkan-tools-1.2.162.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
> diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
> new file mode 100644
> index 0000000000..129efddf3b
> --- /dev/null
> +++ b/package/vulkan-tools/vulkan-tools.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# vulkan-tools
> +#
> +################################################################################
> +
> +VULKAN_TOOLS_VERSION = 1.2.162
> +VULKAN_TOOLS_SITE = $(call github,KhronosGroup,Vulkan-Tools,v$(VULKAN_TOOLS_VERSION))
> +VULKAN_TOOLS_LICENSE = Apache-2.0
> +VULKAN_TOOLS_LICENSE_FILES = LICENSE.txt
> +
> +VULKAN_TOOLS_DEPENDENCIES = vulkan-headers vulkan-loader
> +
> +VULKAN_TOOLS_CONF_OPTS += \
> +	-DBUILD_CUBE=OFF \
> +	-DBUILD_VULKANINFO=ON \
> +	-DBUILD_ICD=OFF \
> +	-DINSTALL_ICD=OFF \
> +	-DBUILD_WSI_XCB_SUPPORT=OFF \
> +	-DBUILD_WSI_XLIB_SUPPORT=OFF \
> +	-DBUILD_WSI_WAYLAND_SUPPORT=OFF \
> +	-DBUILD_WSI_DIRECTFB_SUPPORT=OFF \
> +	-DUSE_CCACHE=OFF
> +
> +$(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
