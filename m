Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B155C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DC482410;
	Sun,  9 Jan 2022 20:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VUxNraGtdzQK; Sun,  9 Jan 2022 20:30:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E413823CB;
	Sun,  9 Jan 2022 20:30:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C1A161BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF8D281DCB
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AoiTQ6sIYP49 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:30:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9991B81D7C
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 20:30:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t28so16226109wrb.4
 for <buildroot@busybox.net>; Sun, 09 Jan 2022 12:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YKpVkEYjA0XdT11dO/a+ZFmmrVGPGeAyNZwc1IndGUQ=;
 b=EbER0eabp07RYoFy3MjceslyN0ZEwbxE+HZt03WWfu9C+EI0FmHgHa5d6p7psT8bzk
 vcrRNJwidwrqOySYpf+lsKW/gzyLrwg8YLTsGpjYndO3bBkPdEZO2dw3FjZtICmDUdjX
 e9tlJNBgePyaVK2SH3+Q6Bp4GuKoohcmNt2dx7s7lmWP4oAs3oF92avcowCU2JBkupnZ
 bVqGe9hXLW802VKvLBcrbjdVem+mWB265OCtYL4UMdEYIjHGivjOOc1Sk9DiDHj9ur0f
 wgsk4UOFxni+IFzgSYY1cf6PlhObYJKQGENRAwpAf0fzhJFSdim3u9+v3yT4GNN0+WO3
 vVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YKpVkEYjA0XdT11dO/a+ZFmmrVGPGeAyNZwc1IndGUQ=;
 b=lqzPqi5BKwpv+ScCPsrZk6BcU5FH3K/S65jvHJGzgmVngSYaJWusp4EuPmLpbPzFVw
 av7vHlfb1yFhXUgx363PSFxLkhgE1wsSibmXZO7+9vRrFMktRBngbMJpPlYrAlosZ7nH
 nf+hwtDQQZdBp1zhHVRW+UPd0wQf4SA81QjJtwQOyitHLov6tQpelP3leP9ltH4bz/MO
 wGUvTmoFs9Ls7JdHsJWYBaB4ckAL0hIIga8g+QICwAAv7fOnj9ihA7dW++bswzhAMJ6F
 58OwZouECSmJ29JZq8dWtO60q5kA0LhrC8TtWq+HeUBGaNZGqTrQgLkAg3IIH3qeEREm
 TcIQ==
X-Gm-Message-State: AOAM530yNtU92I2gR31YYZlGHGV9kLmMS8VZ7N8wuLTpnt9D9iwvFlUj
 Z79HQfOVlLGGkRWaSQ3eKNOsEQ==
X-Google-Smtp-Source: ABdhPJz2ni4rTB0XEgjzNcpwOY/2Hjtap4Hh/wbjBwKOzAFfX6rANOWyEU/QYMduypE9Livq18bTZw==
X-Received: by 2002:adf:d4cd:: with SMTP id w13mr4066415wrk.506.1641760236629; 
 Sun, 09 Jan 2022 12:30:36 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id u10sm4939032wrt.11.2022.01.09.12.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 12:30:36 -0800 (PST)
Message-ID: <eaffa73b-9c8b-388b-2c64-726c994f4dca@mind.be>
Date: Sun, 9 Jan 2022 21:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@busybox.net
References: <20210110222833.26301-1-ps.report@gmx.net>
 <20210110222833.26301-6-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210110222833.26301-6-ps.report@gmx.net>
Subject: Re: [Buildroot] [RFC v2 05/12] package/vulkan-headers: new package
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
> ---
> Changes v1 -> v2:
>    - fix license SPDX (Yann E. MORIN)
> ---
>   package/Config.in                          |  1 +
>   package/vulkan-headers/Config.in           |  7 +++++++
>   package/vulkan-headers/vulkan-headers.hash |  3 +++
>   package/vulkan-headers/vulkan-headers.mk   | 13 +++++++++++++
>   4 files changed, 24 insertions(+)
>   create mode 100644 package/vulkan-headers/Config.in
>   create mode 100644 package/vulkan-headers/vulkan-headers.hash
>   create mode 100644 package/vulkan-headers/vulkan-headers.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9ed02ec890..9a91e6324c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -338,6 +338,7 @@ comment "Graphic libraries"
>   	source "package/sdl2_net/Config.in"
>   	source "package/sdl2_ttf/Config.in"
>   	source "package/tk/Config.in"
> +	source "package/vulkan-headers/Config.in"
>   
>   comment "Other GUIs"
>   	source "package/qt5/Config.in"
> diff --git a/package/vulkan-headers/Config.in b/package/vulkan-headers/Config.in
> new file mode 100644
> index 0000000000..c0fc8f20b0
> --- /dev/null
> +++ b/package/vulkan-headers/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_VULKAN_HEADERS
> +	bool "vulkan-headers"
> +	help
> +	  The Khronos official Vulkan header files and API
> +	  registry.
> +
> +	  https://github.com/KhronosGroup/Vulkan-Headers
> diff --git a/package/vulkan-headers/vulkan-headers.hash b/package/vulkan-headers/vulkan-headers.hash
> new file mode 100644
> index 0000000000..678a38e0d4
> --- /dev/null
> +++ b/package/vulkan-headers/vulkan-headers.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  3f9435a93ba13d94d0c3265a47e0436579e46bb9ca085e9b16a753458e4d79d2  vulkan-headers-1.2.165.tar.gz
> +sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
> diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
> new file mode 100644
> index 0000000000..48d390a581
> --- /dev/null
> +++ b/package/vulkan-headers/vulkan-headers.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# vulkan-headers
> +#
> +################################################################################
> +
> +VULKAN_HEADERS_VERSION = 1.2.165

  There's a 1.2.203 now, so I bumped to that version and applied to master, thanks.

  Regards,
  Arnout

> +VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
> +VULKAN_HEADERS_LICENSE = Apache-2.0
> +VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
> +VULKAN_HEADERS_INSTALL_STAGING = YES
> +
> +$(eval $(cmake-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
