Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63F2C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 07:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E102400EF;
	Mon,  6 Dec 2021 07:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTiCh3OFgfhD; Mon,  6 Dec 2021 07:45:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 023CD4016A;
	Mon,  6 Dec 2021 07:45:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4BD271BF427
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 07:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 485A082CCA
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 07:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eAeUv8IzJvNw for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 07:45:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 360E482CB7
 for <buildroot@busybox.net>; Mon,  6 Dec 2021 07:45:35 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r25so38958046edq.7
 for <buildroot@busybox.net>; Sun, 05 Dec 2021 23:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5WSdKBwoSV8oHggO7vWeG8jfqJsN3QWNqpftGNKOhA8=;
 b=eWgWXbkUtTEOdcvvs9c5CadY2G9OFOJo93LxLIUB0NzD6ya0ou123IzmMHGWAL9+uF
 KnrtJR3Ow1GAZQtPzN8NzVUTUzXov6ZR0xArOCO9rHSCSOijnwTFoeoHtWFESTPtS838
 cVj9HbTAdurKuFo1wQHq4lYfMMSWJnUXO1ga1WDbMuKETlUk/fg8Vysr5XUvyUPUPQ/k
 R7V2WxZyC3El2m1jjRAevchS+KyLHUrq6qYVNL6HM+WHxaa1B+HOnUXrWw7jLtzFW2iC
 TKTJntb2IVmxcNf93TSnn2HNvea52aY+PX4Jlvq4ScOENqkGYcPUF87xycHWNrGXJ0tg
 I2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5WSdKBwoSV8oHggO7vWeG8jfqJsN3QWNqpftGNKOhA8=;
 b=w73QnE0/+5QIyIW/cZC+3bCXPJcaV5o9EICeIggK7Mlh/LohtaTb9C4nSSiPuC42Mh
 E7j5UpEXwlB1UKHrqUTS94u83cajm4Ug7Tkrtxzqgxg+AWfY9bWMgxyeGzT5fv9dDCVm
 lRgg1077uSbiQ5barSCukNgT6THXO+hfc2BpFoYWDULGwU+DGngxWFFj7hwOFZXbo536
 VGSc6NjoD9iUfHrjqcYnr90P6Or7TSiKePIJOL7TMcI08v32bssD4zd2x9CdKmyOuU8I
 123CC3YTtROhIcTGrv9eO9d2dbxhWdV6rHjy1mgJZOshvm24jWJHL7t6h96z/7tkftwr
 zobw==
X-Gm-Message-State: AOAM532MhNRjNK7KOXAS+DBQK9Q1IEJL1nPOyaB3shNvCABAQ9ckhaaP
 FEYxtlr/dNl5qi3qXeCaxDygUg==
X-Google-Smtp-Source: ABdhPJxCTpjaP06LM7Zp9HhZ51dxogJFGdYdXDaYr6Z1K5B5xSARKRJLEG/+DSq2kmMCTGmODLIXwQ==
X-Received: by 2002:a05:6402:270c:: with SMTP id
 y12mr51742607edd.258.1638776733849; 
 Sun, 05 Dec 2021 23:45:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gb42sm6350057ejc.49.2021.12.05.23.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Dec 2021 23:45:33 -0800 (PST)
Message-ID: <1e21be4a-2465-e5c9-f775-0430cd3b0cf1@mind.be>
Date: Mon, 6 Dec 2021 08:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: guillaume.bressaix@gmail.com, buildroot@busybox.net
References: <20211205204720.2831-1-guillaume.bressaix@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211205204720.2831-1-guillaume.bressaix@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pybind: fix upgrade to
 version 2.6.1
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
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Guillaume,

  This is still looking fairly weird to me...

On 05/12/2021 21:47, guillaume.bressaix@gmail.com wrote:
> From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> 
> The python 'setup.py' script needs header files
> in $(@D)/pybind11 to work since v2.6.1, and these files
> are created by an internal minimalist cmake build.
> 
> fixes http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d

  Nitpick: to make it appear with the fixes tag in patchwork or in the summary 
that Peter makes, you have to format it like this:

Fixes:
     http://autobuild.buildroot.net/results/b89f1de64b308dffa73675f1f31ccb0b7be5a10d
     http://...

> fixes http://autobuild.buildroot.net/results/d0287b7f64f206b0f074908c5780a3632e0cb799
> fixes http://autobuild.buildroot.net/results/27efb545a5a719a5581c8f746d3a3555ff4216ce
> fixes http://autobuild.buildroot.net/results/d2f0a0ad8f6c7178517df109e7d885dac9134c3a
> fixes http://autobuild.buildroot.net/results/b57e9a3279260dae4a590f9421238fcabb2f7cab
> fixes http://autobuild.buildroot.net/results/515e6f2fc6b5780260d98d6bb52b541ce4bf1afe
> fixes http://autobuild.buildroot.net/results/d89c4ecc81222d4f80c951da2232d2e393fa1c69
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> 
> ---
> This remains a python-package.
> 
> 'python setup.py' actually hardcodes a system call to cmake,
> which seems dirty at first.
> Fortunately, if we have CMAKE ENV, all BR variables are retrieved.

  I don't see CMAKE_ENV anywhere in Buildroot, or in this patch.

  Also, I don't think there's any way to tell CMake about "all BR variables" 
other than passing a toolchainfile (with -DCMAKE_TOOLCHAIN_FILE=...). Are you 
sure that it's really building correctly for the target?


  Regards,
  Arnout


> I think they made this cmake call to make setup.py self sufficient.
> 
> ---
>   package/python-pybind/python-pybind.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
> index a6a1bdb976..080586a877 100644
> --- a/package/python-pybind/python-pybind.mk
> +++ b/package/python-pybind/python-pybind.mk
> @@ -9,5 +9,11 @@ PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
>   PYTHON_PYBIND_LICENSE = BSD-3-Clause
>   PYTHON_PYBIND_LICENSE_FILES = LICENSE
>   PYTHON_PYBIND_SETUP_TYPE = setuptools
> +PYTHON_PYBIND_INSTALL_STAGING = YES
> +
> +# every single 'python setup.py' call actually calls cmake
> +# to populate $(@D)/pybind11 with .h and build requirements.
> +# If we have a HOST_CMAKE_ENV, then installation paths are properly defined
> +PYTHON_PYBIND_DEPENDENCIES = host-cmake
>   
>   $(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
