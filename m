Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16107C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CD9A60A99;
	Mon, 15 Aug 2022 19:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CD9A60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KaLDr5WjsqB; Mon, 15 Aug 2022 19:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A70E760A70;
	Mon, 15 Aug 2022 19:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70E760A70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 910CF1BF279
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CE7281362
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE7281362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6KyzlpdLYoFy for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:02:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6751B81347
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6751B81347
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 19:02:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A967D60128;
 Mon, 15 Aug 2022 21:02:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 21:02:22 +0200
Date: Mon, 15 Aug 2022 21:02:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220815190222.GH2854108@scaer>
References: <20220815165632.1278597-1-francois.perrad@gadz.org>
 <20220815165632.1278597-4-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815165632.1278597-4-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660590144;
 bh=79/t3ERXcTZXMCKAWayX8m9M8NAKPsK0AM+nMkgZR0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X/w8yxu+HDmDqKARrPQfgsjdKjH5GuCNPQKvDyq8dSxX5X3wZprh/2x1P5AHd1OOZ
 DyCLbYKCIB2kvrAkknkjb4L/5Y3vKCZtItcOv7yrDOVAIXklKyjuvoBoDdognAFVNc
 7GAsLMW4tzF206Fg4pjx2OTvVu13OkJfquptZcDQieAq+5evWRiRCC3oFgPjgx3/rv
 W/CTaFBQIcJCyX4UJU+lD9WlR5rx0rpZNgl6YYKHkCYR6X1nhldIG+916PFF2cwli2
 Rha6L2I72txTNScWIwBRCHXuUiK0vNe60Iyiue0VTPk9YUEDqwb/5efmTYOGU3uUbM
 hR9X9TFQqjHQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X/w8yxu+
Subject: Re: [Buildroot] [PATCH 4/4] package/qoriq-cadence-dp-firmware:
 refactor with NXP_EXTRACT_HELPER
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-08-15 18:56 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../qoriq-cadence-dp-firmware.mk              | 27 +------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)
> 
> diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> index 7d701c4ac..8cc2200a1 100644
> --- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> +++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> @@ -13,33 +13,8 @@ QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
>  QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
>  QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
>  
> -# Helper for self-extracting binaries distributed by NXP.
> -#
> -# The --force option makes sure it doesn't fail if the source
> -# directory already exists. The --auto-accept skips the license check,
> -# as it is not needed in Buildroot because we have legal-info. Since
> -# there's a EULA in the binary file, we extract it in this macro, and
> -# it should therefore be added to the LICENSE_FILES variable of
> -# packages using this macro. Also, remember to set REDISTRIBUTE to
> -# "NO". Indeed, this is a legal minefield: the EULA specifies that the
> -# Board Support Package includes software and hardware (sic!) for
> -# which a separate license is needed...
> -#
> -# $(1): full path to the archive file
> -#
> -define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER
> -	awk 'BEGIN      { start = 0; } \
> -	     /^EOEULA/  { start = 0; } \
> -	                { if (start) print; } \
> -	     /<<EOEULA/ { start = 1; }' \
> -	    $(1) > $(@D)/EULA
> -	cd $(@D) && sh $(1) --force --auto-accept
> -	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
> -	rmdir $(@D)/$(basename $(notdir $(1)))
> -endef
> -
>  define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
> -	$(call QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
> +	$(call NXP_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
>  endef
>  
>  define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
