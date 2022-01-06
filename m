Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D23C433EF
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 15:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D8F94294C;
	Thu,  6 Jan 2022 15:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6CNaRm0wGyp5; Thu,  6 Jan 2022 15:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46524294A;
	Thu,  6 Jan 2022 15:19:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1211BF3F6
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5913B83268
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 15:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kU0GeHRMJaVY for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 15:19:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1443183267
 for <buildroot@busybox.net>; Thu,  6 Jan 2022 15:19:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso1371503wme.1
 for <buildroot@busybox.net>; Thu, 06 Jan 2022 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zL5X4VmsXDYa4uTV00tsEwJ+mFQs0KNjOy7YCko5YIk=;
 b=XHVR1nA/u0nEnoPzoCi3ram1RGTZz3yQpeGcJzEiiFzbctB0FlhXIT1n7NxMXEuhI/
 ufqDIlSKXT9W81N4zDiU2+UksEApn1IHKsvvjVZueID+5XMQL/sOhN09qcKMPQAEJdxY
 XGDjdJJMePfaPajHXYH80/oeqbJp4+CX17Mv83XS8Sj/J36Rztgx78lOw4LoYJO84TZ2
 4vCnpxb8OMZyCiO9Xnn+4Gm7paowFI+rICuKxy3F7Q79FbKSaq9ppH9rE3Qn5WdpZNdO
 s6p+tmSy+BKNdZRX77ceXMGjx6J9CH+8WnI33snQvRIKbGf+hAAF/5QRrRl3PRkvB33N
 rhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zL5X4VmsXDYa4uTV00tsEwJ+mFQs0KNjOy7YCko5YIk=;
 b=rpvn9jfcNcdn2BZWd9LRGOpQ7ql+C3WhhJZE6Gdr3r0Z+V1KUhpCPm5wYunmWU7rh1
 dVwb6bfxQgvx8Pr3z0b7ee2fJHObbrFxBTHUy1zBHGKshF1WeaTnAcw3m1PpzKxwbuPl
 e+mqHm9eg9JKV7nnBMY438MDrF3cgxSdua2ewfqo4OqNTXEgyQA4BPytieuULdoKMOCv
 82gB+R+0s5LRs4U5wM5rGASUeDbRe5FoAFUDHP9p6DdX3TgWhBvQtoS7aTy3GWudtMg+
 XT8HTT2w+W/eCGBDD6pw5fkwMCYiaOOih5jDEume3yjQqr3wse0VOZtdnjFNtKDvlSKm
 amJQ==
X-Gm-Message-State: AOAM530QydOqTR+o3qYAM5w9B3Oi+YSFL2iT0l+jdEOCluQ6xIxac5S3
 OZEM8uZ00FzM5V/vmvCF8sks0w==
X-Google-Smtp-Source: ABdhPJyuB9YSX2UJs3mF5nKRj0gMwWi1i+MvwLZDe/JrPFtlDr4rfVuSytJ0f8jqD897WoG1gu9jSQ==
X-Received: by 2002:a1c:ed17:: with SMTP id l23mr7325087wmh.118.1641482354275; 
 Thu, 06 Jan 2022 07:19:14 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id i4sm5528648wmd.34.2022.01.06.07.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 07:19:13 -0800 (PST)
Message-ID: <630ac08b-3908-c4eb-a8ba-18518e27d8cc@mind.be>
Date: Thu, 6 Jan 2022 16:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Changming Huang <jerry.huang@nxp.com>, buildroot@busybox.net
References: <20200207083857.28058-1-jerry.huang@nxp.com>
 <20200207083857.28058-6-jerry.huang@nxp.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200207083857.28058-6-jerry.huang@nxp.com>
Subject: Re: [Buildroot] [PATCH v5 6/9] package/qoriq-cadence-dp-firmware:
 new package
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
Cc: michael@walle.cc, matthew.weber@collins.com, thomas.petazzoni@bootlin.com,
 geomatsi@gmail.com, heiko.thiery@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/02/2020 09:38, Changming Huang wrote:
> From: Jerry Huang <jerry.huang@nxp.com>
> 
> This package provides the firmware for LS1028ARDB DP (display port).
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>

  Applied to master, with a few changes:

      - move out of nxp directory;
      - add extraction helper;
      - set REDISTRIBUTE to NO.


  Regards,
  Arnout

> ---
> changes since v4:
> 1. remove the variable NXP_QORIQ_SITE.
> 2. use the url for qoriq-cadence-dp-firmware site directly.
> 
> changes since v3:
> no changes.
> 
> changes since v2:
> 1. change the package name to qoriq-cadence-dp-firmware.
> 2. add the hash of COPYING.
> 3. modify makefile with new option.
> 4. update DEVELOPERS with alphabetic ordering
> 
> changes since v1:
> 1. rename the package to fsl-qoriq-cadence-dp-fw.
> 2. update DEVELOPERS.
> 3. add the hash of package.
> 4. modify the context fo config file to package name.
> 5. re-write the makefile according to rule of buildroot.
> 6. add the license message in makefile.
> ---
>   DEVELOPERS                                    |  3 +++
>   package/nxp/Config.in                         |  2 ++
>   .../nxp/qoriq-cadence-dp-firmware/Config.in   |  4 ++++
>   .../qoriq-cadence-dp-firmware.hash            |  3 +++
>   .../qoriq-cadence-dp-firmware.mk              | 23 +++++++++++++++++++
>   5 files changed, 35 insertions(+)
>   create mode 100644 package/nxp/qoriq-cadence-dp-firmware/Config.in
>   create mode 100644 package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
>   create mode 100644 package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e555b9773b..ffb07d67ea 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -529,6 +529,9 @@ F:	configs/nanopi_m1_plus_defconfig
>   F:	configs/olimex_a13_olinuxino_defconfig
>   F:	configs/orangepi_plus_defconfig
>   
> +N:	Changming Huang <jerry.huang@nxp.com>
> +F:	package/nxp/qoriq-cadence-dp-firmware/
> +
>   N:	Chris Packham <judge.packham@gmail.com>
>   F:	package/gstreamer1/gst1-shark/
>   F:	package/micropython/
> diff --git a/package/nxp/Config.in b/package/nxp/Config.in
> index 575542c7ab..855d62700b 100644
> --- a/package/nxp/Config.in
> +++ b/package/nxp/Config.in
> @@ -1,4 +1,6 @@
>   menu "NXP QorIQ libraries"
>   	depends on BR2_aarch64 || BR2_arm || BR2_powerpc64 || BR2_powerpc
>   
> +source "package/nxp/qoriq-cadence-dp-firmware/Config.in"
> +
>   endmenu
> diff --git a/package/nxp/qoriq-cadence-dp-firmware/Config.in b/package/nxp/qoriq-cadence-dp-firmware/Config.in
> new file mode 100644
> index 0000000000..3f494bd3a3
> --- /dev/null
> +++ b/package/nxp/qoriq-cadence-dp-firmware/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE
> +	bool "qoriq-cadence-dp-firmware"
> +	help
> +	  NXP QorIQ cadence DP firmware, a resident EL3 firmware.
> diff --git a/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> new file mode 100644
> index 0000000000..89aaf1d71b
> --- /dev/null
> +++ b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256 5871c5717be32f14a59624d5699d405e8ce9ae2e9c9ef86fd16e13d264a40e58  firmware-cadence-lsdk1909.bin
> +sha256 d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
> diff --git a/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> new file mode 100644
> index 0000000000..5c29602574
> --- /dev/null
> +++ b/package/nxp/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# qoriq-cadence-dp-firmware
> +#
> +################################################################################
> +
> +QORIQ_CADENCE_DP_FIRMWARE_VERSION = lsdk1909
> +QORIQ_CADENCE_DP_FIRMWARE_SITE = http://www.nxp.com/lgfiles/sdk/$(QORIQ_CADENCE_DP_FIRMWARE_VERSION)
> +QORIQ_CADENCE_DP_FIRMWARE_SOURCE = firmware-cadence-$(QORIQ_CADENCE_DP_FIRMWARE_VERSION).bin
> +QORIQ_CADENCE_DP_FIRMWARE_LICENSE = NXP-Binary-EULA
> +QORIQ_CADENCE_DP_FIRMWARE_LICENSE_FILES = COPYING
> +QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES = YES
> +QORIQ_CADENCE_DP_FIRMWARE_INSTALL_TARGET = NO
> +
> +define QORIQ_CADENCE_DP_FIRMWARE_EXTRACT_CMDS
> +	$(call NXP_EXTRACT_HELPER,$(QORIQ_CADENCE_DP_FIRMWARE_DL_DIR)/$(QORIQ_CADENCE_DP_FIRMWARE_SOURCE))
> +endef
> +
> +define QORIQ_CADENCE_DP_FIRMWARE_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D -m 0644 $(@D)/dp/ls1028a-dp-fw.bin $(BINARIES_DIR)/ls1028a-dp-fw.bin
> +endef
> +
> +$(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
