Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7335C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E88A60D76;
	Sat, 11 Dec 2021 20:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URzV18n5XHRe; Sat, 11 Dec 2021 20:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC2A160D73;
	Sat, 11 Dec 2021 20:53:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A61B61BF576
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9461460D73
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7ZJmXDSxUwf for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 997BA60768
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:11 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y13so39823554edd.13
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 12:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1Eaxjirmo5huxe6LkIMJmRWsJ0OpnT2+zBqOg3AtoOM=;
 b=QT9PR6u+AePDoP+qZbdGH3LZlcmZs7D4eniakGUWML8yB0UDtipBuQx7aNZTswof0a
 RiO/3GoQgeCz8++4vbJetB/3hfc3ZH7foRzU9eYNvxnwpgtB1wzYwJdro3EN7OsiGt+D
 Fh2zEirLgxO8j406CyM0ix4g8lk+7g3+/L3M8JQXLkYG2Z7raA8t5AFKrvexvoxt59h4
 UiDGZunGq1OPJVMN3Uf8Kyr4+emK3bsX4wo52usBhEiIugHUcEcbI+nXW+AVMmkqdpJQ
 L2+vU+tE4tklM7SuaCDxcxu4LkYzaMdl/Nsh0gVuf/g2rBkVPysc0XcJnBvQvouRHJRy
 WT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=1Eaxjirmo5huxe6LkIMJmRWsJ0OpnT2+zBqOg3AtoOM=;
 b=4c20cJMbNfEdrmJIXRmXlDPDPHrvE3+gR2QP41TqgX7AaxM/fx6uwKiJ/q+Vn0sUrq
 Q58RqBVTljKgEVR4jcDab+MOrve0FeioMQ7d1lfXGjaaMAKZ7XxZk4vNVOk3wr1q6MW/
 WuzUPEWCkrjR7HvYYfI/D/a0xLfF3mNg4siBYcSKzcJe9FgBch3rnhcuR1juFpoZ4zWr
 OjOck/jB9hH+UubGApnttdhtBLgx9oDgMHVCEX7lABJAoMgmXtsaes67+NZ4vUPpTJbP
 7klCfyhl3Ir4QQ3jDUtvcfycP/8s71Z/CAEtIHLh+mkIFTGAGBRP/tdi9jhLUKrvrOsp
 caiw==
X-Gm-Message-State: AOAM533ApLu07wNO2BmxEVxh+k0030eSi1bqVpKifP+zR8KaZp7xqBLq
 LL/kg4Kukn/B7PQ7NjBELGvREw==
X-Google-Smtp-Source: ABdhPJx1ZSiVsU4TRTXCR/U620KDxCgB6kqcAVbeQZr5tAA5SLeu3MB6WUC6XmM95VxqAX4t27dxEg==
X-Received: by 2002:a17:907:2d87:: with SMTP id
 gt7mr33428357ejc.554.1639255989698; 
 Sat, 11 Dec 2021 12:53:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id yd13sm3542908ejb.39.2021.12.11.12.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 12:53:09 -0800 (PST)
Message-ID: <d9ec5171-b2e7-c971-e0e3-e6f8abd73e64@mind.be>
Date: Sat, 11 Dec 2021 21:53:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211125025952.1694072-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211125025952.1694072-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cups-pk-helper: new package
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/11/2021 03:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/Config.in                          |  1 +
>   package/cups-pk-helper/Config.in           | 17 +++++++++++++++++
>   package/cups-pk-helper/cups-pk-helper.hash |  3 +++
>   package/cups-pk-helper/cups-pk-helper.mk   | 14 ++++++++++++++
>   4 files changed, 35 insertions(+)
>   create mode 100644 package/cups-pk-helper/Config.in
>   create mode 100644 package/cups-pk-helper/cups-pk-helper.hash
>   create mode 100644 package/cups-pk-helper/cups-pk-helper.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index cb94e30be3..bdadbd2799 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2140,6 +2140,7 @@ menu "Networking applications"
>   	source "package/ctorrent/Config.in"
>   	source "package/cups/Config.in"
>   	source "package/cups-filters/Config.in"
> +	source "package/cups-pk-helper/Config.in"
>   	source "package/dante/Config.in"
>   	source "package/darkhttpd/Config.in"
>   	source "package/dehydrated/Config.in"
> diff --git a/package/cups-pk-helper/Config.in b/package/cups-pk-helper/Config.in
> new file mode 100644
> index 0000000000..63a0d3acd8
> --- /dev/null
> +++ b/package/cups-pk-helper/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_CUPS_PK_HELPER
> +	bool "cups-pk-helper"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # polkit -> c++17
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, polkit
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_PACKAGE_CUPS
> +	select BR2_PACKAGE_POLKIT
> +	help
> +	  cups-pk-helper is a PolicyKit helper to configure cups with
> +	  fine-grained privileges.
> +
> +	  https://wiki.freedesktop.org/www/Software/cups-pk-helper/
> +
> +comment "cups-pk-helper support needs a toolchain with threads, wchar, gcc >= 7"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
> +		!BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/cups-pk-helper/cups-pk-helper.hash b/package/cups-pk-helper/cups-pk-helper.hash
> new file mode 100644
> index 0000000000..18fe789389
> --- /dev/null
> +++ b/package/cups-pk-helper/cups-pk-helper.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  959af8f2f5a2761e7e498b61c9caf25ae963335031eae9972d999e9a0d97a228  cups-pk-helper-0.2.6.tar.xz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/cups-pk-helper/cups-pk-helper.mk b/package/cups-pk-helper/cups-pk-helper.mk
> new file mode 100644
> index 0000000000..c90b94da14
> --- /dev/null
> +++ b/package/cups-pk-helper/cups-pk-helper.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# cups-pk-helper
> +#
> +################################################################################
> +
> +CUPS_PK_HELPER_VERSION = 0.2.6
> +CUPS_PK_HELPER_SITE = https://www.freedesktop.org/software/cups-pk-helper/releases
> +CUPS_PK_HELPER_SOURCE = cups-pk-helper-$(CUPS_PK_HELPER_VERSION).tar.xz
> +CUPS_PK_HELPER_LICENSE = GPL-2.0+
> +CUPS_PK_HELPER_LICENSE_FILES = COPYING
> +CUPS_PK_HELPER_DEPENDENCIES = cups libglib2 polkit
> +
> +$(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
