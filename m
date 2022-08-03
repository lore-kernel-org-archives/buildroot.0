Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC3DC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AA9D4159B;
	Wed,  3 Aug 2022 16:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AA9D4159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wd0j-Em5AjLj; Wed,  3 Aug 2022 16:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB3DE400AC;
	Wed,  3 Aug 2022 16:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB3DE400AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2CF1BF3D1
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B0DE4103B
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B0DE4103B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddvdSMH8zxIZ for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:03:12 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC5F240D78
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC5F240D78
 for <buildroot@busybox.net>; Wed,  3 Aug 2022 16:03:11 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JGj9otUo3cdGJJGj9oPcWH; Wed, 03 Aug 2022 17:56:07 +0200
Message-ID: <8d724b62-1509-b02f-c900-38292fa3bdb3@benettiengineering.com>
Date: Wed, 3 Aug 2022 17:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220803074349.7590-1-francois.perrad@gadz.org>
 <20220803074349.7590-3-francois.perrad@gadz.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220803074349.7590-3-francois.perrad@gadz.org>
X-CMAE-Envelope: MS4xfIMw0mYtN6vSsUgBCpN5oxiIXeHiObPYbhgkzxN3eL+ffgDoB4nyb7ZbYrIF4hvlvR/DyfvF81/Vi4nidJRDRS9h0lT+Tpq7B0ypht243Ru2oL0dxiTr
 sKamPLQT7L25MgPmP0dT0kji+udmwHfG1eOJSoVXLbK6ynHa4YSrpCAoRP1dS7Gns2JqeK9fbnxboMORmc1sL3+RkfJG/QksNSH8KNz0eap1ew0MG68/kRs6
 LwWzN4Xg3GWcqME97SE8zw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659542167; bh=dqF+P435KOSJYMVSmV60cBwDD2tUkSOIVIOHMkw7kQI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=HeNC+M1IDiwjG97I/YFMI/76G1ihUkW/wCbQF656EuKY+x3sGMUml5NyymDvAmfGt
 vqY6BuG95APz1nzXeEayWPoKNjpaGXDB9xs/mSkOgULQkna87NqRxEf8362dvy15MV
 zDEsZtCUHoA1Lbi8g5kfN7Elu1ewZRs04BApygKmnNcCXAM4UV3GZ0STR0vtBrEfpH
 wbaX52cZAzSJi6xjS7f3bxmZNZ81wkKoDODkakplfOg98dkLL+F5qMzFvm4ZWZ6wOU
 745hQukVlwlkIf3eapCiNdRlnRLAuvw8dOdzxONbj3/An2XTMA+FMds5hT8Wb5oSaC
 PgpzmrX4XwgaA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HeNC+M1I
Subject: Re: [Buildroot] [PATCH v2 2/3] package/qoriq-cadence-dp-firmware:
 add install in target
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

Hi Francois,

On 03/08/22 09:43, Francois Perrad wrote:
> This patch adds the firmware to $(TARGET_DIR)/boot other than
> to $(BINARIES) folder. This is needed in the case
> BR2_LINUX_KERNEL_INSTALL_TARGET is not set

You've forgotten your SoB and my Reviewed-by here

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
>   .../qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk  | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> index 23643d24e..a8172cb1d 100644
> --- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> +++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> @@ -10,8 +10,10 @@ QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_
>   QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP-Binary-EULA
>   QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING
>   QORIQ_CADENCE_DP_FIRMWARE_REDISTRIBUTE = NO
> +ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),)
>   QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
>   QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
> +endif
>   
>   # Helper for self-extracting binaries distributed by NXP.
>   #
> @@ -42,6 +44,10 @@ define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
>   	$(call QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
>   endef
>   
> +define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(TARGET_DIR)/boot/ls1028a-dp-fw.bin
> +endef
> +
>   define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
>   	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
>   endef

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
