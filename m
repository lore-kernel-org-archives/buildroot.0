Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF8BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2DBC83F2D;
	Thu, 16 Dec 2021 19:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4IM_ZO830sk; Thu, 16 Dec 2021 19:44:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0972883E73;
	Thu, 16 Dec 2021 19:44:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91C411BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80B6083E73
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l5sEXBW3HirY for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:44:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7644783E23
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:44:14 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z7so29086291edc.11
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/0VJOkqfQu/+W317605bC4hvyboCVBGX2+VQdyp30TE=;
 b=XavXibJrLDknuO47/4/ep+DUzMchGjiGOflzWVUIAzE9X5q2R14DLsDQaNYA+YhJFV
 1SiTtcTVSDuJMNNU9Gvw/KYab1ucHmXCnHFy1pjpw+QNo32ubndZg1e0MY/qZEQcDlZU
 qTN62QGWAv+kKKkjYIyaBj8TnQEQKd996IkHpkqsyzVxpTpUCrqEXy6BJGXwu6ZXsRhK
 TEUeNW1LSrNCV7CHswFx6NV3UGnKa2Z7gLKOo9pIr87AB4XRNahgai3630oDVE5urf3d
 ziZUbHvLz0jGFJcIaMJQlw7M6HLx2WWbTVSdpoJUTOWeskEgE0aIuH6YFK/CTpB1wcVU
 pN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/0VJOkqfQu/+W317605bC4hvyboCVBGX2+VQdyp30TE=;
 b=6ZBgIlDc9767DexkzmeKyfL0Gar4U6jg9LUAWk/2CErqJJ6jnbdbpei6Kea8VjNZJo
 kwqFNIhqXdHJoMd3OffxFMYEr+A08bxioHvSZFKQbi739/drp8lKFMDksrLGsSPm/oHM
 HhlYxkt+z8i4vxlagAdhW+oCeHBz4+M80V6YTPzkrNb6YCcsDInXeIkQN/8rcEsxOlNB
 9Xg2oNo79VjF1IvfF9N5J/W+fUpTmfhmntqfcVKj91GvDlqRPX6aQUZehAHftKhQKaVM
 QttsK5prv3UAW81RupOpe/+82q1zzLNmI8QKn0Il4sr46pY7MqYf9sJS7ysHzvazq4ye
 GqgA==
X-Gm-Message-State: AOAM532qSPejiAy6z2bauiqXHfKRVPavpscltJVqIf4gD2IZc/PRBaY9
 NB88NPi3Qi9qUxt2ipZKqiM4YG24I5hUBg==
X-Google-Smtp-Source: ABdhPJxCcvri52PwKoBbGZXHXP7NV3ClW9i7EtKOlrHodVcKmZQ7tEJrEdr+y0vpi5ahLHRQS75LDg==
X-Received: by 2002:a17:907:1693:: with SMTP id
 hc19mr17160390ejc.396.1639683852570; 
 Thu, 16 Dec 2021 11:44:12 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ji4sm2183113ejc.148.2021.12.16.11.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:44:12 -0800 (PST)
Message-ID: <83b633e1-f9d1-ed89-8e6f-f85250591e6d@mind.be>
Date: Thu, 16 Dec 2021 20:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20211215221153.6799-1-petr.vorel@gmail.com>
 <20211215221153.6799-2-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215221153.6799-2-petr.vorel@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 2/2] package/iputils: don't build legacy
 tools
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 23:11, Petr Vorel wrote:
> ninfod, rarpd, rdisc are legacy tools which are going to be removed from
> upstream in next release [1], following previous removals [2].
> Remove them now from Buildroot.

  Since iputils will probably not be bumped again before the 2022.02 release, 
and it probably also won't be bumped in the 2022.02.x branch, it makes sense to 
keep them available for the time being. So I've marked this patch as Rejected.

  Regards,
  Arnout

> 
> [1] https://github.com/iputils/iputils/pull/388
> [2] https://github.com/iputils/iputils/issues/363
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * move options to Config.in.legacy (Fabrice)
> 
>   Config.in.legacy           | 20 ++++++++++++++++++++
>   package/iputils/Config.in  | 23 -----------------------
>   package/iputils/iputils.mk | 10 ++++------
>   3 files changed, 24 insertions(+), 29 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 3f5ad9132e..38c8afd4a8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -4395,6 +4395,26 @@ config BR2_TARGET_UBOOT_NETWORK
>   	help
>   	  U-Boot's custom network settings options have been removed.
>   
> +config BR2_PACKAGE_IPUTILS_NINFOD
> +	select BR2_LEGACY
> +	bool "ninfod"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
> +	help
> +	  ninfod has been removed from upstream.
> +
> +config BR2_PACKAGE_IPUTILS_RDISC
> +	bool "rdisc"
> +	select BR2_LEGACY
> +	help
> +	  rdisc has been removed from upstream.
> +
> +config BR2_PACKAGE_IPUTILS_RDISC_SERVER
> +	bool "rdisc (server code)"
> +	select BR2_LEGACY
> +	depends on BR2_PACKAGE_IPUTILS_RDISC
> +	help
> +	  rdisc has been removed from upstream.
> +
>   config BR2_PACKAGE_IPUTILS_TFTPD
>   	bool "tftpd"
>   	select BR2_LEGACY
> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
> index 1a8b555570..97870d1745 100644
> --- a/package/iputils/Config.in
> +++ b/package/iputils/Config.in
> @@ -33,33 +33,10 @@ config BR2_PACKAGE_IPUTILS_RARPD
>   	help
>   	  Installs rarpd.
>   
> -config BR2_PACKAGE_IPUTILS_RDISC
> -	bool "rdisc"
> -	default y
> -	help
> -	  Installs rdisc.
> -
> -config BR2_PACKAGE_IPUTILS_RDISC_SERVER
> -	bool "rdisc (server code)"
> -	default y
> -	depends on BR2_PACKAGE_IPUTILS_RDISC
> -	help
> -	  Builds rdisc with server code.
> -
>   config BR2_PACKAGE_IPUTILS_TRACEPATH
>   	bool "tracepath"
>   	default y
>   	help
>   	  Installs tracepath.
>   
> -config BR2_PACKAGE_IPUTILS_NINFOD
> -	bool "ninfod"
> -	default y
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
> -	help
> -	  Installs ninfod.
> -
> -comment "ninfod needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -
>   endif
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 84059de330..6420720eff 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -21,19 +21,17 @@ IPUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>   # Selectively build binaries
>   IPUTILS_CONF_OPTS += \
>   	-DBUILD_CLOCKDIFF=$(if $(BR2_PACKAGE_IPUTILS_CLOCKDIFF),true,false) \
> -	-DBUILD_RARPD=$(if $(BR2_PACKAGE_IPUTILS_RARPD),true,false) \
> -	-DBUILD_RDISC=$(if $(BR2_PACKAGE_IPUTILS_RDISC),true,false) \
> -	-DENABLE_RDISC_SERVER=$(if $(BR2_PACKAGE_IPUTILS_RDISC_SERVER),true,false) \
> +	-DBUILD_NINFOD=false \
> +	-DBUILD_RARPD=false \
> +	-DBUILD_RDISC=false \
>   	-DBUILD_TRACEPATH=$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),true,false) \
> -	-DBUILD_NINFOD=$(if $(BR2_PACKAGE_IPUTILS_NINFOD),true,false) \
>   	-DSKIP_TESTS=true
>   
>   # Selectively select the appropriate SELinux refpolicy modules
>   IPUTILS_SELINUX_MODULES = \
>   	$(if $(BR2_PACKAGE_IPUTILS_ARPING),netutils) \
>   	$(if $(BR2_PACKAGE_IPUTILS_PING),netutils) \
> -	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils) \
> -	$(if $(BR2_PACKAGE_IPUTILS_RDISC),rdisc)
> +	$(if $(BR2_PACKAGE_IPUTILS_TRACEPATH),netutils)
>   
>   #
>   # arping
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
