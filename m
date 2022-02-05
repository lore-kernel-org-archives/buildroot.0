Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1671C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C0360BD0;
	Sat,  5 Feb 2022 22:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H_hoIFh6Ijyi; Sat,  5 Feb 2022 22:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82E9B60806;
	Sat,  5 Feb 2022 22:54:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26FE91BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23B2560806
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:54:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0daOVIi5_KpW for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:54:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6670F6079D
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:54:38 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id s21so2467223ejx.12
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 14:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cC0QCFwf13/7SvZiVg09Ohw9WYcsviIaE1BoCQ7WLZg=;
 b=ICxHDmr7LaEo4iWoJmDa1/SSkaw7h7p3BQ0NNVA21FJevTIDSPvl/QeWQVD1iVmMi8
 oeRxBmpN3KsF2K+omItSxUC4cYsICqoLJfTQzRitY1UUEn6TB4FuOs9vkSivZ1r5UHwQ
 6qs/4EBIOTFfkj9o6eor6sq0V180C/os9q+TlewtgAGzKO9JQ3Yj71pshl3YTuuJpDe9
 CoWdRHIU199AD5PqbhAyX0DX1yIR1e5m+A/Wgx28EVCu5OqYqHI7Do5xisLIaYGYRqbi
 dTf0T8Z7ZX10Dcyd8LRlPS8k40x3NsCtFlUUFX51wiuVAFl+zMZpto3cWmYemCqNajyX
 c1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cC0QCFwf13/7SvZiVg09Ohw9WYcsviIaE1BoCQ7WLZg=;
 b=GBSn1XOHJm3k23IXpN5+clWj2giCQ587TM1XivKclcoV4jI0qHH3hu+J07A+hoIMHD
 JF/vOcmGJgDr0u9LA4H07BD8Sd81dASuQuG8acGdVEFXvz1DkylN8G+F08DCXgLTMx1O
 0SdT8Hkixv4BpuJZErYZZ1FOGvxa2YPRkuWZdu7sIwwV9SAvi2eVZjkoYCP6PM2T6waY
 JrLrQLixym8mJ7uSPByOnAROMbsWU1eK3jIdC3W4VGF65U1ZAnNLLMk0ixwlGia7c/Ib
 PArWT0OK7cnpoXYaevr0O51H2H9GRmO0bCNPN1iiYSulBFtGUeUGPp74J9a0RmxO0Xgn
 ouZg==
X-Gm-Message-State: AOAM533HdSdtHZ2mwkFt8NPLVpKFn3i8mZJfsf66q9gcFd3vymMDnFWu
 XFaozqOCpmabUbb2tDSRPe36AA==
X-Google-Smtp-Source: ABdhPJz3exhrBYoKDZfgnfoMqgn6T5RjVHw+muXIyS9U0KDXP+rCzVRcaRn4+IpRnxZ7PYvgiXP2/w==
X-Received: by 2002:a17:907:97d0:: with SMTP id
 js16mr4487860ejc.345.1644101676675; 
 Sat, 05 Feb 2022 14:54:36 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h15sm2060585ejg.144.2022.02.05.14.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 14:54:36 -0800 (PST)
Message-ID: <b66bd6a7-fc7f-b141-8a3d-f2fa20471c11@mind.be>
Date: Sat, 5 Feb 2022 23:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220126211749.1550932-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220126211749.1550932-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: add pgsql support
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



On 26/01/2022 22:17, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/lighttpd/Config.in   | 10 ++++++++++
>   package/lighttpd/lighttpd.mk |  8 +++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
> index eb8ab480a0..57bb756603 100644
> --- a/package/lighttpd/Config.in
> +++ b/package/lighttpd/Config.in
> @@ -86,6 +86,16 @@ config BR2_PACKAGE_LIGHTTPD_PCRE
>   	help
>   	  Enable PCRE support. Needed to support mod_rewrite
>   
> +config BR2_PACKAGE_LIGHTTPD_PGSQL
> +	bool "pgsql support"
> +	depends on BR2_USE_MMU # postgresql
> +	select BR2_PACKAGE_POSTGRESQL
> +	help
> +	  Enable postgres support for lighttpd mod_vhostdb_pgsql.
> +
> +comment "pgsql support needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
> +
>   config BR2_PACKAGE_LIGHTTPD_WEBDAV
>   	bool "webdav support"
>   	select BR2_PACKAGE_LIBXML2
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index 90b4ba0a72..595c59cb37 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -22,7 +22,6 @@ LIGHTTPD_CONF_OPTS = \
>   	-Dwith_nettle=false \
>   	-Dwith_nss=false \
>   	-Dwith_pcre=false \
> -	-Dwith_pgsql=false \
>   	-Dwith_sasl=false \
>   	-Dwith_wolfssl=false \
>   	-Dwith_xattr=false \
> @@ -101,6 +100,13 @@ else
>   LIGHTTPD_CONF_OPTS += -Dwith_pcre2=false
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIGHTTPD_PGSQL),y)
> +LIGHTTPD_DEPENDENCIES += postgresql
> +LIGHTTPD_CONF_OPTS += -Dwith_pgsql=true
> +else
> +LIGHTTPD_CONF_OPTS += -Dwith_pgsql=false
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
>   LIGHTTPD_DEPENDENCIES += libxml2 sqlite
>   LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
