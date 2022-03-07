Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6F2C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92AC60EE3;
	Mon,  7 Mar 2022 22:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFgxlrrsJ3lr; Mon,  7 Mar 2022 22:05:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D15C5600D1;
	Mon,  7 Mar 2022 22:05:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 997731BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 922A2600D1
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5In7y27ZUD-8 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:04:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52AA060087
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:04:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a8so35022568ejc.8
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 14:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u7hfEfE+dsnHHiy6LWO2GlTfhoEJXTOeKvJhyUMuVhE=;
 b=KM9bdDv3mgMhBGqYOQek/bIxryGBgG0z9eJkfNvPzJ6lJfq0wVfrjq95qIVBGFIW1m
 LZPTJ6omtiaNhL3FWBm578IhZwAfm4+k4RoBMTBEPlDeOGuBxEmcGt7OtUljr+uo+OS4
 YnHpDJP1Pm+7fP4eflC3DCQGvgHMlEdovctDkYX1deirvkegBvMhvp/QUjXMBbZ10+Nq
 FrswiuWNHeRFZYfZ7188/SZFwA1rNM5vIr0tivMKkYgFkR+j/EKzO5nVGPR6kO5+tb84
 55S1X0UhNv/YuDjjaIurvVgnRjKeRA6WoPqbE1YtNNlOYrinNyp4hyVCwVU9fTC1tnKe
 rwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=u7hfEfE+dsnHHiy6LWO2GlTfhoEJXTOeKvJhyUMuVhE=;
 b=zZOw5SyZqqmlbDHe12FHU7XfIY3XzrfbtlcEOxn7SwMgpnxG7zyEZegDjYTCGPV7jF
 Dbn//nY24+KLLnqAzEbxaAEcX16Ij33u/vOMCvnDdhRYf1g9A7b3qP0ojPJIxfF0oiyN
 JXZruKEprvkB/jJsKFOz8uBuyk8ukTu9lDrLjipTpbB2sbcUHdLc2bgk0W0A79l0+b6N
 yb08T8GMlFU+Fp/rNq3anFKBlA21fkFM/BLKfmABHyznxIpaP4QXYH3BB9jOoZrxx2i0
 hJtd5+s26vjam71cWMKbrClOsGujCn/wWqiTUZ7d0w+45xTkZyctO/6E3HXh0o8L7rRd
 lLxQ==
X-Gm-Message-State: AOAM53036ALgKebCu1m7LpgiI7+28YlXq7KrlBCXmuxxkTXk0mgZ74Pk
 swG4+4zIUy1lNBVQIk6FFr8Ifg==
X-Google-Smtp-Source: ABdhPJxn+owJnOPcBRYsZ2kAxw2kf49L8qfrrTEqY65UJafUQsSd50dz8x3+dnIvFfRVOqGZ7firAQ==
X-Received: by 2002:a17:906:3913:b0:6da:b2dc:2278 with SMTP id
 f19-20020a170906391300b006dab2dc2278mr10470292eje.419.1646690694372; 
 Mon, 07 Mar 2022 14:04:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ho12-20020a1709070e8c00b006ce3f158e87sm5114990ejc.2.2022.03.07.14.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 14:04:53 -0800 (PST)
Message-ID: <6d5f714c-da1b-1eae-5b73-51622e0f5121@mind.be>
Date: Mon, 7 Mar 2022 23:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220221223842.2201966-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220221223842.2201966-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/osm2pgsql: disable external fmt
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/02/2022 23:38, Fabrice Fontaine wrote:
> osm2pgsql doesn't support fmt > 8.0 yet resulting in the following build
> failure since bump of fmt to version 8.1.1 in commit
> ec7fd50d08690a383fec40748ac9b78c3f764316:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/fmt/core.h:1728:7: error: static assertion failed: Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
>   1728 |       formattable,
>        |       ^~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5af1a0ea176559a5dc787ba945a3a83823f5b1bb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/osm2pgsql/Config.in    | 5 ++---
>   package/osm2pgsql/osm2pgsql.mk | 5 +++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
> index 315f496d8e..e903e92c49 100644
> --- a/package/osm2pgsql/Config.in
> +++ b/package/osm2pgsql/Config.in
> @@ -1,17 +1,16 @@
>   config BR2_PACKAGE_OSM2PGSQL
>   	bool "osm2pgsql"
> -	depends on BR2_INSTALL_LIBSTDCPP # boost, fmt, libosmium, protozero
> +	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
>   	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
> -	depends on BR2_USE_WCHAR # boost, fmt, libosmium
> +	depends on BR2_USE_WCHAR # boost, libosmium
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
>   	select BR2_PACKAGE_BOOST
>   	select BR2_PACKAGE_BOOST_SYSTEM
>   	select BR2_PACKAGE_BOOST_FILESYSTEM
>   	select BR2_PACKAGE_BZIP2
>   	select BR2_PACKAGE_EXPAT
> -	select BR2_PACKAGE_FMT
>   	select BR2_PACKAGE_LIBOSMIUM
>   	select BR2_PACKAGE_PROTOZERO
>   	select BR2_PACKAGE_ZLIB
> diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
> index b00976d28b..d389fff590 100644
> --- a/package/osm2pgsql/osm2pgsql.mk
> +++ b/package/osm2pgsql/osm2pgsql.mk
> @@ -10,12 +10,13 @@ OSM2PGSQL_LICENSE = GPL-2.0+
>   OSM2PGSQL_LICENSE_FILES = COPYING
>   OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
>   
> -OSM2PGSQL_DEPENDENCIES = boost bzip2 expat fmt libosmium postgresql protozero zlib
> +OSM2PGSQL_DEPENDENCIES = boost bzip2 expat libosmium postgresql protozero zlib
>   
> +# fmt > 8.0 is not yet supported
>   OSM2PGSQL_CONF_OPTS = \
>   	-DBUILD_TESTS=OFF \
>   	-DBUILD_COVERAGE=OFF \
> -	-DEXTERNAL_FMT=ON \
> +	-DEXTERNAL_FMT=OFF \
>   	-DEXTERNAL_LIBOSMIUM=ON \
>   	-DEXTERNAL_PROTOZERO=ON
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
