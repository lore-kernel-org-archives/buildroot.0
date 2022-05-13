Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE70C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A70A7415EC;
	Fri, 13 May 2022 21:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WhxOTFOFyp6; Fri, 13 May 2022 21:39:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 462D040886;
	Fri, 13 May 2022 21:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EFCBA1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDA624015A
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAmzUbkJ0dTq for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B8A740490
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:39:20 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c12so11379264edv.10
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IqtrMdxa5E5bslkC2nDa7QFvQNhLQ8Y/pBi17QvP2tw=;
 b=TOe5NHOp0s6qNnSrmGARvBZdn1DNkCDX8947ybwp2iUB3Smu8ob8Su+9zPwa+9C3Ar
 dz7JkPaVtSV0Tt7Ggw7mA1B1yOXFE9B+91k85TaraKWgKkggAce4MKIGB+x7FBlFbOv3
 +0ii4qRDyjQGJ1h9dGi23bQ8titnjJ/IlPWor9z7jqSW8crQiMd2dxn9UVuJgIW/iZxc
 j8HIBjeqNqdImmMRXvtc0z36YSY9hZuQSQRcJ7q3MMptQ3yIyiRsXBQX04jN84N+gHrR
 Z4Pz5Tlm02CSy9PIH6PlKn3JXYURJ+uhg1dCxpNQLsTEsD3XMioPQlRhf0N1IPzyM09M
 0zGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IqtrMdxa5E5bslkC2nDa7QFvQNhLQ8Y/pBi17QvP2tw=;
 b=iTCUI4hV8XZJM2MLykmBNPUZUXMnqxtpW+XTLq+X4VBzH7xOxXjeF9BXED7Pw/oA8t
 V6JcDZWv2coG3jbPXjtq9jry4SvsAPbGBOi+s94vYYld1rPvZTVzAxx5vKrxyoW2VXKD
 vqEDnRBWF/kyGt7+emuZsrfGR1tlnPWp2LuSWPyi9nwTVsuxw+U0byczzNa04ABZBSj2
 b+rDYwCr/S1KaVC7o5ANFsBcdYcX1bEVXkG/LJ2tMI/vWEdpdVTPwBDjLSy8O6Zbwd2O
 +eLofPVnBkfdWk9woCY9Bd9SEHs2iPiHfN+Pz7UcRlnZOfltJA/UdGoBHIxCwdsruKQW
 wjVw==
X-Gm-Message-State: AOAM533qNXiEORO5QLPs84iJMhBDe+GyeRrrot5W0m60MGVcuf7NByf7
 XxUgeGPB+RStYx2ndD0wolAHn2lktZ4s/Q==
X-Google-Smtp-Source: ABdhPJx6vVonODv3JQ48xaCNjm9UV0xLOH2HqyWcnEg5JMFZccxVuAXygbJRo3NMTJum4dgVZOBtUg==
X-Received: by 2002:a05:6402:280a:b0:427:df14:d6a9 with SMTP id
 h10-20020a056402280a00b00427df14d6a9mr683882ede.139.1652477958533; 
 Fri, 13 May 2022 14:39:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906004900b006f3ef214e5dsm1135667ejg.195.2022.05.13.14.39.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:39:17 -0700 (PDT)
Message-ID: <6b861704-a03c-0e22-67ff-b9eff58da3a9@mind.be>
Date: Fri, 13 May 2022 23:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20220509153031.1562693-1-tianyuanhao3@163.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220509153031.1562693-1-tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8188eu: enable required
 kernel options
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/05/2022 17:30, TIAN Yuanhao wrote:
> Enable Linux kernel configuration options required by the driver.
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/951/9514704d6d44fc1b5dd188eac06b269427d3dee2
>   - http://autobuild.buildroot.org/results/9ea/9ea060cc35e859ebc73c65fe2d1f7478f9b4fa8d
>   - http://autobuild.buildroot.org/results/658/658c06f8125613b56511d3351cdfd3d8e19d48da
> 
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>   package/rtl8188eu/rtl8188eu.mk | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
> index fa420b0d57..ebce4617ac 100644
> --- a/package/rtl8188eu/rtl8188eu.mk
> +++ b/package/rtl8188eu/rtl8188eu.mk
> @@ -10,6 +10,14 @@ RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
>   RTL8188EU_LICENSE_FILES = COPYING
>   RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
>   
> +define RTL8188EU_LINUX_CONFIG_FIXUPS
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)

  This option depends on !S390, so I added !BR2_s390x to Config.in.

  Regards,
  Arnout

> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
> +endef
> +
>   define RTL8188EU_INSTALL_FIRMWARE
>   	$(INSTALL) -D -m 644 $(@D)/rtl8188eufw.bin \
>   		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188eufw.bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
