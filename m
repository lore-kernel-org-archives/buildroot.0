Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB96DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 21:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 913B7404BD;
	Thu,  6 Jan 2022 21:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M9Sm9NRufvG5; Thu,  6 Jan 2022 21:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 914BB40B9C;
	Thu,  6 Jan 2022 21:08:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D32F01BF38A
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF0A76FB82
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nkg3FDJMQ3Cn for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 21:08:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9AB460E07
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 21:08:45 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i22so7208477wrb.13
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 13:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SsNdfBue4j7gz6//Wz2TWUpN7pfBaJFaxdkb50/IMQA=;
 b=hoXtDrUT5H3/ysuyRI7k34dWYYzo+Ko56O6qRHBVysXQjxKufIwp1VxZSaI+GnZ8k5
 GQOSGTK7o0FV44VE0m39ZGO3mW+UPHENXB4/i26vb8eRMrBI314ylmRD6UEXeB1OT7jx
 SQ8NpTWf8n5bSzYB5N0gigJZp5ikRML+i3xF8sCrV9qTqLtrY/3SIzUQs79Ee50t1sVN
 nETsRljNT5vDJqO1fXcrpnzFDwq98LK11zbm7WUcPQHYqxMHfWkIjjz5BmDsPDZzDvSS
 mg6sz9PNjS0XHXPPasxxm9USL5vTk2IXFjNCqVRHJfphIqTHHgd9VzCX3Fo58GPAsCJx
 Hp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SsNdfBue4j7gz6//Wz2TWUpN7pfBaJFaxdkb50/IMQA=;
 b=5PAzvwt5mOEzBBpHoJMuARCH8ykQzD+GPuFsdrEPLLm3xhxfsnNoCcoizhwIhsb9I7
 auAef1rMbgtaPtkpQKJALlGIwKzGz3sVOO9jkz7J4sC6BrXhk+DZ0SuN+bIEpwDZNbbj
 wGrcMWgXxZuu6+3Blc5ayD2KvC92g3YA02lnUUC0gvxLEksY4f9A7+hUbw1Ko48I8bTf
 5MjFQ5N/mtoiPQAwaV5CUtzXsj1grDLE2qVXrJr4r4kKv1GlPZ9UZbuIfDkWBf1YR6qJ
 uCBLbHMKwtody0brOSQWUF1bGxvPuhEsLOlfR+PrixItpWfStIq1PgVL1HuIRrqA0Fxc
 576A==
X-Gm-Message-State: AOAM533alR+CNRrzmJoKTqwLjbyh0AO+GyQw/116i5Wg0yitk63/kAhh
 eCpIdfsf2kB2Ui0yZwIlwJla5k8yG4rElpnq
X-Google-Smtp-Source: ABdhPJxUgJAKXtWDpRbWTFUVNAdc0AENyi/WSpg6aWPsPa3urZrRxCp7vJmvgZRwZtiXLZ97e0nnfQ==
X-Received: by 2002:a05:6000:107:: with SMTP id
 o7mr8515581wrx.546.1641503324047; 
 Thu, 06 Jan 2022 13:08:44 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id b14sm3140816wrg.15.2022.01.06.13.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 13:08:43 -0800 (PST)
Message-ID: <ee149324-ace5-6c00-c40c-5471666abed8@mind.be>
Date: Thu, 6 Jan 2022 22:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Frank Vanbever <frank.vanbever@essensium.com>, buildroot@buildroot.org
References: <20200228163917.10596-1-frank.vanbever@essensium.com>
 <20200311105447.23808-1-frank.vanbever@essensium.com>
 <20200311105447.23808-3-frank.vanbever@essensium.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200311105447.23808-3-frank.vanbever@essensium.com>
Subject: Re: [Buildroot] [PATCH v3 3/4] package/python-iptables: use
 installed iptables by default
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/03/2020 11:54, Frank Vanbever wrote:
> python-iptables depends on ctypes.util.find_library() which does not work due to
> the absence of gcc and friends on target. The location of the xtables library
> and the iptables modules can be configured through environment variables. Within
> the scope of buildroot we can determine what these should be at build time and
> replace the calls to os.getenv() with the correct value.
> 
> Fixes: https://bugs.busybox.net/show_bug.cgi?id=12271
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>

  This one had fallen through the cracks. I finally applied it to master.

  To verify that it really solves a bug, I also added a runtime test which 
indeed fails without this patch.

  Regards,
  Arnout

> ---
> v2 -> v3:
>   - None
> v1 -> v2:
>   - Remove unnecessary continuation in pre-build hook
>   - Change sed separator to %
> 
> Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
> ---
>   package/python-iptables/Config.in          | 2 +-
>   package/python-iptables/python-iptables.mk | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-iptables/Config.in b/package/python-iptables/Config.in
> index a35577bad3..0e24283d06 100644
> --- a/package/python-iptables/Config.in
> +++ b/package/python-iptables/Config.in
> @@ -1,7 +1,7 @@
>   config BR2_PACKAGE_PYTHON_IPTABLES
>   	bool "python-iptables"
>   	depends on !BR2_STATIC_LIBS
> -	select BR2_PACKAGE_IPTABLES # runtime dependency
> +	select BR2_PACKAGE_IPTABLES
>   	help
>   	  Python bindings for iptables.
>   
> diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
> index 66e478a89a..38c6ee3950 100644
> --- a/package/python-iptables/python-iptables.mk
> +++ b/package/python-iptables/python-iptables.mk
> @@ -9,5 +9,14 @@ PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/08/5e/16a5ca35c42
>   PYTHON_IPTABLES_SETUP_TYPE = setuptools
>   PYTHON_IPTABLES_LICENSE = Apache-2.0
>   PYTHON_IPTABLES_LICENSE_FILES = NOTICE
> +PYTHON_IPTABLES_DEPENDENCIES = iptables
> +
> +define PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
> +	XTABLES_VERSION=`awk '/XTABLES_VERSION_CODE/ {print $$NF}' $(STAGING_DIR)/usr/include/xtables-version.h`; \
> +	sed -i "s%os.getenv(\"PYTHON_IPTABLES_XTABLES_VERSION\")%$$XTABLES_VERSION%" $(@D)/iptc/xtables.py
> +	sed -i "s%os.getenv(\"XTABLES_LIBDIR\")%\"/usr/lib/xtables\"%" $(@D)/iptc/xtables.py
> +endef
> +
> +PYTHON_IPTABLES_PRE_BUILD_HOOKS += PYTHON_IPTABLES_SET_XTABLES_ENV_VARS
>   
>   $(eval $(python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
