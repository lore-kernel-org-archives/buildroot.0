Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8F2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9156340912;
	Sat,  8 Jan 2022 16:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oWC82IdzorWO; Sat,  8 Jan 2022 16:59:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8F644090C;
	Sat,  8 Jan 2022 16:59:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 524A01BF20D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FCFD60A9B
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JU6dwh59Vw7h for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3296B60745
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:59:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v6so17558866wra.8
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=DPUGfde/ZsXX5Ai/Jll1YguTfpwW5SOLdrMLdvFDhx0=;
 b=V5k9zjpsENfE0cFlTFbTgqQQRiUpWZ5IBE8VkkZiihhvOJRV5ow06Q47qV8N1DHIZr
 C3JUZpC23CjaHhWn5PpIUtH95d++rGKxo4EwgLKWWb+AZrtoYH8Bw75Z/m8xwWW3x/nX
 RO8ZPOU+36BFYOqlhETuXs9Us9HOJvoLZhvqEz4xyOU/HXI1RrsdfnROGSv3bmdzknBl
 6Ye0TW8B0/hWfbsHyESkBNdH3NC6IoduoYpvTocP0uQF31pjtccJ4bYlZAHA4SeT+05y
 A5Iovr0V41kIgvl3s5rixz0wX4dEejecsu7BqCNuZifoXFcp6v97pI56FTE5XKUUMVH4
 p8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DPUGfde/ZsXX5Ai/Jll1YguTfpwW5SOLdrMLdvFDhx0=;
 b=qZFdHXG3Fh3VhmH322jySfvSeQcNbTDeylh7q7s0oZ6D5wd+zcIYk28QmCHtkQoy06
 9h7dCYBKQ/tME/kDGjULDAhaKM2/zRP78pSsz7eBxKgga7sQ1w4diFm494A3y9a5d17v
 R3s9lmukfOC+pAw3ZaRTUrcBNxKElGXqzEPJswVPr9EReTpbg/vxN0zL7qg/Ehcv9Yq0
 u2IrZq3fhPtDg9N5stLLVrGG2r27VUhxa2QEBQqRE+5MFo0IYXU8Vx5sRvbyYzbHYsh9
 atH2kyBNlULGyCQLIWjD3g2tUrtfyCMq4QFlEQMR7HO5YQDDqi/fy4Xv0mahbe6/idK2
 USDg==
X-Gm-Message-State: AOAM532jI95bwj19JiC8WkPZ321Hvgf8QAhvzbclym9BEQQSJ0nFKMGX
 g2MstgvxebeDmliC0LkMnF8hxw7mobEEzdNu
X-Google-Smtp-Source: ABdhPJzBwr64xJ3r2VFxG0x9EoH8wFNnFlmKqMcycwPUAWF4cIkFHnhBY6TyX80Rj2v3sVTRGusjTQ==
X-Received: by 2002:a05:6000:15cd:: with SMTP id
 y13mr59358928wry.28.1641661144409; 
 Sat, 08 Jan 2022 08:59:04 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id c7sm2263956wri.21.2022.01.08.08.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 08:59:03 -0800 (PST)
Message-ID: <5bd067df-5e7b-1248-7dad-bf790a57ee68@mind.be>
Date: Sat, 8 Jan 2022 17:59:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20201024145750.267540-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20201024145750.267540-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-memory-profiler: new
 package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/10/2020 16:57, Asaf Kahlon wrote:
> A module for monitoring memory usage of a python program.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  A bit late, but: applied to master, thanks. Sorry it took so long.

  Regards,
  Arnout

> ---
>   package/Config.in                                  |  1 +
>   package/python-memory-profiler/Config.in           |  8 ++++++++
>   .../python-memory-profiler.hash                    |  5 +++++
>   .../python-memory-profiler.mk                      | 14 ++++++++++++++
>   4 files changed, 28 insertions(+)
>   create mode 100644 package/python-memory-profiler/Config.in
>   create mode 100644 package/python-memory-profiler/python-memory-profiler.hash
>   create mode 100644 package/python-memory-profiler/python-memory-profiler.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 504cfec98e..4da49ad179 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1037,6 +1037,7 @@ menu "External python modules"
>   	source "package/python-matplotlib/Config.in"
>   	source "package/python-mbstrdecoder/Config.in"
>   	source "package/python-meld3/Config.in"
> +	source "package/python-memory-profiler/Config.in"
>   	source "package/python-mimeparse/Config.in"
>   	source "package/python-mistune/Config.in"
>   	source "package/python-modbus-tk/Config.in"
> diff --git a/package/python-memory-profiler/Config.in b/package/python-memory-profiler/Config.in
> new file mode 100644
> index 0000000000..60833304ae
> --- /dev/null
> +++ b/package/python-memory-profiler/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_MEMORY_PROFILER
> +	bool "python-memory-profiler"
> +	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
> +	help
> +	  A module for monitoring memory usage of a python program.
> +
> +	  https://github.com/pythonprofilers/memory_profiler
> diff --git a/package/python-memory-profiler/python-memory-profiler.hash b/package/python-memory-profiler/python-memory-profiler.hash
> new file mode 100644
> index 0000000000..9ee515b529
> --- /dev/null
> +++ b/package/python-memory-profiler/python-memory-profiler.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/memory-profiler/json
> +md5  b1d1783064a1198fb21bc877e535ec1b  memory_profiler-0.58.0.tar.gz
> +sha256  01385ac0fec944fcf7969814ec4406c6d8a9c66c079d09276723c5a7680f44e5  memory_profiler-0.58.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256  51926ce91b8283532efa9dfb02518582c15f49c105a3ac18cce1f7a4947e96ae  COPYING
> diff --git a/package/python-memory-profiler/python-memory-profiler.mk b/package/python-memory-profiler/python-memory-profiler.mk
> new file mode 100644
> index 0000000000..053b0e2d62
> --- /dev/null
> +++ b/package/python-memory-profiler/python-memory-profiler.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-memory-profiler
> +#
> +################################################################################
> +
> +PYTHON_MEMORY_PROFILER_VERSION = 0.58.0
> +PYTHON_MEMORY_PROFILER_SOURCE = memory_profiler-$(PYTHON_MEMORY_PROFILER_VERSION).tar.gz
> +PYTHON_MEMORY_PROFILER_SITE = https://files.pythonhosted.org/packages/8f/fd/d92b3295657f8837e0177e7b48b32d6651436f0293af42b76d134c3bb489
> +PYTHON_MEMORY_PROFILER_SETUP_TYPE = setuptools
> +PYTHON_MEMORY_PROFILER_LICENSE = BSD-3-Clause
> +PYTHON_MEMORY_PROFILER_LICENSE_FILES = COPYING
> +
> +$(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
