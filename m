Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597D9D4A605
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 06:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE3285568;
	Fri, 16 Jan 2026 06:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XlMnM3bCg8DN; Fri, 16 Jan 2026 06:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E3A8556A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768545363;
	bh=/YM+ohBD1aBDfE0dP9120t5oN4Z7/1yAXQgIY2iq0TA=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=cXbuwUnsayBEhZORdNu1/9IcWD+y9Vz/fTi86fTD8BaCDpjrMqLfNj6wdHyga44B6
	 4zDmyl7rsZtt718I9ptf26SJgxJq2LQgxvU1XyXxVt4A2ULnOkI/Th5QZaMUOrUpCJ
	 5FiMz//XhiTegUbr/pKdUKQkDgtNvNv/skDbmjs3OEBBg5HmolYF405+c4rAvSmjf9
	 0UDvE3wuc1JFhvL6Vgek+XCTy6oqAWNlIwlO//S9VCJUysNiVg8g6t3lXkFD9z8AfU
	 LSoUMvV2Px+DvMqRr96f8XuUE0c5aIppcAdX2ta3brl1SMyXs9oKVgIEDCi4XrlH9d
	 EvHjOJBEDOXlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E3A8556A;
	Fri, 16 Jan 2026 06:36:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B96D160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06A9385568
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPNOyhEmWA0C for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 06:36:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E327B85567
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E327B85567
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E327B85567
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:36:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so1436017f8f.1
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768545359; x=1769150159;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=haBaRCTz2nROHDBpcRZuOlCJGuLYKHEtYm82Kugkhj4=;
 b=CSGWluCiZ+tFLblEqypwbok7BdzxvFTlYT3C1HZRLcLL5Lqj/UUTfjt+dvVDRI+tlt
 mozKpiuIhZ058hvmIUuPbCVhjIcIcxlNYhCUpkNZkFxgQwlSpnVafswUStme+uoiW40r
 H1qSiE7acNDpp28FES+Q5E2yE9zNl5neaiGkqcUrv/Th6WLnegyRTa888Lax1zySNhTC
 uhfPHyjMFJxirzUXQUvd4UI2YHnDUVz5k4XpnkPrWaH4kYqSPXiuHM8dieLJmBtyhOuY
 NTcB9R8/EBQLvh7/O0nfVficzCpt/ZD5uGHSLpd0mw8isnQCGC8UrG/5EaS2/IYSi6uE
 hyrg==
X-Gm-Message-State: AOJu0Yx6qmGWjuRfNw07O6cbNIDi4BV3zj6uGJF9PI91+K30s7RgoTxY
 Sq6Iy+awXn8vnr1tDflp4tDZ5F/7mvzgYBjc+9PEMjleVsRZUq5bzaWh
X-Gm-Gg: AY/fxX4Ki7gJSbtsNepV0FH/9jO+2MnYSVRUk5rWDpvwK28tBDoeOfkgfU+61vMcKYl
 7MZ0XH/m3e+HUXw2CvQEtblr7qE85MUnIVUPZ5QLr7A1U8Tp6b/Yi+sNTJwoG1UKyNoXmR5wXgQ
 V+DAI9kcbM18ahVKBciZ9jWow72PiUgRNVN8D503S7ChBemFIS87/VMZtQczkVeM+sIY7GVtN1m
 FMuyZT/Za3oHjKUO4JQYg7nNZOQO0rYlzbZyYBJVUP9I0afOMKC2q5TMJY73IVHJT2SEGFQ/n27
 CfgWYl631SP/4GKqwt8UReeefkOirEQ9chxZ3zAzqmxVINW3lSFOjvOurg2xN1Oc1d2/P9Ov2E7
 RKOP+aG5YSjUpjRlNWleaTBrk3u4yqv+mM+dDYmWEzdzn+JH/ze3UoOzI3N4pOQwy9B7FxkW3wT
 sDmisiBVtYTGdoo82oApjmutyu0OAyOSe/pLokoJrc+3fC3ww8
X-Received: by 2002:a05:6000:290d:b0:434:24ae:f687 with SMTP id
 ffacd0b85a97d-4356997f729mr2006622f8f.6.1768545358307; 
 Thu, 15 Jan 2026 22:35:58 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569926ff1sm3268104f8f.13.2026.01.15.22.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 22:35:57 -0800 (PST)
Date: Fri, 16 Jan 2026 07:35:55 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Maxim Tarelov <tarelovma@yandex.ru>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20260116063555.GB554275@pevik>
References: <20260114192413.569151-1-tarelovma@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114192413.569151-1-tarelovma@yandex.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768545359; x=1769150159; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=haBaRCTz2nROHDBpcRZuOlCJGuLYKHEtYm82Kugkhj4=;
 b=OIRqzQ3VMKHVpOE+0tpXOdcMEQDtRFVwrNKzYxSBtpJovxWVesvPuPSc5S6Kb292/0
 7G/dnAOjGQidD6ksm66xLhjuXj81Dcy73DmP1RLgdho0aXYET19ogfA9oPFon9pjpVwf
 bIPAD+MloahvkHDT+Ambma4FdUR2y6n6ea5Bcb6J171i7o7LyuhyBkNZun0mzEBPKy8j
 7OaA1E/HLrzWdLN8V9Jm40O9lQl0I+vZgS+lHsgHHZwGydODcvnqWcPQHXsMyJtxrdXG
 zQ1LKYo3kfjEXbMpCYLvzp7lBn2AU2xTgDaJWjDeJyQoHSQbSYvupeIowJwldfsR2xXT
 paLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OIRqzQ3V
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: kirk needs
 python3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

[ Cc Julien and Thomas ]

> LTP project contains a number of scripts, such as kirk, which depend on
> python3, but not all boards _defconfigs enable python3 by default.

> To avoid errors like this:
>  # /usr/lib/ltp-testsuite/kirk
>  env: can't execute 'python3': No such file or directory

> we must explicitly enable python3 when selecting LTP.

> Signed-off-by: Maxim Tarelov <tarelovma@yandex.ru>
> ---
>  package/ltp-testsuite/Config.in        | 1 +
>  package/ltp-testsuite/ltp-testsuite.mk | 2 ++
>  2 files changed, 3 insertions(+)

> diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
> index 81dc9dffee..0ddc2fe02c 100644
> --- a/package/ltp-testsuite/Config.in
> +++ b/package/ltp-testsuite/Config.in
> @@ -15,6 +15,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
>  	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
>  	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_PYTHON3

I would prefer not to drag python3 for all people which want LTP.
There are a different ways to use LTP.

1) Preferred way to use kirk is to run it remotely. The main advantage is to to
detect test crashed the kernel, actually one of the reasons why we wrote kirk.
Also to reduce dependencies on SUT.

2) Run a single test (user wants to test sinle kernel/libc fix). Any LTP test
can be run just by executing it. Any runner (kirk or the old script runltp) is
to help using runtest files (and help with other tasks).

Moreover Buildroot has support/testing/tests/package/test_ltp_testsuite.py
where Julien adds kirk + BR2_PACKAGE_PYTHON3=y [1].

If this must be added differently, maybe a new option: "run kirk locally"
which would drag python3.

Also, I'm not sure if people are aware of support scripts (I did not know),
but I don't think anything can be done for it.

Kind regards,
Petr

[1] https://lore.kernel.org/buildroot/20251221180810.3770181-1-ju.o@free.fr/

>  	help
>  	  The Linux Test Project provides a huge testsuite for Linux.

> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index e4e3ff8717..c103ac9819 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -13,6 +13,8 @@ LTP_TESTSUITE_LICENSE_FILES = COPYING

>  LTP_TESTSUITE_CONF_OPTS += --disable-metadata

> +LTP_TESTSUITE_DEPENDENCIES += python3
> +
>  ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
>  LTP_TESTSUITE_CONF_OPTS += --with-open-posix-testsuite
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
