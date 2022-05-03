Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859AFC433FE
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2800B40B49;
	Tue,  3 May 2022 20:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6wfpwUClqne; Tue,  3 May 2022 20:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 282B540B3F;
	Tue,  3 May 2022 20:19:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AEE61BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7864340B3F
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Wo9UsvFjfVR for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:18:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E92540ABF
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:18:57 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k23so35549589ejd.3
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8c/431FkUkpuii4dmjfQI77v23BXbXkRrj3lrmm4Z3o=;
 b=VXnrpJYNCp0PhC2mti2fB5q5CNratuSKMvLhDqTOkCfMEgd/Tp/jm5suQ5NfMYlA4j
 OWoR8GSOIQDx4E/+1dHpOwD1QJDH4dKCeJPuhzbfz4upQsM5a4vJ5zMlikZnX4v2IEe5
 HQOOX315oXiO6HF9mHZoMk4MlBCtIQN0eCZPaa96QJuq+g60RO/fdEOVsxkXhTb0eYzB
 r1yQ1OKnLgr9pLcoKXrdnd/WbqfKcCZA1nvL+O4I9SnowQXCKfXGuvgmQuO1vO0/P2nT
 TaLmwMsDk2jSYEh3hcE3yOXHFyvvG6WC+HYOrcpeaadpU4mkFc5dWRsep3Eh/FoINZ9+
 oLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8c/431FkUkpuii4dmjfQI77v23BXbXkRrj3lrmm4Z3o=;
 b=6L2Xu70vTB3+h29yPjYTXxomxznLm4md2XsGEmd4Pb0rZrQ/3v3IrGzNvnHJ9rLpGo
 s27p/lcyrx19TX83SNs+0SRIjCt/mVY1dGvjEoYRZSUyOFwyUbH7jox/JMRm0GzxMhUY
 fbyapLLcB7nW/hy4pHcdFqwqq37VgDc5q0YwIXs1CiIYJ2d1z5TPDhyqjWg7A2pV4Csv
 d7Kult0Z4Gk9IkCX6Yxj6zvJ0wSoJ3ERKH0XKj7W1xbHU94m+Hq4A2Oq2aN9JQAsdYjq
 u9paeEUctienv0Nwz4l0cOf3pWnvAMAI9ZGUNerJ6HqzeuEwv+X68Q318Ax8A7Lfe95x
 jcQA==
X-Gm-Message-State: AOAM531yf9Bo329VRrG/aeJf273hoPKQBPdlHMuT7Z3nz8PkK/VmLo9R
 4MOFR7z4CyeYzsRh2KroYUeu0A==
X-Google-Smtp-Source: ABdhPJxw5AonTDoXhh3crsXsRinf6Thv9JVsJnF8LALBzNz6VIl0wtYuIbOCpa6zaKV12wEDiij5Xw==
X-Received: by 2002:a17:907:7618:b0:6f3:9722:3dd1 with SMTP id
 jx24-20020a170907761800b006f397223dd1mr12113014ejc.424.1651609135603; 
 Tue, 03 May 2022 13:18:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jz24-20020a17090775f800b006f3ef214de1sm4911765ejc.71.2022.05.03.13.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:18:54 -0700 (PDT)
Message-ID: <fe414936-9124-2cb6-5c0c-58449aad6b0e@mind.be>
Date: Tue, 3 May 2022 22:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220502220919.1313508-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502220919.1313508-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v5 1/1] package/python-pillow: fix
 pkg-config search paths
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2022 00:09, James Hilliard wrote:
> Currently pillow doesn't correctly search pkg-config system paths
> for some libraries which can prevent some libraries from being
> properly detected/enabled in pillow.
> 
> This is due to pillow implementing custom header validation
> checks which need system paths present to function correctly:
> https://github.com/python-pillow/Pillow/blob/9.0.1/setup.py#L633
> 
> Removed custom BUILD_CMDS and INSTALL_TARGET_CMDS which were
> causing python-pillow to be installed for the host, they are
> not required, we just need to set build_ext at the start
> of PYTHON_PILLOW_BUILD_OPTS instead.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v4 -> v5:
>    - use backported upstream patch
> Changes v3 -> v4:
>    - pass BUILD_OPTS to INSTALL_TARGET_OPTS
> Changes v2 -> v3:
>    - actually remove MAX_CONCURRENCY env variable
> Changes v1 -> v2:
>    - remove unrelated MAX_CONCURRENCY env variable
> ---
>   ...Search-pkg-config-system-libs-cflags.patch | 33 +++++++++++++++++++
>   package/python-pillow/python-pillow.mk        | 23 +++----------
>   2 files changed, 37 insertions(+), 19 deletions(-)
>   create mode 100644 package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> 
> diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> new file mode 100644
> index 0000000000..d0552ce0f4
> --- /dev/null
> +++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> @@ -0,0 +1,33 @@
> +From 9ea46247048f861f088f09541cd434aeb16e6f9c Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Tue, 15 Mar 2022 23:31:59 -0600
> +Subject: [PATCH] Search pkg-config system libs/cflags.
> +
> +We need to search the system paths as well from pkg-config for
> +some packages to be found properly.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[james.hilliard1@gmail.com: backport from upstream commit
> +9ea46247048f861f088f09541cd434aeb16e6f9c]
> +---
> + setup.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 9a05e5105..d41aedbd6 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
> + def _pkg_config(name):
> +     try:
> +         command = os.environ.get("PKG_CONFIG", "pkg-config")
> +-        command_libs = [command, "--libs-only-L", name]
> +-        command_cflags = [command, "--cflags-only-I", name]
> ++        command_libs = [command, "--libs-only-L", "--keep-system-libs", name]
> ++        command_cflags = [command, "--cflags-only-I", "--keep-system-cflags", name]
> +         if not DEBUG:
> +             command_libs.append("--silence-errors")
> +             command_cflags.append("--silence-errors")
> +--
> +2.25.1
> +
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index 901876e0ee..1d99f44fa1 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
>   PYTHON_PILLOW_CPE_ID_VENDOR = python
>   PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
>   PYTHON_PILLOW_SETUP_TYPE = setuptools
> -PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
> +
> +PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
> +PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
> +PYTHON_PILLOW_INSTALL_TARGET_OPTS = $(PYTHON_PILLOW_BUILD_OPTS)
>   
>   ifeq ($(BR2_PACKAGE_FREETYPE),y)
>   PYTHON_PILLOW_DEPENDENCIES += freetype
> @@ -68,22 +71,4 @@ else
>   PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
>   endif
>   
> -define PYTHON_PILLOW_BUILD_CMDS
> -	cd $(PYTHON_PILLOW_BUILDDIR); \
> -		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> -		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> -		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> -		$(PYTHON_PILLOW_BASE_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)
> -endef
> -
> -define PYTHON_PILLOW_INSTALL_TARGET_CMDS
> -	cd $(PYTHON_PILLOW_BUILDDIR); \
> -		PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> -		$(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> -		$(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> -		$(PYTHON_PILLOW_BUILD_OPTS) install \
> -		$(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
> -		$(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
> -endef
> -
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
