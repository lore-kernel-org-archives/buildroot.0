Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31781C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB35B40104;
	Sun, 27 Mar 2022 16:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iH3nAIu6-FKZ; Sun, 27 Mar 2022 16:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 798AA40189;
	Sun, 27 Mar 2022 16:27:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F17F01BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D775940189
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:27:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3kULPvlHEySw for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:27:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0987940104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:27:48 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id pv16so24193989ejb.0
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=QyCYrusZiKGw9S4ey+yEKFxCgQpJkts4I6IfOtbDW5w=;
 b=ZayXZYoGQ/95AI6MMNtPRvrmmfU95T8PAqb2yHVBZQyLEGy+DwfqTlEQ/IwmbyoqQq
 8gZfP7eHP5yWTy3fn//Il7IcZjAx/7lvCmBPPdW8zAaeHSFbdvrWWMAA5X5I7Z5ST7NY
 SGFQtbjLarK1fubNteCDqyjW9NENEDpKgBrxG1s2WFNuD7ywEGZqqe3Zhc3HgNUWyhWM
 sPLTCqqSqWCqpWP+hS4GBKg4BNYz5yvhc7GvhGJZ+d4BGemrPyUUBhJG5F+mpue5bidt
 3yyksSGgw8YI8Dsz3sU7A7xhuFJyRS0AwQEh6lG65geoMT3355YxFBca+87bWJKqB7f8
 zvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=QyCYrusZiKGw9S4ey+yEKFxCgQpJkts4I6IfOtbDW5w=;
 b=lbQ3YptNEOmE3ONFU0tzXRuphrkH1qcUBlzbFDHOVf+eE3lDJ8hUy3uV+beb6ZLmQO
 RRtRFUdQBIQrZw266plUN6sXzRSSdRstNkXSmNpQ8wHKiehlFH7TLddpkHH1s3WYWNrR
 QotlNehbBVmZlRblQdxuc9EhfTfb9E5ixfcKi2280a1DTOD02o42UtF7PQ2PR13mYHHl
 wWxDOUAyNZmPMcz3K68kzCDIQ/X3iyS6G4l0+DFKxul0ay175NdjCo+wbzraBRq3+nXx
 82I7bi9ZQnQKXYUkGCg4A6++aZjJ5o/hMuS+PAyn4HNYT1r2+HJggt2vVn6ZHs09HtUc
 O5zw==
X-Gm-Message-State: AOAM5328/4agu1Jn86k0cKbVFl3DDCIkspt5tJUEB0608Cz3mjdjTr+R
 EFyihhLEejPiGXRf8hgLw/WNGw==
X-Google-Smtp-Source: ABdhPJw4bMrZK91vrv94Kh6VCOVVS3jluzwfueJcs2CxO5rHoHM9+Q3LTvEQi7n2Y8Q4mnZRMn4M1g==
X-Received: by 2002:a17:907:2d0a:b0:6df:8bc8:236f with SMTP id
 gs10-20020a1709072d0a00b006df8bc8236fmr22463507ejc.527.1648398467115; 
 Sun, 27 Mar 2022 09:27:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hp12-20020a1709073e0c00b006e02924bf20sm4781694ejc.117.2022.03.27.09.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:27:46 -0700 (PDT)
Message-ID: <66f33483-b1ac-640b-8226-a382de57d9c4@mind.be>
Date: Sun, 27 Mar 2022 18:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220324063928.3448755-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220324063928.3448755-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: bump to
 version 1.36.4
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



On 24/03/2022 07:39, James Hilliard wrote:
> CONTRIBUTING.md hash changed due to various style updates.
> 
> Set new default wifi backend config option to iwd when enabled in
> cases where the default wpa_supplicant is not enabled.

  Applied to master, thanks.

  However, I would like to challenge the order of preference here. If you select 
network-manager, iwd and wpa_supplicant, and network-manager uses 
wpa_supplicant, then you end up not using iwd at all, so that was probably not 
the intention of the user. However, there is a good reason to still have 
wpa_supplicant around when you have selected network-manager+iwd: wpa_supplicant 
is also used for 802.1X authentication over Ethernet.

  Either way, it's pretty hard to guess the intention of the user. So maybe a 
Config.in choice is appropriate?

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   package/network-manager/network-manager.hash |  6 +++---
>   package/network-manager/network-manager.mk   | 13 ++++++++++---
>   2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
> index d25f0e8194..26bcf843c2 100644
> --- a/package/network-manager/network-manager.hash
> +++ b/package/network-manager/network-manager.hash
> @@ -1,6 +1,6 @@
> -# From https://download.gnome.org/sources/NetworkManager/1.34/NetworkManager-1.34.0.sha256sum
> -sha256  819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd  NetworkManager-1.34.0.tar.xz
> +# From https://download.gnome.org/sources/NetworkManager/1.36/NetworkManager-1.36.4.sha256sum
> +sha256  61304e937dd926471d56715bdede7bab7ccac827356e67f2700d343317cd3c59  NetworkManager-1.36.4.tar.xz
>   # Locally computed
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> -sha256  ad0abd8e90dd134cc5546f7a13eb4268707b77a5a1a5e3afe31dc4397a573a04  CONTRIBUTING.md
> +sha256  f3c5ae3cafa27c24590cf89e732581cbeb4d25d950fe49ce7e4042963012b105  CONTRIBUTING.md
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index a90228992c..3479bb3794 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -NETWORK_MANAGER_VERSION_MAJOR = 1.34
> -NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
> +NETWORK_MANAGER_VERSION_MAJOR = 1.36
> +NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
>   NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
> @@ -53,8 +53,15 @@ endif
>   ifeq ($(BR2_PACKAGE_IWD),y)
>   NETWORK_MANAGER_DEPENDENCIES += iwd
>   NETWORK_MANAGER_CONF_OPTS += --with-iwd
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT),y)
> +NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=wpa_supplicant
>   else
> -NETWORK_MANAGER_CONF_OPTS += --without-iwd
> +NETWORK_MANAGER_CONF_OPTS += --with-config-wifi-backend-default=iwd
> +endif
> +else
> +NETWORK_MANAGER_CONF_OPTS += \
> +	--without-iwd \
> +	--with-config-wifi-backend-default=wpa_supplicant

  This is set regardless of whether wpa_supplicant is enabled or not. Are you 
sure that's OK?

  Regards,
  Arnout

>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBCURL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
