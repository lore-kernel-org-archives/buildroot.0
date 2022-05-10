Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A94C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A1AD60AF2;
	Tue, 10 May 2022 19:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_lLXNSWN-cn; Tue, 10 May 2022 19:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C6D6068B;
	Tue, 10 May 2022 19:01:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12EDD1BF21A
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00DD26068B
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:01:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Ua4a01peS5w for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:01:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E84A600B8
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:01:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id n10so34802136ejk.5
 for <buildroot@buildroot.org>; Tue, 10 May 2022 12:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z/3Ys6IPOEjdAPRUljeylu60qb6gk4z2fTyPT1LxIpY=;
 b=PiOm1H3GjoUELXWoQ6fXzUJwmtoGD1FgblALw6UWoHU+/9nivHld93xN8W3KLtXvXD
 H/QvRfuoGKBOZSz+SXMKgv9gu2bAS7xwTOnb5TIs2lrOFdlEvFcZWE9pl+jshWxqc+/l
 mujTPhxfXVhFra7BRv6mOq8XBXIiB2KEgv1pmlU+lHJc9M2L5n04RLV0RVFUl7ijKnIG
 9dZCcZvta65cAS8Rb+U4OjCMAozFc25Nm6qgW1zfcVNMtAO1weRxR42A86LJVwb9uhlq
 j/zSuD4xm6ecd7rAvREs6iIuB9nKV6fgICroic27NcrTHhJ0Fq7elFGh4wzYbUI4E69Y
 Cznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z/3Ys6IPOEjdAPRUljeylu60qb6gk4z2fTyPT1LxIpY=;
 b=TqYKQTwb6x7rz9u8dH4/kTRFRmrW8kepUmj/wv+gDChWBKn0qZ2l+Ce4O20Bz+XGG0
 hjRC7H4CkPWvwyqywqvK1eo4UqRj3PSlqh90D1QCd9LbSd9R0iG/eRN3qzIvf+y4sZSk
 AhWpWHU/nX2su2MIq2she/fmVbtYn7H5m0mrSe0ixzUBJmxkvtYQ5+279ov4xbRrpJ8b
 bWmUvAGySlrqj6CHwxLmW+EqcyhfrfRDe3k8+4bgnveFZBcBQDy/04SFnkX28TTMLYc+
 TfG0jFjSMqEownHgphWpPDreglyVbXO2v7G0gHcrdCmQR3ie7fS9CdF/ICXIybf0HToT
 okKg==
X-Gm-Message-State: AOAM530pbfnejmPsCBZKElEOZcAm4ndZbEtKPRqpd1cw9qFUYebLElj0
 zcDUkhy1+GrIPth4oShH36ZEGg==
X-Google-Smtp-Source: ABdhPJx60H5rbh4nML6YtSfAlVf9hN/K76Da5sy+yf3LHhKQSGLad1NjOEQJS4u7wDm3N8/dgkOy7w==
X-Received: by 2002:a17:907:96a8:b0:6f4:45f1:6e76 with SMTP id
 hd40-20020a17090796a800b006f445f16e76mr21621853ejc.186.1652209275514; 
 Tue, 10 May 2022 12:01:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 23-20020a170906309700b006f3ef214e4fsm43999ejv.181.2022.05.10.12.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 12:01:15 -0700 (PDT)
Message-ID: <123fec62-0841-8dff-9da6-61f2cc9614d3@mind.be>
Date: Tue, 10 May 2022 21:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220510003116.336797-1-james.hilliard1@gmail.com>
 <20220510003116.336797-2-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220510003116.336797-2-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-orjson: bump to
 version 3.6.8
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2022 02:31, James Hilliard wrote:
> Convert package to use python infrastructure instead of cargo
> infrastructure.

  AFAIU, maturin was already available in 3.6.7, so the conversion should be 
separate from the bump.

  That said, I think Graeme intentionally did not use maturin because it doesn't 
really offer much benefit over calling cargo directly. Do you have a reason to 
prefer using maturin?

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/python-orjson/python-orjson.hash |  5 +++--
>   package/python-orjson/python-orjson.mk   | 24 ++++++++++++------------
>   2 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
> index 5ef2726d82..06cc5cae79 100644
> --- a/package/python-orjson/python-orjson.hash
> +++ b/package/python-orjson/python-orjson.hash
> @@ -1,4 +1,5 @@
> -# Locally calculated
> -sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  python-orjson-3.6.7.tar.gz
> +# Locally calculated after vendoring
> +sha256  40b95576b81916d167f7a44829401acb3b6cbbfe9840b5ed88c9535a86507d7b  orjson-3.6.8.tar.gz
> +# Locally computed sha256 checksums
>   sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
>   sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
> diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
> index 5de4b2c5fa..ccbaf37c6d 100644
> --- a/package/python-orjson/python-orjson.mk
> +++ b/package/python-orjson/python-orjson.mk
> @@ -4,19 +4,19 @@
>   #
>   ################################################################################
>   
> -PYTHON_ORJSON_VERSION = 3.6.7
> -PYTHON_ORJSON_SITE = $(call github,ijl,orjson,$(PYTHON_ORJSON_VERSION))
> +PYTHON_ORJSON_VERSION = 3.6.8
> +PYTHON_ORJSON_SOURCE = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
> +PYTHON_ORJSON_SITE = https://files.pythonhosted.org/packages/14/8e/7e745d867466bdafb12ab7b0179d40f23f55639f7cd14bd375acfa74aca2

  Kind of an aside, since this applies to many other packages: is there a reason 
we prefer to get Python packages from pypi rather than the upstream source itself?

> +PYTHON_ORJSON_SETUP_TYPE = pep517
>   PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
>   PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> -PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
> -PYTHON_ORJSON_CARGO_ENV = \
> +PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-python-maturin
> +PYTHON_ORJSON_ENV = \
> +	$(PKG_CARGO_ENV) \
>   	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> +# We need to vendor the Cargo crates at download time
> +PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
> +PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
> +PYTHON_ORJSON_DL_ENV = $(PKG_CARGO_ENV)

  Is this going to be needed for all maturin packages? If yes, it will make 
sense to move this into a maturin setup type (but preferably only after we have 
at least 3 packages that use it).

  Regards,
  Arnout

>   
> -# orjson uses "maturin" to generate distribution packages - rather than teach
> -# buildroot how to understand this, we reach in and install directly.
> -define PYTHON_ORJSON_INSTALL_TARGET_CMDS
> -	$(INSTALL) -m 0755 -D $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
> -		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
> -endef
> -
> -$(eval $(cargo-package))
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
