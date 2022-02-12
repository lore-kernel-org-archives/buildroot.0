Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F62C433FE
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 20:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58C0C606BF;
	Sat, 12 Feb 2022 20:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7mYp698GG1Dy; Sat, 12 Feb 2022 20:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 864D7606ED;
	Sat, 12 Feb 2022 20:35:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFCCD1BF577
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE8CC606ED
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 20:35:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcP_ybvkSaiC for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 20:35:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9468B606BF
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 20:35:19 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id s7so21400618edd.3
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ql8oybcq/D509mADQ388yt03omBDKeFulEe8AoeBypA=;
 b=Kw64y6lprS4uYn+MxDqbcSe7MmUAQl4RYKRr+bTH6V/r4NQT/LyFErJsBIujZfAQVJ
 8pYCuG6TZu07n0Lvli49rgF2rmTvh9wdvrPXxUuz3OfWAXrmM42PXuQQRAo+NvvYq2rg
 5WldunvPLLdvimb/hM/4VxsMfrwcSJjVSDfydFQxki7tvIxiNtiJ3SqAg/03trK5pZkb
 /sSwACYlSlVBGziSUypNd5vc27ZAZJUSF0aASTvrmxSx6dAqxwP5HmS3hP0rAbzhymsS
 pXPbf0IZrEteaRV9xet57GtqBUlnJ7OUP6q5uxwFC0eJuEGZ6pCq1PJtCXTmwmlajWre
 wEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ql8oybcq/D509mADQ388yt03omBDKeFulEe8AoeBypA=;
 b=hV+CysZokNYdyH6OKbEyziCkqV5UIosY8yiNW7TI7FkVQxAhvDhq5ojTig7cNpGi6z
 JFWHIYA4VbFZ2zwIDtCdoLLyABQmgTMRk2jGgWAKgAXS3RBgNa7ZpoWmrqjkPsSayT15
 fupOCmmjl230Shx8BTlN0S42VRHhRHqAwCVoEpW8guwSjm1DbRpUaq4J1TwArHxb/erS
 Qck5SNoMeEsDIBozaPhnUCZ1Pxpxt16G/N8N060xbJdSElgZdv9AQX5eQOFAfcpMPqYg
 Ub2N/bPZa516o3vjXCWQX8BKACgOAWYB8w4xmA5ARQEPGreVY06J483vL0ypeZEaIgkw
 iceA==
X-Gm-Message-State: AOAM530PofhYn2HqQ4FjDdlDFN+9oDYVY05jjZ9sCX2tulh2xkBHuqsa
 /EmNIMB66rFQfvgoGxU5s9FsLQ==
X-Google-Smtp-Source: ABdhPJwgW0p8h2aTLFXfJQEeNrYGFouJnOTrhADEm31kQG6cYZRn5g48Z0wLZbWX1pHbrpIBXB//3Q==
X-Received: by 2002:a05:6402:43cd:: with SMTP id
 p13mr190256edc.28.1644698117518; 
 Sat, 12 Feb 2022 12:35:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id q7sm6528963edv.93.2022.02.12.12.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 12:35:17 -0800 (PST)
Message-ID: <d8123960-c3ec-398b-9d27-15c01b73858c@mind.be>
Date: Sat, 12 Feb 2022 21:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Michael Trimarchi <michael@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220201091342.143010-1-michael@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220201091342.143010-1-michael@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH] boot/uboot: add support for bundling TEE in
 BIN format into U-Boot
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/02/2022 10:13, Michael Trimarchi wrote:
> Some U-Boot platforms (e.g. nxp) can bundle OPTEE's tee.bin
> into the U-Boot image using binman. This patch brings the necessary changes to
> enable this feature.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>   boot/uboot/Config.in | 12 ++++++++++++
>   boot/uboot/uboot.mk  | 12 ++++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index c630fc6552..117bbd3faf 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -237,6 +237,18 @@ config BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE
>   	  U-Boot. This option makes sure optee-os gets built prior to
>   	  U-Boot, and that the TEE variable pointing to OPTEE's
>   	  tee.elf, is passed during the Buildroot build.
           ^^^^^^^ This is inconsistent with the choice below. Perhaps 
reformulate like this:

	  U-Boot, and that the TEE variable pointing to OPTEE's binary
	  is passed during the Buildroot build.


> +choice
> +	prompt "U-Boot OPTEE BL32 format"
> +	default BR2_TARGET_UBOOT_NEEDS_OPTEE_BIN
> +	depends on BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE

  (nitpick) IMHO it's nicer to write this with if...endif around the choice.

  More importantly: there should be a help text.

> +
> +config BR2_TARGET_UBOOT_NEEDS_OPTEE_BIN
> +	bool "tee.bin"
> +
> +config BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF
> +	bool "tee.elf"
> +
> +endchoice
>   
>   config BR2_TARGET_UBOOT_NEEDS_OPENSBI
>   	bool "U-Boot needs OpenSBI"
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 574fc7089a..210fa219ed 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -177,7 +177,19 @@ endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_TEE),y)
>   UBOOT_DEPENDENCIES += optee-os
> +ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPTEE_ELF),y)
>   UBOOT_MAKE_OPTS += TEE=$(BINARIES_DIR)/tee.elf
> +define UBOOT_COPY_TEE_FIRMWARE
> +	cp $(BINARIES_DIR)/tee.elf $(@D)/

  As Yann explained but it didn't appear to get through: before, it supposedly 
wasn't necessary to make this copy, so why is it necessary now?

  Perhaps it is necessary to copy it in more recent versions of U-Boot (i.e. 
when using binman). In that case, I think it would be good to also update the 
make option to TEE=tee.elf, to make it more consistent.


> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> +else
> +UBOOT_MAKE_OPTS += BL32=$(BINARIES_DIR)/tee.bin
> +define UBOOT_COPY_TEE_FIRMWARE
> +	cp $(BINARIES_DIR)/tee-raw.bin $(@D)/tee.bin

  Again, it's very weird that you pass in a BL32= that refers to a different 
file (really different this time, because it's not the tee-raw.bin but the full 
tee.bin).

  There may be good reasons to do it this way, but that should be explained in 
detail in the commit message, and also briefly in a comment because it's simply 
too weird to understand like this.


  I've marked the patch as Changes Requested.

  Regards,
  Arnout


> +endef
> +UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_TEE_FIRMWARE
> +endif
>   endif
>   
>   ifeq ($(BR2_TARGET_UBOOT_NEEDS_OPENSBI),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
