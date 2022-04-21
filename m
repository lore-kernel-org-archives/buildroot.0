Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB118C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 21:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8704083F98;
	Thu, 21 Apr 2022 21:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ic1OFn6pX8Kl; Thu, 21 Apr 2022 21:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920C684199;
	Thu, 21 Apr 2022 21:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 830541BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E69760FA7
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 21:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nn9Ngifa4CCT for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 21:01:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 596C660EC1
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 21:01:09 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y21so3932111wmi.2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 14:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xPIooLapNeuX9R5uUPRZmzJUdN4oF4O+XBn8suIVp/s=;
 b=dK2XEk/xzGXLjSomMVxF/Hjt6xo/RHjNnj0oH7LEtRyUFYrHYtBkieSaxeJd/9/cZV
 tEJ2FBzdywGsaWAbVaRmTLRN3FeRcs2OscageVmFunFu8eBFks0DPMyhUFi6ylyR3F6e
 ffwkjWHkyxsg9MEJNEy0oPizPE0zUV31eeNN6Zo75c88h68TjZUnbxEyxoSUkZ4jNDzu
 ij9IvLCiusMqwWJ9yokVfBU8k4EUQZSyaeRJeW1oaz4BNrQnfEUMgEDWCMMdMtB4z7dD
 UYfx+UNfR29oQCD+ug+FVj3G2sV8ExEeTrgdUSGW8UgqRKD+roFGDfBT+/+qDZUHioBV
 zIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xPIooLapNeuX9R5uUPRZmzJUdN4oF4O+XBn8suIVp/s=;
 b=aLRAes7XzGwSYT37eG4QwmZSrdSF1v3w71/vBdVbxWcp3cDZZsuHjdpq93Fy5XRAP7
 +aKB1ryb1Cbqdw9VHnbZ6vS/5wno9bF6x4fQGJeHwDTSzPNYPcdjUMX4iVkcu9c20Dbl
 4tqS/dvA8kshw/rkYVjS1ezU7rqAI17F5VsEZR5T+j3Bz0h3xA8hLDs4K1SUKMYT+7xl
 0hkOP/iiKRtvyN0o6D/jweFdq3+MgcyRID5sVX2tVcW0TFRQh9h3FzO7ugim2ai80Z6N
 9PDZ0rCBYI4sOBv1xq6SFv89v0i/zFMMU82MRjZEiWBnAuHVvF1QOD1bu4qrzxFrU95+
 oCqw==
X-Gm-Message-State: AOAM532MBaEWFs4+zF0/xRkbRFnJs+TLK1kVyvOKILOLXt3124NFNGQz
 Pnb44n53qEFCp1HY0f7xNGvfDA==
X-Google-Smtp-Source: ABdhPJzSsATM3SpXBsa1z3XZCY3T/tXvWRyjJIwbTjM5pvmLg8QG6PCWtnwWc6dGF2oVvadB4vPCIw==
X-Received: by 2002:a1c:a181:0:b0:392:8f7e:d2f8 with SMTP id
 k123-20020a1ca181000000b003928f7ed2f8mr1088141wme.30.1650574867592; 
 Thu, 21 Apr 2022 14:01:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056000186500b0020a8688963bsm104635wri.89.2022.04.21.14.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 14:01:07 -0700 (PDT)
Message-ID: <fa5ff7ac-2d37-5e94-d016-f96c8f7fde7f@mind.be>
Date: Thu, 21 Apr 2022 23:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220418113248.275783-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418113248.275783-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pybind: needs C++
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2022 13:32, Fabrice Fontaine wrote:
> python-pybind needs C++ since its addition in commit
> f42f2a63b3c5733dc56a58b18d6ba417a59d8342:
> 
> -- Check for working CXX compiler: /usr/bin/c++ - broken
> CMake Error at /nvmedata/autobuild/instance-24/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
>    The C++ compiler
> 
>      "/usr/bin/c++"
> 
>    is not able to compile a simple test program.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/90364b752bef3f7b4b1fd9181e21030349e0e529
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pybind/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/python-pybind/Config.in b/package/python-pybind/Config.in
> index 604cb9ee67..6e03cc62fc 100644
> --- a/package/python-pybind/Config.in
> +++ b/package/python-pybind/Config.in
> @@ -1,8 +1,12 @@
>   config BR2_PACKAGE_PYTHON_PYBIND
>   	bool "python-pybind"
> +	depends on BR2_INSTALL_LIBSTDCPP
>   	help
>   	  PyBind is a lightweight header-only library that exposes C++
>   	  types in Python and vice versa, mainly to create Python
>   	  bindings of existing C++ code.
>   
>   	  http://pybind11.readthedocs.org/en/master
> +
> +comment "python-pybind needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
