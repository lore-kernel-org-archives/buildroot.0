Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8828C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 14:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49B9A40523;
	Sat,  5 Mar 2022 14:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmHSRXFCuI8g; Sat,  5 Mar 2022 14:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36F79402F6;
	Sat,  5 Mar 2022 14:47:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6D7D1BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5E54408F7
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 14:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bj7ZOT6tYntG for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 14:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5CD74091D
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 14:47:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id s1so14170968edd.13
 for <buildroot@buildroot.org>; Sat, 05 Mar 2022 06:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v+77Ah3Uvu05PSDEOzv42mh7CuHHbbX/RsTAwg0R/6Y=;
 b=WUDc9XvkTtF5uPMqGz9b6O0LmOTGpWTDY+pH73IsV1vXiLDpQiDMjvNalV7N2wciQI
 oxBu176ZkA1zcpYQ4/5GzVwZAjCxsKRmp37f3zG4wy7yQROVTdDcmVDU8gt60YRYO8Um
 UiFvG4jGu4Iq4GbGXdBih4ZUYuwn3eAiS4clusq/N5lUGCNUqMDybdKR2CIkTcLxbhyw
 xDBGJxaLss4l2QU3yB/twXCYbjVj9iaqnLfvy5KSxRRKzpfipiW5t0Xkd/O8lV/K5h5R
 cjgHfm5ymBwa7UyTxx/jzGO5hrHG1OxN8VtIbQC40JOsV5mnZWVcioQZy7ohd9gIj0q3
 GAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=v+77Ah3Uvu05PSDEOzv42mh7CuHHbbX/RsTAwg0R/6Y=;
 b=ECqtadOvUF4Hkb3W2Gux9NFPUh/qRUeUp8+P+05CwrI2uFa8qOmc0M48S5StRgnQAE
 Z+2l3VSLTjyP/lJN33EP4ebchMht8jucrGDlx20A5W70GaZSv4k3bM83YSLPWDwWIVnW
 WqEbCd9Snx6RiZQIgva+tTvpqV9qGxzhrGk1ae18JKsn9bYxAve37ipW/jBv6MK7P4u9
 0VFdXZvqdX6/lIu59rJhnqX3ynl6zRDoTf1Qdb09xQ0t/ywLp53U3oxkE5guGhLRLnBj
 A8Bt1P8sH6ACtOzdh60kNYWDR+h0dI0pZ9Pnmw7vwgKpOM4ALIDHl3hyxFwKQFOwABbs
 BwfA==
X-Gm-Message-State: AOAM5312OI3/SSiiwWOkulahFHr5ce7GjpcGgGHuYXcdnJ4glacrwcT4
 za8HQMf/39ItYS9eV8Hk8UMXqQ==
X-Google-Smtp-Source: ABdhPJzZwY6yv8uv0mWZ6snlT0JRMqt1ViRKeUlAnIuLXQKkMvE/V+3hZvAME8kdL75WYVTfFk9Glg==
X-Received: by 2002:a05:6402:268a:b0:410:cc67:e792 with SMTP id
 w10-20020a056402268a00b00410cc67e792mr3256926edd.218.1646491632939; 
 Sat, 05 Mar 2022 06:47:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:b032:6b00:cb7e:b535:458f:f512?
 (ptr-cyunlkwzu35hsouvwnm.18120a2.ip6.access.telenet.be.
 [2a02:1811:b032:6b00:cb7e:b535:458f:f512])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a1709062ad300b006d1289becc7sm2870897eje.167.2022.03.05.06.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Mar 2022 06:47:12 -0800 (PST)
Message-ID: <df78b1f4-0b9d-fc1c-7706-b6e4278c5e1b@mind.be>
Date: Sat, 5 Mar 2022 15:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220213204327.1206836-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220213204327.1206836-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gnupg: add
 PYTHON_GNUPG_CPE_ID_VENDOR
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/02/2022 21:43, Fabrice Fontaine wrote:
> cpe:2.3:a:python:python-gnupg is a valid CPE identifier for this
> package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython%3Apython-gnupg
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-gnupg/python-gnupg.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-gnupg/python-gnupg.mk b/package/python-gnupg/python-gnupg.mk
> index f16910e517..fda264a0ed 100644
> --- a/package/python-gnupg/python-gnupg.mk
> +++ b/package/python-gnupg/python-gnupg.mk
> @@ -8,6 +8,7 @@ PYTHON_GNUPG_VERSION = 0.4.8
>   PYTHON_GNUPG_SITE = https://files.pythonhosted.org/packages/b1/90/75e15ead9693028c05fc7abd25c756c0d1da27bf04a27d6f5c4139d8ee10
>   PYTHON_GNUPG_LICENSE = BSD-3-Clause
>   PYTHON_GNUPG_LICENSE_FILES = LICENSE.txt
> +PYTHON_GNUPG_CPE_ID_VENDOR = python
>   PYTHON_GNUPG_SETUP_TYPE = setuptools
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
