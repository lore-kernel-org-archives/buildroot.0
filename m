Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800D6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DDA0410BD;
	Mon,  7 Mar 2022 21:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpsUP1_Nr0XB; Mon,  7 Mar 2022 21:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C4E141521;
	Mon,  7 Mar 2022 21:24:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C389F1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF1D4403A4
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:23:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPGYWkSv1OTx for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:23:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 623234012E
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:23:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qa43so34783005ejc.12
 for <buildroot@buildroot.org>; Mon, 07 Mar 2022 13:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cfqz1pBxcIMe9p6aEfTYd5HvhOC1PdSoyRYwllGTo/s=;
 b=OR/YUS6DaNy+IEjbwj7VqwXVNEQg+GPTAmDrb9S56wPUaHVa3a8KXeJc1hiznX9qlG
 waUFunVCTa+MEqkiHX/yscZTDqvrdPm2DMAvWQZmk5Il3O/49PnUMJIFUR2xDuW2jfyY
 SQN17Cryyh2lg7HdU4KoSEPC5GFj+wVIuAbOsMzDAbJWXEOWYDi/clk51ktjGmvE+bsQ
 oG6sow0Gv8WAyKBYygGQJSVbj2wdKfYIGOJjYM4fvbgYw19lLu7TOim8oyKAIGfaYwo1
 l1LID7QBRqtcyQKOLgpwEMFyYaSO+SLKJakBH+Y1GIV34E8qYjxAbLF90Zpja0V7ilpo
 6GzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cfqz1pBxcIMe9p6aEfTYd5HvhOC1PdSoyRYwllGTo/s=;
 b=etK9PCDAPmqVLI83gImzuD4Sv3F3cLvCVH7xgpWRedjxdn50xa+R4f6uA1EfFYD7j/
 dxsdv0UGceHfHwBeIoY4P4EMTlMQZqD9aGpSKFReCPlXrdwXSadKccU2lmzt/iWy9esX
 RddIeVJO1FF0JCXNKGGlTVr8Wk5ZJs+tVMapDB2pfc6QgaDMGFyHxFVep741jjUxRjlq
 C9kT3Tu7eURxOCtGpqXyhsgte0hj8377IoUvm84CRzmN1/3lfjgiijrEDrqcC+zS/rZe
 uuBCP/8YbgurSRiVfMqzZUOU4D359QpSqJlXoRH2sTKoMX5PKqIXtkXTF3vYAw8aZ0tz
 rlAg==
X-Gm-Message-State: AOAM532SCDf3cr+gTPZpqGGKp8FjXEdCax1PdsHY8j8TrrJiDOotU5BA
 0dGHN1rXPiqFPWCHWD44y1GVe8s6PwYosw==
X-Google-Smtp-Source: ABdhPJwxuzpf+HtgIn4hn9uDkKSkXhRAp5vxjpjcnxnnmqZA5o21TvjGR5SxXIRmNRoShXD1mAY2hA==
X-Received: by 2002:a17:906:3ec9:b0:6bb:2eb9:84f with SMTP id
 d9-20020a1709063ec900b006bb2eb9084fmr10478703ejj.86.1646688233406; 
 Mon, 07 Mar 2022 13:23:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cc20-20020a0564021b9400b00412f2502469sm6815081edb.23.2022.03.07.13.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 13:23:53 -0800 (PST)
Message-ID: <eaf038a6-c6f4-2aed-43ee-430cf0f2792e@mind.be>
Date: Mon, 7 Mar 2022 22:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
References: <20220217211823.402414-1-geomatsi@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220217211823.402414-1-geomatsi@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/{hostapd,
 wpa_s}: modify config options handling
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/02/2022 22:18, Sergey Matyukevich wrote:
> Makefiles hostapd.mk and wpa_supplicant.mk define different macros for
> different defconfig options. Options that are not listed in defconfig,
> can be set using CONFIG_SET. Options that are listed in defconfig, can
> be enabled or disabled using CONFIG_ENABLE or CONFIG_DISABLE. Starting
> from hostapd v2.10, option CONFIG_DPP is explicitly listed in defconfig.
> So it would be time to switch to enable/disable macros for this option.
> 
> On the other hand, this approach looks fragile: we have to track
> 'promoted' defconfig options for each hostapd/wpa_s update. This patch
> removes CONFIG_SET macros, keeping only CONFIG_ENABLED/CONFIG_DISABLED.
> CONFIG_SET is replaced by the additional pass over enabled options. All
> such options that are not listed in defconfig, will be appended to the
> configuration file.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/3f8058ee6f3913fda795578f206db895731ba1e6/
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> 
> v1 -> v2:
> 
> - drop patch for mesh fix
> - remove CONFIG_SET macro as per suggestion by Thomas
> 
> 
>   package/hostapd/hostapd.mk               | 20 +++++++++++++-------
>   package/wpa_supplicant/wpa_supplicant.mk |  9 +++++++--
>   2 files changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index 075cb2a8d0..99f0cdf1b8 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -15,7 +15,6 @@ HOSTAPD_LICENSE_FILES = README
>   
>   HOSTAPD_CPE_ID_VENDOR = w1.fi
>   HOSTAPD_SELINUX_MODULES = hostapd
> -HOSTAPD_CONFIG_SET =
>   
>   HOSTAPD_CONFIG_ENABLE = \
>   	CONFIG_INTERNAL_LIBTOMMATH \
> @@ -83,13 +82,14 @@ HOSTAPD_CONFIG_ENABLE += CONFIG_WPS
>   endif
>   
>   ifeq ($(BR2_PACKAGE_HOSTAPD_WPA3),y)
> -HOSTAPD_CONFIG_SET += \
> -	CONFIG_DPP \
> -	CONFIG_SAE
>   HOSTAPD_CONFIG_ENABLE += \
> +	CONFIG_DPP \
> +	CONFIG_SAE \
>   	CONFIG_OWE
>   else
>   HOSTAPD_CONFIG_DISABLE += \
> +	CONFIG_DPP \
> +	CONFIG_SAE \
>   	CONFIG_OWE
>   endif
>   
> @@ -98,8 +98,9 @@ HOSTAPD_CONFIG_ENABLE += CONFIG_NO_VLAN
>   endif
>   
>   ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_DYNAMIC),y)
> -HOSTAPD_CONFIG_ENABLE += CONFIG_FULL_DYNAMIC_VLAN
> -HOSTAPD_CONFIG_SET += NEED_LINUX_IOCTL
> +HOSTAPD_CONFIG_ENABLE += \
> +	CONFIG_FULL_DYNAMIC_VLAN \
> +	NEED_LINUX_IOCTL
>   endif
>   
>   ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_NETLINK),y)
> @@ -123,9 +124,14 @@ define HOSTAPD_CONFIGURE_CMDS
>   	cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
>   	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(HOSTAPD_CONFIG_ENABLE)) \
>   		$(patsubst %,-e 's/^\(%\)/#\1/',$(HOSTAPD_CONFIG_DISABLE)) \
> -		$(patsubst %,-e '1i%=y',$(HOSTAPD_CONFIG_SET)) \
>   		$(patsubst %,-e %,$(HOSTAPD_CONFIG_EDITS)) \
>   		$(HOSTAPD_CONFIG)
> +	# set requested configuration options not listed in hostapd defconfig
> +	for s in $(HOSTAPD_CONFIG_ENABLE) ; do \
> +		if ! grep -q "^$${s}" $(HOSTAPD_CONFIG); then \
> +			echo "$${s}=y" >> $(HOSTAPD_CONFIG) ; \
> +		fi \
> +	done
>   endef
>   
>   define HOSTAPD_BUILD_CMDS
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index b414144774..f0eb36e083 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -164,7 +164,7 @@ WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
>   endif
>   
>   ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
> -WPA_SUPPLICANT_CONFIG_SET += CONFIG_BUILD_WPA_CLIENT_SO
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_BUILD_WPA_CLIENT_SO
>   define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
>   	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/libwpa_client.so \
>   		$(TARGET_DIR)/usr/lib/libwpa_client.so
> @@ -183,9 +183,14 @@ define WPA_SUPPLICANT_CONFIGURE_CMDS
>   	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
>   	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
>   		$(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
> -		$(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
>   		$(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
>   		$(WPA_SUPPLICANT_CONFIG)
> +	# set requested configuration options not listed in wpa_s defconfig
> +	for s in $(WPA_SUPPLICANT_CONFIG_ENABLE) ; do \
> +		if ! grep -q "^$${s}" $(WPA_SUPPLICANT_CONFIG); then \
> +			echo "$${s}=y" >> $(WPA_SUPPLICANT_CONFIG) ; \
> +		fi \
> +	done
>   endef
>   
>   # LIBS for wpa_supplicant, LIBS_c for wpa_cli, LIBS_p for wpa_passphrase
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
