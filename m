Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D235C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 21:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D82C40A16;
	Tue,  2 Aug 2022 21:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D82C40A16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywpNxDU739yo; Tue,  2 Aug 2022 21:34:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E5194037C;
	Tue,  2 Aug 2022 21:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E5194037C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61A9A1BF28F
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4943060E25
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 21:34:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4943060E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQvVF2tPEVtZ for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 21:34:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8484060E2C
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8484060E2C
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 21:34:22 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IzWuoatKX34GkIzWuonCig; Tue, 02 Aug 2022 23:34:21 +0200
Message-ID: <6c1f44fa-f720-e6ee-dd14-4757c03b0136@benettiengineering.com>
Date: Tue, 2 Aug 2022 23:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Francois Perrad <francois.perrad@gadz.org>
References: <20220731094808.1347975-1-francois.perrad@gadz.org>
 <20220731094808.1347975-3-francois.perrad@gadz.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220731094808.1347975-3-francois.perrad@gadz.org>
X-CMAE-Envelope: MS4xfMUztFIPiMpo8g8fTLo8GQdfKPIFAHY4oHwR5EwwKiHA4tL17vGqKerfVOgYD6ux3yAGzK1go+ggKeFr7+uTmjDAvCoWPdI8tMvrwAvdTLqPDsAizydx
 mfU7mLaAVTMN5RDfVeOuUUyAW5aA+zA67ROO6xeFHXIF7CEh8Yo8ZO0roSg0kXljKFpns8vc1xMebqWMkSbuOun7zaM2VLEL7EW4mk94/SqS7lsODgSrXdXP
 D4v55+aeq+aEEOvBSW0sgA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659476061; bh=LDVROZ/74QwfMdfEXwtHrRKqOlfE6rvKk8VMl7naxe8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=SC45i7aM3Fy2LTRV7oZNwVLE1ukaF2LfKIb+yqw0wiNek3Cf3FrzdVhgZtSCh0PoT
 jBnEdytRTenaEwqkQ6FLaa2ahIHmFBsSzX2iKRz78MKoLETHVA68KBFSFi8GwI3rKA
 0QdfjhgFgQ5SaWCvTPGi0WroCwvYgSeEiHJYL93m0rNYH1SgjVd4hIKPJZjESBAA2B
 sqM0UZ2dXL2PAGsZLZZBXNIjD5X/v9+MSSB/z/kvAcdw2dw8ANJ2rEGELsH3XmHTaz
 bqcFt8Wh4aAJfV9j1lxSpyP+K+lboQnVo11h/liUsr5XbT7XJ1sgmxsurXKau/5YWE
 J+r/hpRoA2jIg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SC45i7aM
Subject: Re: [Buildroot] [PATCH 2/3] package/qoriq-cadence-dp-firmware: add
 install in target
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
> this firmware must be installed with the kernel,
> there are 2 cases:
> - in $(TARGET_DIR)/boot
> - in $(BINARIES), in order to be bundled into a boot partition

What about:
"
This patch adds the built firmware to $(TARGET_DIR)/boot other than
to $(BINARIES) folder. This is needed in the case 
BR2_LINUX_KERNEL_INSTALL_TARGET is not set
"

Is it like this ^^^?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> 
> Signed-off-by: Francois Perrad <francois.perrad at gadz.org>
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
