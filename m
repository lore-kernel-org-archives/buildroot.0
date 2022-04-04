Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C30FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE38960FF5;
	Mon,  4 Apr 2022 18:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X46aVf5YxlI9; Mon,  4 Apr 2022 18:03:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED6E560FE6;
	Mon,  4 Apr 2022 18:03:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B89E41BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B559060FE6
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yFu3CoIbZtV for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:02:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E495760FE2
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:02:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id d10so7296942edj.0
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=PBj1RfMwTGjr6oq3B1nBiwv4GHiouXYzhKaj2H1aU48=;
 b=gQ1fumLVrUiW1nq8c4NY3+3TbSu6LYbthllvI16VRF0oeb89SV1nt6qEUiX6VeuAi6
 tSCPkfb7yJaU36HUrIAfidy/e2g0AHa7dSlR/ytVyywhrg88fggIUSDjNeZqZ3ZVryXv
 z4iod0zblzX6SthXT3R9hwKnvyXAdUtKmaRP1I8kd5n5NQNOhaIfZe1WXS6agFSockus
 P+77JIN71+Z5xkHqQwbj0f3JyxkuSChdkppytx+nqB5frlUsFRHUIPCHsJAip31Q2Lke
 dCH04Wx67aQsxi+YHknsB3OVMYABWb+zm5mu5pd4IDbwosWfyec8tRUASu0OXd2AWgaY
 VhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PBj1RfMwTGjr6oq3B1nBiwv4GHiouXYzhKaj2H1aU48=;
 b=1HAwgQMmCaWOxAEQU1hlj4aeyXpJtGRk8kJerOMHr2AU5DVXZRakCMCoP4kL+w4ZrY
 wz0BFI/1AUuAB/Ryq5WPUSJQ9U0tBCBTclPt9HxvYJrXCkhe0KZbdvf62koHDmTc7VK0
 hx6VA4yFXt9lNhylbatcrHXGdg6/oQ2UijmoX4V8owEEbmd0fr66B6xVX7j0DQTA3+KV
 3mWUT4T2dD2w5AluE9cL14m/Xmh51Idq9JBlzl34k62iBgKB1J9KFtodeGZlzedmEPS2
 Rc6skYCXGLmNAqUPgILuvWwEaXGfdo2ldkrWgmuIURlm3hDo7V8JMwshXH+9Yq3ZrTVc
 LuEA==
X-Gm-Message-State: AOAM533qN8mFAZL2HpR83icJiXT4P454ibiXFc9OvL33nl4nHH3IfCca
 EtsoTGePPmfhPElVhuB12OA9LaF6406SNA==
X-Google-Smtp-Source: ABdhPJzNi1tLl2G06X0ZjnIwwOhxql0cQ3vWY8p6bN9H1EMR13XiAPjThqGD0JfVKIOEzqyV+skPyg==
X-Received: by 2002:aa7:c3d6:0:b0:419:2370:4856 with SMTP id
 l22-20020aa7c3d6000000b0041923704856mr1467052edr.180.1649095374062; 
 Mon, 04 Apr 2022 11:02:54 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hr38-20020a1709073fa600b006e0280f3bbdsm4656029ejc.110.2022.04.04.11.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:02:53 -0700 (PDT)
Message-ID: <7ea28df0-42ef-18f5-cc66-de0e9c31f5f8@mind.be>
Date: Mon, 4 Apr 2022 20:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220401170255.540939-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220401170255.540939-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/udpcast: fix build without
 pod2man
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



On 01/04/2022 19:02, Fabrice Fontaine wrote:
> udpcast unconditionally build manpages which will raise the following
> build failure without pod2man since at least bump to version 20200328 in
> commit 4fb91d8b9dff314fc53438144f843b3e3ceaacaa:
> 
> sh: line 1: pod2man: command not found
> 
> To fix this issue, rework how udpcast is built and installed to always
> build and install the sender or the receiver and never build the
> manpages. As a side effect, this will also avoid to install the unneeded
> rateGovernor.h
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ce602a09357e950d79794391cd4a852d565914f1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/udpcast/Config.in  |  2 ++
>   package/udpcast/udpcast.mk | 24 ++++++++----------------
>   2 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/package/udpcast/Config.in b/package/udpcast/Config.in
> index ef94b30a99..cc38c6e57c 100644
> --- a/package/udpcast/Config.in
> +++ b/package/udpcast/Config.in
> @@ -6,6 +6,8 @@ config BR2_PACKAGE_UDPCAST
>   	bool "udpcast"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_UDPCAST_SENDER \
> +		if !BR2_PACKAGE_UDPCAST_RECEIVER
>   	help
>   	  A multicast protocol implementation which happens to
>   	  be very handy for imaging drives over the network.
> diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
> index 34ebddd2d5..4c151bb41f 100644
> --- a/package/udpcast/udpcast.mk
> +++ b/package/udpcast/udpcast.mk
> @@ -9,23 +9,15 @@ UDPCAST_SITE = http://www.udpcast.linux.lu/download
>   UDPCAST_DEPENDENCIES = host-m4
>   UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
>   UDPCAST_LICENSE_FILES = COPYING
> +UDPCAST_TARGETS = \
> +	$(if $(BR2_PACKAGE_UDPCAST_RECEIVER),udp-receiver) \
> +	$(if $(BR2_PACKAGE_UDPCAST_SENDER),udp-sender)
> +UDPCAST_MAKE_OPTS = $(UDPCAST_TARGETS)
>   
> -define UDPCAST_REMOVE_UDP_SENDER
> -	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
> -	rm -f $(TARGET_DIR)/usr/sbin/udp-sender.1
> +define UDPCAST_INSTALL_TARGET_CMDS
> +	$(foreach f,$(UDPCAST_TARGETS),\
> +		$(INSTALL) -D -m 755 $(@D)/$(f) $(TARGET_DIR)/usr/sbin/$(f)
> +	)
>   endef
>   
> -ifneq ($(BR2_PACKAGE_UDPCAST_SENDER),y)
> -UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_SENDER
> -endif
> -
> -define UDPCAST_REMOVE_UDP_RECEIVER
> -	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver
> -	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver.1
> -endef
> -
> -ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
> -UDPCAST_POST_INSTALL_TARGET_HOOKS += UDPCAST_REMOVE_UDP_RECEIVER
> -endif
> -
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
