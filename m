Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEB8EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DB8540578;
	Tue,  4 Jul 2023 20:52:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DB8540578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8mUMmOoCQUXr; Tue,  4 Jul 2023 20:52:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE83840576;
	Tue,  4 Jul 2023 20:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE83840576
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F4D1BF42E
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 322D281764
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 322D281764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypOOTlgMOsfp for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:52:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A157B8175A
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A157B8175A
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:52:03 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99364ae9596so314834266b.1
 for <buildroot@buildroot.org>; Tue, 04 Jul 2023 13:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688503921; x=1691095921;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=psbX1+yRmgaK9MuOBCdUgxfydGl9dsGxJx5F5/kixDE=;
 b=cB026DPobjlwhKs6PFxkT4MaULWILsV+YX6pvEe7VUuvlx2bMpIYzLxmuvFfq7nQtN
 JG/m4rzqz9YLgGFwO1RTHIGg9iQ53SwZzVYt9IC0j2fb0RTFl7ucU3la4wog6JGooenm
 4WzPUIW7bM/LxyUUiJO7Vd4l0Vdq7E2DBFQUVTx6X0ATmP8QrwZ7IaQIiTKI40ALORA/
 E0qGIjAUxONC0dueMMER4rk+zfp0hMgxfrmZRbD8yY7aQAogwsxijqodWzL/QsjvzBop
 vISGwj93qZnZRLvNFugMtjSFGtaU6l2m+S27/dDjxmemu2fRGlVPnCL054PwCXehhY0y
 AIQg==
X-Gm-Message-State: AC+VfDwc3LCOQF1otu3qmxNQSOlahDRldWoGxJlT17JScGNcm0Dropun
 eUEf8uqXcDA3zWXumqPRvrJmdeqaHuvCGp6EWKU=
X-Google-Smtp-Source: APBJJlE2+NYwYyO6V0/EGsWBYlHFNysR+xBozG4FJjkdXqi/O9nO5qRrdBOOkPhZsiUSAf9fWCs+xA==
X-Received: by 2002:a17:907:7671:b0:983:ba44:48af with SMTP id
 kk17-20020a170907767100b00983ba4448afmr9872849ejc.53.1688503921629; 
 Tue, 04 Jul 2023 13:52:01 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49?
 (ptr-9fplejo7y5h55ppcgnd.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:5bb6:c9e9:e89b:2c49])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a17090652da00b00992acab8c45sm7705061ejn.12.2023.07.04.13.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 13:52:01 -0700 (PDT)
Message-ID: <503759ef-8263-e971-cfdb-5d2d2c395c27@mind.be>
Date: Tue, 4 Jul 2023 22:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@buildroot.org
References: <20230626070536.311268-1-gwenj@trabucayre.com>
 <20230626070536.311268-2-gwenj@trabucayre.com>
In-Reply-To: <20230626070536.311268-2-gwenj@trabucayre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1688503921; x=1691095921;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=psbX1+yRmgaK9MuOBCdUgxfydGl9dsGxJx5F5/kixDE=;
 b=YkvYHThxM0KsovuMC4zPYDlJsA1dcYsVmaeP4B7klfuDSpQ8br7Afd8mw3CZJLLpRk
 8zV4YRcvF1iuCbQ6JztStO2Gb02RBBOcXvOYIgYkDbUhStWpHA/hXlmHM09PKSPbYIJx
 r+PYWJS0gQkig+Sk4oZyZIWBkOA2Hs1NoRdDthoq1UnzB6HBo7AuH0LdcoUW47Ll6jJr
 cFAxlNsjrtpUvBZAJrmcqtYRxdvVGl6LDfBnMs9jtsGPLarxCPGQ+pNZZeNAYNTQ+zTl
 9vHm8g9sGUWwO3mM9/LRv+9M9JtKRsZQj0/+jZN4lKLSXySAkzcx0/BNzRf9A5wWmdOA
 Fj7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YkvYHThx
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnuradio: fix gnuradio
 python libraries for cross-compile
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/06/2023 09:05, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> By default, module libraries have a suffix based on cpython version + host
> architecture: this is fine for a native compile when these libraries are used on

  I think that this is solved in the python infrastructure by setting

_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)"

Or it may be some other environment variable that is set. For sure though, the 
same problem would exist in normal python packages, and it is resolved there. So 
ideally we should use the same solution for gnuradio.

  Regards,
  Arnout

> the same computer (or similar computers). But when target architecture is not
> the same python is unable to find libraries due to the wrong suffix and produces
> unclear errors messages:
> 
> # python3
> Python 3.11.3 (main, Jun 19 2023, 14:15:44) [GCC 11.4.0] on linux
> Type "help", "copyright", "credits" or "license" for more information.
>>>> from gnuradio import blocks
> Traceback (most recent call last):
>    File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 18, in <module>
> ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
> 
> During handling of the above exception, another exception occurred:
> 
> Traceback (most recent call last):
>    File "<stdin>", line 1, in <module>
>    File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 22, in <module>
> ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
>>>>
> 
> By adding -DPYTHON_MODULE_EXTENSION=".so" at configure time, pybind11 will use
> this option instead of using host-python to forge suffix.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> ---
> Changes v1 -> v2:
> - replaces patch by PYTHON_MODULE_EXTENSION option (result is the same
>    but less "noisy")
> ---
>   package/gnuradio/gnuradio.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index 1453b78493..d7b3b86c31 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -119,6 +119,8 @@ GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
>   # mandatory to avoid pybind11 to overwrite variables provided
>   # by gnuradio and buildroot
>   GNURADIO_CONF_OPTS += -DPYBIND11_PYTHONLIBS_OVERWRITE=OFF
> +# force libraries suffix (avoid to have libxxx.PYTHONVER-HOST_ARCH.so)
> +GNURADIO_CONF_OPTS += -DPYTHON_MODULE_EXTENSION=".so"
>   # mandatory to install python modules in site-packages and to use
>   # correct path for python libraries
>   GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
