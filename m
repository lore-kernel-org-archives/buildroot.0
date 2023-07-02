Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7218EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 09:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1719140502;
	Sun,  2 Jul 2023 09:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1719140502
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXRbDvQySMkz; Sun,  2 Jul 2023 09:07:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A7FF405CA;
	Sun,  2 Jul 2023 09:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A7FF405CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDB6A1BF300
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 09:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B499D81EB6
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 09:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B499D81EB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_a08t0hRLvJ for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 09:07:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECAE381EB5
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECAE381EB5
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 09:07:19 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id DD573BDE4095;
 Sun,  2 Jul 2023 11:07:16 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 02 Jul 2023 09:07:16 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
In-Reply-To: <mailman.173.1688221173.139798.buildroot@buildroot.org>
References: <mailman.173.1688221173.139798.buildroot@buildroot.org>
Message-ID: <c623c8d67b9f9af6423b719d812c6e1f@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1688288836; bh=9haPa64IV/E6Xh4VEoCwAp+NoHw8sPpjR+6ms/gGPZo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=5b2oebx+yYPAGS/7oZnZQzApPO5dmqzHJVBItEDniabazBAN1AInQ2jAipHuSsrO5
 dRudprJz25vlBZVvkdgKekCYiNcp76hTMokzqFg3NBG0FgOSTB1FzfXVH/RN3xkmev
 EZob2dGRUIWqrxUWsnNH8BhdStq9wOsyj2S+tlrE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=5b2oebx+
Subject: Re: [Buildroot] [PATCH 1/3] package: add rockchip-rkbin package
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

some comments inline.

On 2023-06-30 23:26, Kilian Zinnecker wrote:
> 
> Adds a package to fetch Rockchip specifig ATF binary blobs, which
> are needed to build u-boot for the Rockchip RK3588 SoC.
> 
> Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
> ---
>  package/Config.in                        |  1 +
>  package/rockchip-rkbin/Config.in         | 19 +++++++++++++++++++
>  package/rockchip-rkbin/rockchip-rkbin.mk | 19 +++++++++++++++++++
>  3 files changed, 39 insertions(+)
>  create mode 100644 package/rockchip-rkbin/Config.in
>  create mode 100644 package/rockchip-rkbin/rockchip-rkbin.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index bff090a661..80221d0406 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -581,6 +581,7 @@ endmenu
>  	source "package/read-edid/Config.in"
>  	source "package/rng-tools/Config.in"
>  	source "package/rockchip-mali/Config.in"
> +	source "package/rockchip-rkbin/Config.in"
>  	source "package/rpi-userland/Config.in"
>  	source "package/rs485conf/Config.in"
>  	source "package/rtc-tools/Config.in"
> diff --git a/package/rockchip-rkbin/Config.in 
> b/package/rockchip-rkbin/Config.in
> new file mode 100644
> index 0000000000..a877d4f1cf
> --- /dev/null
> +++ b/package/rockchip-rkbin/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_ROCKCHIP_RKBIN
> +	bool "Rockchip RKBIN binary blobs"
> +	depends on BR2_arm || BR2_aarch64
> +	help
> +	  Those packages provide binary blobs for the Rockchip RK
> +          SoCs.
> +
> +if BR2_PACKAGE_ROCKCHIP_RKBIN
> +choice
> +	prompt "Rockchip RK platform"
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM_RK3588
> +	bool "rk3588"
> +endchoice
> +
> +config BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM
> +	string
> +	default "RK3588" if BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM_RK3588
> +endif

Both BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM* variables are never used, you 
might remove them.

If you intend to make the package reusable, just use the <choice> 
directive and add a section in rockchip-rkbin.mk to define the firmware 
file names:

ifeq ($(BR2_PACKAGE_ROCKCHIP_RKBIN_PLATFORM_RK3588),y)
ROCKCHIP_RKBIN_DDRFW = rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin
ROCKCHIP_RKBIN_EL3FW = rk35/rk3588_bl31_v1.38.elf
endif

to be used in INSTALL_STAGING_CMDS.

> diff --git a/package/rockchip-rkbin/rockchip-rkbin.mk 
> b/package/rockchip-rkbin/rockchip-rkbin.mk
> new file mode 100644
> index 0000000000..51421769b4
> --- /dev/null
> +++ b/package/rockchip-rkbin/rockchip-rkbin.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# rockchip-rkbin
> +#
> +################################################################################
> +
> +
> +ROCKCHIP_RKBIN_VERSION = d6ccfe401ca84a98ca3b85c12b9554a1a43a166c
> +ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
> +ROCKCHIP_RKBIN_SITE_METHOD = git
> +
> +ROCKCHIP_RKBIN_INSTALL_STAGING = YES

Technically not necessary, but to document that this package is not 
intended for the target, you might add:

ROCKCHIP_RKBIN_INSTALL_TARGET = NO

> +
> +define ROCKCHIP_RKBIN_INSTALL_STAGING_CMDS
> +	cp $(@D)/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.11.bin 
> $(BINARIES_DIR)/
> +	cp $(@D)/bin/rk35/rk3588_bl31_v1.38.elf $(BINARIES_DIR)/
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
