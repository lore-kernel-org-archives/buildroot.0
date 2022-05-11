Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C8EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 22:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17A4D83E64;
	Wed, 11 May 2022 22:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLNXilRYrDNX; Wed, 11 May 2022 22:05:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED2A883E55;
	Wed, 11 May 2022 22:05:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30C631BF417
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 22:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F982402DC
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 22:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key)
 header.d=threespeedlogic-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RA7r-C8FmkS4 for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 22:05:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1BEB4015F
 for <buildroot@buildroot.org>; Wed, 11 May 2022 22:05:10 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id x88so3473119pjj.1
 for <buildroot@buildroot.org>; Wed, 11 May 2022 15:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=F/TMxVLvHIpMKHW2ol8SsMH3xchnxNoPMqXB59cfwGY=;
 b=H2FGeKBbSM8V87SN3e0DAX2YBZJrNN60FxBLqh0iyRe0xIahBCInNw+zZ848KIisyX
 SFSGeCg+rzygJBWUhiPEDY5gPYGRIARpUx8keFkCtHSWFmbE24A8FMw+QhSIDQ4DtBCj
 ji5DJ5mq1dbNqdsDU+H4EeUkmkRjZa68+NbT7SzMHLG66FA4czetbyrx5gIK+OLfDRE1
 hVFIM2DC9GDLZIuJ10AXu8JE7pxF55ou7asOBJVeBIWi/R+bj1G2yivonKO5lRyMpQIj
 NTUpYuqKB3PNrduooJsIJMir8XfiV9OECWvth2alWd5o6YpE+vYMYfHLVK4QLJy/FSI8
 dFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F/TMxVLvHIpMKHW2ol8SsMH3xchnxNoPMqXB59cfwGY=;
 b=LJ76FS47h4tbKa3RtS/ic331fZdFxyPYXNR5tbLDu/tmDOgO2zpglmNLRuu7YuJDnf
 4MSKGCZZrxBCH3CAiPCYkCbMB3maDV9AUbrNh/mnEtQlT1wysIHVOXL6sJqLEopKA7PN
 IEkZNdD2a6DiQ9lr6cgmokQ0tiqmUUoHU/ItpTvd6j96yf4BZdGA4IdZX8tq4THT190P
 ew66SCO+8wmuDw59MmDzBIEn3SF5C9ai2h2xJ69C9OTwi4uZiT3L53bKt8MJDdKp8Uq2
 ahHKjuZeFSYnm1PGXt+jto2fesKWao55yJ66pW9R0pSp4GRXROTaLgxDbsN1FyOHQcxE
 es8Q==
X-Gm-Message-State: AOAM530kJYEQHE0PnUuRSC5GXNUK0dt9vaQjHn4JCcpglKMR2j0a8HX+
 gxSGkth4MLH0puuFc8hXR/mfYeqh5cH7Bg==
X-Google-Smtp-Source: ABdhPJxBOTt35iJIHKV0YFN+LG7njHFyk2xRYlUz+MLQTcVj4YywzC0B8lc4p0uGjwpglrII/dWvyA==
X-Received: by 2002:a17:90b:4b91:b0:1dc:3149:1749 with SMTP id
 lr17-20020a17090b4b9100b001dc31491749mr7571480pjb.46.1652306710243; 
 Wed, 11 May 2022 15:05:10 -0700 (PDT)
Received: from [192.168.0.164] ([104.246.196.44])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a17090302c200b0015e8d4eb23esm2366395plk.136.2022.05.11.15.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 15:05:09 -0700 (PDT)
Message-ID: <5ac63275-e552-3d1c-5ce1-521afbe86173@threespeedlogic.com>
Date: Wed, 11 May 2022 15:05:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220509221055.335263-1-james.hilliard1@gmail.com>
From: Graeme Smecher <gsmecher@threespeedlogic.com>
In-Reply-To: <20220509221055.335263-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-maturin: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

On 2022-05-09 15:10, James Hilliard wrote:
> This is pep517 pyo3 build backend that's an alternative to
> python-setuptools-rust.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Tested-by: Graeme Smecher <gsmecher@threespeedlogic.com>

best,
Graeme

> ---
>   .../0001-Fix-invalid-pyproject.toml.patch     | 62 +++++++++++++++++++
>   package/python-maturin/python-maturin.hash    |  5 ++
>   package/python-maturin/python-maturin.mk      | 20 ++++++
>   3 files changed, 87 insertions(+)
>   create mode 100644 package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
>   create mode 100644 package/python-maturin/python-maturin.hash
>   create mode 100644 package/python-maturin/python-maturin.mk
> 
> diff --git a/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch b/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
> new file mode 100644
> index 0000000000..7d227fea18
> --- /dev/null
> +++ b/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
> @@ -0,0 +1,62 @@
> +From 9ad69941d02e494d45ee67f3bcccc83c0bb4cdcd Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Mon, 9 May 2022 14:37:36 -0600
> +Subject: [PATCH] Fix invalid pyproject.toml
> +
> +These attributes should be marked dynamic.
> +
> +Fixes:
> +configuration error: `project` must contain ['version'] properties
> +
> +Fixes:
> +The following seems to be defined outside of `pyproject.toml`:
> +
> +`description = 'Build and publish crates with pyo3, rust-cpython and cffi bindings as well as rust binaries as python packages'`
> +
> +According to the spec (see the link bellow), however, setuptools CANNOT
> +consider this value unless 'description' is listed as `dynamic`.
> +
> +Fixes:
> +The following seems to be defined outside of `pyproject.toml`:
> +
> +`license = 'MIT OR Apache-2.0'`
> +
> +According to the spec (see the link bellow), however, setuptools CANNOT
> +consider this value unless 'license' is listed as `dynamic`.
> +
> +Fixes:
> +The following seems to be defined outside of `pyproject.toml`:
> +
> +`authors = 'konstin'`
> +
> +According to the spec (see the link bellow), however, setuptools CANNOT
> +consider this value unless 'authors' is listed as `dynamic`.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://github.com/PyO3/maturin/pull/908]
> +---
> + pyproject.toml | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index 207ceb7..329faae 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -13,6 +13,13 @@ classifiers = [
> +     "Programming Language :: Python :: Implementation :: PyPy",
> + ]
> + dependencies = ["tomli>=1.1.0 ; python_version<'3.11'"]
> ++dynamic = [
> ++    "authors",
> ++    "description",
> ++    "license",
> ++    "readme",
> ++    "version"
> ++]
> +
> + [project.optional-dependencies]
> + zig = [
> +--
> +2.25.1
> +
> diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
> new file mode 100644
> index 0000000000..e9ba83e78e
> --- /dev/null
> +++ b/package/python-maturin/python-maturin.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated after vendoring
> +sha256  092db51dfd1479e3abfc8eef4b109b6ab504481959e383090827e2024f09aab3  maturin-0.12.15.tar.gz
> +# Locally computed sha256 checksums
> +sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
> +sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
> diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
> new file mode 100644
> index 0000000000..f6daabc008
> --- /dev/null
> +++ b/package/python-maturin/python-maturin.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# python-maturin
> +#
> +################################################################################
> +
> +PYTHON_MATURIN_VERSION = 0.12.15
> +PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
> +PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/30/4d/b8a32e0bd711f7905fa8f10487be7dbf9992c5b5b3bfa8734abf2487d967
> +PYTHON_MATURIN_SETUP_TYPE = setuptools
> +PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
> +PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
> +HOST_PYTHON_MATURIN_DEPENDENCIES = host-python-tomli host-rustc
> +HOST_PYTHON_MATURIN_ENV = $(HOST_PKG_CARGO_ENV)
> +# We need to vendor the Cargo crates at download time
> +PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
> +PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
> +HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)
> +
> +$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
