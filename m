Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11020C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAF5A40010;
	Fri,  7 Jan 2022 21:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJSCw-borpIJ; Fri,  7 Jan 2022 21:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B395C424C0;
	Fri,  7 Jan 2022 21:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 308AF1BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E6598177A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fw9fhaAtCKd4 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1528581779
 for <buildroot@busybox.net>; Fri,  7 Jan 2022 21:55:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w20so13500795wra.9
 for <buildroot@busybox.net>; Fri, 07 Jan 2022 13:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x4WjhQkvk+yCD6Tr5al0ONf2PEgJp5+FFEm2IyGZ+4o=;
 b=ZXIU7V2fzuMKjics+T+XyFEwPOq4urvt386BFW5Ykb6EgrWD2y5dWERI/Te4D4RgjT
 3RO0yFRuK3jc+gn8uxUaZS9m5xVwyAuyVYqW/acO0hf5vCyAISTrzjJdZqBxTkQGXMLq
 tWfAjxj8LzTRE9zTii4sC+srfRK7HgcdukPFxRFg3zEnzIvFjkdYArs3RXy9Xpiwv4r3
 EQG+o/QV65L/KjALY/SsXA/j6u5FrZHXF9nJyYHA4tHjJCGVDyuG6iBhqa9cGm16J9le
 ctlshnTX2+ifQlHF3XsxRII8VOzbiqWC/ip8znaUqmUCBZ4m8c6ALAavm3j6+WpK+Ov9
 B31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=x4WjhQkvk+yCD6Tr5al0ONf2PEgJp5+FFEm2IyGZ+4o=;
 b=BYPpg2V65GbMxh4j5lKt7JWppXGK3xRqL+p+pZeDemgbKSyscRWNzwEYfNhdvsRlXK
 sZl31UBSs2Kax6biuuMsk1SD0Ryk8jS47vMbPmhQc6FUzqVZbhDIOIYomjKjUW09FMZr
 nSP1v/JcBoMMh4YT9v3mS5zvLEMrHJF0E12QzAO441EKC3ssuLejgi0P90eY2qpAwtpY
 KUDW6F2o2EhTDsybOKD65hGA88cz6KINdarNSXT/Q8S2vFTFX4vujM0IZ+bomyBQmM+Q
 YaFoo9o8J1CAa9tsuTLkrUnXSl2/afp3Dmeh4Exu9koWtG4sNwrLBkAhUMNbnYcQiqFF
 IooA==
X-Gm-Message-State: AOAM530fXhHc8UAbnU7zd8YG/ZwqpftDc+yg3KoC6uaO03a4IZpdeLsK
 q3gxR0MPts1RNix5V0oXdfjinA==
X-Google-Smtp-Source: ABdhPJypVG0qslymt1qVcJTV9Jun6HPweN8yemKxMxQvsmpx9WIL4ud0nwhy+7Z0HmAmrF967UsGsA==
X-Received: by 2002:adf:f282:: with SMTP id k2mr12701419wro.307.1641592525291; 
 Fri, 07 Jan 2022 13:55:25 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id o29sm4413929wms.3.2022.01.07.13.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 13:55:24 -0800 (PST)
Message-ID: <dbb21893-4789-8c58-c49c-e47b180ed8f2@mind.be>
Date: Fri, 7 Jan 2022 22:55:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Andreas Naumann <dev@andin.de>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, guillaume.bressaix@gmail.com
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
 <20211206215730.GE2603@scaer> <7d360d46-e4e5-bbf4-80a9-d5e1ff6a3ea1@mind.be>
 <ce501294-679b-fdbd-957e-de1a7cdb9ff9@andin.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <ce501294-679b-fdbd-957e-de1a7cdb9ff9@andin.de>
Subject: Re: [Buildroot] [PATCH v2 1/2] package/python-pybind: fix upgrade
 to version 2.6.1
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/12/2021 12:19, Andreas Naumann wrote:
[snip]
> By chance I was playing with such a package just yesterday: zxing-cpp. Not the 
> version buildroot uses (from github glassechidna), but the nu-book one which 
> claims to be faster. (And is the one where the python bindings in the PyPi 
> package zxing-cpp originate from).
> 
> Until recently they shipped their own pybind11 version, which throws an error 
> when included in a cmake project in a crosscompile environment. This is a known 
> problem, https://github.com/pybind/pybind11/issues/2139 but non of the proposed 
> fixes has been merged yet.
> 
> However, the unreleased master version of zxing-cpp hast been changed so it can 
> be configured to use the a system pybind11. So I tried to include the br 
> packaged one (2.6.1 as well as 2.8.1). They both built on my system (no problem 
> with the hardcoded host cmake here) but I needed to change three things:
> 1. Add PYTHON_PYBIND_INSTALL_STAGING = YES
> 2. Set ZXING_CPP_CONF_OPTS += 
> -Dpybind11_DIR=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pybind11/share/cmake/pybind11 
> 
> 3. Apply one of the proposed fixes for the pybind11 crosscompile problem (to 
> tools/pybind11Tools.cmake)
> 
> So this patch here seems to help my (and possibly others) because 1. is already 
> included. If interested, I could send a patch for 3.

  I applied a slightly different approach to master [1]. If you'd like to give 
that one a go, we'd welcome an updated zxing-cpp package!

  Regards,
  Arnout

[1] 
https://git.buildroot.org/buildroot/commit/?id=a19b822239c36cb40a632899bb5c3e848a5fc81e

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
