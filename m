Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDC8C77B60
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 10:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD2F840AB;
	Fri, 28 Apr 2023 10:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD2F840AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IcUuKdhjtah7; Fri, 28 Apr 2023 10:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 272AB84068;
	Fri, 28 Apr 2023 10:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272AB84068
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 04BA11BF28A
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 10:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFE1042132
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 10:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFE1042132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcTjRXiWl-uG for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 10:45:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095BA402F7
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 095BA402F7
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 10:45:44 +0000 (UTC)
Received: from [172.25.4.220] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id sLbhp40lKQMrZsLbhpaRTT; Fri, 28 Apr 2023 12:45:41 +0200
Message-ID: <34d2a793-2250-9812-b8a6-a141204bd9e2@benettiengineering.com>
Date: Fri, 28 Apr 2023 12:45:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Maksim Kiselev <bigunclemax@gmail.com>, buildroot@buildroot.org
References: <20230427202802.69965-1-bigunclemax@gmail.com>
Content-Language: en-US, it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230427202802.69965-1-bigunclemax@gmail.com>
X-CMAE-Envelope: MS4xfNpOezwocDuXLt6Kct5bq8F5JR0P7t28WB/bW3/JYDtcN+gWMSyMt2aZ3l63fDcR+Dg5BuVat5DG1rYdiGknz2aPk7KVZ/jsM/aynKhZzygwNfn53XSl
 40OVypxk/jv4i2x+M1zbBm/VifbAhmiQ4/t/XaTdyXUMoilZ/R4DWLOoDfKKFftRXid3xLaf5fL5oiD49OA3jaBybhJO3oY3+WuoNUyOAFGo/2f/H336vSyf
 bV/9W1TjHIz4+pTqrjZ+Tg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1682678741; bh=RIanOqnlsfyBTDpQeRDz2gv3DbRox6AEmrTulJhUZB4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ZREupWRvZkjCnXmxFftIh9Vdc4oWauSSzEdkuGYhBD0X8QCySO6PpSvtGeV+qmEPV
 NrcQypQ+WABhsLj0a3K2dM22PNhsnNa1Urid58BouyVkjoJQlq6wdqnnmsakJnOe0L
 os5hs8V1J81QURgNihtygX1Ajj5NOsUOjkNyYHZ+MYvudV2auFzFLPbvIjVYg517L6
 DUvGmrOU8yGzYIGFf1+Xd2bN6cG0D5RvpvXq4pL1gIubnEcvll/xPqtwPYDu3A+bYy
 3Es9SLGJze9H5UkDa8q6Qhp7wibBIlEhZ8quE/2sjQdBE8o3PD3liytkK/dDQSjZoY
 xsmvJnGn4cYOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ZREupWRv
Subject: Re: [Buildroot] [PATCH] package/sunxi-tools: fix build dependencies
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maksim,

On 27/04/23 22:28, Maksim Kiselev wrote:
> This patch fixes the dependency on libfdt for host-sunxi-tools.
> Also it fixes the dependency on zlib for sunxi-tools.
> 
> Fix the following host build failure raised since commit
> 2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb
> 
> fit_image.c:19:10: fatal error: libfdt.h: No such file or directory
>     19 | #include <libfdt.h>
>        |          ^~~~~~~~~~
> compilation terminated.
> 
> Fixes: http://autobuild.buildroot.net/results/2677c69ac34642a7a501230e1dd22b193db0899d/
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

thank you for the patch, it looks good:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
CEO/CTO@Benetti Engineering sas

> ---
>   package/sunxi-tools/Config.in      | 1 +
>   package/sunxi-tools/Config.in.host | 1 +
>   package/sunxi-tools/sunxi-tools.mk | 7 ++++---
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
> index e748637c72..14f7da5bf2 100644
> --- a/package/sunxi-tools/Config.in
> +++ b/package/sunxi-tools/Config.in
> @@ -27,6 +27,7 @@ config BR2_PACKAGE_SUNXI_TOOLS_FEL
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
>   	select BR2_PACKAGE_DTC
>   	select BR2_PACKAGE_LIBUSB
> +	select BR2_PACKAGE_ZLIB
>   	help
>   	  The sunxi-fel command can interact with a sunxi device in
>   	  fel mode. This allows do download code to memory and execute
> diff --git a/package/sunxi-tools/Config.in.host b/package/sunxi-tools/Config.in.host
> index 51f13cf623..f7c60b37a9 100644
> --- a/package/sunxi-tools/Config.in.host
> +++ b/package/sunxi-tools/Config.in.host
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_SUNXI_TOOLS
>   	bool "host sunxi-tools"
>   	depends on BR2_arm
>   	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-libusb
> +	select BR2_PACKAGE_HOST_DTC
>   	help
>   	  Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i)
>   	  based devices. This includes fex2bin which can be used to
> diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
> index a9569f2910..97863efc13 100644
> --- a/package/sunxi-tools/sunxi-tools.mk
> +++ b/package/sunxi-tools/sunxi-tools.mk
> @@ -8,7 +8,7 @@ SUNXI_TOOLS_VERSION = 1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292
>   SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,v$(SUNXI_TOOLS_VERSION))
>   SUNXI_TOOLS_LICENSE = GPL-2.0+
>   SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
> -HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb host-pkgconf
> +HOST_SUNXI_TOOLS_DEPENDENCIES = host-dtc host-libzlib host-libusb host-pkgconf
>   FEX2BIN = $(HOST_DIR)/bin/fex2bin
>   
>   SUNXI_TOOLS_TARGETS_$(BR2_PACKAGE_SUNXI_TOOLS_FEXC) += sunxi-fexc
> @@ -26,13 +26,14 @@ SUNXI_TOOLS_FEXC_LINKS += fex2bin bin2fex
>   endif
>   
>   ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEL),y)
> -SUNXI_TOOLS_DEPENDENCIES += dtc libusb host-pkgconf
> +SUNXI_TOOLS_DEPENDENCIES += dtc libusb zlib host-pkgconf
>   endif
>   
>   define HOST_SUNXI_TOOLS_BUILD_CMDS
>   	$(HOST_MAKE_ENV) $(MAKE) CROSS_COMPILE="" CC="$(HOSTCC)" \
>   		PREFIX=$(HOST_DIR) EXTRA_CFLAGS="$(HOST_CFLAGS)" \
> -		LDFLAGS="$(HOST_LDFLAGS)" -C $(@D) tools misc
> +		LDFLAGS="$(HOST_LDFLAGS) -I$(HOST_DIR)/include/libfdt" \
> +		-C $(@D) tools misc
>   endef
>   
>   define HOST_SUNXI_TOOLS_INSTALL_CMDS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
