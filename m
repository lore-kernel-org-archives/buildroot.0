Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FB5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89E478144B;
	Sat,  8 Jan 2022 20:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfwzU7ox4rbX; Sat,  8 Jan 2022 20:55:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE4A81443;
	Sat,  8 Jan 2022 20:55:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A44FD1BF847
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 938B540641
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qetv36cS0VOB for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:55:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89AAB4063C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:55:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so3311566wme.2
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 12:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=1IYAUQXCOPv9OfKciEG/TnyhzOuypStyVZYYCAEX74A=;
 b=ETG/vezlg+lJFcMOi8cdPXesA8AbNJd3KyB4xYLnYXGPbCipbWgzFlNt63O40O1WZ2
 l/v+0szfe+LEFVDzbjz9jqM1MfXXXo/8Q0dq0bsIbUjIdAZ7+gdxDnhjA4w9oqsBDZvB
 Gxtu+LLH6+GUlSQV3U2XqQMY1y3VmVPGs6EebiDUsJnC/zz8QE2CWogTDpNsLo2ZMMZk
 cP5VbkKTin8dm/jKkqg7zcvn+2vnIMCdqNSZ5QfJ+VPj1haqvCCRxw0EizdDj+MAJIcr
 wGT6G4eittmo05Ocrv6jgUmFbCqI957cKNCRlTemvtsXXpCTtS+nKjCpARoCnGZCzFb2
 Jt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1IYAUQXCOPv9OfKciEG/TnyhzOuypStyVZYYCAEX74A=;
 b=v1rs9zZn1kEEgQCWPgUuoeKZDkCHv5iJuzYdHTVaRxNadazoRbrkqtWFBoi1QrreEv
 wQnLysS+/4X4pC5wDqC3EM6/Beaqg8j4UUjWz0smXJOHfmsdwUv7vkX+d+JNyeBB9hY6
 XN6eM/kbQEkE91WyvpXhDsYtecchYO0OJ6flVpUSCG1kuIKs4ozNZTagpTepv00dx7A7
 lAOBsYwbn7z1fEriGxFdssVDrEmXujq78BKeUPQGUGuRy0m1rMt2kZxmKIcShM3oP1A8
 /23xeehCXIPHjG6IR+NJypPy6GQSVsIpAjtTQp0W6JCMLu+73PHU8fJO7tMzMEEl2qE5
 Dbhw==
X-Gm-Message-State: AOAM531liiJkQ7NxpcOYvfArRcwBMk0sqIpZMBkacr09VFlIY7s3oroi
 72oUpOTyEZ4vD71VtMcw9opwRg==
X-Google-Smtp-Source: ABdhPJz+jsQpyU7/lR8pDBUuoIxAhCTKQTynr0l8el30JiXuHhEgvYwp9uV/JtKZyLdxTTOFlUYwGQ==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr16039350wmj.169.1641675333788; 
 Sat, 08 Jan 2022 12:55:33 -0800 (PST)
Received: from ?IPV6:2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1?
 ([2a01:cb19:8b51:cb00:8a68:e76b:e0e9:90a1])
 by smtp.gmail.com with ESMTPSA id f8sm2811291wry.16.2022.01.08.12.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jan 2022 12:55:33 -0800 (PST)
Message-ID: <5af07a98-a5dd-6ca5-2f78-75aed51c70f1@mind.be>
Date: Sat, 8 Jan 2022 21:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Louis Aussedat <aussedat.louis@gmail.com>, buildroot@buildroot.org
References: <20200511181051.9347-1-aussedat.louis@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20200511181051.9347-1-aussedat.louis@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] rtl8189es: new package
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



On 11/05/2020 20:10, Louis Aussedat wrote:
> This package adds the rtl8189es WiFi driver.
>     repo: https://github.com/jwrdegoede/rtl8189ES_linux.git
>     branch: master
> 
> Driver is known to support Realtek RTL8189ES-VB-CG chip.
> 
> Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>

  Applied to master, thanks. Sorry it took so long.

  Regards,
  Arnout

> ---
>   DEVELOPERS                       |  1 +
>   package/Config.in                |  1 +
>   package/rtl8189es/Config.in      | 10 ++++++++++
>   package/rtl8189es/rtl8189es.hash |  2 ++
>   package/rtl8189es/rtl8189es.mk   | 17 +++++++++++++++++
>   5 files changed, 31 insertions(+)
>   create mode 100644 package/rtl8189es/Config.in
>   create mode 100644 package/rtl8189es/rtl8189es.hash
>   create mode 100644 package/rtl8189es/rtl8189es.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e427ab15d4..83b47b77b6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1520,6 +1520,7 @@ F:	package/python-dnspython/
>   F:	package/python-future/
>   F:	package/python-huepy/
>   F:	package/python-tqdm/
> +F:	package/rtl8189es/
>   
>   N:	Louis-Paul Cordier <lpdev@cordier.org>
>   F:	package/intel-gmmlib/
> diff --git a/package/Config.in b/package/Config.in
> index c12676d859..32f4b21625 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -525,6 +525,7 @@ endmenu
>   	source "package/rs485conf/Config.in"
>   	source "package/rtc-tools/Config.in"
>   	source "package/rtl8188eu/Config.in"
> +	source "package/rtl8189es/Config.in"
>   	source "package/rtl8189fs/Config.in"
>   	source "package/rtl8723bs/Config.in"
>   	source "package/rtl8723bu/Config.in"
> diff --git a/package/rtl8189es/Config.in b/package/rtl8189es/Config.in
> new file mode 100644
> index 0000000000..2e3474e5e1
> --- /dev/null
> +++ b/package/rtl8189es/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_RTL8189ES
> +	bool "rtl8189es"
> +	depends on BR2_LINUX_KERNEL
> +	help
> +	  Wireless driver rtl8189es.
> +
> +	  https://github.com/jwrdegoede/rtl8189ES_linux.git
> +
> +comment "rtl8189es needs a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
> new file mode 100644
> index 0000000000..624c51ac0d
> --- /dev/null
> +++ b/package/rtl8189es/rtl8189es.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  bf972b6494844c66885dc6846228994fac6075477cf9a7122ffd521e25ac791c  rtl8189es-2c8d44ae26485052f39d933a3a132b3ff395803a.tar.gz
> diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
> new file mode 100644
> index 0000000000..9e4053ae83
> --- /dev/null
> +++ b/package/rtl8189es/rtl8189es.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# rtl8189es
> +#
> +################################################################################
> +
> +RTL8189ES_VERSION = 2c8d44ae26485052f39d933a3a132b3ff395803a
> +RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
> +RTL8189ES_LICENSE = GPL-2.0
> +
> +RTL8189ES_MODULE_MAKE_OPTS = \
> +	CONFIG_RTL8189ES=m \
> +	KVER=$(LINUX_VERSION_PROBED) \
> +	KSRC=$(LINUX_DIR)
> +
> +$(eval $(kernel-module))
> +$(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
