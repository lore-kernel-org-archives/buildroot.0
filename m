Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CD8C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 16:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4142560AB1;
	Tue,  4 Jan 2022 16:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TM1Z8OzhZcBQ; Tue,  4 Jan 2022 16:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64FBD60B74;
	Tue,  4 Jan 2022 16:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 63EF61BF5EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 526E681D18
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 16:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vcVcTrxEAN4w for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 16:44:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0555B81C6F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 16:44:14 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id y22so150858952edq.2
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 08:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pnvCqhos1G6kZoXjHF1NDqVAQnCB1XLdAGKJNhkt848=;
 b=VBMG5jCtkHKycZOQ+XE4bya2fmJuo1fe07ObL+5ryvq6K+tjUzCVuVref8BDZ5uidj
 7dJSsrsBNnayVX+a3VfJ4kuBVGNX8l0Mbu2mnp7g8pjZUhm5LC8HD8qK3tIDwKxWx/cK
 iD5p9Z3wtASowjOTBJvwUXBgNMRGWuLfrGvYYLHmSo+YZZdrXkA63cfBA45coi1UV+1j
 wqdUAIFdU+WzWQ2uNs8VNTn7krmSOnNfUqHfnFx07v1xQsvE7Kt3NcvOWDlmkj+Dp1Sn
 aSCleowKWG2v6wt2IX+KJAhpnIi6l+9p7O6o/ag6RqdrwdZphLCMKrbvFKu0aLLYnUYM
 ZDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pnvCqhos1G6kZoXjHF1NDqVAQnCB1XLdAGKJNhkt848=;
 b=Yf3S8OummXl6+vjJO0Ho8HGoPL/vxLf0whJrR7EC3VLF3wcjruLLA/ZxpztVlrkRbF
 YC12z5w7c6Rsk2PW3PMd83++bssazeKqDbJDoBpDDCbahQv93fZoaC6AVRxOQHe/G0WU
 4ySeZSDXwr7BaM6AAyZHr32GHB1G6VSs/fDlloMdA2OcUZ+VBWbEi2iC6c45ATQjCeI0
 Y0E4EsZZQq/wpfrVwbCqm7w6G4p4lwflbZBnJdBTLmPv9Kr2wD01JHVhEOid3xfZAQbt
 W5K6n9/N5zHCXq69GlWaWDLfdb3dRgGPpG0V7IIYyu6ERBV7Y/VLbHLuSAUd+PcXmPCf
 xQQQ==
X-Gm-Message-State: AOAM531pxs45MjZWQmclyfd3UII8W8JdIyL0WJYTSog7zaqYXAy91PEs
 yofMK5GasmR+T3sM+gHYwf1uSA==
X-Google-Smtp-Source: ABdhPJyFQZY0dMy8Cj3FaIWGGW5d0dekVsN4apN3yf/t6cSYjHVxAtkNiNM0ctfjzgQ1YyZOlX60Ig==
X-Received: by 2002:aa7:cfc2:: with SMTP id r2mr49289446edy.244.1641314653017; 
 Tue, 04 Jan 2022 08:44:13 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b1sm11230730ejb.51.2022.01.04.08.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 08:44:12 -0800 (PST)
Message-ID: <0949e63d-a8b0-d70c-af17-06cecbbe87f1@mind.be>
Date: Tue, 4 Jan 2022 17:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101135737.956301-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101135737.956301-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ksmbd-tools: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 14:57, Fabrice Fontaine wrote:
> ksmbd kernel server userspace utilities.
> 
> https://github.com/cifsd-team/ksmbd-tools
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                           |  1 +
>   package/Config.in                    |  1 +
>   package/ksmbd-tools/Config.in        | 15 +++++++++++++++
>   package/ksmbd-tools/ksmbd-tools.hash |  3 +++
>   package/ksmbd-tools/ksmbd-tools.mk   | 20 ++++++++++++++++++++
>   5 files changed, 40 insertions(+)
>   create mode 100644 package/ksmbd-tools/Config.in
>   create mode 100644 package/ksmbd-tools/ksmbd-tools.hash
>   create mode 100644 package/ksmbd-tools/ksmbd-tools.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 98ff2372cc..cf0e6fe0fc 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -870,6 +870,7 @@ F:	package/hiredis/
>   F:	package/i2pd/
>   F:	package/igd2-for-linux/
>   F:	package/json-c/
> +F:	package/ksmbd-tools/
>   F:	package/lcms2/
>   F:	package/lftp/
>   F:	package/libcap-ng/
> diff --git a/package/Config.in b/package/Config.in
> index 4185675e4c..1e25ccd964 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2235,6 +2235,7 @@ endif
>   	source "package/keepalived/Config.in"
>   	source "package/kismet/Config.in"
>   	source "package/knock/Config.in"
> +	source "package/ksmbd-tools/Config.in"
>   	source "package/leafnode2/Config.in"
>   	source "package/lft/Config.in"
>   	source "package/lftp/Config.in"
> diff --git a/package/ksmbd-tools/Config.in b/package/ksmbd-tools/Config.in
> new file mode 100644
> index 0000000000..ce1850e016
> --- /dev/null
> +++ b/package/ksmbd-tools/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_KSMBD_TOOLS
> +	bool "ksmbd-tools"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libnl
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBNL
> +	help
> +	  ksmbd kernel server userspace utilities.
> +
> +	  https://github.com/cifsd-team/ksmbd-tools
> +
> +comment "ksmbd-tools needs a toolchain w/ wchar, threads"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
> new file mode 100644
> index 0000000000..ad507bfdb2
> --- /dev/null
> +++ b/package/ksmbd-tools/ksmbd-tools.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  bd7218ebfeaa0d6a73c0a4beb9ea506228cd5695c1f8d3f9a9064e2346d52f0a  ksmbd-tools-3.4.3.tar.gz
> +sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
> diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
> new file mode 100644
> index 0000000000..b3ffc3e768
> --- /dev/null
> +++ b/package/ksmbd-tools/ksmbd-tools.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# ksmbd-tools
> +#
> +################################################################################
> +
> +KSMBD_TOOLS_VERSION = 3.4.3
> +KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
> +KSMBD_TOOLS_LICENSE = GPL-2.0+
> +KSMBD_TOOLS_LICENSE_FILES = COPYING
> +KSMBD_TOOLS_DEPENDENCIES = host-pkgconf libglib2 libnl
> +
> +ifeq ($(BR2_PACKAGE_LIBKRB5),y)
> +KSMBD_TOOLS_CONF_OPTS += --enable-krb5
> +KSMBD_TOOLS_DEPENDENCIES += libkrb5
> +else
> +KSMBD_TOOLS_CONF_OPTS += --disable-krb5
> +endif
> +
> +$(eval $(autotools-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
