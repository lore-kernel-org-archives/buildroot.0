Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F748C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 09:26:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B61F460FED
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 09:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B61F460FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62D8140114;
	Thu,  4 Nov 2021 09:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zzJI0pQzGdp; Thu,  4 Nov 2021 09:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76079400D4;
	Thu,  4 Nov 2021 09:26:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 133381BF2FA
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 09:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 021548175B
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 09:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gl6H4jcDn5zt for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 09:26:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BFB23814B5
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 09:26:09 +0000 (UTC)
Received: from [77.244.183.192] (port=62510 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1miZ0Z-000kdP-7d; Thu, 04 Nov 2021 10:26:07 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
 <20211104063807.139604-2-giulio.benetti@benettiengineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <fcc23c74-070b-12cc-3d77-48bc2fcf5eb4@lucaceresoli.net>
Date: Thu, 4 Nov 2021 10:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104063807.139604-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/2] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

thanks for these and the other olimex patches you are sending. Thomas
applied them faster than I could review and test them... let me try this
time :)

On 04/11/21 07:38, Giulio Benetti wrote:
> From: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> This package provides Mali libraries for Sunxi Mali Utgard GPUs. The
> trailing -mainline is historical and was used at a time when there was
> two packages providing these libraries. The "non-upstream" package has
> been removed some time ago so before adding new packages bringing
> support for other ARM Mali GPU versions or implementations, rename
> sunxi-mali-mainline into sunxi-mali-utgard.
> 
> Add a legacy entry.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> [Giulio: rebase on master. Rename SUNXI_MALI_MAINLINE_REV to
> SUNXI_MALI_UTGARD_REV in sunxi-mali-mailine-driver.mk and
> BR2_PACKAGE_SUNXI_MALI_MAINLINE to BR2_PACKAGE_SUNXI_UTGARD in
> sunxi-mali-mainline-driver/Config.in to respect bisectability]

[...]

> diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
> index ed279326bc..d0ebeb53a3 100644
> --- a/configs/olimex_a20_olinuxino_lime2_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime2_defconfig
> @@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  
>  # sunxi packages
>  BR2_PACKAGE_SUNXI_TOOLS=y
> -BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
> +BR2_PACKAGE_SUNXI_MALI_UTGARD=y
>  BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
>  
>  # Filesystem
> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
> index cd88a2d19a..000071b11c 100644
> --- a/configs/olimex_a20_olinuxino_lime_defconfig
> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
> @@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
>  
>  # sunxi packages
>  BR2_PACKAGE_SUNXI_TOOLS=y
> -BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
> +BR2_PACKAGE_SUNXI_MALI_UTGARD=y
>  BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
>  
>  # Filesystem

Both lime defconfigs still have this line:

  # glibc is needed for sunxi-mali-mainline-package.

which sould be updated.

While there, please change replace "-package" -> " package".

The rest looks good.
-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
