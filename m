Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F43C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5BD440204;
	Mon,  4 Apr 2022 19:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2riKFBXWWbzM; Mon,  4 Apr 2022 19:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7876401A3;
	Mon,  4 Apr 2022 19:28:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6601BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CC2C813F2
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:28:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQ_NZBEEXaMX for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:28:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 693B4813EC
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:28:52 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ot30so12156476ejb.12
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 12:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=db+3uN5zlnWvenRdlj8ccZe5viOWPqXXiC+HpRQwQuE=;
 b=O4rIGNye+XZoiKUZA0RUJ55iiwNLcrGX8zU3rnP9lHxelL6lOZaCij9mEoxB5PLBxD
 7mndqH5tBYbfM1+P0VTlSY7CvLQhvHwmo0xc+Oeqr9zb3erxIfGEWEfp6UlmJh8uImh8
 poGqlOMEQ0+dPjfzXOJ8DgV6bIsTjwLTARvD19Zuipjy//5KnrB05DGWexQoRacW+BK4
 z0/BFjCI6YHMkTjlYFcvsSzATViDbbEMv4qZhvrDhdhuQTQr3KCHosdXUICiXG/7St4L
 Sa8KTPNWJ9Ip3CXoqw8Rr7HBY5BuP4L6s0VtZU+t3F953HkU9panhs4tyn0zoFm4whb1
 eRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=db+3uN5zlnWvenRdlj8ccZe5viOWPqXXiC+HpRQwQuE=;
 b=jHyCfmARooaIUD/cN+aqnIVCnbxB49BGrsz9RtoYBhsa26jANnr0FASzGyEwVB2FHX
 Xtd5tScHL7MRbRShQgzJnLPUOI0gjufu/rGm8f6X54BKqRTSm44Ll38WQXEhMSqEomJH
 ppNxBT8/XREE7pYjHMRqfMPsGeaGFrWqOfkSQcL0pfJX0d7VNVjt7P9fW8zTMN4ATQwd
 tKfjnGRLzrAPJAcsEh33pCWC2uoIzIuGs64CibG30kLTkH6M1/J973hFDLctEf4VFXsf
 /NxKMZjYuJ8pevsRmD+J/Lcr3W10srmV29Xr86gZQ4l9FR7q47tQVpRMSoDw0va6JqaG
 k0dw==
X-Gm-Message-State: AOAM533Tqt/GSZemAzwyKrs378casJmfShairRXrHYngZIGeUTm2qdaV
 Qnag23jNao54i/GYCokixOhtww==
X-Google-Smtp-Source: ABdhPJwBVxx/Pv3UYVuMFl9cxjTCI+zOOw1hJXIMv7Nr8iIeRUz3Sg67n3rrzR49EL1s0YHQg4s06A==
X-Received: by 2002:a17:907:3e0b:b0:6df:cc38:ffeb with SMTP id
 hp11-20020a1709073e0b00b006dfcc38ffebmr1594554ejc.263.1649100530626; 
 Mon, 04 Apr 2022 12:28:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 fd8-20020a1709072a0800b006e7b63f8ae6sm2348615ejc.4.2022.04.04.12.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 12:28:50 -0700 (PDT)
Message-ID: <fa132248-de46-4e86-7d6d-1fe9f873e0ae@mind.be>
Date: Mon, 4 Apr 2022 21:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220402212444.1892632-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402212444.1892632-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-greenlet: disable cpp
 test
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2022 23:24, Fabrice Fontaine wrote:
> Disable cpp test to avoid the following build failure without C++ raised
> since the addition of the package in commit
> 826ef33bedc0f2f39a38622f066978cd9cc05226 and
> https://github.com/python-greenlet/greenlet/commit/d9cb12af26da2abbabe9f05101564866f25a74e2:
> 
> powerpc64-buildroot-linux-gnu-gcc.br_real: error: src/greenlet/tests/_test_extension_cpp.cpp: C++ compiler not installed on this system
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/1140463b8b2407c2a28b9a955efab6037ee7dbeb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-greenlet/python-greenlet.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-greenlet/python-greenlet.mk b/package/python-greenlet/python-greenlet.mk
> index 3b1ef7e314..72d2747970 100644
> --- a/package/python-greenlet/python-greenlet.mk
> +++ b/package/python-greenlet/python-greenlet.mk
> @@ -10,6 +10,7 @@ PYTHON_GREENLET_SITE = https://files.pythonhosted.org/packages/0c/10/754e21b5bea
>   PYTHON_GREENLET_SETUP_TYPE = setuptools
>   PYTHON_GREENLET_LICENSE = MIT, PSF-2.0
>   PYTHON_GREENLET_LICENSE_FILES = LICENSE LICENSE.PSF
> +PYTHON_GREENLET_ENV = GREENLET_TEST_CPP=no
>   
>   $(eval $(python-package))
>   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
