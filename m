Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FBAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F09B341945;
	Thu, 21 Apr 2022 17:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VMLjkOcJG2u; Thu, 21 Apr 2022 17:58:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B95554192E;
	Thu, 21 Apr 2022 17:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6D31BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 399AA830E2
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nzuhmuqc4EhU for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:58:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36CA183148
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:58:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 r187-20020a1c44c4000000b0038ccb70e239so6378294wma.3
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hM/gEzFgz9xYR2WK/P4rNl5+KIZllsSh337rniA/TVY=;
 b=Wq1uzBS0zxKAww/wPGqs+jBGeMNIudjdNzxrqWzTAQW2f9vhJFUpkm/APEsZ0o5k2D
 CZ/4v3Gp3NfT49QSNWvftzMfwbNq3eHuWqv3Sm5UKH3c/BDaM6jv2LEZh9Jq2z4V/Gj3
 TvN6KAW9jqgjcogDkn/r0f6Dg7tQXi6m7jyGDL49zFzFYWFQf6LfrKK90UyX+IeCHjsh
 fqSeWXDTWDzp3pSty3hfXYdmN4B26YqFqDXeuKMvtDga7SJVyJnZ4wqG2UGuiGjn4Wqr
 tFba2R5QwCcfSpFHjNy/l5TcOcTeUlbhhBqwbeahSEVZ/RYS/kwlVAbNsFhigBuUAVaw
 vNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hM/gEzFgz9xYR2WK/P4rNl5+KIZllsSh337rniA/TVY=;
 b=WzPT+nEVAlraVnZyNuhtfew+sVehZAY1yq2jyqPZW0QNw4sjg4y7/Ib0vE/LFlxeBC
 iFaukVj+Y/cfilGro2enkllllhSVO49jfQJk5gsgaq3Kl0/HejbuU1bRCiBTcK8i9w3e
 REXB6B1yYtBeZVn17amLqL9rmg0lSb+WrAkFUH7Np+SE9UDeriWee4wu+S9PdltIHWGW
 cRZ5gAnOTtHYqa8NANUpWpqi8/SP3fFf3lxUoCx+rJmDw1agyA+suxv5e75uCtdEn9fN
 rg2Og75KtgNsDr74k6JbdNEdd7hCwkdwJde6TUuRYejGQyJ5uMvjrcSaPVmZLxSpiVLE
 rNog==
X-Gm-Message-State: AOAM530+SGOgklEAIdsVyMkTxW6Z/cLD9uiC81I2mHnrByTHuAgYGEm2
 PcmartBOh4EZmIZ5jogQRzoR6w==
X-Google-Smtp-Source: ABdhPJw63aGpkQX9gzbUHBFhM7R+gERb2uaSCdTWOdtCIA+S1lZb72ZOpJLmzQ4a8fDJlvMxePq1ww==
X-Received: by 2002:a05:600c:651:b0:381:3d7b:40e0 with SMTP id
 p17-20020a05600c065100b003813d7b40e0mr9716637wmm.17.1650563927494; 
 Thu, 21 Apr 2022 10:58:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b0038ed14b7ac3sm2524276wmq.40.2022.04.21.10.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:58:47 -0700 (PDT)
Message-ID: <16a05482-8a31-5323-cc4b-13bdc66945ec@mind.be>
Date: Thu, 21 Apr 2022 19:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220412204926.24281-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220412204926.24281-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libbpf: needs __sync_*_4
 intrisics
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/04/2022 22:49, Fabrice Fontaine wrote:
> libbpf needs __sync_*_4 intrisics since bump to version 0.7.0 in commit
> 4b1003855b02f6d9c77de634c9d0f636470e7388 and
> https://github.com/libbpf/libbpf/commit/b0c3d7133faa55fbcbc19f76f9cc9e183e178c97
> 
> Fixes:
>   - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libbpf/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
> index 3aa6679b3a..b3d6e44c6a 100644
> --- a/package/libbpf/Config.in
> +++ b/package/libbpf/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
>   config BR2_PACKAGE_LIBBPF
>   	bool "libbpf"
>   	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on BR2_USE_WCHAR # elfutils
>   	depends on !BR2_STATIC_LIBS # elfutils
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
> @@ -27,6 +28,7 @@ config BR2_PACKAGE_LIBBPF
>   
>   comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
>   	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>   	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
>   		|| !BR2_TOOLCHAIN_HAS_THREADS \
>   		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
