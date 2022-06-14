Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB95CCA47B
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D90A140A67;
	Tue, 14 Jun 2022 18:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptFolxUMD0BF; Tue, 14 Jun 2022 18:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E33B6409E3;
	Tue, 14 Jun 2022 18:44:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E28E51BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF35F409E3
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6BIYNG5bHr08 for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:44:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C272B409DD
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:44:53 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gl15so18910160ejb.4
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 11:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=xz9uEhlczNf14jvm35usFoi6vmEBUUfsFSwvPhD2344=;
 b=VeopSYLA6yQr+LxbCPXWfIKl4QGvxsqqolYcBI+dLVUabcITkJjPUNDYI725Uc/DSv
 k6W4FC8QHK8fGq3TBgfTT2a7U1LLfpEpopo1kglIp7DwttABxu0QTqUmrCxTnRjGn4dP
 3sqfsKWbvf8BRGWyQ+4rX95EE6ZRsa0gEw+j2K1AnyqLECywIwuyWyhp0tZ0cIXoGDbC
 nspIbs7iioEHtuEj3pS1IwizlyuWVPqYoC5hrR+o1b269ggdVA86chdtrhKcJkv0EZEi
 euXOi1Jj5OISXkONZ81FJoeXOJ7QVZEwMWXuQWMSRnrusPqNV4pz89q0dFYW2o3O87FF
 ktKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xz9uEhlczNf14jvm35usFoi6vmEBUUfsFSwvPhD2344=;
 b=JRYSI95Y0AxMKGlIjupaSBL7K4pCty23J1JZH20PMcEulfkB32c5WO5tjxDHKPMEV0
 ow+pR1AzV3wm7A5YvXxgDLkVS/+YmoInDKYAzM2DE1EqS2JzvTDS5LwUukB/jXAIjot4
 XGNfHCt8871OgTR3umCmkX1BEn6aQ70NWyQth1L+TfwVplfrvTfI6KZEu5wfNmBqfBv/
 QpSLEH7fXD3z04nBLggHRiCSasEq+JcZFSN32y6w+yhEBYMv5W3GGydrI1qd8EQAmhyk
 eYce5ihS5u7aVvSbM9XnIX8UXan2n4NHk06aWVHvvyE9xg7aKdfYXqx9W66JtyJo4zzO
 lrTw==
X-Gm-Message-State: AOAM533Hadn/P7oGGVXoyuODmgbvO/SvMQGZ5OdCzej/L7k+UDuVJ4gT
 G+kqYjq836aKM/9I7wlRwKlXfg==
X-Google-Smtp-Source: AGRyM1vMDl+7z2UMDZvr/fCnlPZALGdrcFXrIFDX0SjjsxBv9N7+p0VO/toF4QXc8e71oxCUXu9jkw==
X-Received: by 2002:a17:906:7a08:b0:712:12f6:243a with SMTP id
 d8-20020a1709067a0800b0071212f6243amr5692690ejo.619.1655232292017; 
 Tue, 14 Jun 2022 11:44:52 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 hh14-20020a170906a94e00b00703e09dd2easm5462091ejb.147.2022.06.14.11.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:44:51 -0700 (PDT)
Message-ID: <bf7e50f0-a171-d59b-709b-7dcc7ff1d938@mind.be>
Date: Tue, 14 Jun 2022 20:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
References: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/4] package/php: remove wddx extension
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



On 11/06/2022 15:18, Bernd Kuhls wrote:
> Upstream removed the wddx extension with version 7.4:
> https://github.com/php/php-src/commit/6bbb18a0b6bef11222caaa55c00abdbcbb55d54b
> 
> and moved it to pecl: https://pecl.php.net/package/wddx
> 
> The pecl package is unmaintained however so we do not add it as a new
> package to buildroot.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---

  Applied all 4 to master, thanks.

  Regards,
  Arnout

>   Config.in.legacy       | 8 ++++++++
>   package/php/Config.ext | 7 -------
>   package/php/php.mk     | 5 -----
>   3 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 853a8917be..9d7bdfab10 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -144,6 +144,14 @@ endif
>   
>   ###############################################################################
>   
> +comment "Legacy options removed in 2022.08"
> +
> +config BR2_PACKAGE_PHP_EXT_WDDX
> +	bool "php wddx removed"
> +	select BR2_LEGACY
> +	help
> +	  The WDDX extension was removed from php.
> +
>   comment "Legacy options removed in 2022.05"
>   
>   config BR2_PACKAGE_KTAP
> diff --git a/package/php/Config.ext b/package/php/Config.ext
> index 1c2af9fd15..d5f8659016 100644
> --- a/package/php/Config.ext
> +++ b/package/php/Config.ext
> @@ -385,13 +385,6 @@ config BR2_PACKAGE_PHP_EXT_SIMPLEXML
>   	help
>   	  SimpleXML support
>   
> -config BR2_PACKAGE_PHP_EXT_WDDX
> -	bool "WDDX"
> -	select BR2_PACKAGE_EXPAT
> -	select BR2_PACKAGE_PHP_EXT_LIBXML2
> -	help
> -	  WDDX support
> -
>   config BR2_PACKAGE_PHP_EXT_XML
>   	bool "XML Parser"
>   	select BR2_PACKAGE_PHP_EXT_LIBXML2
> diff --git a/package/php/php.mk b/package/php/php.mk
> index f649a9bb8b..39db9d3a7c 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -150,11 +150,6 @@ PHP_CONF_OPTS += --with-libxml
>   PHP_DEPENDENCIES += libxml2
>   endif
>   
> -ifeq ($(BR2_PACKAGE_PHP_EXT_WDDX),y)
> -PHP_CONF_OPTS += --enable-wddx --with-libexpat-dir=$(STAGING_DIR)/usr
> -PHP_DEPENDENCIES += expat
> -endif
> -
>   ifeq ($(BR2_PACKAGE_PHP_EXT_ZIP),y)
>   PHP_DEPENDENCIES += libzip
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
