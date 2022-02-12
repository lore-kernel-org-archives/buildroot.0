Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBCCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 226F840384;
	Sat, 12 Feb 2022 22:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9-22V5f28Tl; Sat, 12 Feb 2022 22:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C5AA402F3;
	Sat, 12 Feb 2022 22:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 077801BF4DD
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7D67400AB
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbHgoXj0l9ZW for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:00:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A011A40022
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:00:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p24so29815750ejo.1
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/q7r8lMJ7aVIITX54eWhPNHUXY12/+TddHDYuNyDxr8=;
 b=AjkRrEam3C+V3zs685Xqy02+ftY55SuPN/S+873+j8hpldwchGSlvHGesmIgNutCiG
 8ufsFfnhimpTcLbLcUceoAeynAeT8Fe7c4hANgvBx03R23FBkNsmGIofSTv7n8NKuwV7
 uv8POLdnug13IiCVWPlFFvfkxDww8f11G4nWCGA6U70mYuMoH/r84YC3Dch6WGCVMAgr
 RZoFTv7BYlmBYnL3eIOMxF/VxlbTD0oLv1j2UqO9KQ/bWdscrGsqoM+PvDmw2rKzCO0Z
 kGASadBhaDz7U5vEsdt3weRX7ZtivTSwM0mhfwc5cMeZnoICuzx70qrABIo8pOkywJPh
 k1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/q7r8lMJ7aVIITX54eWhPNHUXY12/+TddHDYuNyDxr8=;
 b=Qim0/A92mNEAFhSH/Fv7ag3S4ITUdL4biWHi9X8DZRuzqyOBQ6+Md4oqnhStR6ekrU
 KEVSN4NhOgxAoT399mQOlunMBwwiA/Cv66CwKuZnkmLE6It1ZK+Set25dJxkJxWQUQ2w
 dCI1RQVpNWerT1cw7v+qsWxHRBmNU4bPFreSFWU1/lrAr1IsQ0OruAri76Uq0bSPUxRj
 PzH4yiYLIAfCmjsNHLIuUpNURuBfDgdfOuG5M5ehG7UQ6BzpUuKv2HrAy3srYzLMP5vu
 75V95+fGY4r4hIITYR1kFJUFv74mmJhT4buSv4sN4MdUM1VeeJKNPiazrvJ22tqgIRhe
 1ryg==
X-Gm-Message-State: AOAM533EiuTtsGiUAriflQ+gvf/6ud+nNfnjUoD0P0XikdxUx746ZesD
 VIMW9TYwqFchE+K3PZJ8D/e+JXqaCyArvQ==
X-Google-Smtp-Source: ABdhPJwSup2zn5yDpm/Y3sLVRkZGPd3mU/VAZQFw6Hv34nQUFAO73XV52gjoTljrEKJ1kuXXAGZztw==
X-Received: by 2002:a17:907:1b0f:: with SMTP id
 mp15mr6053129ejc.493.1644703254322; 
 Sat, 12 Feb 2022 14:00:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id t5sm2209428edd.7.2022.02.12.14.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 14:00:53 -0800 (PST)
Message-ID: <56728901-85a9-87ef-1a97-b1d907f17056@mind.be>
Date: Sat, 12 Feb 2022 23:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220129155019.3819750-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220129155019.3819750-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/android-tools: fastboot needs gcc >= 5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/01/2022 16:50, Fabrice Fontaine wrote:
> Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add gcc >= 5
> dependency to fastboot:
> 
> Makefile:591: *** libsepol is in the dependency chain of libselinux that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/2430ba4afb40569ed54506201494baeebf6c5d42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Fix typo
> 
>   package/android-tools/Config.in | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
> index a36c4db189..bc76d545c1 100644
> --- a/package/android-tools/Config.in
> +++ b/package/android-tools/Config.in
> @@ -38,6 +38,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
>   	bool "fastboot"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
>   	depends on !BR2_STATIC_LIBS # libselinux
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
>   	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
>   	select BR2_PACKAGE_LIBSELINUX
>   	select BR2_PACKAGE_ZLIB
> @@ -46,8 +47,9 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
>   	  the target, which can be used to reflash other target devices
>   	  implementing the fastboot protocol.
>   
> -comment "fastboot needs a toolchain w/ threads, dynamic library"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +comment "fastboot needs a toolchain w/ threads, dynamic library, gcc >= 5"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
>   
>   comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
>   	depends on !BR2_arc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
