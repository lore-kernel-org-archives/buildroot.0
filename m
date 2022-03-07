Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8963FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0325860C19;
	Mon,  7 Mar 2022 21:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-xp98aw2psI; Mon,  7 Mar 2022 21:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F7960D87;
	Mon,  7 Mar 2022 21:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5104E1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CFB0404B9
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZYf-xSt7QLg for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:45:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09AA7404B0
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:45:34 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y12so8320745edt.9
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bslLtTXqV6Ea/FkoKBzuA1LGNdppFKfn/m5XuBqwd80=;
 b=YDbIlFcLlN1IVmy/gpgLB1PhAocgCciRUok9ambAzI9rs3cjRy0jMJgoKtW9WcMOKQ
 6ZW41BkLjCzQ/Qy5h1rIoIqWimTb7BNA/iisIFkuNB9YRRX+i3u3TS7GjYScsyHlJ9jX
 FKMKNPPxSGBQrtul7wOrM9OKaRHm+v0gZUffOlASZfzOoHo4m+lmfycb3MM+JL2rHucy
 afkvq6gLPPq1JrCToiHPhvEcbj3UOEMA3FO1axJUoWXs7YdmdQmE4Bk4xxhK4TAAHsoX
 daa8JUUqb4yCN6Nli4FaHSK6gQ0vPOi74bhyvKwH07p03MpfinPUOm4GujjMIud6Q2XQ
 e0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bslLtTXqV6Ea/FkoKBzuA1LGNdppFKfn/m5XuBqwd80=;
 b=NOXr4Sm5C2wH1tmWdpZfEqU4BaDfJGNAqjLxHZ5/ex9NIHtgk8g1mOKmWZ9/YJROdI
 7YjTsMM1rtdqcGJNGdK77RXpDRNLwIHrWg3lkpcoEIJywYDFSdEoBdqq3MB6H1/yNF1c
 Mf6rwInaWAb+yZ38sX8EvPT3VDhClHGPaXZnzGG7bUefzFvqSZmYwXMEa25V8tK51SuD
 /y7I7xQLmSHM/7wfejWPFOOCEKUnYnb+v+Hk7blB5CByCH0k5Dj5uTm/At2TJhOscE9f
 bli/4vTeqHjqdnt1nx7Q+9Rh7T0M5ceyZRQ4HBgEmxXZFQYHbipsl+zI3IpfSAYJ1VC8
 3oUw==
X-Gm-Message-State: AOAM5301Ii75BXK6nlxfqVOGwktNZ8LUvq/SBVSp8Jh6MLDnov/kaEgz
 rPABD4XNOd6DN2Fyl42CMBG00g==
X-Google-Smtp-Source: ABdhPJztmlBvUOMucxPHoGa0m+pqka0ea/L8Re4P/0YX78KgOrtNyqZRNkhdM4N5+wX8a1mW2EPzJQ==
X-Received: by 2002:aa7:d80f:0:b0:410:d5c3:f770 with SMTP id
 v15-20020aa7d80f000000b00410d5c3f770mr12948839edq.279.1646689533046; 
 Mon, 07 Mar 2022 13:45:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm5130442ejd.217.2022.03.07.13.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:45:32 -0800 (PST)
Message-ID: <42500a6f-bd28-a8b0-68fe-c9098fe64153@mind.be>
Date: Mon, 7 Mar 2022 22:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220218102719.693274-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220218102719.693274-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python: fix headers install
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/02/2022 11:27, Fabrice Fontaine wrote:
> For an unknown reason, installation of headers is broken since commit
> 7c1bb5c2bfdc9d726c41a66b30b7aa8e759c6596 which sets _PYTHON_PROJECT_BASE

  I've been trying to understand and I don't really understand what is going on 
either.

> As _PYTHON_PROJECT_BASE value seems correct and fix its own build

  This still looks fishy to me though :-(

  Still, we need to fix this somehow and this patch indeed fixes the issue. 
Therefore, applied to master, thanks.

  Regards,
  Arnout


> failures, use --install-headers to set install path for headers and
> avoid the following build failure with python-greenlet or python-pygame:
> 
> python-greenlet: installs files in /home/peko/autobuild/instance-0/output-1/target//home/peko/autobuild/instance-0/output-1
> 
> python-pygame: installs files in /home/peko/autobuild/instance-1/output-1/target//home/peko/autobuild/instance-1/output-1
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f5b52dee7e72f0a1f72b9f87723bc585743c7b31
>   - http://autobuild.buildroot.org/results/9eb2685d32756864000e1b38f8a183b57f6ea528
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/pkg-python.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index b8dc9cd9e5..c4e590bd70 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -51,10 +51,12 @@ PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
>   	--executable=/usr/bin/python
>   
>   PKG_PYTHON_DISTUTILS_INSTALL_TARGET_OPTS = \
> +	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--prefix=/usr \
>   	--root=$(TARGET_DIR)
>   
>   PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
> +	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--prefix=/usr \
>   	--root=$(STAGING_DIR)
>   
> @@ -81,12 +83,14 @@ PKG_PYTHON_SETUPTOOLS_ENV = \
>   	_python_exec_prefix=/usr
>   
>   PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
> +	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--prefix=/usr \
>   	--executable=/usr/bin/python \
>   	--single-version-externally-managed \
>   	--root=$(TARGET_DIR)
>   
>   PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
> +	--install-headers=/usr/include/python$(PYTHON3_VERSION_MAJOR) \
>   	--prefix=/usr \
>   	--executable=/usr/bin/python \
>   	--single-version-externally-managed \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
