Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D72C6FA82
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 17:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61FEF82735;
	Tue, 20 Sep 2022 17:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61FEF82735
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltz3LMOjG8xW; Tue, 20 Sep 2022 17:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8322881985;
	Tue, 20 Sep 2022 17:10:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8322881985
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97F7F1BF2CE
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 17:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C4B681985
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 17:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C4B681985
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8QWKtlb4Q0je for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 17:10:03 +0000 (UTC)
X-Greylist: delayed 00:07:52 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E406781980
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.181])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E406781980
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 17:10:02 +0000 (UTC)
Received: from 1oagdL-0007BP-V9 by out3c.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1oagdM-0007DG-Ug; Tue, 20 Sep 2022 10:02:08 -0700
Received: by emcmailer; Tue, 20 Sep 2022 10:02:08 -0700
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3c.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1oagdL-0007BP-V9; Tue, 20 Sep 2022 10:02:07 -0700
Received: from tsdebian (unknown [75.164.57.7])
 by mail.embeddedts.com (Postfix) with ESMTPSA id 19913B09A;
 Tue, 20 Sep 2022 10:02:07 -0700 (MST)
Message-ID: <1663693308.2395.5.camel@embeddedTS.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 buildroot@buildroot.org
Date: Tue, 20 Sep 2022 10:01:48 -0700
In-Reply-To: <20220920133224.3290270-1-giulio.benetti@benettiengineering.com>
References: <20220920133224.3290270-1-giulio.benetti@benettiengineering.com>
Organization: embeddedTS
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=embeddedTS.com; s=mailanyone20220121;
 h=Mime-Version:References:In-Reply-To:Date:To:From:Message-ID;
 bh=Het7FNJ/yu958+PrUzFN9AkgG7BFOMQR2LRoq7EsVPg=;
 b=SrcPmqjhnTRmq9SsS71a4RPdeKFDBoRF4lnvRpBuJ13aE58Aq67WF2rZRujyuoHfffF8evL0XdOFWpYyqXNi9dAg9rSGc+cDvB/htXM6kHuAjoc8kcdiB2XR8Rb535wVl7IVKtFQSKlPAAnTbEXxgBTFxsb4thTGnxh6O7BGrO4KmipBvvT1o8FH01BeU89z77cpUh3jJMUT+4McbxcJD93cAiuoRFLAV3cmAZwwP2036hb5EZglPqMl/ctRtpZMl2U5JPxy+k4OzyPLrg4DyGgXNYyMS0phreHCZJm8mewmc8mltn6KCCqdM9gGfLbe4xUwuImNrXn2dZzTUTsDzg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=embeddedTS.com header.i=@embeddedTS.com
 header.a=rsa-sha256 header.s=mailanyone20220121 header.b=SrcPmqjh
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure due
 to missing Linux options
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 2022-09-20 at 15:32 +0200, Giulio Benetti wrote:
> Enable Linux options depending on the bus has been chosen, so:
> 1) enable by default common Linux options:
> CONFIG_NET
> CONFIG_WIRELESS
> CONFIG_CFG80211
> CONFIG_CRC_ITU_T
> CONFIG_CRC7
> 2) enable for SDIO bus:
> CONFIG_MMC
> 3) enable for SPI bus:
> CONFIG_SPI
> 
> Fixes:
> http://autobuild.buildroot.net/results/d8c4f0f959dd2ec110db8a75980f13172c3c116c/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/wilc-driver/wilc-driver.mk | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
> index a89af30e29..a7a902b6db 100644
> --- a/package/wilc-driver/wilc-driver.mk
> +++ b/package/wilc-driver/wilc-driver.mk
> @@ -13,11 +13,17 @@ WILC_DRIVER_LICENSE_FILES = LICENSE
>  ifeq ($(BR2_PACKAGE_WILC_DRIVER_SPI),y)
>  WILC_DRIVER_MODULE_MAKE_OPTS += \
>  	CONFIG_WILC_SPI=m
> +define WILC_DRIVER_SPI_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_SPI)
> +endef
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO),y)
>  WILC_DRIVER_MODULE_MAKE_OPTS += \
>  	CONFIG_WILC_SDIO=m
> +define WILC_DRIVER_SDIO_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
> +endef
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO_OOB),y)
> @@ -25,5 +31,15 @@ WILC_DRIVER_MODULE_MAKE_OPTS += \
>  	CONFIG_WILC_HW_OOB_INTR=y
>  endif
>  
> +define WILC_DRIVER_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC_ITU_T)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC7)
> +	$(WILC_DRIVER_SPI_LINUX_CONFIG_FIXUPS)
> +	$(WILC_DRIVER_SDIO_LINUX_CONFIG_FIXUPS)
> +endef
> +
>  $(eval $(kernel-module))
>  $(eval $(generic-package))

Reviewed-by: Kris Bahnsen <Kris@embeddedTS.com>


Thanks for that! I was not readily aware of that syntax for kernel config fixups.
I've also added auto-builds to my filter exception rules so I should be able
to more readily look those over in the future.

-Kris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
