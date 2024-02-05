Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896E0C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4118A40B12;
	Mon,  5 Feb 2024 10:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4118A40B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H5i_VsaYEL3l; Mon,  5 Feb 2024 10:53:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A43B40B42;
	Mon,  5 Feb 2024 10:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A43B40B42
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD861BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7458080EB3
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:53:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7458080EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nqi5mYV90nxS for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:53:46 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EBA280DA8
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EBA280DA8
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fd2f7ef55so7608335e9.0
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 02:53:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707130424; x=1707735224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HNvi0FiyMkgML0/qpyMi365Li/Y5CapFfG//ySff6F0=;
 b=owt1lIQHUUCKB80uNcc+KVmfxLydUBzIwEj5awOY1HDNp/VJCBzKY3Qx1+eq/SiATu
 4Mq7NbSyRz+8Lnv8VIVTA2+2c2TD/BK8HEUxIaQ3BKdsNa8WIQH1dgPqE/9VYUVXTb6H
 cbiDriWS/zcdKKmTm25Zs2Y46efjq21xdvSC2kP2ZbOy/f5lEdqvK7xlwLG761GC3uY7
 Gjbu2IcG2HYjsU2+Zhn3RwzatDFaYGC779YWyyjhHdRnQmnxbUrou+GeY8iH8h/g6NZ+
 /Y+G7aTJ7VndhU9uwJDAuAnRAPAnE/evoKR/h0uB1w2JXPH9jq+lyPFWr3Fwm/v14H4T
 8Lzw==
X-Gm-Message-State: AOJu0YxFKY/sV6h+U+Ni0hFio/4MaK0n2zp3owTnkLHJbPpv+M2bfa3v
 D7yC5PQbm7cBZQGwvHZegsuLHIW5CZBNmjD7y9yDTTatbzjxfkMGMNDfEQMDyYI=
X-Google-Smtp-Source: AGHT+IFdU4KRvYOT7VLE5iex1sG2kaxeX6nMmNcgdJtJ/HvJBPnFA4Nx03Ke72VQnp5yCGBsShSptQ==
X-Received: by 2002:a05:600c:4fc6:b0:40f:bbdb:4f2b with SMTP id
 o6-20020a05600c4fc600b0040fbbdb4f2bmr3702979wmq.19.1707130424532; 
 Mon, 05 Feb 2024 02:53:44 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUdaIBU9izjfl14Go/wopSKRK9BpWOaZNLfCXiqTMFa4uP6rtNHKEUyKkyoJp7SLogwiOgiM1luZRwE6O/eZ2t70GVVP8NM/A==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b0040efc268713sm8101947wmb.26.2024.02.05.02.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 02:53:44 -0800 (PST)
Message-ID: <a052f707-35d9-4c71-80f1-2ecf1242a800@mind.be>
Date: Mon, 5 Feb 2024 11:53:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111051726.2918732-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111051726.2918732-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707130424; x=1707735224; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HNvi0FiyMkgML0/qpyMi365Li/Y5CapFfG//ySff6F0=;
 b=Le6+q7KPK3LO2fdEr/B2cTIi02TyVMz+Mvn4DOtiwlf2KmZFcrMW6cXohE2cKD6CZY
 A562GiZoMfGkNve6AO9rt6zBlgKzrTDk8U15cVMD8C5ovfNz1D6e2DkGqe9+l/DzUebW
 nXF7XWEJ35fqgZZiriw0yNa4UhkDetU5HvwpfckigtlCcer6BEK4V2SinUfe/eRe+eNF
 YdS/MSLaZWPMfWv2DNfGstgkWdoYn1WMy0wWj8w1okeSjRqJeSck6XrgQY/xswGMRg22
 6gUoE6TYVhnnAOdtYj9wsV008F6Bq3xbX2bBzPpc2oHd99nMHzhsRyXveI2m00E5gCrt
 6PXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Le6+q7KP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.16.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/01/2024 06:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-rpds-py/python-rpds-py.hash | 2 +-
>   package/python-rpds-py/python-rpds-py.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
> index b04aa210d3..8c4b6181d0 100644
> --- a/package/python-rpds-py/python-rpds-py.hash
> +++ b/package/python-rpds-py/python-rpds-py.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after vendoring
> -sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
> +sha256  861b1fa8c37819b2e2cebbde6dea66ac2fa1247e4a7c3933dbf4c89244d7fecb  rpds_py-0.16.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
> diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
> index 6f71d02047..5f0d30d002 100644
> --- a/package/python-rpds-py/python-rpds-py.mk
> +++ b/package/python-rpds-py/python-rpds-py.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_RPDS_PY_VERSION = 0.12.0
> +PYTHON_RPDS_PY_VERSION = 0.16.2
>   PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
> -PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
> +PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/c2/63/94a1e9406b34888bdf8506e91d654f1cd84365a5edafa5f8ff0c97d4d9e1
>   PYTHON_RPDS_PY_SETUP_TYPE = maturin
>   PYTHON_RPDS_PY_LICENSE = MIT
>   PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
