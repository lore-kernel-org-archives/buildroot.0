Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2185CC433F5
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 19:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B286740297;
	Tue,  3 May 2022 19:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dB5HJFmNj3Wd; Tue,  3 May 2022 19:48:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A10D540207;
	Tue,  3 May 2022 19:48:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91F071BF963
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F38A409A1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 19:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIL47ghrBcA0 for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 19:48:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFD7840993
 for <buildroot@buildroot.org>; Tue,  3 May 2022 19:48:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id dk23so35390139ejb.8
 for <buildroot@buildroot.org>; Tue, 03 May 2022 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=aWAPy9+B+vCCn98Q58H4AseXWj/6azmEn8lb9pm7wus=;
 b=R7Pzq0bO5odgA2k+d7bFYlNLt/oHQIv1t9xsJ4QnuHjYcQy8x9Nks/FQU+q4Cn8gTx
 JMqtw8HRe2Rg32d4D6TBWa6j6xOxp+burqz2pSe9bTY9B60wb0oTCUIOWWHm2kHDfAB4
 HvtLUiOOElXcYLnORcLtpKVrpTg74dviqfWnx7khGwk2mUF+FixvBbSRtyjH5BIgD0sI
 UiL9BFtbBX9xQn8jLbUOWXxdOklU2zw/OdqR3HC8fb5Usdxn7I1OmhCKFtGnHuEOrQgD
 PjxKXZyO/0xFDRGTMZ3bVfeKHGL4Y2NceQE2VV95KPTzZvsEeC/3pFjTwjeOXig6ixms
 W2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aWAPy9+B+vCCn98Q58H4AseXWj/6azmEn8lb9pm7wus=;
 b=sJ6MMGirnBDICza51Gxv39SMJVC34Vha/I8qgsmy9fftb0COk4tbPl7mKmClqZs3jY
 /kHcKC5iCiFASxaJ9VIpBsehJtpiusGHQVYI+XO9YgTW8q87oS/gZ92LKOapWNP/CVkD
 KhI9C+gJjeUq4B7eEeD7xwQtGEFHhEwLga+HFy5P8lZSsLifFNHWoytJ3xGwHMwD0Ro/
 M+gMyUSZkBAGJj3ucwXQ7LlOsGZJWDnB9TureXP4Ju4wLaS/HbJ3lf1Q/xeXg/7QHxWg
 uA4kKCE3rbJPxIwinguK2CKhcVrVFE7tSufhtwFLUeGCp6WY78+Q/McLz+ofLNgjj7o4
 m7ZQ==
X-Gm-Message-State: AOAM531/g3xg+oBJQSBvUty/0NyI3xZMbR6lV0yZRk2DrtbhTEiilMa0
 ADbw3S4YIjX5Ga/7XfLW9gDmvw==
X-Google-Smtp-Source: ABdhPJyrw+kT0RF4i57feUABRVVOYPTsX/KCC83t3gMk+K53lwoTmpqKdCdaSOSYStSKKxRN4+jGuA==
X-Received: by 2002:a17:906:1e94:b0:6b9:6fcc:53fd with SMTP id
 e20-20020a1709061e9400b006b96fcc53fdmr17328530ejj.450.1651607314740; 
 Tue, 03 May 2022 12:48:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hy26-20020a1709068a7a00b006f3ef214dbasm4919901ejc.32.2022.05.03.12.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 12:48:34 -0700 (PDT)
Message-ID: <bc367aae-e1bc-a071-9785-833c5357b299@mind.be>
Date: Tue, 3 May 2022 21:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Graeme Smecher <gsmecher@threespeedlogic.com>, buildroot@buildroot.org
References: <20220419212447.2441888-1-gsmecher@threespeedlogic.com>
 <20220419212447.2441888-2-gsmecher@threespeedlogic.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419212447.2441888-2-gsmecher@threespeedlogic.com>
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

The commit message should have been like this:

package/python-orjson: new package

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>


On 19/04/2022 23:24, Graeme Smecher wrote:
> ---
>   DEVELOPERS                               |  3 +++
>   package/Config.in                        |  1 +
>   package/python-orjson/Config.in          | 12 ++++++++++++
>   package/python-orjson/python-orjson.hash |  3 +++
>   package/python-orjson/python-orjson.mk   | 22 ++++++++++++++++++++++
>   5 files changed, 41 insertions(+)
>   create mode 100644 package/python-orjson/Config.in
>   create mode 100644 package/python-orjson/python-orjson.hash
>   create mode 100644 package/python-orjson/python-orjson.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ca9decb58f..0846aac835 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3058,3 +3058,6 @@ F:	package/quazip/
>   F:	package/shapelib/
>   F:	package/simple-mail/
>   F:	package/tinc/
> +
> +N:	Graeme Smecher <gsmecher@threespeedlogic.com>

  This should have been alphabetic.

> +F:	package/python-orjson/
> diff --git a/package/Config.in b/package/Config.in
> index c599271c65..1494387c2e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1111,6 +1111,7 @@ menu "External python modules"
>   	source "package/python-numpy/Config.in"
>   	source "package/python-oauthlib/Config.in"
>   	source "package/python-opcua-asyncio/Config.in"
> +	source "package/python-orjson/Config.in"
>   	source "package/python-packaging/Config.in"
>   	source "package/python-paho-mqtt/Config.in"
>   	source "package/python-paramiko/Config.in"
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

  Wrap at 72 columns (the tab counts for 8). utils/check-package warns about this.


  Applied to master with those things fixed, thanks.

  Regards,
  Arnout


> +	  the fastest Python library for JSON and is more correct than the
> +	  standard json library or other third-party libraries. It serializes
> +	  dataclass, datetime, numpy, and UUID instances natively.
> +
> +	  https://github.com/ijl/orjson
> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> new file mode 100644
> index 0000000000..8f9cc2a7c9
> --- /dev/null
> +++ b/package/python-orjson/python-orjson.hash
> @@ -0,0 +1,3 @@
> +sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
> +sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
> +sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> new file mode 100644
> index 0000000000..5de4b2c5fa
> --- /dev/null
> +++ b/package/python-orjson/python-orjson.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# python-orjson
> +#
> +################################################################################
> +
> +PYTHON_ORJSON_VERSION = 3.6.7
> +PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
> +PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
> +PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
> +PYTHON_ORJSON_CARGO_ENV = \
> +	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> +
> +# orjson uses "maturin" to generate distribution packages - rather than teach
> +# buildroot how to understand this, we reach in and install directly.
> +define PYTHON_ORJSON_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
> +		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
> +endef
> +
> +$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
