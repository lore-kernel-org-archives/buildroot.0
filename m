Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F77C19F2B
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 21:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01721409EA;
	Tue,  2 Aug 2022 21:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01721409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZmfAKAdbaGy8; Tue,  2 Aug 2022 21:28:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D45E4032A;
	Tue,  2 Aug 2022 21:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D45E4032A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C81E1BF9B5
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBCC34032A
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBCC34032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h5iHuIJ_9ApF for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 21:28:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDDC3400AF
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDDC3400AF
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 21:28:43 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IzRSoaoV734GkIzRSonBB0; Tue, 02 Aug 2022 23:28:42 +0200
Message-ID: <3426984f-bd2e-d4b9-2603-45108cbd9a05@benettiengineering.com>
Date: Tue, 2 Aug 2022 23:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Francois Perrad <francois.perrad@gadz.org>
References: <20220731094808.1347975-1-francois.perrad@gadz.org>
 <20220731094808.1347975-2-francois.perrad@gadz.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220731094808.1347975-2-francois.perrad@gadz.org>
X-CMAE-Envelope: MS4xfG0KoiaULJDuzlq9zzP5tGfKOFsx6dRZxFsXkCtX/JInjlU5rXBsg8CjaYYBaw0ubPtLWv019msauywDTeVjz5YqyXVqI+c1fAh1qT9ZA6VNiaKLJnU3
 ioYtQEXtNFWaj6Z7oaRMMnpQromk7kokJOvTamdWMqIYpo3eLU6i7nqZPf80h9USCxwkZJtRBd6Vhnb5ttvedI76Kp4+P+h6to+jXnysjNbTtGH2rwlrhD+V
 2BNOPKWyubPh89G5I80niQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659475722; bh=e8PacnFLU9sJUcRpS+ZSCdH0ZBy0eLd3JdsFVxXpNy4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=QdOkCUQ9mYAJG2grWTCIXfBLrEwacSeJc8ttwiHdq2HIhzoDl8iWaP2hJ2jQbXsXP
 MX/AM8Uc8yTU47s/2xBWFJeBG5SUzziJKQ7mS5ZD4C9kh7aDm226Ja+q3icowjezQ0
 P2gLCKnu/PNBtGY5wzRBRyvArgjiKS3BSWUk/D2hrGre+2JCT3FegIZvBaMlBuKrwB
 4M27cDiugpTr2/SiwnyyWysbMkojfmtI6LvTf9xCShNrpoZMpavHFkx1n3ODjEsmsH
 bHy879SnstK3tcrwYZwcoPmAixW5fCDmcQec3kGYPiGXiSWUKbEq+qaEEo9CB7HIgi
 nKBJCfFICXB1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QdOkCUQ9
Subject: Re: [Buildroot] [PATCH 1/3] boot/arm-trusted-firmware: allow to
 generate BL2 from RCW
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Francois,

On 31/07/22 11:48, fperrad at gmail.com (Francois Perrad) wrote:
> add the option BR2_TARGETARM_TRUSTED_FIRMWARE_RCW.
> 
> TF-A can encapsulate a pre-loader RCW (Reset Configuration Word) file into BL2.
> 
> This is useful with NXP QorIQ family.
> 

What about:
"
This patch adds option BR2_TARGETARM_TRUSTED_FIRMWARE_RCW that allows
TF-A to encapsulate a pre-loader RCW (Reset Configuration Word) file
into BL2.

Upcoming NXP QorIQ family board needs this option.
"

> Signed-off-by: Francois Perrad <francois.perrad at gadz.org>
> ---
>   boot/arm-trusted-firmware/Config.in               | 6 ++++++
>   boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
> index b1fc03e10..0f91953bf 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -85,6 +85,12 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP
>   	  platforms were ATF encapsulates the second stage bootloader
>   	  (such as U-Boot).
>   
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW
> +	bool "Include RCW"
> +	select BR2_PACKAGE_HOST_QORIQ_RCW
> +	help
> +	  Include the RCW in BL2.
> +
>   config BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31
>   	bool "Build BL31 image"
>   	help
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> index 35a95a7ec..eb9b656fe 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -133,6 +133,12 @@ define ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
>   endef
>   endif
>   
> +ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW),y)
> +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-qoriq-rcw
> +ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
> +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RCW=$(BINARIES_DIR)/PBL.bin
> +endif
> +
>   ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31),y)
>   ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += bl31
>   endif

I've build-tested with all the other patches in the series and it builds
fine, so with the commit log improved:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
