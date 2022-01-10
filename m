Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7FB540900;
	Mon, 10 Jan 2022 07:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IUQTPXKK5nM; Mon, 10 Jan 2022 07:21:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12AAE40906;
	Mon, 10 Jan 2022 07:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 029E01BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E65BC408FF
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADu9RRHjjd6b for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:20:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40B83408F2
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:20:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q8so24810696wra.12
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 23:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k5cmvRw7l9f6LN7GfEmGhFgg5rAiLi9/osnvhgSanR8=;
 b=ApAr8T3TAFVx381+SPWo4voJWsdBql6fGfY8tFQYB1bpPcmeM/2e6VVdIW2E6S8sO3
 c5HIs5ONHN0C4q5iQOxcZ4vw9laISeu8YkxWpcX8ClYfepYvgA0ZiM+OqUs5Hr5PWTXW
 irx7iovYBqxBCjP7Mav4EOOjiyRt3jH/bRhAy8xfLM9nZq/J/T24H8tOpkDILQmHlM2b
 mCYmgJQtm9+DeVkngnGKXtopB7EeRa5fzvMYTd/vtCddnMdslZBQBoULLeEmT6eWTmbn
 HL4oOmxHXJkydMasH/wW+vLRYzjQZBiIszejMbMzTLHdtAZtEoAY3tiLzFYXebUy4Amc
 faSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=k5cmvRw7l9f6LN7GfEmGhFgg5rAiLi9/osnvhgSanR8=;
 b=FW+RS7N2qUIGCfM5uqq0B/YIi7lKWU5czNBkyrvz2Fdsp7dZhyBfvmS+9Dz4ZL1Snb
 nAnD5dDujTX4rfgz0/145OJT8EpWdUGfurOYvEO72NKFD5tfxbe2vKLDym00aJO+7slR
 NC8LzlkDhisligPrtRASROxpXDT0VAgq5RmmyJ/yugB/U7X3Dv7xaH328Ge3wSj9GS4r
 1RN9rTHanCFXMiYJ1glb6VTK+CX4oTSt2L96T68XYE92kGngX5t9rpqhvBCcMm17fb5i
 Uybypm7cMMVGMhngl9rAL2YwXclLOJsBnjVVAfoEc2vK0MBcWRoY/7SturJuhiwh3ShO
 4PnA==
X-Gm-Message-State: AOAM532MFCHSeN2MHo3/A4Gt4shIe+P4Iq9si83ikRAyjoEiZdGdZDF5
 aBQLnYCDgrMwOF+px0ElWEq59crH/SFgRCuM
X-Google-Smtp-Source: ABdhPJyLopy7Jw07YSDatPb0NzfLFgRZNfG23zY9j2WzHNThDPQsVQqO2Wc7QBIQJ7s4g0O/MTXwJg==
X-Received: by 2002:a05:6000:1192:: with SMTP id
 g18mr15464692wrx.328.1641799226642; 
 Sun, 09 Jan 2022 23:20:26 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id n14sm6156724wrf.107.2022.01.09.23.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jan 2022 23:20:26 -0800 (PST)
Message-ID: <1151a8f7-e692-6fc7-9bae-44b39ae0ad21@mind.be>
Date: Mon, 10 Jan 2022 08:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220109221633.1307381-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220109221633.1307381-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/hiawatha: mbedtls is mandatory,
 not optional
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



On 09/01/2022 23:16, Fabrice Fontaine wrote:
> hiawatha is unconditionally using mbedtls since bump to version 11.1 in
> commit 24e4c888c3d36e3943206ea55894b84344cc8b2e (e.g. wigwam.c includes
> "mbedtls/md5.h")
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
>   package/hiawatha/hiawatha.mk | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
> index 017592de1e..ed9f8aba54 100644
> --- a/package/hiawatha/hiawatha.mk
> +++ b/package/hiawatha/hiawatha.mk
> @@ -11,7 +11,10 @@ HIAWATHA_LICENSE = GPL-2.0
>   HIAWATHA_LICENSE_FILES = LICENSE
>   HIAWATHA_CPE_ID_VENDOR = hiawatha-webserver
>   
> +# Disable system mbedtls as hiawatha needs mbedtls 3.x
>   HIAWATHA_CONF_OPTS = \
> +	-DINSTALL_MBEDTLS_HEADERS=OFF \
> +	-DUSE_SYSTEM_MBEDTLS=OFF \
>   	-DENABLE_TOOLKIT=OFF \
>   	-DCONFIG_DIR=/etc/hiawatha \
>   	-DLOG_DIR=/var/log \
> @@ -20,11 +23,7 @@ HIAWATHA_CONF_OPTS = \
>   	-DWORK_DIR=/var/lib/hiawatha
>   
>   ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
> -# Disable system mbedtls as hiawatha needs mbedtls 3.x
> -HIAWATHA_CONF_OPTS += \
> -	-DENABLE_TLS=ON \
> -	-DINSTALL_MBEDTLS_HEADERS=OFF \
> -	-DUSE_SYSTEM_MBEDTLS=OFF
> +HIAWATHA_CONF_OPTS += -DENABLE_TLS=ON
>   else
>   HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
