Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6804BCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFEE0407AB;
	Sun,  7 Apr 2024 15:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4f6mjgJKlbQ; Sun,  7 Apr 2024 15:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8371407A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8371407A0;
	Sun,  7 Apr 2024 15:16:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAF0F1BF489
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4D6E608DE
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qTr6c-WuLg8 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7CEE0608A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CEE0608A5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CEE0608A5
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:15:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-415523d9824so37311265e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 08:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712502957; x=1713107757;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b6XegeyCKNEHHwGBlYtMAKpY+ZKAoeJJx55Q6FlEpaY=;
 b=XttCvhJwOxp50OXO3JX1x5E8hXHkFpzUpnDp/v2UPbKXsu+q4KkiHUh+HEA923h9Rw
 IRofOVnohNCvccTq8KuGR7ywIes+P0TBDSu76J68A0FrN3M4MnlDU8Si4KPelkLLBpj1
 z3AnOI1BuMqMJ8fgBFJq0KTpuV0pgz4OQ2PFOOLFf3RqK7IaEkU4Jm/K67uoOuTZzne1
 Rg7T8y+xUyJOHlZu2pG98MRf8GGDe4DWNNFe4R5rWPlRCu+6s1bGhGgUmVCIMbqCDuAC
 3qLdUawipT8PL8j7OxLx909X7Aa9WpScVFsnL/EfwjOudEdCs/QQMHfcoom5lkfdZvR0
 JMLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRbNtG3Sk/J2dlSGEgzP2DnP1JhqNzQxMgqiJDt9Reu0XGbaVVWIF5EBM8KlUI6STVSctGHT0NmlGWF5jVXNL/qtbCyO9sDw==
X-Gm-Message-State: AOJu0YxONFOObDCZJDqyFLU0OJXCeKem1HdezeUhc2GIbPMMnDYOcJ/6
 H6GczwhMl8bvN/H0T8y30g4IebBd+/wFoJIzZcfcVl7bkOczPCdWh7dABOof0aJcN26p8n/Pz5U
 k
X-Google-Smtp-Source: AGHT+IFWV419Fx6rXUTLryAEp+ipFHYbnSCLONPk6zm6ejTjRUwmLhzmev07Wyl2jNiCSZCsVal3NQ==
X-Received: by 2002:a05:600c:5494:b0:416:2d39:bcc2 with SMTP id
 iv20-20020a05600c549400b004162d39bcc2mr6235826wmb.29.1712502957491; 
 Sun, 07 Apr 2024 08:15:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a5d498c000000b00343e8968917sm6366972wrq.1.2024.04.07.08.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 08:15:56 -0700 (PDT)
Message-ID: <414577b2-fdc6-4b26-b079-ea0a1ae8d79f@mind.be>
Date: Sun, 7 Apr 2024 17:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240303132222.151704-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240303132222.151704-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712502957; x=1713107757; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b6XegeyCKNEHHwGBlYtMAKpY+ZKAoeJJx55Q6FlEpaY=;
 b=C1I7hBwm9m7ZKlDs3SYRtz0tP0oqHDl1dK/R//Sl1VdldqkX3ugqwMMJHA119QHnPf
 VXGSU5TqI9UR7K5JcGdM7mmitWwRpVDJpzNYDjYWGDEwqdKO8bk3A5i0NJrlmXduCcHG
 3gkcza1WYhK6laIDqP+QbABmnA4X+HQ/2LkU5FHNO+CmPHHdQ9JxyxHBcwT6FsMEysWN
 1Sc5yJJhXosJrpw7u/+MvXUz3it4VLKsI8HAJoIJV2ykAiKQwAKkQoStum4SN9J0CxLL
 yxaq8z0nUuwiV9KXVK4NfcEyJUJwQ6lTl3xxKw8sRi0dGasU2Sn55gGMyaGuRLwCLKcz
 rjww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=C1I7hBwm
Subject: Re: [Buildroot] [PATCH 1/1] package/google-breakpad: needs C++17
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Pascal Huerst <pascal.huerst@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/03/2024 14:22, Fabrice Fontaine wrote:
> Fix the following build failure raised since commit
> 32c1fbad554d4c2bfbe56a652333195c8ae67904:
> 
> configure: error: *** A compiler with support for C++17 language features is required.
> 
> Fixes: 32c1fbad554d4c2bfbe56a652333195c8ae67904
>   - http://autobuild.buildroot.org/results/451bae7151a74cbcb5d199b8516e9c255a0953fe
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  You forgot to update BR2_GOOGLE_BREAKPAD_ENABLE in Config.in.

  Applied to master with that fixed, thanks.

  Regards,
  Arnout

> ---
>   package/google-breakpad/Config.in | 6 +++---
>   package/sentry-native/Config.in   | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
> index 5c7f4bb7ba..4e2d98eb04 100644
> --- a/package/google-breakpad/Config.in
> +++ b/package/google-breakpad/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
>   config BR2_PACKAGE_GOOGLE_BREAKPAD
>   	bool "google-breakpad"
>   	depends on BR2_INSTALL_LIBSTDCPP
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>   	depends on BR2_USE_WCHAR
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_TOOLCHAIN_USES_GLIBC
> @@ -45,10 +45,10 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_TOOLS
>   
>   endif
>   
> -comment "google-breakpad requires a glibc toolchain w/ wchar, thread, C++, gcc >= 4.8"
> +comment "google-breakpad requires a glibc toolchain w/ wchar, threads, C++, gcc >= 7"
>   	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
>   	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
> diff --git a/package/sentry-native/Config.in b/package/sentry-native/Config.in
> index 7a3cbd36ad..88db2779f1 100644
> --- a/package/sentry-native/Config.in
> +++ b/package/sentry-native/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_PACKAGE_SENTRY_NATIVE
>   	bool "sentry-native"
>   	depends on BR2_INSTALL_LIBSTDCPP # google-breakpad
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # google-breakpad
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # google-breakpad
>   	depends on BR2_USE_WCHAR # google-breakpad
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # google-breakpad
>   	# google-breakpad is restricted to glibc or uClibc, but
> @@ -19,10 +19,10 @@ config BR2_PACKAGE_SENTRY_NATIVE
>   
>   	  https://github.com/getsentry/sentry-native
>   
> -comment "sentry-native needs a glibc toolchain with w/ wchar, thread, C++, gcc >= 4.8"
> +comment "sentry-native needs a glibc toolchain with w/ wchar, threads, C++, gcc >= 7"
>   	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
>   	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>   		!BR2_TOOLCHAIN_HAS_THREADS || \
>   		!BR2_TOOLCHAIN_USES_GLIBC || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
