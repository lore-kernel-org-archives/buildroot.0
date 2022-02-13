Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EECC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B4D4814BA;
	Sun, 13 Feb 2022 15:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_nqA8fJkXg1; Sun, 13 Feb 2022 15:25:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95B6881494;
	Sun, 13 Feb 2022 15:25:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35C9F1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32FF081420
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ys7rkqNtR78q for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:24:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7443F8140F
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:24:39 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id s7so23612282edd.3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Huquuomnp5M7JdkgCn2AxJYb43NxPyymUAvXtL8g6zA=;
 b=cYpXX58YsVXpbMEOYgFdefsahYHnYHuIwUtI7BQBx+9iYRPJqk225UWKk4QpQFj5OC
 aLDXkMONDW+tLpro/XphBqLflghvJ3KqhHYCfEFYLhoBCVMRpTKxgTU4soscbuuiKwV3
 3rOGMGDMQiugeyNjViSocoeSzP0/pGw1pzFmf+UPMHICjrrK5D2woPwv8/yf4+8tHea+
 uYO8n5O7/GSAL82B5yhGhwtAdAtIRD1fAM0xSi5QO6DspbxuUFEeChWJBD97768fvy75
 De9AKl1X1rFE6qHr8ynneXPLTPcJWfLcJPrAZgP18QJ3aWjifK/XQqhM2C0Os/N/dtM9
 ubdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Huquuomnp5M7JdkgCn2AxJYb43NxPyymUAvXtL8g6zA=;
 b=ZNvSmoc9kvVIw4h9ThPCY0Zzyc/qk/vZ0XuT8OYvNUi4QgFX/HLIMKTFkmz07MfFxh
 LtdYA2TVzH+lpExRzK11eX5MmXqHtkIJ2Jl17EpWQr16GCdWdXPOjHTu4/wYWDbznzGL
 Klnjfa65Mp46wm/xZXA9fXYFw2fmFwHitwJR8453m7Ycuhwg9rAkLSxsV2DCZHOSF1mH
 45/F/RMgG6pLJS5f0MVhzsZhmj+TMWtb14L1jy7/rGdMbJQwYj7TpEAeVrPsohnXjdv9
 SRzNcYC4oTaQyKbd3F56ETBsB+iuyD6xqfY2xIZ+opFz31wceWxJV8RtjaC8AlCRc7Jd
 zHZQ==
X-Gm-Message-State: AOAM5303o0pz2wxkrUzmuchbM7AERSwhC8qEnlxjAvwhPr+IXVYmlmyM
 FrvgeyUH1I1SGu9Gw1wxiS6iIYEGv+JQ1w==
X-Google-Smtp-Source: ABdhPJyRj33i+uGp/4OTTo5ajCObYJnaHTCHAEZs/Ym34/uB0ANber2wjsE9PF5FrN2eFztVHJdtmA==
X-Received: by 2002:a05:6402:3509:: with SMTP id
 b9mr11192888edd.192.1644765877716; 
 Sun, 13 Feb 2022 07:24:37 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r11sm5955602ejc.212.2022.02.13.07.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:24:37 -0800 (PST)
Message-ID: <a063d54d-fced-7baf-1ba2-2ea6442d3d50@mind.be>
Date: Sun, 13 Feb 2022 16:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220206073805.832602-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206073805.832602-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: add mysql support
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/02/2022 08:38, Fabrice Fontaine wrote:
> lighttpd only supports mariadb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lighttpd/Config.in   | 9 +++++++++
>   package/lighttpd/lighttpd.mk | 8 +++++++-
>   2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
> index b9f64a3bc3..aa18c13171 100644
> --- a/package/lighttpd/Config.in
> +++ b/package/lighttpd/Config.in
> @@ -61,6 +61,15 @@ config BR2_PACKAGE_LIGHTTPD_MAXMINDDB
>   	help
>   	  Enable MaxMind GeoIP2 support. Needed to support mod_maxminddb
>   
> +config BR2_PACKAGE_LIGHTTPD_MYSQL
> +	bool "mysql support"
> +	depends on BR2_PACKAGE_MARIADB
> +	help
> +	  Enable mysql support for lighttpd mod_vhostdb_mysql.
> +
> +comment "mysql support needs mariadb"
> +	depends on !BR2_PACKAGE_MARIADB
> +
>   config BR2_PACKAGE_LIGHTTPD_OPENSSL
>   	bool "openssl support"
>   	select BR2_PACKAGE_OPENSSL
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 49ab8587f7..595c59cb37 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -19,7 +19,6 @@ LIGHTTPD_CONF_OPTS = \
>   	-Dwith_libev=false \
>   	-Dwith_libunwind=false \
>   	-Dwith_mbedtls=false \
> -	-Dwith_mysql=false \
>   	-Dwith_nettle=false \
>   	-Dwith_nss=false \
>   	-Dwith_pcre=false \
> @@ -73,6 +72,13 @@ else
>   LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIGHTTPD_MYSQL),y)
> +LIGHTTPD_DEPENDENCIES += mysql
> +LIGHTTPD_CONF_OPTS += -Dwith_mysql=true
> +else
> +LIGHTTPD_CONF_OPTS += -Dwith_mysql=false
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
>   LIGHTTPD_DEPENDENCIES += openssl
>   LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
