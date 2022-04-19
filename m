Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ECAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 21:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 727A6417A6;
	Tue, 19 Apr 2022 21:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbquEngpL5-e; Tue, 19 Apr 2022 21:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDB09417A8;
	Tue, 19 Apr 2022 21:08:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2F621BF3F0
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABEB483155
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 21:08:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iGp0nshOkIdk for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 21:08:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 391CD819CC
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 21:08:14 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id k23so35422866ejd.3
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Y3Yh238+MyFEbnFlW5nWTejrjV5d0kTln3Dmb4L7rbY=;
 b=HIdR/ML6dtdl8gemTogNgTOTHwZSaIQknsFi4l+DpZrq1KpR6B/9nNDYOb/7l4wXPc
 iXb8nzbBh4enYuZrDkdEhwsOxX96isMmHgMj26VIOTN4+0bs2tcuUveK/MBHuHGw9Jn1
 zXa6H6FJAveCbQu/AB/mZ8QyUMuzAPkG0qKBcpcGGiQDqt9BwIhGja/4pSIZRFhEKOWF
 LnXwCF7YgxiBu1zM0szOOdDZCbTm6JPTTyDF5Pqycdm1eF38dMNh4ZeQEXK6eRziMH61
 sDAH8EGzoZ+ai37/SfAl0MWQBCWDtOUM5SpHMcCSKhZDll3yc2zinDYfg+amj/XaXAn8
 lrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y3Yh238+MyFEbnFlW5nWTejrjV5d0kTln3Dmb4L7rbY=;
 b=xPiFDl/TiFFBRWqMjTWmfBCFlLQkgbwnMeOerBk1S8LgZYIrM32xleKGSWO1edQeS9
 WQlDOZu7zaMe+M9xNn9mG3DYuuVTgLqXdRe/lh5WC38ejeWmqMTFUO9kCwo5RmybxZ0n
 XjCURLoWlXxjjw0us44QPOUKPJuM1GBVTo0HQiUgpDRMIPwzKRYz8mVRAbV0HFraLRR4
 2sykq7mHFfeBR7H2JaSjERKv/bbTPffyUU3GZLLPxqWvkQnCX0ULGXN8uC9H14yoomiL
 oFuY+PbQ76i8VKNd8DRhv34u/LS+SzHggAlZeMGZwRXFbFVA5pbFFmv8gleUxdsaYlK/
 w47Q==
X-Gm-Message-State: AOAM531zc5zP4kVaIOF2MT66pqlCshqm5vbQl2EmI9XrPUsGXT8djMlI
 Zk0eea+GiwwRfT/AZ/4AstafBmTZZLgy+A==
X-Google-Smtp-Source: ABdhPJxM97F15HAp3GcWI1anzDAwgQNMmsSz5KoZ+WCdqFc1UdW0y1jT12IW9OMWcAAVnZsETD22UQ==
X-Received: by 2002:a17:907:7d90:b0:6e8:cd12:8893 with SMTP id
 oz16-20020a1709077d9000b006e8cd128893mr15577629ejc.13.1650402492401; 
 Tue, 19 Apr 2022 14:08:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170906520f00b006cd07ba40absm6013525ejm.160.2022.04.19.14.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 14:08:11 -0700 (PDT)
Message-ID: <fdcb803b-4b47-c221-a538-aaa722449713@mind.be>
Date: Tue, 19 Apr 2022 23:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Graeme Smecher <gsmecher@threespeedlogic.com>, buildroot@buildroot.org
References: <20220414194011.2044427-1-gsmecher@threespeedlogic.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220414194011.2044427-1-gsmecher@threespeedlogic.com>
Subject: Re: [Buildroot] [PATCH] Adds python-orjson support.
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

  Hi Graeme,

  I have a few fairly small remarks. Care to fix them up and resend?

  First of all, the subject line should be:

package/python-orjson: new package

Also, add a Signed-off-by line for yourself at the end of the commit message. 
This is a short way for you to assert that you are entitled to contribute the 
patch under buildroot's GPL license.  See  [1] for more details.

On 14/04/2022 21:40, Graeme Smecher wrote:
> ---
>   package/Config.in                        |  1 +
>   package/python-orjson/Config.in          | 12 ++++++++++
>   package/python-orjson/python-orjson.hash |  3 +++
>   package/python-orjson/python-orjson.mk   | 28 ++++++++++++++++++++++++

  Please add yourself to the DEVELOPERS file [1] for this package. This way, 
you'll get an e-mail if the package fails in the autobuilders, or when a new 
version is released if the package is registered on release-monitoring.org.


>   4 files changed, 44 insertions(+)
>   create mode 100644 package/python-orjson/Config.in
>   create mode 100644 package/python-orjson/python-orjson.hash
>   create mode 100644 package/python-orjson/python-orjson.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 86a1c59696..db0e37b7f7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1122,6 +1122,7 @@ menu "External python modules"
>   	source "package/python-numpy/Config.in"
>   	source "package/python-oauthlib/Config.in"
>   	source "package/python-opcua-asyncio/Config.in"
> +	source "package/python-orjson/Config.in"
>   	source "package/python-packaging/Config.in"
>   	source "package/python-paho-mqtt/Config.in"
>   	source "package/python-pam/Config.in"
> diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
> new file mode 100644
> index 0000000000..fa96eee57d
> --- /dev/null
> +++ b/package/python-orjson/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PYTHON_ORJSON
> +	bool "python-orjson"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	select BR2_PACKAGE_PYTHON_CFFI # runtime
> +	help
> +	  orjson is a fast, correct JSON library for Python. It benchmarks as
> +	  the fastest Python library for JSON and is more correct than the
> +	  standard json library or other third-party libraries. It serializes
> +	  dataclass, datetime, numpy, and UUID instances natively.
> +
> +	  https://github.com/ijl/orjson
> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> new file mode 100644
> index 0000000000..158099c174
> --- /dev/null
> +++ b/package/python-orjson/python-orjson.hash
> @@ -0,0 +1,3 @@
> +sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  3.6.7.tar.gz
> +sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
> +sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> new file mode 100644
> index 0000000000..91ead3b170
> --- /dev/null
> +++ b/package/python-orjson/python-orjson.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# python-orjson
> +#
> +################################################################################
> +
> +PYTHON_ORJSON_VERSION = 3.6.7
> +PYTHON_ORJSON_SOURCE = $(PYTHON_ORJSON_VERSION).tar.gz
> +PYTHON_ORJSON_SITE = https://github.com/ijl/orjson/archive/refs/tags

  Rather than the above two lines, keep the default tarball name 
(python-orjson-3.6.7.tar.gz) and use the github helper:

PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))

> +PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
> +PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-rustc

  host-rustc is already added by cargo-package.

> +PYTHON_ORJSON_CARGO_ENV = \
> +	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> +
> +# Vendor the Cargo crates at download time
> +PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
> +PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc

  These two are (or should be) added automatically already by the cargo 
infrastructure, so are unneeded.

> +PYTHON_ORJSON_DL_ENV = BR_CARGO_MANIFEST_PATH=Cargo.toml

  This is the default, so unneeded.

> +
> +# orjson uses "maturin" to generate distribution packages - rather than teach
> +# buildroot how to understand this, we reach in and install directly.
> +define PYTHON_ORJSON_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \

  We normally add -D to the INSTALL arguments, so the target directory is 
created if it doesn't exist yet.

> +		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
> +endef
> +
> +$(eval $(cargo-package))


  Regards,
  Arnout


[1] http://elinux.org/Developer_Certificate_Of_Origin
[2] https://buildroot.org/downloads/manual/manual.html#DEVELOPERS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
