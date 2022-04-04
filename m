Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AE0C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 292C8828AA;
	Mon,  4 Apr 2022 20:17:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xA0KOihBv1pg; Mon,  4 Apr 2022 20:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24A288277E;
	Mon,  4 Apr 2022 20:17:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6111BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F10618277E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPmVOcjbO84e for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:17:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E4C1826C1
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:17:18 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ot30so12404354ejb.12
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nBOhF9CrJyNf/lsubEbxyElB07AJ4VBeK32gYYtgKbM=;
 b=I3lKT914m3GniYNK83jv/E8VOaCgu4eUZm2+Xb0cPamHkOnahvhuIlHhlcTsvlDdYy
 uzrRb+fdiSxszvUlKFhzlYWJAkEtcNgU6V9UEaQhRwgQADHFll5xVCC7ssq5iXIptEMr
 GOLObuD8rygw81u3igrAvSHyGnKWscI+eww73clL9BYzN8o/Ye53HYWjjlEd54fUMTS8
 6pHNM7s/Fn4QZaJIzFw+o5++WWTPMasxuU2L/+B9y9tFvzwL1+5YsetoEcwSDpiArGbe
 iy2ndBwN5yxkMoB22QMyhXeNmPTkTrM1SPsKg/BqmZyAd228PgiGvVngPFwIWOwYWy99
 PZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nBOhF9CrJyNf/lsubEbxyElB07AJ4VBeK32gYYtgKbM=;
 b=efvCO3P4YiaHf0ZtYfEw4iKpS4QBqP2+AAN5gCq5KjTYr16QZs8bTEtZmAgHIoDnho
 M/zOxIKeoo6oUgutZXhep0JKeHJ/MPvCcXiIij3MTQnz9yogJta8mhWKMmCjUqGiBBuu
 ELh9c1/rRN/9IL7EEBvulMRQQivssbU+EwmsFyCtC0GC24CvjsXhvwoEPFnCnGcuO/hS
 3YuqOH0tDu8bmm8yGFKwUeMsLS0ookRFa2pgE5VD7zAC52DrASS8ziJSNj4mPkbMu7VC
 MYpj3u8sIEa9bCFwjwxnqPajWdJyM1q/CesaJbGrg4ghOJv2z3YgE6g1EP6P5Gk6vmdV
 uC0w==
X-Gm-Message-State: AOAM530oMyF889xvOVTXIRJUdo0MgPU/7bLU3G07O/inB10iZZvTN047
 mO/qXKRhB3oRtkN4hRoHbbriUg==
X-Google-Smtp-Source: ABdhPJxzIXkgOJPbyADOpQLv7Y/Kv9G3mAZvx/tmYsqcEDdmU9HsFYi4g0T1a0ThGVOtC6qmAuFQWg==
X-Received: by 2002:a17:906:1603:b0:6ce:362:c938 with SMTP id
 m3-20020a170906160300b006ce0362c938mr1819281ejd.253.1649103436437; 
 Mon, 04 Apr 2022 13:17:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm5858876edz.35.2022.04.04.13.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:17:15 -0700 (PDT)
Message-ID: <2ddab288-a57a-18ed-c392-d6695dd68e89@mind.be>
Date: Mon, 4 Apr 2022 22:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220404091256.683581-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404091256.683581-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: Backport patch to fix
 linking on powerpc
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
Cc: fontaine.fabrice@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 11:12, Joel Stanley wrote:
> Commit 192dfc68c0e4 ("package/zlib-ng: fix build on powerpc") turned the

  Peter just backported this one to 2022.02.x...

> Power8 optimisations off to fix a build issue. Instead apply a patch
> from the develop branch upstream to fix the issue.
> 
> This patch is not yet in a released version of zlib-ng.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

  Applied to master, thanks.

  Regards,
  Arnout


> ---
>   ...rd-for-vec_sumsu-to-prevent-undefine.patch | 27 +++++++++++++++++++
>   package/zlib-ng/zlib-ng.mk                    |  6 -----
>   2 files changed, 27 insertions(+), 6 deletions(-)
>   create mode 100644 package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
> 
> diff --git a/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch b/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
> new file mode 100644
> index 000000000000..cc103215de3c
> --- /dev/null
> +++ b/package/zlib-ng/0001-Use-static-keyword-for-vec_sumsu-to-prevent-undefine.patch
> @@ -0,0 +1,27 @@
> +From 677f56825f7080403e18e57ffe8177f3df290f20 Mon Sep 17 00:00:00 2001
> +From: Nathan Moinvaziri <nathan@nathanm.com>
> +Date: Sun, 23 Jan 2022 12:59:01 -0800
> +Subject: [PATCH] Use static keyword for vec_sumsu to prevent undefined
> + reference error when g++ linking.
> +
> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> +---
> + arch/power/adler32_power8.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/power/adler32_power8.c b/arch/power/adler32_power8.c
> +index 029aa3a84c57..fc4086322efc 100644
> +--- a/arch/power/adler32_power8.c
> ++++ b/arch/power/adler32_power8.c
> +@@ -44,7 +44,7 @@
> + #include "adler32_p.h"
> +
> + /* Vector across sum unsigned int (saturate).  */
> +-inline vector unsigned int vec_sumsu(vector unsigned int __a, vector unsigned int __b) {
> ++static inline vector unsigned int vec_sumsu(vector unsigned int __a, vector unsigned int __b) {
> +     __b = vec_sld(__a, __a, 8);
> +     __b = vec_add(__b, __a);
> +     __a = vec_sld(__b, __b, 4);
> +--
> +2.35.1
> +
> diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> index 938acd4181a6..fb497b8c11d0 100644
> --- a/package/zlib-ng/zlib-ng.mk
> +++ b/package/zlib-ng/zlib-ng.mk
> @@ -23,10 +23,4 @@ ifeq ($(BR2_arm),y)
>   ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
>   endif
>   
> -ifeq ($(BR2_powerpc_power8),y)
> -ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
> -else
> -ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
> -endif
> -
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
