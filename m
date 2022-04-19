Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BD9C433FE
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEF6B60E50;
	Tue, 19 Apr 2022 20:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id plHrl_U36Cbb; Tue, 19 Apr 2022 20:40:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D4360B01;
	Tue, 19 Apr 2022 20:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC9671BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9DBF60B01
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2wci5UgO_tfG for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:40:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89C1960A87
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:40:00 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t25so22797323edt.9
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=qiDYT2snSgIfPKRDERLkmyjVacVTqi3bsDiUAOQGXWY=;
 b=g5WzAhzXZ8qyRhGQaP4YV/+FOAZk3+zJ7wtUIF3z1YRdxb2uI6jjIqjWhH74IrpREX
 YS6SavF9NfXUjRm7UmPQfNkPeunKH9sc2WKG8bGUIB81zJIv5kBJrf8l2IpWt2WGGg9t
 BaqmUNA2xgNz8XB0razQh3yXicXazDSI0ZFVGuSecEi2aJXM36d1qt6Qcva3JKb3ahfs
 RnFFp2/SmuMQnD5hAnpzbsZKi8J7J5D74U2Rw1UR2xjfxua2dVVii9Yr1sHM591rOdBn
 /O2j+kmaJGK9PhSx/UkB4vxt0LGK6CDJDZwDgnXrgqcFQpRBaPNWsvOr8f/6LWvYl5PL
 Tufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qiDYT2snSgIfPKRDERLkmyjVacVTqi3bsDiUAOQGXWY=;
 b=Nhs9I3mlLh1j18RiPgezmZ9RKu8awjiovGySA0cugXvM8u++OwPTwBQC2QEuy54LEA
 KgEC7+7yflQAQ3KHMwSX6hDKbGvLN9Wd+7n21/mhSSQt+VUmTlnubAVSNmdg0kCFM/C1
 lTVdcX6csi4ZIRd62sgB+rf4kdkLS83HgjAJShJNaNA+6iKnOV8oop8XBViNzKamcf3X
 06cGiQJucX7XIr4la5dNLUqL8ac9qudx/h3JEeasCFjJbIuSZeUqh1cLjnypgjEHkBRZ
 gnP3LixsMhsh5y+BmAv2LwhQ2TM6WKey1N7nfmzwI7JhQH8CkWQ+kZyqsC0UGKTue0LI
 YOMQ==
X-Gm-Message-State: AOAM533MqKRbE+IynOE2w2idLaf6T6+wBeL4+f8DW+6W/nPcZVdQatMe
 F9iY2Mf1Cs1WFEI2D613i62DXjfFKqKF+w==
X-Google-Smtp-Source: ABdhPJzHtunv/H/5c5A2HbvThrgSCxNKZShVBebSvSPMEMeXTWymivzVGax/l9XjmXvd4N95d5Rdwg==
X-Received: by 2002:a05:6402:40ca:b0:423:d335:738a with SMTP id
 z10-20020a05640240ca00b00423d335738amr18043528edb.66.1650400798761; 
 Tue, 19 Apr 2022 13:39:58 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a1709067b8300b006e4a6dee49dsm6082045ejo.184.2022.04.19.13.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:39:58 -0700 (PDT)
Message-ID: <f25e4d35-a685-f482-44a4-acae8b301af5@mind.be>
Date: Tue, 19 Apr 2022 22:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20220415025224.1876125-1-tianyuanhao3@163.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220415025224.1876125-1-tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH] package/network-manager: remove invalid
 dependencies
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



On 15/04/2022 04:52, TIAN Yuanhao wrote:
> Dependency on libiw has been removed since 0.9.3.990 [1].
> Dependency on libgcrypt has been removed since 1.2-beta1 [2].
> Dependency on libuuid has been removed since 1.31.4-dev [3].
> 
> [1]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/7d0761588c2dde8816c109c38c1c94233fd74afe
> [2]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/b6f5f030331cc680edbe19ae322e894494d63687
> [3]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

  Applied to master, thanks. Thank you for the detailed research on when/why 
they were removed.

  Regards,
  Arnout

> ---
>   package/network-manager/Config.in          | 6 ------
>   package/network-manager/network-manager.mk | 2 +-
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index a48cb37b15..1370c81c9c 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -1,6 +1,5 @@
>   config BR2_PACKAGE_NETWORK_MANAGER
>   	bool "network-manager"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>   	depends on !BR2_STATIC_LIBS # gnutls
>   	depends on BR2_USE_MMU # dbus
>   	depends on BR2_PACKAGE_HAS_UDEV
> @@ -13,11 +12,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
>   	select BR2_PACKAGE_DBUS
>   	select BR2_PACKAGE_GNUTLS
>   	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_LIBGCRYPT
> -	select BR2_PACKAGE_UTIL_LINUX
> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> -	select BR2_PACKAGE_WIRELESS_TOOLS
> -	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
>   	select BR2_PACKAGE_LIBNDP
>   	help
>   	  NetworkManager is a set of co-operative tools that make
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index a90228992c..d979cfc0d7 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
>   NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> -	libgcrypt wireless_tools util-linux host-intltool libndp
> +	host-intltool libndp
>   NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
>   NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
>   NETWORK_MANAGER_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
