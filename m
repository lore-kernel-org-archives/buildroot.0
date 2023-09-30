Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE624E7737A
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 16:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC25424EB;
	Sat, 30 Sep 2023 16:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC25424EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxaJp_rTTAnv; Sat, 30 Sep 2023 16:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43AB042C2B;
	Sat, 30 Sep 2023 16:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43AB042C2B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2007D1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFBD940385
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 16:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFBD940385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4DjvLBUFBMRq for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 16:51:31 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A32B34017A
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 16:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32B34017A
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40652e570d9so28408985e9.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696092690; x=1696697490;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SR7DefFl6exDg6264JCwEgQl335SBQ8lu3q4esR2dWE=;
 b=tVG88pS7omol5UVXFt+woaf3ofu6nsBNslg9iW5wmWhtguha7yNirr92UfgCgsIfVc
 SawzGq6nUSyPydve3ES4L2V3MUfGD0iYWGigT0euUqGAcVPkuqw5gBgcfIr7gmK6dHG8
 S64IbJt3D2jfZ33KqGBFqkF+w2obl2lXNzFBqeLdRNlB74Yp3LdsR9aPol/aJ5m09suw
 MMwwrf8ZdTp9ZN6hhTosB+0VmTQQPX3DFHNzOHgp0vxBKBRz6JarLSTciSauJs+Vl5gE
 NoazeU+JKIwgcqCJ0Hm9kMeHKiOvbsNZzhm5KMpi7yG+W5pYGkY08jJF+JOjLECWM8pP
 nq2g==
X-Gm-Message-State: AOJu0YyHzphpNfcfKt4FMoXqoMi8AMqR2OeXKlDNX6MZa2kJoVaPQOe6
 ONqUcZJVhte+uxdqb86tt0Ks8MOMRNAbzCPnR/y5pg==
X-Google-Smtp-Source: AGHT+IH/Hs0ReVKvniw5xwfs9QJC3+7x05/bTzK8WvNtzmdVEzIzGlaQrJY22SRCycC6fKlQnw24WQ==
X-Received: by 2002:a7b:c8d7:0:b0:406:4a32:52fc with SMTP id
 f23-20020a7bc8d7000000b004064a3252fcmr6898700wml.21.1696092689673; 
 Sat, 30 Sep 2023 09:51:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264?
 (2a01cb0404ad0b005ddb2bcd94e35264.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:5ddb:2bcd:94e3:5264])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a7bcbd0000000b0040531f5c51asm3750548wmi.5.2023.09.30.09.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 09:51:29 -0700 (PDT)
Message-ID: <cbc23baa-a46b-ab0c-e2ef-7940d9d12e69@mind.be>
Date: Sat, 30 Sep 2023 18:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20221004110421.137795-1-angelo@amarulasolutions.com>
 <20221004110421.137795-4-angelo@amarulasolutions.com>
In-Reply-To: <20221004110421.137795-4-angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696092690; x=1696697490; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SR7DefFl6exDg6264JCwEgQl335SBQ8lu3q4esR2dWE=;
 b=ZhTU3Vmm4HTlqOFNr4npJEAA3LXiX/g1xH5A9YAKA4Hf/WBaojalO4kbhXJ+U5KxHU
 StZohVNdNhjPwtvsTdFClzgC8D2trTv3ropYDE9De7QC2b/xR7B4TQ1xnY688I4lxLwq
 dyxTA+hpGK1MmWKdFIvThkuxNLUvs9UG57S9S7beYbU7jNLIuOT3x3db6mjeG4fwfRoU
 hF/eQmdS/32tdD3svdW91j1fLFnhY5kbdpvfD11cnOKjQhcognArPRSfPc+TcmdxvTjV
 LjmSH/j2UV4LW7J+dTD2Tso7od+6nnXmZYXvl/aInRHeOhG3eXQWzLimKGsnc/4dwo4s
 XwGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZhTU3Vmm
Subject: Re: [Buildroot] [PATCH v4 3/5] package/wpa_supplicant: configure
 wifi on systemd when enabled
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/10/2022 13:04, Angelo Compagnucci wrote:
> Configure a default basic wifi setup able to automatically connect
> to the selected access point.

  I think this feature is indeed useful. IIUC, currently wpa_supplicant actually 
isn't started, even though we do install a service file.

> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>   package/wpa_supplicant/wpa_supplicant.mk | 10 ++++++++++
>   system/Config.in                         |  1 +
>   2 files changed, 11 insertions(+)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 60ae290e26..8611fc6577 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -277,6 +277,15 @@ define WPA_SUPPLICANT_ENABLE_WIFI
>   		echo "}"; \
>   	) >> $(TARGET_DIR)/etc/wpa_supplicant.conf
>   endef
> +define WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/wpa_supplicant/
> +	ln -sf ../wpa_supplicant.conf \
> +		$(TARGET_DIR)/etc/wpa_supplicant/wpa_supplicant-$(BR2_SYSTEM_DHCP).conf

  If the interface-specific service is used rather than the global one, I think 
the idea is to be able to use separate conf files for them. So I think it makes 
more sense to copy than symlink.

  That said, I'm not sure if it's really useful to use the per-interface 
service. The global one should work as well, no? I think the only thing we're 
missing is to enable it for the wifi interface.

  Also, I don't think it's a good idea to reuse BR2_SYSTEM_DHCP for this. There 
are quite a few boards that have both ethernet and wifi and ideally we want both 
to come up. So I think it's worth adding a BR2_SYSTEM_WLAN to specify the wifi 
interface - and perhaps automatically select wpa_supplicant if that option is 
set (although we could just as well use iwd instead of supplicant, of course).

> +endef
> +define WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD_PRESET
> +	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset wpa_supplicant\@$(BR2_SYSTEM_DHCP).service

  I'm not sure what this is supposed to do. Doesn't it just undo the disable we 
do in 50-wpa_supplicant.preset? Wouldn't it be better to just remove that preset 
somehow?

> +endef
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD_PRESET
>   endif
>   
>   define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
> @@ -304,6 +313,7 @@ define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
>   		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant-wired@.service
>   	$(INSTALL) -D -m 644 $(WPA_SUPPLICANT_PKGDIR)/50-wpa_supplicant.preset \
>   		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-wpa_supplicant.preset
> +	$(WPA_SUPPLICANT_WIFI_INSTALL_INIT_SYSTEMD)
>   endef
>   
>   $(eval $(generic-package))
> diff --git a/system/Config.in b/system/Config.in
> index 647072b965..761a5a95c2 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -421,6 +421,7 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
>   config BR2_SYSTEM_CONNECT_WIFI
>   	bool "Connect to a default wifi access point"
>   	depends on BR2_SYSTEM_DHCP != "" && BR2_PACKAGE_WPA_SUPPLICANT
> +	select BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE if BR2_PACKAGE_SYSTEMD

  This needs some explanation. I don't see the service files requiring this 
anywhere.

  On the other hand, the global service file does start wpa_supplicant with the 
-u option so it would need dbus.


  Regards,
  Arnout

>   
>   config BR2_SYSTEM_CONNECT_WIFI_SSID
>   	string "Access point SSID"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
