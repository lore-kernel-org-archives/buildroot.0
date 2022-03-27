Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76034C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326D981D7C;
	Sun, 27 Mar 2022 15:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m393UeILhXiR; Sun, 27 Mar 2022 15:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2527A81678;
	Sun, 27 Mar 2022 15:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F32B1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DB7360A8A
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Q7ZCgqLExrU for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:55:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 040A36068A
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:55:51 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id lr4so15617905ejb.11
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GBK/BUyql/ThBb0gUhg8Nw5q4P6mVbSJwQH94BuVDbk=;
 b=gwTwhLdY3VdamPyPs3jsvW+DuSn0zzgMB1iasF+No0eDWKky+zoFpD4ZY9iz5PmYMT
 IFpzTCW9lTKGiHTTm2pIrDtreHkcwwV0xWO6CSB1cn0RlHuCJoLJ+Zj/0217DsRME7ez
 aV9R2t+psbi+JlbO6fJ25l/O5ruH6nMm3AEVZ3DzN+1oPdUCdmYIlVbTubtsOyW8KYWp
 R14tHbrz5PDf/DrkCDnkUGJMVwEWyMBXQ/5cJ3JiTUrnOZhcNXf9ygMDqLT8tHScKyt2
 ztujqlhySAyjgI4VBZHJybsMBJq82f2atn1XrtFyO21gHbLEbflk2EiSTs3V7R1kWyAv
 hf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GBK/BUyql/ThBb0gUhg8Nw5q4P6mVbSJwQH94BuVDbk=;
 b=PFQ0Zy5lxj3hneuHJSaD+m+uBkI3h7EatzCRLjIdq1X8iq/ZQJIWxNtQTDAX5YLowl
 64hJkEz2zHmhT379KVMgyXizMtksNnodYrXh3KlxqG3S+vMUSceZ44gqrjwHxwZCr1kW
 1rt2gGl4S6TyUZyNRuACY63mF+NyewmIrecniZhi+Xg32LJ5uFZ3Po0V821YXsqlLn6Z
 dRxERSvq9Ys5C780V/wgU8rOktEIfipao1VHxZDvkxMYb/zfSFJ6OMP3IsDsP+HyVJJV
 RDzjGCO/1IGQiMC/3pGRlOR9VF9fviYyVsHqH/EvIDfv7YXYm11Min8Ita6xJXn34xS4
 t42g==
X-Gm-Message-State: AOAM533e0WdntSDoZVuxD5Lb219daQpXDyWKbqQSXeEscKX4gekeIGsj
 FqG+JhoRJnD+KWdVJXgYJl8SXg==
X-Google-Smtp-Source: ABdhPJwtLMGx2K0xkZNIxnJDXnl9dUQ15pAWjedq7YcISjH/Ld4QWtdL3XsXoi7vxqvnkRaQkLoZsw==
X-Received: by 2002:a17:906:7948:b0:6da:64ed:178e with SMTP id
 l8-20020a170906794800b006da64ed178emr23022734ejo.523.1648396550169; 
 Sun, 27 Mar 2022 08:55:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm4729837ejd.133.2022.03.27.08.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:55:49 -0700 (PDT)
Message-ID: <f0bd0fb1-3ad5-0811-071a-9f2800c6066a@mind.be>
Date: Sun, 27 Mar 2022 17:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220319193422.1148509-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220319193422.1148509-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/usbguard: bump to version 1.1.1
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/03/2022 20:34, Fabrice Fontaine wrote:
> - This bump fixes unauthorized access via D-Bus (CVE-2019-25058):
>    https://github.com/advisories/GHSA-p5wh-m4gj-x2mr
>    but dbus is disabled on buildroot
> - musl is supported since
>    https://github.com/USBGuard/usbguard/commit/b04e8deacac4f3f4a82a10b219c2d555e1b2aa24
> - C++17 is now mandatory:
>    https://github.com/USBGuard/usbguard/commit/8c86264986685bf646c65228abce2432e08e3c4c
> - Update hash of license file (use license file from gnu.org:
>    https://github.com/USBGuard/usbguard/commit/3292511ab164ce0bdf6d58f0369ce3993dded9ad)
> 
> https://github.com/USBGuard/usbguard/blob/usbguard-1.1.1/CHANGELOG.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/usbguard/Config.in     | 8 +++-----
>   package/usbguard/usbguard.hash | 6 ++++--
>   package/usbguard/usbguard.mk   | 2 +-
>   3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
> index e97d0e729c..4c3dc7f2c2 100644
> --- a/package/usbguard/Config.in
> +++ b/package/usbguard/Config.in
> @@ -3,9 +3,8 @@ config BR2_PACKAGE_USBGUARD
>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>   	depends on BR2_INSTALL_LIBSTDCPP # protobuf
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>   	depends on !BR2_STATIC_LIBS # libqb, protobuf
> -	depends on !BR2_TOOLCHAIN_USES_MUSL
>   	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
>   	select BR2_PACKAGE_PROTOBUF
>   	select BR2_PACKAGE_LIBQB
> @@ -19,10 +18,9 @@ config BR2_PACKAGE_USBGUARD
>   
>   	  https://usbguard.github.io/
>   
> -comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
> +comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 7"
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
> -		|| BR2_TOOLCHAIN_USES_MUSL
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>   
>   comment "usbguard needs a toolchain not affected by GCC bug 64735"
> diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
> index fd77acc75a..a69240b3f9 100644
> --- a/package/usbguard/usbguard.hash
> +++ b/package/usbguard/usbguard.hash
> @@ -1,3 +1,5 @@
> +# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.1/usbguard-1.1.1.tar.gz.sum
> +sha256  460ebfb4ffc5609739a202a3a1d9fda1c30de033b634845b8baa136352bfb432  usbguard-1.1.1.tar.gz
> +
>   # Locally calculated
> -sha256  5617986cd5dd1a2d311041648a1977d836cf4e33a4121d7f82599f21496abc42  usbguard-1.0.0.tar.gz
> -sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
> index 54a4031056..614b7d655d 100644
> --- a/package/usbguard/usbguard.mk
> +++ b/package/usbguard/usbguard.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -USBGUARD_VERSION = 1.0.0
> +USBGUARD_VERSION = 1.1.1
>   USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
>   USBGUARD_LICENSE = GPL-2.0+
>   USBGUARD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
