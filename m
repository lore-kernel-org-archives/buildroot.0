Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA526C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 712A7828D1;
	Mon, 25 Apr 2022 19:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKCsCMR2U2TX; Mon, 25 Apr 2022 19:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74C8B81D0B;
	Mon, 25 Apr 2022 19:05:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 967381BF2CD
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8335041655
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id naToYeBKTXdm for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:04:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A99C41621
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:04:58 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bv19so31482637ejb.6
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7YQ69ulGE8LSU/3Gl6Ez63erg+4CetBGrfX8pUgYVLo=;
 b=V2CLKkwCXnruiuTiWre6vqagiheKpSA0wT2qA2rBlOBnsj1g9dre8yoE9Yd7JH7GUR
 BfvnIUloj6YH7hXmoPyBE2kqqQQKKwuI9mLwRDS2NWMIsHPpmuVYFNQYx6+IoRPv/dKA
 wmTupZlpIU8G1VU4Sp+I+EzGxlmy7n9SidxkFwyFMwnqQp/zzrlGdHkTobCF1XRKKrFU
 ZvKlejeg3iW5BgQxvncge6tt/NfmZJweHB4SxyiiqPiCL4Bg5PSqWneUDuLhz7Gip7ID
 Nw1qpuYpoZUY8phW+oYUsZlewEkFnCJ3fMQX8S6g2pLB7LG2yiay9C7iEa97c8WC+71C
 bUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7YQ69ulGE8LSU/3Gl6Ez63erg+4CetBGrfX8pUgYVLo=;
 b=M+PXjhYR8NUQ0gsuVWnhzqEVuUjjred7wxzh2IYfTOif5ZtBkqMfL/JkSxPLWNEMv9
 f2AN7x8P0s3D9Ad7UUdReWze9PehElJORrpSEtpq9j6UoW7pnxnTf4AtYcNYKNsd1ath
 WpEV7PQv0guyyLc21b9LOTHAnhGONKMWPVNw4HBQZBxWTD2JskrBO8eGRbEmctWHR1uP
 NYm52ksZQE9rKh82S5EYtLlt+zoH2giMd6ao5S0aY4DINjncJSworu8C6TJMNmCRt+ks
 LkS5VocOqRTGDJMUdjRXdqktDnWCU61ozyNHQ7aSOW97BGvY1NEf17J1UVOt5Rg++q8s
 Qg1A==
X-Gm-Message-State: AOAM5328u+dmi4IaS+CSAiiGr4OfjfDHKy7xLZRmiLFwnvGPfVdFkd9O
 8/5lEfeq4x3D+t7lJNYnN1mKCw==
X-Google-Smtp-Source: ABdhPJwer2xvBELZPC6/wV8oZUpsJ+mNp9nCof8JiQREOZNGll0PdO/l8C+UpDKVB3M9iduZSXvwbA==
X-Received: by 2002:a17:907:168a:b0:6e8:d125:1d24 with SMTP id
 hc10-20020a170907168a00b006e8d1251d24mr17382903ejc.508.1650913496534; 
 Mon, 25 Apr 2022 12:04:56 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ci21-20020a170906c35500b006f394323ccesm1485599ejb.34.2022.04.25.12.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 12:04:55 -0700 (PDT)
Message-ID: <54846226-f77f-c135-a8f3-0975a9ec7ec5@mind.be>
Date: Mon, 25 Apr 2022 21:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220422074456.4104082-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422074456.4104082-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/adwaita-icon-theme: needs host
 gcc >= 4.9
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2022 09:44, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of harfbuzz to version
> 3.1.2 in commit 6861933d22006fbe8c961a41506beac826881f33:
> 
> In file included from ../src/hb.hh:473:0,
>                   from ../src/hb-buffer-verify.cc:27:
> ../src/hb-vector.hh:206:20: error: 'is_trivially_copy_assignable' is not a member of 'std'
>        hb_enable_if (std::is_trivially_copy_assignable<T>::value)>
>                      ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/bbc48cb5232c617d4ff1d0bafd63bb3c9c72d556
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Note: you already sent this patch in December but somehow it got lost.

  Regards,
  Arnout

> ---
>   package/adwaita-icon-theme/Config.in | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
> index d200570e76..71b839d996 100644
> --- a/package/adwaita-icon-theme/Config.in
> +++ b/package/adwaita-icon-theme/Config.in
> @@ -1,5 +1,10 @@
>   config BR2_PACKAGE_ADWAITA_ICON_THEME
>   	bool "adwaita icon theme"
>   	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
> +	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9
>   	help
>   	  Adwaita icon theme
> +
> +comment "adwaita icon theme needs host gcc >= 4.9"
> +	depends on !BR2_HOST_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
