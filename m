Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5021EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF76C830C0;
	Wed, 18 May 2022 18:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuIwTOUNPRr4; Wed, 18 May 2022 18:01:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E45BE82F51;
	Wed, 18 May 2022 18:01:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3AC1BF2B1
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 18:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A3D5600B4
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 18:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3YnEXdYrs18P for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 18:01:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E4D86006A
 for <buildroot@buildroot.org>; Wed, 18 May 2022 18:01:46 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id y13so4568172eje.2
 for <buildroot@buildroot.org>; Wed, 18 May 2022 11:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fqQOGl3cqjFUUN5SLGleAm4MA0IeWFiJDrqR3Vfo+BM=;
 b=TON3mMH0iqojGgRP058RfEV4Eal2Guw/XpQ/F/htsNLnqUJkD2xWjTl8ylsZUboZXy
 TK0HdSomBVq3GMkZfWrKWC5Fdv6QLo6AxB8NS6QdnPOjyiUgDDXgu1frrLdwDACCsv7r
 g81duRzEl6TFe+zaOSwdceOWTwlIa7K6Gffav6QRoaXH1AVYwrxOS12EIecAwScOt1hA
 vN+SSnYY/H+qGeEeFnOtbxMAP9j2NSikAWP29v0cKq4f6vChbFvO9FegOIvXT5+1fMps
 ciRvEzquiM3c4nwV8ZANtrmuAG79pFLuY6k/ioe7oZyKPeVLo3Hd+7uDQY7HpPibj+MR
 CEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=fqQOGl3cqjFUUN5SLGleAm4MA0IeWFiJDrqR3Vfo+BM=;
 b=X9MDfdL1S53WEKrOuDEaqmnpIZ3btlU8tDCiTyjvH9f5Xdvag+64JB694sKOnok7GL
 JY3sFqxkGXv8wFx2aoToUwBPFDwqg2TCpJG6dnZiRiL5qkkIRG9PNUodNFwevRsC2ot+
 k1OX0f2KFRMsKp9GKG5U/y0JXYGDhcez8seX0nz9Z4LB3uw+L/XdkB3dkEe1IZtQLc4a
 B+TLWxU96A7AMVpPpN+s/WobvZutX8mmx9IJ+/YonBBOtdwWcH0skqsTzWRjo5irWE7+
 zXTZBNhhXcfGONp1I0HrPwU+adrRjmybcA+axu5KKi+Nt4RbKU54zduHP4GNE1LchtlC
 KOkA==
X-Gm-Message-State: AOAM533uPTOBiff/FR4f9zGvObHRfhpvKh7ApCLOmdN+vU8KAsNl48E0
 O9rcIi77zq4r9HW+XAa0o2tc/cZx2VdVqQ==
X-Google-Smtp-Source: ABdhPJzTZeL1team5r1UUf9S4I0SCodNxlNHPWFljq/ngCbSisUFo9aTPELMpK5t5zDSYNH0yr9QHQ==
X-Received: by 2002:a17:907:6e8d:b0:6f4:b220:a6b2 with SMTP id
 sh13-20020a1709076e8d00b006f4b220a6b2mr706959ejc.71.1652896904426; 
 Wed, 18 May 2022 11:01:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170906104400b006f52dbc192bsm1243218ejj.37.2022.05.18.11.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 11:01:43 -0700 (PDT)
Message-ID: <4b7583c4-5d03-60bc-4b42-4b2f18177a78@mind.be>
Date: Wed, 18 May 2022 20:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Christian Stewart <christian@paral.in>, buildroot@buildroot.org
References: <20220517103608.3455749-1-christian@paral.in>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220517103608.3455749-1-christian@paral.in>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-utils: prevent
 kconfig_enable_opt from changing =m to =y
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2022 12:36, Christian Stewart via buildroot wrote:
> The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
> option when a package requires it.
> 
> However, this will often override an existing enabled module with `=m` with `=y`
> which overrides the module to be built-in instead of separate.
> 
> This is undesirable behavior; we often want these as `=m` and not `=y` to reduce
> the size of the kernel image.
> 
> This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.

  Good catch!

  Patch is a bit over-complicated, but I don't know how to do better.

> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> 
> v1 -> v2:
> 
>   - fix indentation spacing: use tab instead of spaces
>   - simplify by using $(1) instead of two separate variables
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>   package/pkg-utils.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 7d1aea7710..218d6ea9b0 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -21,8 +21,14 @@ KCONFIG_DOT_CONFIG = $(strip \
>   )
>   
>   # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
> +# If setting to =y and the option is already set to =m, ignore.
>   define KCONFIG_MUNGE_DOT_CONFIG
> -	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
> +	if [[ "$(lastword $(subst =, ,$(strip $(2))))" == "y" ]]; then \

  This part we could avoid by adding a 4th option and setting it only on 
KCONFIG_ENABLE_OPT.

> +		if grep -q "$(strip $(1))=m" $(call KCONFIG_DOT_CONFIG,$(3)); then \
> +			exit 0; \

  This is a kind of hard-to-follow control structure - better turn around the 
condition and do the replacement inside it. So, combined with the above:

	if $(if $(4),grep -q ...,true); then \
		sed ...; \
		echo ...; \
	fi



  Regards,
  Arnout

> +		fi; \
> +	fi; \
> +	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3)); \
>   	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
>   endef
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
