Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8FEC433EF
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 21:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB9504109D;
	Mon,  2 May 2022 21:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mf0cqC1I554q; Mon,  2 May 2022 21:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 552D1409C6;
	Mon,  2 May 2022 21:54:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0201BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BEB4409C6
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnfdKPmz5ZNS for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:54:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37E11409B2
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:54:13 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id a21so18039883edb.1
 for <buildroot@buildroot.org>; Mon, 02 May 2022 14:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bzR8+zVWwYFHpxLoWtsskgK9lIoVt5QrGjROyrT14cE=;
 b=ibXMmKqHiaT7+gRCQrEXWxeNEFOR7rgQrTLToQmh4IvGCQ+br7FsD6sZ6FGyxLCFZ6
 OAtOc1GgshSKfw4e649d++poMEvC4MfPO2SfvbVBlSvbYbXX/AaNv5z7wPKmxUlfrxvL
 45H3V9jI1QgACJhN5wroZkErK5Qf+h/tmj7zKFM6CRl9tifAOXtAAdVjzHvs+YyfrjFh
 ro6/7bDehCwnoNmYIKP9SqPFYEmFiHoLpERdwE3oG+KqweWBKvnPMzxXZNspBE/vrfWu
 oftf+fhipwqfeenh32XBi7qM32gBCKuLq3CjaJOo1BreU/8a7/r/igpn6IapUlJtP76c
 Wkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bzR8+zVWwYFHpxLoWtsskgK9lIoVt5QrGjROyrT14cE=;
 b=JAmFtblsk91aHVtn94kgkAE5vJCt0zN+GbSehdMFbFTGZUBufHybdtHbZn/OS0TiyC
 mEVbaEpDPd+fzyyLbkP7xRIp17BbItzz53FqGZWmNOEuiZYNtWXG9XeNcwNtuzideZoW
 OdC0ldL2gsMv5l9ejaVoSh/Ikd8UwNZrHo7GaSK22wv+ZYB693WE+wkNt5qG7/+uPQru
 hKLu5AnfLdAoXHcWLaZZRvBNi80NO3UNo4qgSiDthHzTcbWPXiW2csv7+AK1aMpb35VV
 eVKFNxDMrmvNCUOrn03I4Gnp8kcbzV/MrP7PXMDO5IIMKTw6yqZo2tXI7TLYKoNZFnYw
 0JJw==
X-Gm-Message-State: AOAM532mEYW+CUwlYEHqULmmuMPx8ilRqFH7UdylxBaygySqCROsQQg+
 9u2oZGfTwCfCvjaRdCyJFxKTsjRybCxiKQ==
X-Google-Smtp-Source: ABdhPJwtayI+Mlhm1cnUNXvlVZ1PUIbljAWSkfU2bBhpgC8lKe+cAmnrEGgg1OFUyJy0Z7yvobTjDw==
X-Received: by 2002:aa7:db0a:0:b0:427:db1d:b258 with SMTP id
 t10-20020aa7db0a000000b00427db1db258mr2547211eds.304.1651528451399; 
 Mon, 02 May 2022 14:54:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 ig11-20020a1709072e0b00b006f3ef214e2dsm4125802ejc.147.2022.05.02.14.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:54:10 -0700 (PDT)
Message-ID: <c199ac1d-6883-fca4-5065-87ee6c466f12@mind.be>
Date: Mon, 2 May 2022 23:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
References: <20220502051059.8301-1-dariobin@libero.it>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502051059.8301-1-dariobin@libero.it>
Subject: Re: [Buildroot] [v2,
 1/1] package/libmnl: add options to build examples
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/05/2022 07:10, Dario Binacchi wrote:
> The example applications, which are minimal, can be of great help in
> understanding how the library works.
> 
> As there is no configure option to enable examples compilation, building
> and installation instructions had to be added to libmnl.mk. By default,
> which is always the case for buildroot, they are disabled.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
> Changes v1 -> v2:
> - Build all examples when BR2_PACKAGE_LIBMNL_EXAMPLES is set.
> ---
>   package/libmnl/Config.in |  9 +++++++++
>   package/libmnl/libmnl.mk | 28 ++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
> index 5acfb2447e..b4a4195751 100644
> --- a/package/libmnl/Config.in
> +++ b/package/libmnl/Config.in
> @@ -5,3 +5,12 @@ config BR2_PACKAGE_LIBMNL
>   	  to Netlink developers.
>   
>   	  http://netfilter.org/projects/libmnl/
> +
> +if BR2_PACKAGE_LIBMNL
> +
> +config BR2_PACKAGE_LIBMNL_EXAMPLES
> +	bool "install examples"
> +	help
> +	  Install binary examples.
> +
> +endif
> diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
> index 3361d05248..d9b1fbabe7 100644
> --- a/package/libmnl/libmnl.mk
> +++ b/package/libmnl/libmnl.mk
> @@ -12,4 +12,32 @@ LIBMNL_LICENSE = LGPL-2.1+
>   LIBMNL_LICENSE_FILES = COPYING
>   LIBMNL_CPE_ID_VENDOR = netfilter
>   
> +ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES),y)
> +define LIBMNL_EXAMPLES_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) check -C $(@D)
> +endef
> +LIBMNL_POST_BUILD_HOOKS += LIBMNL_EXAMPLES_BUILD_CMDS
> +
> +LIBMNL_EXAMPLES_INSTALL_TARGETS += \
> +	$(addprefix examples/genl/, genl-family-get genl-group-events)
> +LIBMNL_EXAMPLES_INSTALL_TARGETS += \

  This could have been simpler as

LIBMNL_EXAMPLES_INSTALL_TARGETS = \
	$(addprefix ...) \
	$(addprefix ...) \
	....

  But I was too lazy to fix it up, so I applied to master as is, thanks.

  Regards,
  Arnout

> +	$(addprefix examples/kobject/, kobject-event)
> +LIBMNL_EXAMPLES_INSTALL_TARGETS += \
> +	$(addprefix examples/netfilter/, nfct-create-batch \
> +		nfct-daemon nfct-dump nfct-event nf-log \
> +		nf-queue)
> +LIBMNL_EXAMPLES_INSTALL_TARGETS += \
> +	$(addprefix examples/rtnl/, rtnl-addr-add rtnl-addr-dump \
> +		rtnl-link-dump rtnl-link-dump2 rtnl-link-dump3 \
> +		rtnl-link-event rtnl-link-set rtnl-neigh-dump \
> +		rtnl-route-add rtnl-route-dump rtnl-route-event)
> +
> +define LIBMNL_EXAMPLES_INSTALL_TARGET_CMDS
> +	$(foreach t,$(LIBMNL_EXAMPLES_INSTALL_TARGETS), \
> +		$(INSTALL) -D -m 0755 $(@D)/$(t) \
> +			$(TARGET_DIR)/usr/bin/$(notdir $(t))$(sep))
> +endef
> +LIBMNL_POST_INSTALL_TARGET_HOOKS += LIBMNL_EXAMPLES_INSTALL_TARGET_CMDS
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
