Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91565C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 14:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF8C2400FE;
	Sun,  9 Jan 2022 14:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1SVx0HvtELO; Sun,  9 Jan 2022 14:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C224240111;
	Sun,  9 Jan 2022 14:54:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 23CDA1BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DBE540111
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 14:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Malrq846HBLN for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 14:54:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE63B400FE
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 14:54:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q8so21804050wra.12
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 06:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=iMb8VJSw08w5KQrksNtWFMivMx2rIFFDwkPcZdbE3Oo=;
 b=gL7BeyoGICoPNuKZuuiXvVeXGrtrLP7H0ZWiICtLqwhbIh5kJpNQVLgjml76PO1NRe
 /iMUWBVnLOalfqkQdfgihNgIsAyuGw/G1qJADqpaCSwSgLtt5JQktLnz3eZtl/LsGw7G
 D4lfrCZeLYmsENGtXBEYkwmbJVPEqNHztgpwnYm/lTKGZN7xgHvVZlp4UkQtpxPSJEQH
 /tjLA7qpYKpdBWVBvrJeTZARkFz/Il6BgbvDgnH678QSteGBICzHf4VFJvqo6hXgL65o
 fEmLSEx6+Qd/ImUgSjmQKF/zJWDuGuj6xPYSBrMGzcO08VKgPIHaPOaQ0VZYy5D4utv4
 Vz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iMb8VJSw08w5KQrksNtWFMivMx2rIFFDwkPcZdbE3Oo=;
 b=aArPdHIlLO+08buhHKxhcjG3nNRqmtxGhhg/PsBjcUe3s3mv4eExf5ZXh3+bEgAIXa
 a6gfEt3+j+4zeljXkYb9gnCRReT1u1aebzNN8pNFqOg8DVX3E/3WdJ9kZfdqn+hdOgx0
 qlZlXLf0MKPaLhtXsnCVo4c543V8A/LhmqnPOTMWT4M74Xd8CRzlGs8yEuRCPcZkC5yP
 QK0mJY5PrbGCAJLA+GsdziWeFuz+7MCn/gwHFuRs0J/VF2bKtSCN1OE0P3N8IHaJB8Po
 oyFzsKEgtghbRMOlAnSuaLgJDOKxdKfcqiBBXYYndRyyip85WDtFtB3Wdi9d8sj5f782
 ombA==
X-Gm-Message-State: AOAM531es82mENzGCrJn2laQnX3Bw6CzacO0Y/6PbeOTpM4s/S3QsCxb
 GLj04cpsggCo97cpR5Fj+Z3VdQ==
X-Google-Smtp-Source: ABdhPJy7rtrdIFt6gX3eFaQoiXUkeLBd9Dl7UP2DXlzGZvxhFxF+pG0nyO2EMn1x7C+FKhmfpbYATw==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr40531866wrb.268.1641740058960; 
 Sun, 09 Jan 2022 06:54:18 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id e12sm4491931wrg.110.2022.01.09.06.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 06:54:18 -0800 (PST)
Message-ID: <5a29a382-a3c4-cd0a-24e2-85d478f79ece@mind.be>
Date: Sun, 9 Jan 2022 15:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Yair Ben-Avraham <yairba@protonmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <LRqYEr-8n8UCFItcyNs3C7MB6QE2qjqOzG6oeXtPjF0qV_bhTXsJ2-mD4NDoS9Ro4UsvpwIh8HK5vcnjj87xxjS8QVNoFCyX9WMEBOu17As=@protonmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <LRqYEr-8n8UCFItcyNs3C7MB6QE2qjqOzG6oeXtPjF0qV_bhTXsJ2-mD4NDoS9Ro4UsvpwIh8HK5vcnjj87xxjS8QVNoFCyX9WMEBOu17As=@protonmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot/: Name U-Boot boot script
 image
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

  Hi Yair,

On 24/06/2020 01:04, Yair Ben-Avraham wrote:
> Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>

  Shortly after you submitted this patch, the logic for U-boot scripts moved 
from boot/uboot to package/u-boot-tools. Could you update this patch to take 
that into account?

  Also, please update the commit message to explain the use case. Why would you 
want the name field in the script image to be set to anything? AFAIK it is not 
visible or used anywhere.


> ---
>   boot/uboot/Config.in | 5 +++++
>   boot/uboot/uboot.mk  | 1 +
>   2 files changed, 6 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index 8cce9b1bae..310c4f8186 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -568,6 +568,11 @@ config BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE
>          help
>            Source file to generate the U-Boot boot script.
> 
> +config BR2_TARGET_UBOOT_BOOT_SCRIPT_IMAGE_NAME
> +       string "U-Boot boot script image name"
> +       help
> +         Image (*not* file) name.
> +
>   endif
> 
>   if BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 71689207e3..ab945eb159 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -340,6 +340,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
>          $(UBOOT_GENERATE_ENV_IMAGE)
>          $(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
>                  $(MKIMAGE) -C none -A $(MKIMAGE_ARCH) -T script \
> +                       -n $(BR2_TARGET_UBOOT_BOOT_SCRIPT_IMAGE_NAME) \

  We generally prefer explicit quoting, i.e.

-n "$(call qstrip,$(BR2_PACKAGE_HOST_UBOOT_TOOLS_SCRIPT_IMAGE_NAME))"


  Regards,
  Arnout

>                          -d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
>                          $(BINARIES_DIR)/boot.scr)
>   endef
> --
> 2.20.1
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
