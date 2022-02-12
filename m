Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05E5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C254148B;
	Sat, 12 Feb 2022 13:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkqPgAJDZDv8; Sat, 12 Feb 2022 13:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A63324136B;
	Sat, 12 Feb 2022 13:10:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63FFD1BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6045B4136B
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UiparmO9xNDz for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:10:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 491B5410E9
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:10:32 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id jg20so3211931ejc.3
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 05:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9OzYipr/qHQxDjCu9JvV+RUYqcDK8XAqxQIpU/yxZ14=;
 b=dIfQuAhHDKylNOOXcas++BOY71/PY8uSadI7i3k4uBWCnQqOoTR43O3JZVRX8Kqwpj
 pAckADei/dQw+za+5aeYmy/0vGhoBSqJ7QzG0x2Fyd0/1wqe96dilPvupJBMsCz9iN7S
 r7ZU6R2QgpPHNlAoEMzLnK0UlzNpJ7VxoOcm8U64FTd4AzQE2Q95x8ajWZOAFCMUBrIf
 xpU15vLgqXmmppY6e4PSVCoFixCcvg8uc4KlX3RHK6XoLTvLFbd8hB20FT9V14bdQ+Im
 e/TmTiXGn7MMgLoWPc/Ga9mEVZDwD4BR2OFoVDBtFVp0cPC5pzSatyMpAPz8e9IGz7zQ
 03+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9OzYipr/qHQxDjCu9JvV+RUYqcDK8XAqxQIpU/yxZ14=;
 b=cB8EcIQZa7ZPnL+PZch3/78Y6+cdAGNMBVo0kmZ54PGKXFdjzI0mgRyLLmTV22fNYf
 PlY3Kh2IgB4RCG9CXc/RKrhECiyG2064tcSnxsiJY3y+B+WYmiCUhv0X8RMZK+r5FO7R
 L9f9NClUkWLXcxwvtEby5gXX4NhG/wXjd8b7KGbuFN55SoeukrfnMWFiVIL5UYNcMRHn
 y9H1nkzwQZhHf8YTsQFhnLOmRtXzvX4h0/oajPcbSBpKBopYkA+IWBE8UUOLrYtngZUu
 xv5v7ozEzEA+CZ8tO2+uBJS0JRW0ww7P7p8E+0mBrhFX13InzVOHAiPqyCdBzv0TqT/B
 h5Jg==
X-Gm-Message-State: AOAM533kTgIrKQ75Mh/Od30ezpkcyW4p39pcpsYH+LGZq+IzJKAiJvQ4
 85DsTd+0MkGRu9CimkkeIPbZKA==
X-Google-Smtp-Source: ABdhPJznp/Prw3WxCAVjGN7vFnq0Xv/Nifg12yaTHv8CQ33LkkgDN5GFvFAUr826AbTMIUNJ3McxHg==
X-Received: by 2002:a17:907:6e91:: with SMTP id
 sh17mr4884065ejc.534.1644671430463; 
 Sat, 12 Feb 2022 05:10:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id nb16sm5652618ejc.136.2022.02.12.05.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 05:10:29 -0800 (PST)
Message-ID: <4dbf1b11-209a-b222-bea5-7ad7c531baff@mind.be>
Date: Sat, 12 Feb 2022 14:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220128173002.2483220-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220128173002.2483220-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/xml-security-c: needs threads
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/01/2022 18:30, Fabrice Fontaine wrote:
> Add threads dependency to avoid the following build failure raised since
> bump to version 2.0.4 in commit
> 27d08083ed4db5bd055219574cc602aaf8053a49:
> 
> configure: error: unable to find pthreads, currently this is required
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b6065efaa722f2da911c7cf150d446da621e8c71
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/xml-security-c/Config.in | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
> index 02544d5a01..c7963be69a 100644
> --- a/package/xml-security-c/Config.in
> +++ b/package/xml-security-c/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_XML_SECURITY_C
>   	depends on !BR2_STATIC_LIBS # xerces
>   	depends on BR2_USE_WCHAR # xerces
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +	depends	on BR2_TOOLCHAIN_HAS_THREADS
>   	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>   	select BR2_PACKAGE_OPENSSL
>   	select BR2_PACKAGE_XERCES
> @@ -13,6 +14,7 @@ config BR2_PACKAGE_XML_SECURITY_C
>   
>   	  https://santuario.apache.org/cindex.html
>   
> -comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7"
> +comment "xml-security-c needs a toolchain w/ C++, wchar, dynamic library, threads, gcc >= 4.7"
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> +		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
